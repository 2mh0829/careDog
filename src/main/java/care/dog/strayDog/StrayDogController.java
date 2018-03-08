package care.dog.strayDog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("strayDog.strayDogController")
public class StrayDogController {
	
	@Autowired
	private StrayDogService service;
	
	
	@RequestMapping(value="/strayDog")
	public String main() {
		
		return ".strayDog.main";
	}
	
	@RequestMapping(value="/strayDog/callList")
	@ResponseBody
	public Map<String, Object> callList(){  // 유기견 리스트 호출
		Map<String, Object> map = new HashMap<>(); // 메인보내는 용
		Map<String, Object> map2 = new HashMap<>(); 
		ArrayList<HashMap<String, Object>> list=service.strayDog(); // 값 가져오는용
		for(int i=0;i<list.size();i++) {
			HashMap<String, Object> model = list.get(i);
			map.put("age"+i, model.get("age"));
			map.put("careAddr"+i, model.get("careAddr"));
			map.put("careNm"+i, model.get("careNm"));
			map.put("careTel"+i, model.get("careTel"));
			map.put("chargeNm"+i, model.get("chargeNm"));
			map.put("colorCd"+i, model.get("colorCd"));
			map.put("desertionNo"+i, model.get("desertionNo"));
			map.put("filename"+i, model.get("filename"));
			map.put("happenDt"+i, model.get("happenDt"));
			map.put("happenPlace"+i, model.get("happenPlace"));
			map.put("kindCd"+i, model.get("kindCd"));
			map.put("neuterYn"+i, model.get("neuterYn"));
			map.put("noticeEdt"+i, model.get("noticeEdt"));
			map.put("noticeNo"+i, model.get("noticeNo"));
			map.put("noticeSdt"+i, model.get("noticeSdt"));
			map.put("officetel"+i, model.get("officetel"));
			map.put("orgNm"+i, model.get("orgNm"));
			map.put("popfile"+i, model.get("popfile"));
			map.put("processState"+i, model.get("processState"));
			map.put("sexCd"+i, model.get("sexCd"));
			map.put("specialMark"+i, model.get("specialMark"));
			map.put("weight"+i, model.get("weight"));
		}
		return map;
	}
	
	@RequestMapping(value="/strayDog/support")
	public String support() {
		
		return ".strayDog.support";
	}
	
	@RequestMapping(value="/strayDog/tempSupport")
	public String tempSupport() {
		
		return ".strayDog.tempSupport";
	}
	
	@RequestMapping(value="/strayDog/addSupport")
	public String addSupport() {
		
		return ".strayDog.addSupport";
	}
	
	@RequestMapping(value="/strayDog/volunteer")
	public String volunteer() {
		
		return ".strayDog.volunteer";
	}
	
}
