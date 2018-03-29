package care.dog.admin.strayDog;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
	
	@RequestMapping(value="/admin/strayDog/tempSupport")
	public String tempSupport() {
		return ".admin.strayDog.tempSupport";
	}
	
	@RequestMapping(value="/admin/strayDog/volunteer")
	public String volunteer() {
		return ".admin.strayDog.volunteer";
	}
	
	@RequestMapping(value="/admin/strayDog/fixSupport")
	@ResponseBody
	public Map<String, Object> fixSupportList(
			@RequestParam(defaultValue="1") int page,
			@RequestParam(value="rows", defaultValue="10") int rows,
			@RequestParam(value="searchField", defaultValue="subject") String search,
			@RequestParam(value="searchType", defaultValue="") String type,
			@RequestParam(value="searchValue", defaultValue="") String keyword,
			HttpServletRequest req, Model model
			){
		int totalPage = 0;
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
		pagingmap.put("type", type);
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
		
		map.put("rows", list);
		map.put("page", page);
		map.put("total_page", totalPage);
		map.put("dataCount", dataCount);
		return map;
	}
	
}
