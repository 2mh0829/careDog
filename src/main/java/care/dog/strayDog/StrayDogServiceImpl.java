package care.dog.strayDog;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.fasterxml.jackson.annotation.JsonValue;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service("strayDog.strayDogServiceImpl")
public class StrayDogServiceImpl implements StrayDogService {
	@Override
	public ArrayList<HashMap<String, Object>> StrayDog() throws IOException, ParserConfigurationException, SAXException {
		ArrayList<HashMap<String, Object>> strayDogList=new ArrayList<HashMap<String, Object>>();
		
		String addr="http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido?ServiceKey=";
		String key="2tZYhOcrXJBIeeVzX9bylvmtsaHiaSrBkh13F9DlyGL0KfQZKGuRtuM3xcc%2Bz55Nblf0iaPOfUwRqeKu2IZ7rQ%3D%3D";
		String parameter="";
		
		addr=addr+key+parameter;
		
		DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
		DocumentBuilder parser = f.newDocumentBuilder();
		
		//XML 파싱
		Document xmlDoc = null;
		String parseUrl = addr;
		
		xmlDoc = parser.parse(parseUrl);
		xmlDoc.getDocumentElement().normalize();
		
		NodeList items = xmlDoc.getElementsByTagName("item");
		
		/*try {
			for(int i=0;i<items.getLength();i++) {
				Node n = items.item(i);
				if(n.getNodeType() != Node.ELEMENT_NODE)
					continue;
				
				Element e = (Element)n;
				HashMap pub=new HashMap();
				
				for(String name : )
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Element root = xmlDoc.getDocumentElement();
		
		int length = */
		
		URL url=new URL(addr);
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
		String inLine;
		String xml="";
		while((inLine=in.readLine()) != null) xml=inLine;
		in.close();
		
		JSONObject json = new JSONObject();
		json.put("msg", xml);
		
		return strayDogList;
	}
	
}
