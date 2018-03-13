package care.dog.center.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("faq.faqController")
public class FAQController {
	
	@RequestMapping(value="/center/faq")
	public String faqList() {
		return "center/faq";
	}
	
	
	
}
