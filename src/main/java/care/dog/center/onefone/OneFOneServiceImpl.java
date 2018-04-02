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

	@Override
	public OneFOneVo readonefone(int num) {
		OneFOneVo dto = null;
		try {
			dto = dao.selectOne("onefone.readonefone", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int insertReply(ReplyVo dto) {
		int result = 0;
		try {
			result = dao.insertData("onefone.insertreply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
