package care.dog.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public Member readMember(String memberId); //
	public int memberIdCheck(String memberId);
	
	public void insertMember(Member dto) throws Exception ; //
	
	public void updateMember(Member dto) throws Exception ; //
	public int updateLastLogin(String userId); //
	
	public int deleteMember2(String userId); //
	
	public int dataCount(Map<String, Object> map); //
	public List<Member> listMember(Map<String, Object> map); //
	
	public int updateAuthority(Map<String, Object> map); //
	public List<Member> listAuthority(String userId);	//
	
	public List<String> selectIsMember();
	public int updateIsMember(String memberId);
	public int isMemberByMemberId(String memberId);
	public int deleteAuthFail(String memberId) throws Exception;
	public int emailChecked(Map<String, String> map);
	
	public String findId(String email);
	public int changePwd(Map<String, String> dto);
}
