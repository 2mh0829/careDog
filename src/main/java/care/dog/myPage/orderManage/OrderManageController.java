package care.dog.myPage.orderManage;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//aa

@Controller("orderManage.orderManageController")
public class OrderManageController {
	
	@RequestMapping(value = "/orderManage/main")
	public String main(Model model) throws Exception {
		//hello;
		return "myPage/orderManage/main";
	}
	
}
