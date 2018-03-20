package care.dog.myPage.messenger;
//;
import java.util.List;
import java.util.Map;

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
		try {
			list = dao.selectList("messenger.listFriend", memberId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int insertMessage(Messenger dto) {
		int result=0;
		 try {
			result = dao.insertData("messenger.insertMessage", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<Messenger> getMessageMemberList(String memberId) {
		List<Messenger> list = null;
			try {
				list= dao.selectList("messenger.getMessageMemberList", memberId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return list;
	}
	@Override
	public List<Messenger> getMessages(Map<String, String> id) {
		List<Messenger> list = null;
		try {
			list = dao.selectList("messenger.getMessages", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
