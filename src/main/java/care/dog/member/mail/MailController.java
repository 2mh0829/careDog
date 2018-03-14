package care.dog.member.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("mail.mailController")
public class MailController {
	@Autowired
	private MailSender mailSender;

	@RequestMapping(value="/member/join3")
	public String sendSubmit(Mail dto, Model model, String email1, String email2, String userId) throws Exception {

		dto.setReceiverEmail(email1 + "@" + email2);
		int userHashCode = userId.hashCode();
		
		String content = "";
		content += "<div align='center' style='background: #eee; margin-top: 30px; padding: 20px; width: 800px;'>";
		content += "<div style='font-size: 30px; font-weight: bold; margin: 30px auto;'>Care Dog 가입을 환영합니다.</div>";
		content += "<img src='http://cfile23.uf.tistory.com/image/9931294B5AA7E1542BB6B8' width='400px;'>";
		content += "<br><a href='http://localhost:9090/careDog/member/auth?authCode=\"" + userHashCode + "\"' target='_blank'>";
		content += "<button style='background: #4286f4; width:300px; height: 50px; color: white; font-size: 20px; font-weight: bold; margin: 30px auto;' type='button'>인증하기</button></a></div>";
		
		dto.setContent(content);
		
		boolean b=mailSender.mailSend(dto);
		
		String msg="<span style='color:blue;'>"+dto.getReceiverEmail()+"</span> 님에게<br>";
		if(b) {
			msg+="메일을 성공적으로 전송 했습니다.";
		} else {
			msg+="메일을 전송하는데 실패했습니다.";
		}
		
		model.addAttribute("message", msg);
		
		return ".member.join3";
	}
	
	@RequestMapping(value="/member/auth")
	public String auth(@RequestParam int authCode) {
		
		System.out.println(authCode);
		
		// 인증
		
		return "member/auth";
	}

	@RequestMapping(value="/member/auth_completed")
	public void auth_completed() {
		
		// 삭제
		System.out.println("completed");
		
	}
	
	
}
