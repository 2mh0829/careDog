package care.dog.center.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("center.main.mainController")
public class MainController {
	
	@RequestMapping(value="/center")
	public String main() {
		return ".center.main";
	}
}
