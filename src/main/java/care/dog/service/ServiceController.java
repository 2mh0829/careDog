package care.dog.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import care.dog.member.SessionInfo;

@Controller("service.serviceController")
public class ServiceController {
	
	@Autowired
	private ServiceService service;
	
	@RequestMapping(value="/service")
	public String main(HttpSession session, HttpServletRequest req,
						Model model) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		// 총 펫시터 수
		int dataCount = service.dataCount();
		model.addAttribute("dataCount", dataCount);
		
		// 펫시터 리스트
		List<ServiceDto> list = service.sitterList();
		model.addAttribute("list", list);
		
		// 펫시터 사진 리스트
		List<ServiceDto> listPhoto = service.sitterPhotoList();
		model.addAttribute("listPhoto", listPhoto);
		
		// 태그
		List<ServiceDto> listTag = service.sitterTag();
		model.addAttribute("listTag", listTag);
		
		return ".service.sitting";
	}
	
	@RequestMapping(value="/service/sitting_detail")
	public String sitting_detail() {
		return ".service.sitting_detail";
	}
	
	@RequestMapping(value="/service/sitter_input", method=RequestMethod.GET)
	public String sitter_input(HttpSession session, ServiceDto dto) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setMemberId(info.getMemberId());
		
		return "service/sitter_input";
	}
	
	@RequestMapping(value="/service/sitter_input", method=RequestMethod.POST)
	public void sitter_input_submit(ServiceDto dto, HttpSession session) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "service";
		
		dto.setMemberId(info.getMemberId());
		
		service.insertService(dto, pathname);
		
		System.out.println(dto.toString());
		
	}
	
	@RequestMapping(value="/service/sitter_diary", method=RequestMethod.GET)
	public void sitter_diary() {
		
	}

}
