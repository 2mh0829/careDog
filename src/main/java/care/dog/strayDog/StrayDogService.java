package care.dog.strayDog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface StrayDogService {
	public List<Map<String, Object>> listSido(); //시도 리스트 호출
	public List<Map<String, Object>> listGu(String sido); //구 리스트 호출
	public List<Map<String, Object>> listCenter(String sido, String gu); //구 리스트 호출
	public List<Map<String, Object>> listKind(); //종 리스트 호출
	public Map<String, Object> pagenation(Map<String, Object> model);
	
	public ArrayList<HashMap<String, Object>> strayDog(Map<String, Object> model); //유기견 리스트 호출
	
	//자원봉사 페이지
	public int volunteerApply(Map<String, Object> map);
	
	//일시 후원 인풋
	public int tmpSupportInput(Map<String, Object> map);
	
	//정기 후원 인풋
	public int fixSupportInput(Map<String, Object> map);
}
