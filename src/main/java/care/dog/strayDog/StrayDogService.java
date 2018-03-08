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
	public String totalCount(Map<String, Object> model); // 총 갯수
	
	public ArrayList<HashMap<String, Object>> strayDog(Map<String, Object> model); //유기견 리스트 호출
}
