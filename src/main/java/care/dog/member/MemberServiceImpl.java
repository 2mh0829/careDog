package care.dog.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO  dao;

	@Override
	public Member readMember(String userId) {
		Member dto=null;
		try {
			dto=dao.selectOne("member.readMember", userId);
			
//			if(dto!=null) {
//				if(dto.getEmail()!=null) {
//					String [] s=dto.getEmail().split("@");
//					dto.setEmail1(s[0]);
//					dto.setEmail2(s[1]);
//				}
//
//				if(dto.getTel()!=null) {
//					String [] s=dto.getTel().split("-");
//					dto.setTel1(s[0]);
//					dto.setTel2(s[1]);
//					dto.setTel3(s[1]);
//				}
		//	}
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			// 회원정보 저장
			dao.insertData("member.insertMember1", dto);
			dao.insertData("member.insertMember2", dto);
//			dao.insertData("member.insertMember", dto);
			
			// 권한저장
			dto.setAuthority("ROLE_USER");
			dao.insertData("member.insertAuthority", dto);
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Override
	public void updateMember(Member dto) throws Exception {
		try {
//			if(dto.getEmail1() != null && dto.getEmail1().length()!=0 &&
//					dto.getEmail2() != null && dto.getEmail2().length()!=0)
//				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
//			
//			if(dto.getTel1() != null && dto.getTel1().length()!=0 &&
//					dto.getTel2() != null && dto.getTel2().length()!=0 &&
//							dto.getTel3() != null && dto.getTel3().length()!=0)
//				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			
			dao.updateData("member.updateMember1", dto);
			dao.updateData("member.updateMember2", dto);
			
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public int updateLastLogin(String userId) {
		int result=0;
		try {
			result=dao.updateData("member.updateLastLogin", userId);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteMember2(String userId) {
		int result=0;
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("userId", userId);
			map.put("enabled", 0);
			
			dao.updateData("member.updateMemberEnabled", map);
			
			// member2 테이블 삭제
			result=dao.deleteData("member.deleteMember2", userId);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("member.dataCount", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		List<Member> list=null;
		try {
			list=dao.selectList("member.listMember", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int updateAuthority(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.updateData("member.updateAuthority", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Member> listAuthority(String userId) {
		List<Member> list=null;
		try {
			list=dao.selectList("member.listAuthority", userId);
		} catch (Exception e) {
		}
		return list;
	}
	
	
	@Override
	public List<String> selectIsMember() {
		List<String> list = null;
		try {
			list = dao.selectList("member.selectIsMember");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateIsMember(String memberId) {
		int result = 0;
		try {
			result = dao.updateData("member.updateIsMember", memberId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int isMemberByMemberId(String memberId) {
		int result = 0;
		try {
			result = dao.selectOne("member.isMemberByMemberId", memberId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteAuthFail(String memberId) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("member.deleteMember2", memberId);
			result = dao.deleteData("member.deleteMember1", memberId);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public int memberIdCheck(String memberId) {
		int result = 0;
		try {
			result = dao.selectOne("member.memberIdCheck", memberId);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int emailChecked(Map<String, String> map) {
		int result = 0;
		try {
			result = dao.selectOne("member.emailChecked", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int changePwd(Map<String, String> dto) {
		int result = 0;
		try {
			result = dao.updateData("member.changePwd", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public String findId(String email) {
		String memberId = null;
		try {
			memberId = dao.selectOne("member.findId", email);
		} catch (Exception e) {
		}
		return memberId;
	}
}
