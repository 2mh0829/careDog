package care.dog.myPage.myPet;

//aaasdwasdsa
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import care.dog.common.MyUtilGeneral;
import care.dog.member.SessionInfo;
import care.dog.myPage.MyPageInfo;
import care.dog.myPage.MyPageService;

@Controller("myPet.myPetController")
public class MyPetController {
	@Autowired
	private MyPetService myPetService;
	
	@Autowired
	private MyPageService myPageService;

	// @Autowired
	// private MyUtilGeneral util;

	@RequestMapping(value = "/myPage/myPetList")
	public String myPetList() throws Exception {

		return "myPage/myPet/myPetList";
	}

	@RequestMapping(value = "/myPet/myPetCreated", method = RequestMethod.GET)
	public String myPetCreated(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return "myPage/myPet/myPetCreated";
	}
	@RequestMapping(value = "/myPet/myPetCreated", method = RequestMethod.POST)
	public String myPetCreated(MyPetInfo dto,
			HttpSession session,
			ModelAndView mav
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"myPet"+
				File.separator+info.getMemberId();
		//asdsads
		dto.setMemberId(info.getMemberId());
		System.out.println(dto.toString());
		MyPageInfo myPageInfo=myPageService.readMyPageInfo(info.getMemberId());
		session.setAttribute("myPetMode", "myPetList");
		return "redirect:/myPage/"+myPageInfo.getMyPageId();
	}


}
