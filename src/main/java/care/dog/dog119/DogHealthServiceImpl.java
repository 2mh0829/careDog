package care.dog.dog119;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.dao.CommonDAO;
import care.dog.dog119.dogHealthVo.DogHealthVo;

@Service("dog119.dogHealthService")
public class DogHealthServiceImpl implements DogHealthService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<DogHealthVo> listBoard(Map<String, Object> map) {
		List<DogHealthVo> list=null;
		try {
			list=dao.selectList("dogHealth.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}

	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int cnt=0;
		try {
			cnt=dao.selectOne("dogHealth.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
