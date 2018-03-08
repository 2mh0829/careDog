package care.dog.strayDog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		ArrayList<HashMap<String, Object>> list=service.strayDog(); // 값 가져오는용
		map.put("list", list);
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
