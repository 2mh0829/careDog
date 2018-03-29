package care.dog.myPage.myPet;
//aa

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;


@Service("caredog.myPetService")
public class MyPetServiceImpl implements MyPetService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public int insertMyPetInfo(MyPetInfo dto, String pathname) {
		int result=0;
		try {
			if(dto.getMyPetPhoto()!=null&&!dto.getMyPetPhoto().isEmpty()) {
				String filename=fileManager.doFileUpload(
						dto.getUpload(),
						pathname);
				dto.setMyPetPhoto(filename);
			}
			dao.insertData("myPet.insertMyPetInfo",dto);
			result =1;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;  
	}

	@Override
	public List<MyPetInfo> selectMyPetInfo(String memberId) {
		List<MyPetInfo> list = new ArrayList<>();
		try {
			list = dao.selectList("myPet.selectMyPetInfo", memberId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	
}
