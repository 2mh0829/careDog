package care.dog.myPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mypage.MypageController")
public class MypageController {

	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypageMain() {
		return ".mypage";
	}
}
