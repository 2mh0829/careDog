package care.dog.strayDog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.common.MyUtilBootstrap;

@Controller("strayDog.strayDogController")
public class StrayDogController {
	
	@Autowired
	private StrayDogService service;
	@Autowired
	private MyUtilBootstrap myUtilBoostrap;
	
	
	@RequestMapping(value="/strayDog")
	public String main() {
		return ".strayDog.main";
	}
	
	@RequestMapping(value="/strayDog/callList", method=RequestMethod.POST)  // 유기견 리스트 호출
	@ResponseBody
	public Map<String, Object> callList(
			@RequestParam Map<String, Object> model
			,HttpServletRequest req
			){
		Map<String, Object> map = new HashMap<>(); // 메인보내는 map
		ArrayList<HashMap<String, Object>> list=service.strayDog(model); // 값 가져옴
		Map<String, Object> page = service.pagenation(model);
		int numOfRows = Integer.parseInt((String) page.get("numOfRows")); // 한 페이지에 보여지는 글 수
		int totalCount = Integer.parseInt((String) page.get("totalCount")); // 총 게시물 수
		int pageNo = Integer.parseInt((String) page.get("pageNo")); // 현재 페이지
		int totalPage = 0;
		
		if(totalCount != 0)
			totalPage = myUtilBoostrap.pageCount(numOfRows, totalCount);
		
		map.put("list", list);
		
		String paging = myUtilBoostrap.paging(pageNo, totalPage);
		System.out.println(paging);
		map.put("paging", paging);
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
	
	@RequestMapping(value="/strayDog/fixSupport")
	public String fixSupport() {
		
		return ".strayDog.fixSupport";
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
