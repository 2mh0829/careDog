package care.dog.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("service.serviceController")
public class ServiceController {
	
	@RequestMapping(value="/service")
	public String main() {
		return ".service.main";
	}

}
