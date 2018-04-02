package care.dog.admin.strayDog;

import java.util.List;
import java.util.Map;

import care.dog.admin.strayDogVo.AdminFixSupportVo;
import care.dog.admin.strayDogVo.AdminTempSupportVo;
import care.dog.admin.strayDogVo.VolunteerVO;

public interface AdminStrayDogService {
	public List<AdminFixSupportVo> fixSupportList(Map<String, Object> map);
	public List<AdminTempSupportVo> tempSupportList(Map<String, Object> map);
	public int fixSupportDataCnt(Map<String, Object> map);
	public int tempSupportDataCnt(Map<String, Object> map);
	
	public List<VolunteerVO> listMonthSchedule(Map<String, Object> map);
	
	public VolunteerVO readSchedule(int num);
}
