package care.dog.myPage;
//aa
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;


@Service("caredog.myPageService")
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int maxMyPageId() {
		int result=0;
		try {
			result=dao.selectOne("myPage.maxMyPageId");
			if(result<10000)
				result=10000;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertMyPage(MyPageInfo dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String filename=fileManager.doFileUpload(
						dto.getUpload(), pathname);
				dto.setProfilePhoto(filename);
			}
			
			int myPageId=maxMyPageId()+1;
			dto.setMyPageId(myPageId);
			dao.insertData("myPage.insertMyPageInfo", dto);
			dao.insertData("myPage.insertMyPageProfile", dto);
			dao.updateData("myPage.updateProfilePhoto", dto);
			createMyPageTable(myPageId);
			
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}



	
	@Override
	public int updateMyPage(MyPageInfo dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				if(dto.getProfilePhoto().length()!=0) {
					fileManager.doFileDelete(dto.getProfilePhoto(), pathname);
				}
				
				String filename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setProfilePhoto(filename);
			}			
			
			dao.updateData("myPage.updateMyPageInfo", dto);
			dao.updateData("myPage.updateMyPageProfile", dto);
			dao.updateData("myPage.updateProfilePhoto", dto);
			result=1;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteImage(int myPageId, String pathname, String filename) {
		int result=0;
		try {
			fileManager.doFileDelete(filename, pathname);
			
			result=dao.updateData("myPage.deleteMyPageProfileImage", myPageId);
		} catch (Exception e) {
		}
		return result;
	}
	
	@Override
	public int deleteMyPage(int myPageId, String pathname) {
		int result=0;
		try {
			// 개인 블로그 파일 폴더 및 파일 삭제  
			fileManager.removePathname(pathname);
			
			dao.deleteData("myPage.deleteMyPageProfile", myPageId);
			dao.deleteData("myPage.deleteMyPageInfo", myPageId);
			
			// 테이블 지우기
			dropMyPageTable(myPageId);
			
			result=1;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCountMyPage(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("myPage.dataCountMyPage", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<MyPageInfo> listMyPage(Map<String, Object> map) {
		List<MyPageInfo> list=null;
		try {
			list=dao.selectList("myPage.listMyPage", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public MyPageInfo readMyPageInfo(String memberId) {
		System.out.println("##"+memberId);
		MyPageInfo dto=null;
		try {
			dto=dao.selectOne("myPage.readMyPageInfo", memberId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public MyPageInfo readMyPageInfoHome(int myPageId) {
		MyPageInfo dto=null;
		try {
			dto=dao.selectOne("myPage.readMyPageInfoHome", myPageId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}


	@Override
	public int updateMyPageVisitorCount(int myPageId) {
		int result=0;
		try {
			result=dao.updateData("myPage.updateMyPageVisitorCount", myPageId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int createMyPageTable(int myPageId) {
		int result=0;
		try {
			dao.updateData("myPage.createGuestTable", myPageId);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dropMyPageTable(int myPageId) {
		int result=0;
		try {
			dao.updateData("myPage.dropGuestTable", myPageId);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
