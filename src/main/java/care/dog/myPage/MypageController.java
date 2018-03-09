package care.dog.myPage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mypage.MypageController")
public class MypageController {

	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String main() {
		return ".mypage.main";
	}
	@RequestMapping(value="/mypage/editMember", method=RequestMethod.GET)
	public String member() {
		return ".mypageMemberEdit.join";
	}
	@RequestMapping(value="/mypage/blog", method=RequestMethod.GET)
	public String blog(HttpServletRequest req) {
		return ".blog.main.blogList";
	}
	@RequestMapping(value="/mypage/test", method=RequestMethod.GET)
	public String test() {
		return "mypage/test";
	}
	@RequestMapping(value="/blog/{blogId}/editMemberInfo")
	public String editMemberInfo(
			@PathVariable int blogId,
			Model model) throws Exception {

		model.addAttribute("blogId",blogId);
		return "member/join";
	}
}
