package care.dog.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.adminController")
public class AdminController {

	@RequestMapping(value="/admin")
	public String adminMain() {
		return ".adminLayout";
	}
	
}
