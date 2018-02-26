package care.dog.dog119;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("dog119.dog119Controller")
public class Dog119Controller {
	
	@RequestMapping(value="/dog119")
	public String main() {
		return ".dog119.main";
	}
	
	@RequestMapping(value="/dog119/created")
	public String createdSubmit() {
		return ".dog119.created";
	}

}
