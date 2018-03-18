package care.dog.myPage.messenger;
//;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.dao.CommonDAO;
import care.dog.member.Member;
//aa
@Service("messenger.messengerService")
public class MessengerServiceImpl implements MessengerService{
	
	@Autowired
	CommonDAO dao;
	@Override
	public List<Member> listFriend(String memberId) {
		List<Member> list = null;
		System.out.println("@@@@@@@@@@"+memberId);
		try {
			list = dao.selectList("messenger.listFriend", memberId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
