package care.dog.center.onefone;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.common.MyUtil;
import care.dog.member.SessionInfo;

@Controller("onefone.oneFOneController")
public class OneFOneController {
	@Autowired MyUtil myUtil;
	@Autowired OneFOneService service;
	
	@RequestMapping(value="/center/onefonelist")
	public String OneforOneMain() {
		
		return ".center.onefonelist";
	}
	
	@RequestMapping(value="/center/onefone")
	public String onefone() {
		
		return ".center.onefone";
	}
}
