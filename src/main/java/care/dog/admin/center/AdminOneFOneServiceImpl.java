package care.dog.admin.center;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.center.onefone.OneFOneVo;
import care.dog.common.dao.CommonDAO;

@Service("center.adminOneFOneService")
public class AdminOneFOneServiceImpl implements AdminOneFOneService{
	@Autowired CommonDAO dao;

	@Override
	public List<OneFOneVo> listOneFOne(Map<String, Object> map) {
		List<OneFOneVo> list = null;
		try {
			list = dao.selectList("onefone.adminlistonefone", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
