package care.dog.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("info.infoController")
public class InfoController {
	
	@RequestMapping(value="/info")
	public String main() {
		return ".info.youtube";
	}

}
