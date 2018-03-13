package care.dog.dog119;

import java.util.List;
import java.util.Map;

import care.dog.dog119.dogHealthVo.DogHealthVo;

public interface DogHealthService {
	public List<DogHealthVo> listBoard(Map<String, Object> map);
	public int updateHitCount(int num);
	public int dataCount(Map<String, Object> map);
}
