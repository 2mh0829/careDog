package care.dog.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("service.serviceController")
public class ServiceController {
	
	@RequestMapping(value="/service")
	public String main() {
		return ".service.sitting";
	}
	
	@RequestMapping(value="/service/sitting_detail")
	public String sitting_detail() {
		return ".service.sitting_detail";
	}
	
	@RequestMapping(value="/service/sitter_input")
	public String sitter_input() {
		return ".service.sitter_input";
	}

}
