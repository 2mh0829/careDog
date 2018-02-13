package care.dog.mungstargram;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mungstargram.mungstargramController")
public class MungstargramController {
	
	@RequestMapping(value="/mungstargram")
	public String main() {
		return ".mungstargram.main";
	}
	
	@RequestMapping(value="mungstargram/created")
	public String insertForm() {
		return ".mungstargram.created";
	}

}
