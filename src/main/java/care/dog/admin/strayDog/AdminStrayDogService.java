package care.dog.admin.strayDog;

import java.util.List;
import java.util.Map;

import care.dog.admin.strayDogVo.AdminFixSupportVo;
import care.dog.dog119.dogHealthVo.VolunteerVO;

public interface AdminStrayDogService {
	public List<AdminFixSupportVo> fixSupportList(Map<String, Object> map);
	public int fixSupportDataCnt(Map<String, Object> map);
	
	public List<VolunteerVO> listMonthSchedule(Map<String, Object> map);
	
	public VolunteerVO readSchedule(int num);
}
