package care.dog.Messenger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("dm.dmController")
public class MessengerController {
	
	@RequestMapping(value="/messenger")
	public String main() {
		return ".mypage.messenger";
	}

}
