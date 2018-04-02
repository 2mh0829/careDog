package care.dog.member.mail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.member.MemberService;

@Controller("mail.mailController")
public class MailController {
	@Autowired
	private MailSender mailSender;
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/join3")
	public String sendSubmit(Mail dto, Model model) throws Exception {
		
		String msg = "";
		if(dto.getMemberId() == null) {
			return ".member.error";
		}
		
		ShaPasswordEncoder passwordEncoder=new ShaPasswordEncoder(256);
		String hashed = passwordEncoder.encodePassword(dto.getUserPwd(), null);
		dto.setUserPwd(hashed);
		
		dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
		dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
		
		dto.setReceiverEmail(dto.getEmail());
		int userHashCode = dto.getMemberId().hashCode();
		
		String content = "";

		if(dto.getEmail2().equals("gmail.com")) {
			content += "<div align='center' style='background: #eee; margin-top: 30px; padding: 20px'> <div style='font-size: 30px; font-weight: bold; margin: 30px auto'>Care Dog 가입을 환영합니다.</div>";
			content += "<img src='https://ci3.googleusercontent.com/proxy/GvAOE_0eJj9DvqIh5v-ySlFRccupHOS3ELgV-Tgukq_U-MNKeA7wShFdVWr2ZpniKm8mSOiZFq8Zdv7g_7Q8a1s-9AcGjC7v6TAb985biXo=s0-d-e1-ft#http://cfile23.uf.tistory.com/image/9931294B5AA7E1542BB6B8' width='400px;' class='CToWUd a6T' tabindex='0'>";
			content += "<div class='a6S' dir='ltr' style='opacity: 0.01; left: 525.8px; top: 442px;'> </div> <br><a href='http://localhost:9090/careDog/member/auth?authCode=" + userHashCode + "' target='_blank'>";
			content += "<button style='background: #4286f4; width: 300px; height: 50px; color: white; font-size: 20px; font-weight: bold; margin: 30px auto' type='button'>인증하기</button></a></div>";
		}else {
			content += "<div align='left' style='margin-top: 30px; padding: 20px;'><div>";
			content += "<img src='http://cfile4.uf.tistory.com/image/994A44375AAB7FE7048473' width='700px;'></div>";
			content += "<div style=\"position: relative; top: -430px; left: 150px;\"><div style='font-size: 20px; font-weight: bold; margin: 90px 12px;'>CareDog 가입을 환영합니다.</div>";
			content += "<a href='http://localhost:9090/careDog/member/auth?authCode=" + userHashCode + "' target='_blank'>";
			content += "<button style='background: #4286f4; width: 300px; height: 50px; color: white; font-size: 15px; font-weight: bold;' type='button'>인증하기</button>";
			content += "</a></div></div>";
		}

		dto.setContent(content);
		dto.setSubject("[Care Dog] 회원가입을 위한 인증 메일입니다.");
		
		boolean b = mailSender.mailSend(dto);
		
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
	public String auth(@RequestParam int authCode, Model model) {
		String msg = "이미 가입처리가 되었습니다.";
		List<String> list = service.selectIsMember();
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).hashCode() == authCode) {
				service.updateIsMember(list.get(i));
				msg = "인증되었습니다.";
			}
		}
		model.addAttribute("msg", msg);
		return "member/auth";
	}

	@RequestMapping(value="/member/auth_completed")
	public void auth_completed(String memberId) throws Exception {
		int isMember = service.isMemberByMemberId(memberId);
		if(isMember == 0) {
			service.deleteAuthFail(memberId);
		}
	}
	
	
	@RequestMapping(value="/member/sendEmailForChangePwd", method=RequestMethod.POST)
	@ResponseBody
	public int sendEmailForChangePwd(String email, Mail dto) {
		
		dto.setReceiverEmail(email);

		String content = "";
		int authNum = (int)(Math.random()*8999) + 1000;
		content += "인증번호 : " + authNum;
		dto.setContent(content);
		dto.setSubject("[Care Dog] 패스워드 변경 인증번호");
		
		mailSender.mailSend(dto);
		
		return authNum;
		
	}
	
	
}
