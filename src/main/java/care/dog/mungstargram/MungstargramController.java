package care.dog.mungstargram;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import care.dog.mungstargram.vo.MungstarPVO;

@Controller("mungstargram.mungstargramController")
public class MungstargramController {
	@Autowired
	private MungstargramService service;
	
	@RequestMapping(value="/mungstargram")
	public String main() {
		return ".mungstargram.main";
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
