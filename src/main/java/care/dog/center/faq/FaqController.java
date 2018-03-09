package care.dog.center.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.faqController")
public class FaqController {
	
	@RequestMapping(value="/center/faq/list")
	public String faqList() {
		return "center/faq";
	}
	
}
