package care.dog.myPage.messenger;
//aa
import java.util.List;
import java.util.Map;

import care.dog.member.Member;


public interface MessengerService {
	public List<Member> listFriend(String memberId);

	public int insertMessage(Messenger dto);

	public List<Messenger> getMessageMemberList(String memberId);

	public List<Messenger> getMessages(Map<String,String> id);
}
