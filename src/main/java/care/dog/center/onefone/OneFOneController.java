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
	
	@RequestMapping(value="/center/onefone", method=RequestMethod.GET)
	public String onefone(
			Model model
			) throws Exception{
		model.addAttribute("pageNo","1");
		
		return ".center.onefone";
	}
	
	@RequestMapping(value="/center/onefone", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> onefoneSubmit(
			OneFOneVo dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info == null) {
			state = "false";
		} else {
			dto.setMemberId(info.getMemberId());
			service.insertOneFOne(dto);
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
}
