package care.dog.center.onefone;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.dao.CommonDAO;

@Service("onefone.oneFOneService")
public class OneFOneServiceImpl implements OneFOneService{
	@Autowired CommonDAO dao;

	@Override
	public int insertOneFOne(OneFOneVo dto) {
		int result = 0;
		try {
			result = dao.insertData("onefone.insertonefone",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<OneFOneVo> listOneFOne(Map<String, Object> map) {
		List<OneFOneVo> list = null;
		try {
			list = dao.selectList("onefone.listonefone", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
