package care.dog.dog119;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import care.dog.common.MyUtilBootstrap;
import care.dog.dog119.dogHealthVo.DogHealthVo;

@Controller("dog119.dog119Controller")
public class Dog119Controller {
	@Autowired
	DogHealthService service;
	@Autowired
	private MyUtilBootstrap myUtilBootstrap;
	
	@RequestMapping(value="/dog119")
	public String main() {
		return ".dog119.dog119Main";
	}
	
	@RequestMapping(value="/dog119/created")
	public String createdSubmit() {
		return ".dog119.dog119Created";
	}
	
	@RequestMapping(value="/dog119/dogHealth")
	public String dogHealth(Map<String, Object> map
			,HttpServletRequest req
			) {
		
		return ".dog119.dogHealth";
	}
	
	@RequestMapping(value="/dog119/dhcreate")
	public String healthCreate() {
		
		return ".dog119.dogHealthCreate";
	}
	
}
