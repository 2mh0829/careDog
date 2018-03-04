package care.dog.dog119;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="/dog119/created", method=RequestMethod.POST)
	public String created() {
		
		
		return ".dog119.created";
	}
	
	@RequestMapping(value="/dog119/dogHealth")
	public String healthSubmit() {
		
		return ".dog119.dogHealth";
	}

}
