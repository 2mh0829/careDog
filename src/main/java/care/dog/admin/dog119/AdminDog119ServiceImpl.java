package care.dog.admin.dog119;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.dao.CommonDAO;

@Service("dog119.adminDog119Service")
public class AdminDog119ServiceImpl implements AdminDog119Service {
	@Autowired
	private CommonDAO dao;

	@Override
	public int dogHealthCreate(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.insertData("dogHealth.dhInsert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
