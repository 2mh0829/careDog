package care.dog.admin.store;

import java.net.URLDecoder;
import java.net.URLEncoder;
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
import care.dog.store.Product;
import care.dog.store.ProductService;
import care.dog.store.ProductServiceImpl;

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
	
	@RequestMapping(value="/admin/store/listForm")
	public String listProductForm() {
		return ".admin.store.list";
	}
	
	@RequestMapping(value = "admin/store/list")
	@ResponseBody
	public Map<String, Object> listProduct(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "productName") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue, 
			@RequestParam(value="rows", defaultValue="10") int rows,
			HttpServletRequest req
			) throws Exception {

		/*
		System.out.println(req.getParameter("searchField"));
		System.out.println(req.getParameter("searchType"));
		System.out.println(req.getParameter("searchValue"));
		*/
		
		int dataCount, total_page;
		
		Map<String, Object> map=new HashMap<>();
		
		dataCount=service.dataCount(map);
		
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<AdminProduct> list = service.listProduct(map);
		
		Map<String, Object> model=new HashMap<>();
	    /*
	     *  - 디폴드 jsonReader를 사용하는 경우
	     *  modal.put("page", current_page);
	     *  modal.put("records", dataCount);
	     *  modal.put("total", total_page);
	     */
		model.put("dataCount", dataCount);
		model.put("page", current_page);
		model.put("total_page", total_page);
		
		// 디폴드 jsonReader를 사용하는 경우 root의 이름은 rows 이어야 함
		model.put("rows", list);
		
		return model;

	}
	
	@RequestMapping(value="/admin/store/insertProduct")
	@ResponseBody
	public Map<String, Object> insertProduct(
			AdminProduct dto
			){
		
		service.insertProduct(dto);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		return model;
	}
	
	/*@RequestMapping(value = "/admin/store/article")
	public String articleProduct(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "productName") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			@RequestParam(value = "paging", defaultValue = "1") int page,
			@RequestParam(value = "productId", defaultValue ="0") int productId,
			Model model,
			HttpSession session) throws Exception {

//		List<String> list = (List<String>) session.getAttribute("data");
//		if(list!=null) {
//			productId=Integer.valueOf(list.get(0));
//		}
		
		List<String> list_option = null;
		//List<Qna> listProductQna = null;

		String query = "page=" + page;

		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + searchValue;
		}

		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		// 읽을 상품의 정보 가져오기
		Product dto = service.readProduct(productId);
		
		if (dto == null)
			return "redirect:/admin/store/list?" + query;

		// 상품의 옵션내용
		list_option = service.readOption(productId);

		// qna 리스트
		//listProductQna = service.listProductQna();

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String memberId = null;
		if(info != null)
			memberId = info.getMemberId();
		
		model.addAttribute("dto", dto);
		model.addAttribute("list_option", list_option);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("memberId", memberId);
//		if(list!=null)
//		model.addAttribute("optionId", list.get(1));
		session.removeAttribute("data");

		return ".admin.store.article";
	}*/
	
	//상품 등록 페이지
	/*@RequestMapping(value="/admin/store/created", method=RequestMethod.GET)
	public String createdForm(
			HttpSession session
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		return ".admin.store.created";
	}*/
	
}
