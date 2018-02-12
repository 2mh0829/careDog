package care.dog.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.memberController")
public class MemberController {
	
	@RequestMapping(value="/login")
	public String loginForm() {
		return ".member.login";
	}
	
	@RequestMapping(value="/join")
	public String joinForm() {
		return ".member.join";
	}
	
}
