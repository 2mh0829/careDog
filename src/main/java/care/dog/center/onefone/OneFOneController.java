package care.dog.center.onefone;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("onefone.onefoneController")
public class OneFOneController {
	
	@RequestMapping(value="/center/onefonelist")
	public String OneforOneMain() {
		
		return ".center.onefonelist";
	}
	
	@RequestMapping(value="/center/onefone")
	public String OneforOne() {
		return ".center.onefone";
	}
	
	

}
