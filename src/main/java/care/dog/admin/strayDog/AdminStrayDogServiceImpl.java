package care.dog.admin.strayDog;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.admin.strayDogVo.AdminFixSupportVo;
import care.dog.common.dao.CommonDAO;

@Service("strayDog.adminStrayDogServiceImpl")
public class AdminStrayDogServiceImpl implements AdminStrayDogService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<AdminFixSupportVo> fixSupportList(Map<String, Object> map) {
		List<AdminFixSupportVo> list = null;
		try {
			list = dao.selectList("fixSupport.fixSupportList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int fixSupportDataCnt(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("fixSupport.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
