package care.dog.admin.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.adminMemberController")
public class AdminMemberController {

	@RequestMapping(value="/admin/member")
	public String adminMember() {
		return ".admin.member.main";
	}
	
}
