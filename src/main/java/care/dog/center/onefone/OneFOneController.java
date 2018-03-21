package care.dog.center.onefone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import care.dog.common.MyUtil;

@Controller("onefone.onefoneController")
public class OneFOneController {
	@Autowired MyUtil myUtil;
	
	@RequestMapping(value="/center/onefonelist")
	public String OneforOneMain() {
		
		return ".center.onefonelist";
	}
	
	@RequestMapping(value="/center/onefone")
	public String OneforOneForm(
			Model model
			) throws Exception{
/*		model.addAttribute("");*/
		return ".center.onefone";
	}
	
	

}
