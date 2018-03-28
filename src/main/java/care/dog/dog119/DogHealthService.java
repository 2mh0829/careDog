package care.dog.dog119;

import java.util.List;
import java.util.Map;

import care.dog.dog119.dogHealthVo.DhReplyVo;
import care.dog.dog119.dogHealthVo.DogHealthVo;
import care.dog.dog119.dogMissingVo.DogMissingVo;

public interface DogHealthService {
	public List<DogHealthVo> listBoard(Map<String, Object> map);
	public int updateHitCount(int num);
	public int dataCount(Map<String, Object> map);
	public DogHealthVo dhDetail(int boardNum);
	public int insertDhLike(Map<String, Object> map);
	public int dhLikeCnt(int num);
	public int dhInsert(Map<String, Object> map);
	
	public List<DhReplyVo> listDhReply(Map<String, Object> map);
	public int insertDhReply(DhReplyVo dto);
	public int dhReplyCount(int boardNum);
	
	public List<Map<String, Object>> sido();
	public List<Map<String, Object>> gugun(String sido);
	
	public int dog119Input(DogMissingVo dto, String path);
	public int insertFile(DogMissingVo dto);
	public List<DogMissingVo> missingDogList(Map<String, Object> map);
	public int dog119DataCount(Map<String, Object> map);
	
}
