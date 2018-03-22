package care.dog.admin.mungstar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mungstar.adminMungstarController")
public class AdminMungstarController {
	
	@RequestMapping(value="/admin/mungstar")
	public String admimMungstar() {
		return ".admin.mungstar.main";
	}
}
