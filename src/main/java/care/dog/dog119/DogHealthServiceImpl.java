package care.dog.dog119;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import care.dog.common.dao.CommonDAO;
import care.dog.dog119.dogHealthVo.DhReplyVo;
import care.dog.dog119.dogHealthVo.DogHealthVo;

@Service("dog119.dogHealthService")
public class DogHealthServiceImpl implements DogHealthService {
	@Autowired
	private CommonDAO dao;
	
	private static DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	
	@Override
	public List<DogHealthVo> listBoard(Map<String, Object> map) {
		List<DogHealthVo> list=null;
		try {
			list=dao.selectList("dogHealth.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateHitCount(int num) {
		int result = 0;
		try {
			result = dao.updateData("dogHealth.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int cnt=0;
		try {
			cnt=dao.selectOne("dogHealth.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public DogHealthVo dhDetail(int boardNum) {
		DogHealthVo dto = null;
		try {
			dto = dao.selectOne("dogHealth.dhDetail", boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insertDhLike(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.insertData("dogHealth.dhLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dhLikeCnt(int num) {
		int result = 0;
		try {
			result = dao.selectOne("dogHealth.dhLikeCnt", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<DhReplyVo> listDhReply(Map<String, Object> map) {
		List<DhReplyVo> list = new ArrayList<>();
		try {
			list = dao.selectList("dogHealth.dhReplyList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertDhReply(DhReplyVo dto) {
		int result=0;
		try {
			result=dao.insertData("dogHealth.dhReplyInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int dhReplyCount(int boardNum) {
		int result = 0 ;
		try {
			result = dao.selectOne("dogHealth.dhReplyCount", boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dhInsert(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.insertData("dogHealth.dhInsert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> sido() {
		List<Map<String, Object>> list = new ArrayList<>();
		
		String url="http://openapi.nsdi.go.kr/nsdi/eios/service/rest/AdmService/admCodeList.xml"; /* URL */   
        try {
			String key="?" + URLEncoder.encode("authkey","UTF-8") + "=350264dd10fbcc773e94e6";
			url = url+key;
			
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			Element root = doc.getDocumentElement();
			NodeList nList = root.getElementsByTagName("admVOList");
			for(int i=0;i<nList.getLength();i++) {
				Map<String, Object> model = new HashMap<>();
				model.put("admCodeNm", root.getElementsByTagName("admCodeNm").item(i).getTextContent().toString());
				model.put("admCode", root.getElementsByTagName("admCode").item(i).getTextContent().toString());
				model.put("lowestAdmCodeNm", root.getElementsByTagName("lowestAdmCodeNm").item(i).getTextContent().toString());
				
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> gugun(String sido) {
	List<Map<String, Object>> list = new ArrayList<>();
		String url="http://openapi.nsdi.go.kr/nsdi/eios/service/rest/AdmService/admSiList.xml"; /* URL */   
        try {
			String key="?" + URLEncoder.encode("authkey","UTF-8") + "=c384968ddeccd585e82cc8";
			String q="&" + URLEncoder.encode("admCode","UTF-8") + "="+URLEncoder.encode(sido, "UTF-8");
			url = url+key+q;
			
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			Element root = doc.getDocumentElement();
			NodeList nList = root.getElementsByTagName("admVOList");
			
			for(int i=0;i<nList.getLength();i++) {
				Map<String, Object> model = new HashMap<>();
				model.put("admCodeNm", root.getElementsByTagName("admCodeNm").item(i).getTextContent().toString());
				model.put("admCode", root.getElementsByTagName("admCode").item(i).getTextContent().toString());
				model.put("lowestAdmCodeNm", root.getElementsByTagName("lowestAdmCodeNm").item(i).getTextContent().toString());
				
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
