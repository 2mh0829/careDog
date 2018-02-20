package care.dog.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.memberController")
public class MemberController {
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return ".member.login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginSubmit(@RequestParam String userId, @RequestParam String userPwd, HttpSession session, Model model) {
		if((!userId.equals("han") || !userPwd.equals("han")) && (!userId.equals("admin") || !userPwd.equals("admin"))) {
			return ".member.login";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/join")
	public String joinForm() {
		return ".member.join";
	}
	
}
