package care.dog.myPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mypage.MypageController")
public class MypageController {

	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String main() {
		return ".mypage.main";
	}
	@RequestMapping(value="/mypage/member", method=RequestMethod.GET)
	public String member() {
		return ".mypageEdit";
	}
	@RequestMapping(value="/mypage/blog", method=RequestMethod.GET)
	public String blog() {
		return ".mypageEdit";
	}

}
