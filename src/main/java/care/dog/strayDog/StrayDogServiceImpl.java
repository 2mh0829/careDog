package care.dog.strayDog;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Service("strayDog.strayDogServiceImpl")
public class StrayDogServiceImpl implements StrayDogService {
	@Override
	public Map<String, Object> strayDog() {
		Map<String, Object> map=new HashMap<>();
		
		String mainUrl = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic";
	        try {
	        	String serviceKey="?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+"9pUaOiX4C%2BiH1Rt21Bq0dLJbh2Edo6TOS4JFKHcsNK69ezsQ2p1uHBJUWTcAF4Pzybzv5RkKh7gDMY6TL2YvlQ%3D%3D";
	        	String parameter="&" + URLEncoder.encode("bgnde","UTF-8") + "=" + URLEncoder.encode("20180205", "UTF-8"); /*유기날짜 (검색 시작일) (YYYYMMDD) */
	        	parameter += "&" + URLEncoder.encode("endde","UTF-8") + "=" + URLEncoder.encode("20180305", "UTF-8"); /*유기날짜 (검색 종료일) (YYYYMMDD) */
	        	parameter += "&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode("417000", "UTF-8"); /*축종코드 - 개 : 417000 - 고양이 : 422400 - 기타 : 429900 */
	        	parameter += "&" + URLEncoder.encode("kind","UTF-8") + "=" + URLEncoder.encode("", "UTF-8"); /*품종코드 (품종 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8"); /*시도코드 (시도 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("org_cd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8"); /*시군구코드 (시군구 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("care_reg_no","UTF-8") + "=" + URLEncoder.encode("", "UTF-8"); /*보호소번호 (보호소 조회 OPEN API 참조) */
	        	parameter += "&" + URLEncoder.encode("state","UTF-8") + "=" + URLEncoder.encode("null", "UTF-8"); /*상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect */
	        	parameter += "&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"); /*페이지 번호*/
	        	parameter += "&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("9", "UTF-8"); /*페이지당 보여줄 개수*/
	        	
	        	String url = mainUrl+serviceKey+parameter;
	        	
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
	
				// root tag
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
	
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("item");
				//System.out.println("파싱할 리스트 수 : " + nList.getLength());
				
				for(int temp=0;temp<nList.getLength();temp++) {
					Node n = nList.item(temp);
					if(n.getNodeType()==Node.ELEMENT_NODE) {
						Element e = (Element)n;
						//System.out.println(e.getTextContent());
						map.put("age", getTagValue("age",e));
						map.put("careAddr", getTagValue("careAddr",e));
						map.put("careNm", getTagValue("careNm",e));
						map.put("careTel", getTagValue("careTel",e));
						map.put("chargeNm", getTagValue("chargeNm",e));
						map.put("colorCd", getTagValue("colorCd",e));
						map.put("desertionNo", getTagValue("desertionNo",e));
						map.put("filename", getTagValue("filename",e));
						map.put("happenDt", getTagValue("happenDt",e));
						map.put("happenPlace", getTagValue("happenPlace",e));
						map.put("kindCd", getTagValue("kindCd",e));
						map.put("neuterYn", getTagValue("neuterYn",e));
						map.put("noticeEdt", getTagValue("noticeEdt",e));
						map.put("noticeNo", getTagValue("noticeNo",e));
						map.put("noticeSdt", getTagValue("noticeSdt",e));
						map.put("officetel", getTagValue("officetel",e));
						map.put("orgNm", getTagValue("orgNm",e));
						map.put("popfile", getTagValue("popfile",e));
						map.put("processState", getTagValue("processState",e));
						map.put("sexCd", getTagValue("sexCd",e));
						map.put("specialMark", getTagValue("specialMark",e));
						map.put("weight", getTagValue("weight",e));
						map.put("totalCount", getTagValue("totalCount",e));
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	        
	        return map;
	}
	
	//tag 값 가져오기
	private static String getTagValue(String tag, Element e) {
		NodeList nList = e.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nList.item(0);
		if(nValue==null)
			return null;
		return nValue.getNodeValue();
	}

	@Override
	public Map<String, Object> listSido() {
		Map<String, Object> model = new HashMap<>();
	        /*String addr = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido"+"?ServiceKey=";
			String serviceKey = "2tZYhOcrXJBIeeVzX9bylvmtsaHiaSrBkh13F9DlyGL0KfQZKGuRtuM3xcc%2Bz55Nblf0iaPOfUwRqeKu2IZ7rQ%3D%3D";
			String parameter = "";
			
			//인증키(서비스키) url인코딩
			serviceKey = URLEncoder.encode(serviceKey, "UTF-8");
			
			 parameter setting
			 * parameter = parameter + "&" + "PARAM1=AAA";
			 * parameter = parameter + "&" + "PARAM2=BBB";
			 * parameter = parameter + "&" + "PARAM3=CCC";
			 * 
			
			addr = addr + serviceKey + parameter;
			
			URL url = new URL(addr);
			InputStream in = url.openStream(); 
			CachedOutputStream bos = new CachedOutputStream();
			IOUtils.copy(in, bos);
			in.close();
			bos.close();
			return bos.getOut().toString();*/

		return model;
	}
	
}
