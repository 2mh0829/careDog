package care.dog.member.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mail.mailController")
public class MailController {
	@Autowired
	private MailSender mailSender;

	@RequestMapping(value="/member/join3")
	public String sendSubmit(Mail dto, Model model, String email1, String email2) throws Exception {

		dto.setReceiverEmail(email1 + "@" + email2);
		dto.setContent("<button>인증하기</button>");
		
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
}
