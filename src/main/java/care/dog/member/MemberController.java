package care.dog.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm(String login_error, Model model, HttpSession session) {
		// 로그인 폼
		boolean bLoginError = login_error != null;
		
		String msg="";
		if(bLoginError) {
			msg="아이디 또는 패스워드를 잘못 입력 하셨습니다.";
			model.addAttribute("message", msg);
		}
		
		return ".member.login";
	}
	
	@RequestMapping(value="/member/noAuthorized")
	public String noAuthorized() {
		// 접근 오서라이제이션(Authorization:권한)이 없는 경우
		
		return ".member.noAuthorized";
	}
	
	@RequestMapping(value="/member/expired")
	public String expired() {
		// 세션이 만료 된 경우
		
		return ".member.expired";
	}
	
	// 회원가입 및 회원정보 수정 -----------------------
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public String memberForm(Model model) {

		model.addAttribute("mode", "created");
		return ".member.member";
	}
	
	@RequestMapping(value="/member/member", method=RequestMethod.POST)
	public String memberSubmit(
			Member dto,
			Model model) throws Exception {
		
		// 패스워드 암호화
		ShaPasswordEncoder passwordEncoder=new ShaPasswordEncoder(256);
		String hashed=passwordEncoder.encodePassword(dto.getUserPwd(), null);
		dto.setUserPwd(hashed);
		
		try {
			service.insertMember(dto);
		}catch(Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다. 다른 아이디로 다시 가입하시기 바랍니다.");
			model.addAttribute("mode", "created");
			return ".member.member";
		}
		
		StringBuffer sb=new StringBuffer();
		sb.append(dto.getUserName()+ "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		
		model.addAttribute("message", sb.toString());
		model.addAttribute("title", "회원 가입");
		
		return ".member.complete";
	}

	@RequestMapping(value="/member/pwd", method=RequestMethod.GET)
	public String pwdForm(
			String dropout,
			Model model,
			HttpSession session) {
		
		if(dropout==null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}
		
		return ".member.pwd";
	}
	
	@RequestMapping(value="/member/pwd", method=RequestMethod.POST)
	public String pwdSubmit(
			@RequestParam String userPwd,
			@RequestParam String mode,
			Model model,
			HttpSession session
	     ) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Member dto=service.readMember(info.getMemberId());
		if(dto==null) {
			session.invalidate();
			return "redirect:/";
		}
		
		// 패스워드 암호화
		ShaPasswordEncoder passwordEncoder=new ShaPasswordEncoder(256);
		String hashed=passwordEncoder.encodePassword(userPwd, null);
		
		if(! dto.getUserPwd().equals(hashed)) {
			if(mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "dropout");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".member.pwd";
		}
		
		if(mode.equals("dropout")){
			// 회원탈퇴 처리
			
			// 게시판 테이블등 삭제
			
			// service.deleteMember2(info.getMemberId());
			
			session.removeAttribute("member");
			session.invalidate();

			StringBuffer sb=new StringBuffer();
			sb.append(dto.getUserName()+ "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
			
			model.addAttribute("title", "회원 탈퇴");
			model.addAttribute("message", sb.toString());
			
			return ".member.complete";
		}

		// 회원정보수정폼
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".member.member";
	}

	@RequestMapping(value="/member/update",
			method=RequestMethod.POST)
	public String updateSubmit(
			Member dto,
			Model model,
			HttpSession session) throws Exception {
		
		// 패스워드 암호화
		// 패스워드 암호화
		ShaPasswordEncoder passwordEncoder=new ShaPasswordEncoder(256);
		String hashed=passwordEncoder.encodePassword(dto.getUserPwd(), null);
		dto.setUserPwd(hashed);
		
		service.updateMember(dto);
		
		StringBuffer sb=new StringBuffer();
		sb.append(dto.getUserName()+ "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
		
		model.addAttribute("title", "회원 정보 수정");
		model.addAttribute("message", sb.toString());
		return ".member.complete";
	}
	
	@RequestMapping(value="/member/userIdCheck")
	@ResponseBody
	public Map<String, Object> userIdCheck(
			@RequestParam String userId
			) throws Exception {
		String passed="false";
		Member dto=service.readMember(userId);
		if(dto==null)
			passed="true";
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("passed", passed);
		return model;
	}
}
