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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import antlr.ParserSharedInputState;
import care.dog.member.SessionInfo;

@Controller("service.serviceController")
public class ServiceController {
	
	@Autowired
	private ServiceService service;
	
	@RequestMapping(value="/service", method=RequestMethod.GET)
	public String main(HttpServletRequest req, HttpSession session, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		// 총 펫시터 수
		int dataCount = service.dataCount();
		model.addAttribute("dataCount", dataCount);
		
		// 펫시터 리스트
		List<ServiceDto> list = service.sitterList(map);
		model.addAttribute("list", list);
		
		// 펫시터 사진 리스트
		List<ServiceDto> listPhoto = service.sitterPhotoList();
		model.addAttribute("listPhoto", listPhoto);
		
		// 태그 리스트
		List<ServiceDto> listTag = service.sitterTag();
		model.addAttribute("listTag", listTag);
		
		return ".service.sitting";
	}
	
	@RequestMapping(value="/service", method=RequestMethod.POST)
	public String selectSitter(ServiceDto dto ,Model model) {
		
		// 총 펫시터 수
		int dataCount = service.dataCount();
		model.addAttribute("dataCount", dataCount);
		
		// 펫시터 사진 리스트
		List<ServiceDto> listPhoto = service.sitterPhotoList();
		model.addAttribute("listPhoto", listPhoto);
		
		// 태그 리스트
		List<ServiceDto> listTag = service.sitterTag();
		model.addAttribute("listTag", listTag);
		
		// sitter search list
		List<ServiceDto> list = service.selectSitter(dto);
		model.addAttribute("list", list);
		
		
		return "/service/sittingSearch";
	}
	
	@RequestMapping(value="/service/sitting_detail")
	public String sitting_detail(
			@RequestParam(value="sittingId") int sittingId,
			HttpSession session,
			Model model) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		// 펫시터 사진 리스트
		List<ServiceDto> listPhoto = service.sitterPhotoList();
		model.addAttribute("listPhoto", listPhoto);
		
		ServiceDto dto = service.readSitter(sittingId);
		model.addAttribute("dto", dto);
		
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
	}
	
	@RequestMapping(value="/service/sitter_diary", method=RequestMethod.GET)
	public void sitter_diary() {
		
	}
	
	@RequestMapping(value="/service/servicePayment", method=RequestMethod.GET)
	public String servicePayment(
			HttpServletRequest req,
			HttpSession session,
			Model model) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		int totPrice = Integer.parseInt(req.getParameter("totPrice"));
		model.addAttribute("totPrice",totPrice);
		
		return ".service.servicePayment";
	}
}
