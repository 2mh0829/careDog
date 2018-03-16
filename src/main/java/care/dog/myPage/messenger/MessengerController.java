package care.dog.myPage.messenger;
//;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.member.Member;
import care.dog.member.SessionInfo;

@Controller("messenger.messengerController")
public class MessengerController {
	
	@Autowired
	MessengerService service;
	
	@RequestMapping(value="/messenger")//aa
	public String messenger() throws Exception {
		return "myPage/messenger/messenger";
	}
	
	@ResponseBody
	@RequestMapping(value="/messenger/findFriends")
	public Map<String,Object> findFriends(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String memberId = info.getMemberId();
		Map<String,Object> map = new HashMap<>();
		List<Member> list= service.listFriend(memberId);
		map.put("friendList", list);
		return map;//why not change?
	}
}
