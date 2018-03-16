package care.dog.member.mail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import care.dog.member.MemberService;

@Controller("mail.mailController")
public class MailController {
	@Autowired
	private MailSender mailSender;
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/join3")
	public String sendSubmit(Mail dto, Model model) throws Exception {
		
		ShaPasswordEncoder passwordEncoder=new ShaPasswordEncoder(256);
		String hashed = passwordEncoder.encodePassword(dto.getUserPwd(), null);
		dto.setUserPwd(hashed);
		
		dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
		dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
		
		dto.setReceiverEmail(dto.getEmail());
		int userHashCode = dto.getMemberId().hashCode();
		
		String content = "";
		content += "<div align='center' style='background: #eee; margin-top: 30px; padding: 20px; width: 800px;'>";
		content += "<div style='font-size: 30px; font-weight: bold; margin: 30px auto;'>Care Dog 가입을 환영합니다.</div>";
		content += "<img src='http://cfile23.uf.tistory.com/image/9931294B5AA7E1542BB6B8' width='400px;'>";
		content += "<br><a href='http://localhost:9090/careDog/member/auth?authCode=" + userHashCode + "' target='_blank'>";
		content += "<button style='background: #4286f4; width:300px; height: 50px; color: white; font-size: 20px; font-weight: bold; margin: 30px auto;' type='button'>인증하기</button></a></div>";
		
		dto.setContent(content);
		
		boolean b = mailSender.mailSend(dto);
		
		String msg = "";
		if(b) {
			msg += "인증메일이 성공적으로 발송되었습니다.";
			try {
				service.insertMember(dto);
			} catch (Exception e) {
			}
		} else {
			msg += "인증메일 발송이 실패했습니다.";
		}
		
		model.addAttribute("message", msg);
		model.addAttribute("memberId", dto.getMemberId());
		
		return ".member.join3";
	}
	
	@RequestMapping(value="/member/auth")
	public String auth(@RequestParam int authCode) {
		List<String> list = service.selectIsMember();
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).hashCode() == authCode) {
				service.updateIsMember(list.get(i));
			}
		}
		return "member/auth";
	}

	@RequestMapping(value="/member/auth_completed")
	public void auth_completed(String memberId) throws Exception {
		int isMember = service.isMemberByMemberId(memberId);
		if(isMember == 0) {
			service.deleteAuthFail(memberId);
		}
	}
	
	
}
