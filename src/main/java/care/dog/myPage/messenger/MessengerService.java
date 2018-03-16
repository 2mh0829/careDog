package care.dog.myPage.messenger;

import java.util.List;

import care.dog.member.Member;


public interface MessengerService {
	public List<Member> listFriend(String memberId);
}
