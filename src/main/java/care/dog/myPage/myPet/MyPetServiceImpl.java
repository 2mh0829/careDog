package care.dog.myPage.myPet;
//aa

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
	
	
}
