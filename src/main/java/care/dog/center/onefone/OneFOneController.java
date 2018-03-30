package care.dog.center.onefone;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.common.MyUtil;
import care.dog.member.SessionInfo;

@Controller("onefone.oneFOneController")
public class OneFOneController {
	@Autowired MyUtil myUtil;
	@Autowired OneFOneService service;
	
	@RequestMapping(value="/center/onefonelist")
	public String OneforOneMain(
			@RequestParam(value="pageNo", defaultValue="1") int pageNo,
			@RequestParam(value="sort", defaultValue="sort") String sort,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		int rows = 10;
		int totalPage = 10;
		
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
		
		return ".center.onefonelist";
	}
	
	@RequestMapping(value="/center/onefone", method=RequestMethod.GET)
	public String onefone(
			Model model
			) throws Exception{
		model.addAttribute("pageNo","1");
		
		return ".center.onefone";
	}
	
	@RequestMapping(value="/center/onefone", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> onefoneSubmit(
			OneFOneVo dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info == null) {
			state = "false";
		} else {
			dto.setMemberId(info.getMemberId());
			service.insertOneFOne(dto);
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/center/onefonecontent")
	public String content(
			@RequestParam(value="num") int num,
			HttpServletRequest req,
			Model model
			) throws Exception{
		OneFOneVo dto = service.readonefone(num);
		
		if(dto==null) {
			return "redirect:/center/onefonelist";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

		
		model.addAttribute("dto",dto);		
		
		return ".center.onefonecontent";
	}
}
