package care.dog.admin.store;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.common.MyUtil;
import care.dog.member.SessionInfo;

@Controller("store.adminStoreController")
public class AdminStoreController {

	@Autowired
	private AdminStoreService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/admin/store")
	public String adminStore() {
		return ".admin.store.main";
	}
	
	@RequestMapping(value = "admin/store/list")
	public String listProduct(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "productName") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue, 
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);

		dataCount = service.dataCount(map);

		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;

		map.put("start", start);
		map.put("end", end);
		
		//map.put("categoryId", categoryId);
		//map.put("sortField", sortField);
		//map.put("sortMode", sortMode);

		List<AdminProduct> list = service.listProduct(map);

		// 글번호 만들기
		int listNum, n = 0;
		Iterator<AdminProduct> it = list.iterator();
		while (it.hasNext()) {
			AdminProduct data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/admin/store/list";
		String articleUrl = cp + "/admin/store/article?page=" + current_page;

		if (searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/admin/store/list?" + query;
			articleUrl = cp + "/admin/store/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		
		return ".admin.store.list";

	}
	
	@RequestMapping(value="/admin/store/insertProduct", method=RequestMethod.GET)
	public String insertProductForm(
			Model model
			){
		
		//model.addAttribute("mode","insert");
		
		return ".admin.store.created";
	}
	
	@RequestMapping(value="/admin/store/insertProduct", method=RequestMethod.POST)
	public String insertProduct(
			AdminProduct dto,
			HttpSession session
			){
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"uploads"+File.separator+"photo";
		
		service.insertProduct(dto, path);
		
		return "redirect:/admin/store/list";
	}
	
	@RequestMapping(value="/admin/store/updateProduct", method=RequestMethod.POST)
	public String updateProduct(
			AdminProduct dto,
			HttpSession session
			){
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"uploads"+File.separator+"photo";
		//System.out.println("path : " + path);
		//System.out.println("dto : " + dto);
		service.updateProduct(dto, path);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return "redirect:/admin/store/article?productId="+dto.getProductId();
	}
	
	@RequestMapping(value = "/admin/store/article")
	public String articleProduct(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "productName") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			@RequestParam(value = "productId", defaultValue ="0") int productId,
			Model model,
			HttpSession session) throws Exception {
		
		List<String> list_option = null;
		
		String query="page=" + current_page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		AdminProduct dto = service.readProduct(productId);
		if (dto == null)
			return "redirect:/admin/store/list?"+query;
		
		list_option = service.readOption(productId);
		
		model.addAttribute("dto", dto);
		model.addAttribute("list_option", list_option);
		model.addAttribute("page", current_page);
		model.addAttribute("query", query);

		return ".admin.store.article";
	}
	
	@RequestMapping(value="/admin/store/deleteProduct")
	public String deleteProduct(
			@RequestParam int productId,
			@RequestParam int page,
			HttpSession session
			) {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		AdminProduct dto = service.readProduct(productId);
		if (dto == null)
			return "redirect:/admin/store/list?page="+page;
		
		service.deleteProduct(productId, dto.getImageFilename(), pathname);
		
		return "redirect:/admin/store/list?page="+page;
		
	}
	
	@RequestMapping(value="/admin/store/deleteOption")
	@ResponseBody
	public Map<String, Object> deleteOption(
			@RequestParam int optionId
			) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		int state = service.deleteOption(optionId);
		
		/*AdminProduct dto = service.readProduct(productId);
		if (dto == null)
			return "redirect:/admin/store/list?page="+page;*/
		
		model.put("state", state);
		
		return model;
	}
	
}
