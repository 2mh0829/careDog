package care.dog.strayDog;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
		service.strayDog();
		return ".strayDog.main";
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
