package care.dog.center.onefone;

import java.util.List;
import java.util.Map;

public interface OneFOneService {
	public int insertOneFOne(OneFOneVo dto);
	public OneFOneVo readonefone(int num);
	public List<OneFOneVo> listOneFOne(Map<String, Object> map);

}
