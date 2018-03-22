package care.dog.center.onefone;

import org.springframework.beans.factory.annotation.Autowired;

import care.dog.common.dao.CommonDAO;

public class OneFOneServiceImpl implements OneFOneService{
	@Autowired CommonDAO dao;

	@Override
	public int insertOneFOne(OneFOne dto) {
		int result = 0;
		try {
			result = dao.insertData("oneforone.insertonefone",dto);
		} catch (Exception e) {
		}
		return result;
	}

}
