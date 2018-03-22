package care.dog.dog119;

import java.util.List;
import java.util.Map;

import care.dog.dog119.dogHealthVo.DhReplyVo;
import care.dog.dog119.dogHealthVo.DogHealthVo;

public interface DogHealthService {
	public List<DogHealthVo> listBoard(Map<String, Object> map);
	public int updateHitCount(int num);
	public int dataCount(Map<String, Object> map);
	public DogHealthVo dhDetail(int boardNum);
	
	public int insertDhLike(Map<String, Object> map);
	public int dhLikeCnt(int num);
	
	public List<DhReplyVo> listDhReply(Map<String, Object> map);
	public int insertDhReply(DhReplyVo dto);
	public int dhReplyCount(int boardNum);
	public int dhInsert(DogHealthVo dto);
	
	public List<Map<String, Object>> sido();
	public List<Map<String, Object>> gugun(String sido);
}
