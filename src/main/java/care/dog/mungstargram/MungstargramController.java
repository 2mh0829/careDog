package care.dog.mungstargram;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.mungstargram.vo.MungstarPVO;

@Controller("mungstargram.mungstargramController")
public class MungstargramController {
	@Autowired
	private MungstargramService service;
	
	@RequestMapping(value="/mungstargram")
	public String main() {
		return ".mungstargram.main";
	}
	
	@RequestMapping(value="/mungstargram/list")
	@ResponseBody
	public Map<String, Object> printList(
			@RequestParam(value="pageNo", defaultValue="1") int current_page) {
		Map<String, Object> map = new HashMap<>();
		System.out.println(current_page);
		
		return map;
	}
	
	@RequestMapping(value="mungstargram/created", method=RequestMethod.GET)
	public String createForm() {
		return "mungstargram/created";
	}

	@RequestMapping(value="mungstargram/created", method=RequestMethod.POST)
	public void createSubmit(MungstarPVO pvo, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String path = root+"uploads" + File.separator + "mungstargram";
		
//		pvo.setUserNum(userNum);
		
		service.insertPhoto(pvo, path);
		
		System.out.println(path);
	}
}
