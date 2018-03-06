package care.dog.blog.guest;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.blog.BlogInfo;
import care.dog.blog.BlogService;
import care.dog.common.MyUtilGeneral;
import care.dog.member.SessionInfo;


@Controller("blog.guest.guestController")
public class GuestController {
	@Autowired
	private GuestService service;
	@Autowired
	private BlogService blogService;
	@Autowired
	private MyUtilGeneral util;
	
	@RequestMapping(value="/blog/{blogId}/guest")
	public String guest(
			@PathVariable int blogId,
			Model model) throws Exception {

		model.addAttribute("blogId",blogId);
		return "blog/guest/guest";
	}
	
	@RequestMapping(value="/blog/{blogId}/guestList")
	@ResponseBody
	public Map<String, Object> list(
			@PathVariable int blogId,
		    @RequestParam(value="pageNo", defaultValue="1") int current_page,
		    HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		BlogInfo blogInfo=blogService.readBlogInfoHome(blogId);
		
		int owner=0;
		if(info!=null && info.getMemberId().equals(blogInfo.getMemberId()))
			owner=1;
		
		String tableName="b_"+blogId;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("tableName", tableName);
		
		int rows=5;
		int dataCount=service.dataCount(map);
		int total_page=util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Guest> list=service.listGuest(map);
		Iterator<Guest> it=list.iterator();
		while(it.hasNext()) {
			Guest dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		// 인수 2개짜리
		String paging = util.paging(current_page, total_page);
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		if(info==null)
			model.put("isLogin", "false");
		else
			model.put("isLogin", "true");
	
		model.put("blogId", blogId);
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("paging", paging);
		// 게시물 리스트
		model.put("list", list);
		
		model.put("owner", owner);
		
		return model;
	}
	
	@RequestMapping(value="/blog/{blogId}/guestCreated", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			@PathVariable int blogId,
			Guest dto,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			// 로그인 상태가 아닌것을 json으로 전송
			Map<String, Object> model = new HashMap<>(); 
			model.put("isLogin", "false");
			return model;
		}
		
		String tableName="b_"+blogId;
		dto.setTableName(tableName);
		dto.setblogId(blogId);
		// 글을 쓴사람
		dto.setMemberId(info.getMemberId());
		
		service.insertGuest(dto);
		
		return list(blogId, 1, session);
	}
	
	@RequestMapping(value="/blog/{blogId}/guestDelete",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> guestDelete(
			@PathVariable int blogId,
			@RequestParam(value="num") int num,
			@RequestParam(value="pageNo") int pageNo,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
	   	    // 로그인 상태가 아닌것을 json으로 전송
			Map<String, Object> model = new HashMap<>(); 
			model.put("isLogin", "false");
			return model;
		}
		
		String tableName="b_"+blogId;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("tableName", tableName);
		map.put("num", num);
		
		service.deleteGuest(map);
		
		return list(blogId, 1, session);
	}
}
