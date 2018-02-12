package care.dog.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("main.MainController")
public class MainController {

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainLayout() {
		return ".mainLayout";
	}
	
}