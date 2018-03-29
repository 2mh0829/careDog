package care.dog.myPage.myPet;

import java.util.List;

public interface MyPetService {

	public int insertMyPetInfo(MyPetInfo dto, String pathname);

	public List<MyPetInfo> selectMyPetInfo(String memberId);

}
