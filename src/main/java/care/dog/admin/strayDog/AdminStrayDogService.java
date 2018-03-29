package care.dog.admin.strayDog;

import java.util.List;
import java.util.Map;

import care.dog.admin.strayDogVo.AdminFixSupportVo;

public interface AdminStrayDogService {
	public List<AdminFixSupportVo> fixSupportList(Map<String, Object> map);
	public int fixSupportDataCnt(Map<String, Object> map);
	public int dogHealthCreate(Map<String, Object> map);
}
