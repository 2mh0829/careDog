package care.dog.myPage.messenger;
//aa
import java.util.List;

import care.dog.member.Member;


public interface MessengerService {
	public List<Member> listFriend(String memberId);
}
