package care.dog.strayDog;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

@Service("strayDog.strayDogServiceImpl")
public class StrayDogServiceImpl implements StrayDogService {
	private static String MAINURL = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/";
	private static String KEY = "9pUaOiX4C%2BiH1Rt21Bq0dLJbh2Edo6TOS4JFKHcsNK69ezsQ2p1uHBJUWTcAF4Pzybzv5RkKh7gDMY6TL2YvlQ%3D%3D";
	private static DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	
	@Override
	public ArrayList<HashMap<String, Object>> strayDog(Map<String, Object> model) {
		ArrayList<HashMap<String, Object>> allList = new ArrayList<HashMap<String, Object>>();
		String mainUrl = MAINURL+ "abandonmentPublic";
	        try {
	        	String serviceKey= "?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + KEY;
	        	String parameter="&" + URLEncoder.encode("bgnde","UTF-8") + "=" + URLEncoder.encode("20180205", "UTF-8"); /*유기날짜 (검색 시작일) (YYYYMMDD) */
	        	parameter += "&" + URLEncoder.encode("endde","UTF-8") + "=" + URLEncoder.encode("20180305", "UTF-8"); /*유기날짜 (검색 종료일) (YYYYMMDD) */
	        	parameter += "&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode("417000", "UTF-8"); /*축종코드 - 개 : 417000 - 고양이 : 422400 - 기타 : 429900 */
	        	parameter += "&" + URLEncoder.encode("kind","UTF-8") + "=" + model.get("kind"); /*품종코드 (품종 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + model.get("upr_cd"); /*시도코드 (시도 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("org_cd","UTF-8") + "=" + model.get("org_cd"); /*시군구코드 (시군구 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("care_reg_no","UTF-8") + "=" + model.get("care_reg_no"); /*보호소번호 (보호소 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("state","UTF-8") + "=" + model.get("state"); /*상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect */
	        	parameter += "&" + URLEncoder.encode("pageNo","UTF-8") + "=" + model.get("pageNo"); /*페이지 번호*/
	        	parameter += "&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + model.get("numOfRows"); /*페이지당 보여줄 개수*/
	        	
	        	String url = mainUrl+serviceKey+parameter;
	        	
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
	
				// root tag
				Element root = doc.getDocumentElement();
	
				// 가져올 tag
				NodeList nList = root.getElementsByTagName("item");
				//System.out.println("가져올 리스트 수 : " + nList.getLength());
				/*map.put("totalCount",root.getElementsByTagName("totalCount").item(0).getTextContent().toString());
				allList.add(map);*/
				for(int i=0;i<nList.getLength();i++) {
					String sexCd = root.getElementsByTagName("sexCd").item(i).getTextContent().toString();
					String gender = "";
					if(sexCd.equals("M")) {
						gender="암컷";
					}else if(sexCd.equals("F")) {
						gender="수컷";
					}else {
						gender="미상";
					}
					
					String neu = root.getElementsByTagName("neuterYn").item(i).getTextContent().toString();
					String neuCheck = "";
					if(sexCd.equals("U")) {
						neuCheck="미상";
					}else { 
						neuCheck=neu;
					}
					
					String person = root.getElementsByTagName("chargeNm").item(i).getTextContent().toString();
					String pChk = "";
					if(person==null) {
						pChk="없음";
					}else {
						pChk=person;
					}
					
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("age", root.getElementsByTagName("age").item(i).getTextContent().toString()); //나이
					map.put("careAddr", root.getElementsByTagName("careAddr").item(i).getTextContent().toString()); //보호장소
					map.put("careNm", root.getElementsByTagName("careNm").item(i).getTextContent().toString()); //보호소 이름
					map.put("careTel", root.getElementsByTagName("careTel").item(i).getTextContent().toString()); //보호소 번호
					map.put("chargeNm", pChk); //담당자
					map.put("colorCd", root.getElementsByTagName("colorCd").item(i).getTextContent().toString()); 
					map.put("desertionNo", root.getElementsByTagName("desertionNo").item(i).getTextContent().toString()); //유기번호
					map.put("filename", root.getElementsByTagName("filename").item(i).getTextContent().toString()); //썸네일
					map.put("happenDt", root.getElementsByTagName("happenDt").item(i).getTextContent().toString()); //접수일
					map.put("happenPlace", root.getElementsByTagName("happenPlace").item(i).getTextContent().toString()); //발견장소
					map.put("kindCd", root.getElementsByTagName("kindCd").item(i).getTextContent().toString()); //품종
					map.put("neuterYn",neuCheck); //중성화 여부
					map.put("noticeEdt", root.getElementsByTagName("noticeEdt").item(i).getTextContent().toString()); //공고 종료일
					map.put("noticeNo", root.getElementsByTagName("noticeNo").item(i).getTextContent().toString()); //공고 번호
					map.put("noticeSdt", root.getElementsByTagName("noticeSdt").item(i).getTextContent().toString()); //공고시작일
					map.put("officetel", root.getElementsByTagName("officetel").item(i).getTextContent().toString()); //담당자 연락처
					map.put("orgNm", root.getElementsByTagName("orgNm").item(i).getTextContent().toString()); //관할기관
					map.put("popfile", root.getElementsByTagName("popfile").item(i).getTextContent().toString()); //이미지
					map.put("processState", root.getElementsByTagName("processState").item(i).getTextContent().toString()); //상태
					map.put("sexCd", gender); //성별
					map.put("specialMark", root.getElementsByTagName("specialMark").item(i).getTextContent().toString()); //특징
					map.put("weight", root.getElementsByTagName("weight").item(i).getTextContent().toString());
					
					allList.add(map);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	        return allList;
	} // strayDog END
	
	@Override
	public List<Map<String, Object>> listSido() {
		List<Map<String, Object>> list = new ArrayList<>();
		String allurl = MAINURL+"sido";
		try {
			String serviceKey= "?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + KEY;
			String url = allurl+serviceKey;
			
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			Element root = doc.getDocumentElement();
			NodeList nList = root.getElementsByTagName("item");
			
			for(int i=0;i<nList.getLength();i++) {
				Map<String, Object> model = new HashMap<>();
				model.put("orgCd", root.getElementsByTagName("orgCd").item(i).getTextContent().toString()); //지역코드
				model.put("orgdownNm", root.getElementsByTagName("orgdownNm").item(i).getTextContent().toString()); //시도 이름
				
				list.add(model);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // listSido END

	@Override
	public List<Map<String, Object>> listGu(String sido) {
		List<Map<String, Object>> list = new ArrayList<>();
		String allurl = MAINURL+"sigungu";
		try {
			String queryParam = "&"+ URLEncoder.encode("upr_cd","UTF-8") +"="+ sido;
			String serviceKey= "?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + KEY;
			String url = allurl+serviceKey+queryParam;
			
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			Element root = doc.getDocumentElement();
			NodeList nList = root.getElementsByTagName("item");
			
			for(int i=0;i<nList.getLength();i++) {
				Map<String, Object> model = new HashMap<>();
				model.put("orgCd", root.getElementsByTagName("orgCd").item(i).getTextContent().toString()); //지역코드
				model.put("orgdownNm", root.getElementsByTagName("orgdownNm").item(i).getTextContent().toString()); //구 이름
				
				list.add(model);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // listGu END

	@Override
	public List<Map<String, Object>> listCenter(String sido, String gu) {
		List<Map<String, Object>> list = new ArrayList<>();
		String allurl = MAINURL+"shelter";
		try {
			String queryParam = "&"+ URLEncoder.encode("upr_cd","UTF-8") +"="+ sido;
			queryParam += "&"+ URLEncoder.encode("org_cd","UTF-8") +"="+ gu;
			String serviceKey= "?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + KEY;
			String url = allurl+serviceKey+queryParam;
			
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			Element root = doc.getDocumentElement();
			NodeList nList = root.getElementsByTagName("item");
			
			for(int i=0;i<nList.getLength();i++) {
				Map<String, Object> model = new HashMap<>();
				model.put("careRegNo", root.getElementsByTagName("careRegNo").item(i).getTextContent().toString()); //센터코드
				model.put("careNm", root.getElementsByTagName("careNm").item(i).getTextContent().toString()); //센터이름
				
				list.add(model);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // listCenter END

	@Override
	public List<Map<String, Object>> listKind() {
		List<Map<String, Object>> list = new ArrayList<>();
		String allurl = MAINURL+"kind";
		try {
			String queryParam = "&"+ URLEncoder.encode("up_kind_cd","UTF-8") +"="+ URLEncoder.encode("417000", "UTF-8");
			String serviceKey= "?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + KEY;
			String url = allurl+serviceKey+queryParam;
			
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			Element root = doc.getDocumentElement();
			NodeList nList = root.getElementsByTagName("item");
			
			for(int i=0;i<nList.getLength();i++) {
				Map<String, Object> model = new HashMap<>();
				model.put("kindCd", root.getElementsByTagName("kindCd").item(i).getTextContent().toString()); // 종 코드
				model.put("KNm", root.getElementsByTagName("KNm").item(i).getTextContent().toString()); // 종이름
				
				list.add(model);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} // listKind END

	@Override
	public String totalCount(Map<String, Object> model) {
		String totalCount="";
		String mainUrl = MAINURL+ "abandonmentPublic";
	        try {
	        	String serviceKey= "?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + KEY;
	        	String parameter="&" + URLEncoder.encode("bgnde","UTF-8") + "=" + URLEncoder.encode("20180205", "UTF-8"); /*유기날짜 (검색 시작일) (YYYYMMDD) */
	        	parameter += "&" + URLEncoder.encode("endde","UTF-8") + "=" + URLEncoder.encode("20180305", "UTF-8"); /*유기날짜 (검색 종료일) (YYYYMMDD) */
	        	parameter += "&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode("417000", "UTF-8"); /*축종코드 - 개 : 417000 - 고양이 : 422400 - 기타 : 429900 */
	        	parameter += "&" + URLEncoder.encode("kind","UTF-8") + "=" + model.get("kind"); /*품종코드 (품종 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + model.get("upr_cd"); /*시도코드 (시도 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("org_cd","UTF-8") + "=" + model.get("org_cd"); /*시군구코드 (시군구 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("care_reg_no","UTF-8") + "=" + model.get("care_reg_no"); /*보호소번호 (보호소 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("state","UTF-8") + "=" + model.get("state"); /*상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect */
	        	parameter += "&" + URLEncoder.encode("pageNo","UTF-8") + "=" + model.get("pageNo"); /*페이지 번호*/
	        	parameter += "&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + model.get("numOfRows"); /*페이지당 보여줄 개수*/
	        	
	        	String url = mainUrl+serviceKey+parameter;
	        	
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
	
				Element root = doc.getDocumentElement();
	
				totalCount = root.getElementsByTagName("totalCount").item(0).getTextContent().toString();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return totalCount;
	}
	
}
