package care.dog.strayDog;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

public interface StrayDogService {
	public ArrayList<HashMap<String, Object>> StrayDog() throws IOException, ParserConfigurationException, SAXException;
}
