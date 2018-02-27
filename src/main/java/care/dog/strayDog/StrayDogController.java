package care.dog.strayDog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("strayDog.strayDogController")
public class StrayDogController {
	
	@RequestMapping(value="/strayDog")
	public String main() {
		return ".strayDog.main";
	}
	
}
