package care.dog.strayDog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("strayDog.strayDogController")
public class StrayDogController {
	
	@Autowired
	private StrayDogService service;
	
	
	@RequestMapping(value="/strayDog")
	public String main() {
		return ".strayDog.main";
	}
	
	@RequestMapping(value="/strayDog/callList", method=RequestMethod.POST)  // 유기견 리스트 호출
	@ResponseBody
	public Map<String, Object> callList(@RequestParam Map<String, Object> model){
		Map<String, Object> map = new HashMap<>(); // 메인보내는 map
		ArrayList<HashMap<String, Object>> list=service.strayDog(model); // 값 가져옴
		String total = service.totalCount(model);
		map.put("list", list);
		map.put("totalCount", total);
		return map;
	}
	
	@RequestMapping(value="/strayDog/sido") //시도 리스트 호출
	@ResponseBody
	public Map<String, Object> callSido(){
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = service.listSido();
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value="/strayDog/gu") // 구 리스트 
	@ResponseBody
	public Map<String, Object> callGu(@RequestParam String upr_cd){
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = service.listGu(upr_cd);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value="/strayDog/center") // 보호소 리스트
	@ResponseBody
	public Map<String, Object> callCenter(@RequestParam String upr_cd, @RequestParam String org_cd){
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = service.listCenter(upr_cd, org_cd);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value="/strayDog/kind")
	@ResponseBody
	public Map<String, Object> callKind(){
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = service.listKind();
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
