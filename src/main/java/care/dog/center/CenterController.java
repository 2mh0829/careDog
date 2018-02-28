package care.dog.center;
//hihi
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("center.centerController")
public class CenterController {
	
	@RequestMapping(value="/center")
	public String main() {
		return ".center.main";
	}
	
	@RequestMapping(value="/gongji")
	public String gongjiMain() {
		return ".center.gongji";
	}

}
