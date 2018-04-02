package care.dog.admin.dog119;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import care.dog.common.MyUtilBootstrap;
import care.dog.member.SessionInfo;

@Controller("dog119.adminDog119Controller")
public class AdminDog119Controller {
	@Autowired
	private AdminDog119Service service;
	@Autowired
	private MyUtilBootstrap myUtilBootstrap;
	
	@RequestMapping(value="/admin/dog119/dogHealthInput")
	public String dogHealthCreate() {
		return ".admin.dog119.dogHealthCreate";
	}
	
	@RequestMapping(value="/admin/dog119/dhInput", method=RequestMethod.POST)
	public String dhCreate(@RequestParam Map<String, Object> map, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String memberId = info.getMemberId();
		map.put("memberId", memberId);
		
		service.dogHealthCreate(map);
		return "redirect:/dog119/dogHealth";
	}
}
