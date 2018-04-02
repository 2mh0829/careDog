package care.dog.admin.center;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import care.dog.center.onefone.OneFOneVo;
import care.dog.common.MyUtil;
import care.dog.member.SessionInfo;

@Controller("admin.center.adminOneFOneController")
public class AdminOneFOneController {
	@Autowired MyUtil myUtil;
	@Autowired AdminOneFOneService service;
	
	@RequestMapping(value="/admin/center/onefonelist")
	public String AdminOneforOneMain(
			@RequestParam(value="pageNo", defaultValue="1") int pageNo,
			@RequestParam(value="sort", defaultValue="sort") String sort,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpSession session,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		int rows = 10;
		int totalPage = 10;
		
		//SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("sort", sort);
		map.put("pageNo", pageNo);
		
		int start = (pageNo - 1) * rows+1;
		int end = pageNo * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<OneFOneVo> list = service.listOneFOne(map);
		String cp = req.getContextPath();
		String articleUrl = cp+"/center/onefonecontent";
		
		model.addAttribute("list",list);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("articleUrl",articleUrl);
		
		return ".admin.center.onefonelist";
	}
}
