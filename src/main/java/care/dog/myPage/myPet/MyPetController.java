package care.dog.myPage.myPet;

//aaasdwasdsa
import java.io.File;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import care.dog.common.MyUtilGeneral;
import care.dog.member.Member;
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
	public String myPetList(Model model, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}
		return "myPage/myPet/myPetList";
	}

	@RequestMapping(value = "/myPet/myPetInfoDetail")
	public String myPetInfoDetail(@RequestParam int myPetInfoId,
			Model model, HttpSession session) throws Exception {
		System.out.println("Request@@"+myPetInfoId);
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}
		List<MyPetInfo> list = myPetService.selectMyPetInfo(info.getMemberId());
		if (list != null) {
			for(MyPetInfo mpi: list) {
				if(mpi.getMyPetInfoId()==myPetInfoId)
					System.out.println("mpi@@"+mpi.getMyPetInfoId());
					model.addAttribute("myPetInfo", mpi);
			}
		}
		model.addAttribute("mode", "detail");
		return "myPage/myPet/myPetInfoDetail";
	}

	@RequestMapping(value = "/myPet/myPetInfoModify")
	public String myPetInfoModify(Model model, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}
		model.addAttribute("mode", "modify");

		return "myPage/myPet/myPetInfoModify";
	}

	@ResponseBody
	@RequestMapping(value = "/myPet/getMyPetList")
	public Map<String, Object> getMyPetList(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String memberId = info.getMemberId();

		Map<String, Object> map = new HashMap<>();
		List<MyPetInfo> list = myPetService.selectMyPetInfo(memberId);
		if (list != null) {
			map.put("myPetList", list);
		}
		return map;
	}

	@RequestMapping(value = "/myPet/myPetCreated", method = RequestMethod.GET)
	public String myPetCreated(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return "myPage/myPet/myPetCreated";
	}

	@RequestMapping(value = "/myPet/myPetCreated", method = RequestMethod.POST)
	public String myPetCreated(MyPetInfo dto, Model model, HttpSession session, ModelAndView mav) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "myPet" + File.separator
				+ info.getMemberId();

		dto.setMemberId(info.getMemberId());

		int result = myPetService.insertMyPetInfo(dto, pathname);

		if (result == 0) {
			model.addAttribute("message", "애견등록에 오류가 발생했습니다. 다시 시도 하시기 바랍니다.");
			return ".myPage.main.message";
		}

		session.setAttribute("myPetMode", "myPetList");
		MyPageInfo myPageInfo = myPageService.readMyPageInfo(info.getMemberId());
		return "redirect:/myPage/" + myPageInfo.getMyPageId();
	}

}
