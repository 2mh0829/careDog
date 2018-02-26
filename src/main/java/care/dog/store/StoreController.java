package care.dog.store;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("store.storeController")
public class StoreController {
	
	@RequestMapping(value="/store")
	public String main() {
		return ".store.main";
	}
	
	@RequestMapping(value="/store/list")
	public String productList() {
		return ".store.list";
	}
	
}
