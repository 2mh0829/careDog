package care.dog.strayDog;

import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xml.sax.SAXException;

@Controller("strayDog.strayDogController")
public class StrayDogController {
	
	@Autowired
	private StrayDogService service;
	
	
	@RequestMapping(value="/strayDog")
	public String main() {
		return ".strayDog.main";
	}
	
	@RequestMapping(value="/strayDog/dogList", method=RequestMethod.POST)
	public String strayDogList() throws IOException, ParserConfigurationException, SAXException {
		service.StrayDog();
		
		return ".strayDog.main";
	}
	
}
