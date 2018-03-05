package care.dog.mungstargram;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import care.dog.mungstargram.vo.MungstarPVO;
import care.dog.mungstargram.vo.MungstarRVO;

@Controller("mungstargram.mungstargramController")
public class MungstargramController {
	@Autowired
	private MungstargramService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/mungstargram")
	public String main(String searchKey, String searchValue, Model model) {
		
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
		return ".mungstargram.main";
	}
	
	@RequestMapping(value="/mungstargram/list")
	@ResponseBody
	public Map<String, Object> printList(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="") String searchKey, 
			@RequestParam(value="searchValue", defaultValue="") String searchValue) {

		int rows = 9;
		int dataCount = 0;
		int total_page = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.mungstarCount(map);
		if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount) ;
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = (current_page) * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<MungstarRVO> list = service.mungstarList(map);
		List<Integer> photoCountList = service.mungstarPhotoCount(map);
		
		for(int i=0; i<list.size(); i++)
			list.get(i).setPhotoCount(photoCountList.get(i));

		System.out.println(list.toString());
		
		Map<String, Object> model = new HashMap<>();
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("list", list);
		
		return model;
	}
	
	@RequestMapping(value="mungstargram/article")
	@ResponseBody
	public Map<String, Object> articleList(int num){
		
		MungstarRVO rvo = service.selectContent(num);
		System.out.println(rvo.toString());
		if(rvo.getContext() != null) {
			rvo.setContext(rvo.getContext().replaceAll("\n", "<br>"));
		}
		
		List<MungstarRVO> photoList = service.mungstarPhotoList(num);
		
		Map<String, Object> model = new HashMap<>();
		model.put("content", rvo);
		model.put("photoList", photoList);
		
		return model;
	}
		
	
	@RequestMapping(value="mungstargram/created", method=RequestMethod.GET)
	public String createForm(HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info != null) {
			model.addAttribute("memberId", info.getMemberId());
		}
		
		return "/mungstargram/created";
	}

	@RequestMapping(value="mungstargram/created", method=RequestMethod.POST)
	public String createSubmit(MungstarPVO pvo, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String path = root+"uploads" + File.separator + "mungstargram";
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "member/login";
		}
		
		pvo.setMemberId(info.getMemberId());
		
		service.insertPhoto(pvo, path);
		
		System.out.println(path);
		return null;
	}
	
	@RequestMapping(value="mungstargram/autocomplete")
	@ResponseBody
	public List<MungstarRVO> auticomplete(String term){
		
		List<MungstarRVO> list = service.searchList(term);
		
		return list;
	}

	
	
}
