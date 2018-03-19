package care.dog.dog119;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.dao.CommonDAO;
import care.dog.dog119.dogHealthVo.DhReplyVo;
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
		return list;
	}

	@Override
	public int updateHitCount(int num) {
		int result = 0;
		try {
			result = dao.updateData("dogHealth.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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

	@Override
	public DogHealthVo dhDetail(int boardNum) {
		DogHealthVo dto = null;
		try {
			dto = dao.selectOne("dogHealth.dhDetail", boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insertDhLike(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.insertData("dogHealth.dhLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dhLikeCnt(int num) {
		int result = 0;
		try {
			result = dao.selectOne("dogHealth.dhLikeCnt", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<DhReplyVo> listDhReply(Map<String, Object> map) {
		List<DhReplyVo> list = new ArrayList<>();
		try {
			list = dao.selectList("dogHealth.dhReplyList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertDhReply(DhReplyVo dto) {
		int result=0;
		try {
			System.out.println("serviceimpl===============>"+dto);
			result=dao.insertData("dogHealth.dhReplyInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int dhReplyCount(int boardNum) {
		int result = 0 ;
		try {
			result = dao.selectOne("dogHealth.dhReplyCount", boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
