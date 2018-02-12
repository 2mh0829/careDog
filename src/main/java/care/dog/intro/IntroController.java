package care.dog.intro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("intro.introController")
public class IntroController {
	
	@RequestMapping(value="/intro")
	public String main() {
		return ".intro.main";
	}

}
