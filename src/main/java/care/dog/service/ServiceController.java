package care.dog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("service.serviceController")
public class ServiceController {
	
	@Autowired
	private ServiceService service;
	
	@RequestMapping(value="/service")
	public String main() {
		return ".service.sitting";
	}
	
	@RequestMapping(value="/service/sitting_detail")
	public String sitting_detail() {
		return ".service.sitting_detail";
	}
	
	@RequestMapping(value="/service/sitter_input", method=RequestMethod.GET)
	public String sitter_input() {
		
		return "service/sitter_input";
	}
	
	@RequestMapping(value="/service/sitter_input", method=RequestMethod.POST)
	public String sitter_input_submit(ServiceDto dto) {
		
		service.insertService(dto);
		System.out.println(dto.toString());
		
		return "redirect:/service";
		
	}

}
