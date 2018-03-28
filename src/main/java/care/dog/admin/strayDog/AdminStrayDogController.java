package care.dog.admin.strayDog;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.admin.strayDogVo.AdminFixSupportVo;
import care.dog.common.MyUtilBootstrap;
import care.dog.dog119.dogMissingVo.DogMissingVo;

@Controller("strayDog.adminStrayDogController")
public class AdminStrayDogController {
	@Autowired
	private AdminStrayDogService service;
	@Autowired
	private MyUtilBootstrap myUtilBootstrap;
	
	@RequestMapping(value="/admin/strayDog")
	public String admimMungstar() {
		return ".admin.strayDog.fixSupport";
	}
	
	@RequestMapping(value="/admin/dog119/fixSupport")
	@ResponseBody
	public Map<String, Object> fixSupportList(
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="subject") String search,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req, Model model
			){
		String cp = req.getContextPath();
		
		int totalPage = 0;
		int rows=20;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			try {
				keyword = URLDecoder.decode(keyword, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		Map<String, Object> pagingmap = new HashMap<>();
		pagingmap.put("search", search);
		pagingmap.put("keyword", keyword);
		
		dataCount = service.fixSupportDataCnt(pagingmap);
		if(dataCount!=0)
			totalPage = myUtilBootstrap.pageCount(rows, dataCount);
		
		
		if(totalPage < page) {
			page = totalPage;
		}
		
		int start = (page-1)*rows+1;
		int end = page*rows;
		pagingmap.put("start", start);
		pagingmap.put("end", end);
		
		Map<String, Object> map = new HashMap<>();
		List<AdminFixSupportVo> list = service.fixSupportList(pagingmap);
		
		String q = "";
		String dog119ListUrl = cp+"/admin/dog119/fixSupport";
		if(keyword.length() != 0) {
			try {
				q = "search="+search+"&keyword="+URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		if(q.length()!=0) {
			dog119ListUrl = cp+"/admin/dog119/fixSupport?"+q;
		}
		
		String paging = myUtilBootstrap.paging(page, totalPage, dog119ListUrl);
		
		map.put("paging", paging);
		map.put("list", list);
		map.put("page", page);
		map.put("totalPage", totalPage);
		map.put("dataCount", dataCount);
		return map;
	}
}
