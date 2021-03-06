package care.dog.admin.strayDog;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.admin.strayDogVo.AdminFixSupportVo;
import care.dog.admin.strayDogVo.AdminTempSupportVo;
import care.dog.admin.strayDogVo.VolunteerVO;
import care.dog.common.dao.CommonDAO;

@Service("strayDog.adminStrayDogServiceImpl")
public class AdminStrayDogServiceImpl implements AdminStrayDogService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<AdminFixSupportVo> fixSupportList(Map<String, Object> map) {
		List<AdminFixSupportVo> list = null;
		try {
			list = dao.selectList("fixSupport.fixSupportList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int fixSupportDataCnt(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("fixSupport.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<VolunteerVO> listMonthSchedule(Map<String, Object> map) {
		List<VolunteerVO> list = new ArrayList<>();
		try {
			list = dao.selectList("volunteer.vAdminList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public VolunteerVO readSchedule(int num) {
		VolunteerVO dto = new VolunteerVO();
		return dto;
	}

	@Override
	public List<AdminTempSupportVo> tempSupportList(Map<String, Object> map) {
		List<AdminTempSupportVo> list = null;
		try {
			list = dao.selectList("tmpSupport.tempSupportList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int tempSupportDataCnt(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("tmpSupport.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
