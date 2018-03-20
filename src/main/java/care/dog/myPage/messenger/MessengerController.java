package care.dog.myPage.messenger;

//;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.member.Member;
import care.dog.member.SessionInfo;

@Controller("messenger.messengerController")
public class MessengerController {

	@Autowired
	MessengerService service;

	@RequestMapping(value = "/messenger") // aa
	public String messenger() throws Exception {
		return "myPage/messenger/messenger";
	}

	@ResponseBody
	@RequestMapping(value = "/messenger/findFriends")
	public Map<String, Object> findFriends(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String memberId = info.getMemberId();

		Map<String, Object> map = new HashMap<>();
		List<Member> list = service.listFriend(memberId);
		map.put("friendList", list);
		return map;// why not change?
	}

	@ResponseBody
	@RequestMapping(value = "/messenger/getMessageMemberList")
	public Map<String, Object> getMessageMemberList(HttpSession session) throws Exception { //
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String memberId = info.getMemberId();
		List<Messenger> list = service.getMessageMemberList(memberId);
		Map<String, Object> map = new HashMap<>();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getReceiverId().equalsIgnoreCase(memberId)) {
				list.get(i).setReceiverId(list.get(i).getSenderId());
				list.get(i).setReceiverUserName(list.get(i).getSenderUserName());
			} else if (list.get(i).getSenderId().equalsIgnoreCase(memberId)) {
				list.get(i).setSenderId(list.get(i).getReceiverId());
				list.get(i).setSenderUserName(list.get(i).getReceiverUserName());
			}
			if (i > 0) {
				for(int j=0;j<i;j++)
				if (list.get(i).getReceiverId().equalsIgnoreCase(list.get(j).getReceiverId())) {
					list.remove(i);
					i--;
				}
			}
			
		}
		for(int i=0;i<list.size();i++)
		System.out.println(list.get(i).toString());
		map.put("mML", list);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/messenger/sendMessage", method = RequestMethod.POST)
	public Map<String, Object> sendMessage(Messenger dto, HttpSession session) throws Exception { //
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String memberId = info.getMemberId();
		dto.setSenderId(memberId);
		service.insertMessage(dto);
		Map<String, Object> map = new HashMap<>();

		// List<Member> list= service.listFriend(memberId);
		// map.put("friendList", list);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/messenger/getMessages", method = RequestMethod.POST)
	public Map<String, Object> getMessages(Messenger dto, HttpSession session) throws Exception { //
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String myId = info.getMemberId();
		String otherId = dto.getReceiverId();
		Map<String, String> id = new HashMap<>();
		id.put("receiverId", otherId);
		id.put("senderId", myId);
		List<Messenger> list = service.getMessages(id);
		Map<String, Object> map = new HashMap<>();
		map.put("messageList", list);
		return map;
	}

}
