package care.dog.center.event;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.common.FileManager;
import care.dog.common.MyUtil;
import care.dog.member.SessionInfo;

@Controller("event.eventController")
public class EventController {

	@Autowired
	private EventService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/center/event/list")
	public String eventList(
			@RequestParam(value="pageNo",defaultValue="1") int cur_page,
			@RequestParam(value="searchKey",defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue",defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		int rows = 10;
		int tot_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount!=0)
			tot_page = myUtil.pageCount(rows, dataCount);
		
		if(tot_page<cur_page)
			cur_page=tot_page;
		
		int start = (cur_page-1)* rows+1;
		int end = cur_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Event> list = service.listEvent(map);
		
		Date endDate = new Date();
		long gap;
		int listNum, n = 0;
		Iterator<Event> it = list.iterator();
		while(it.hasNext()) {
			Event data = (Event)it.next();
			listNum = dataCount - (start + n -1);
			data.setListnum(listNum);
			
			SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS");
			Date beginDate = formatter.parse(data.getCreated());
			
			gap = (endDate.getTime() - beginDate.getTime()) / (60*60*1000);
			data.setGap(gap);
			
			data.setCreated(data.getCreated().substring(0, 10));
			
			n++;
		}
		
		String paging = myUtil.paging(cur_page, tot_page);
		
		model.addAttribute("list",list);
		model.addAttribute("pageNo",cur_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",tot_page);
		model.addAttribute("paging",paging);
		
		return "center/event";
		
}
	
	@RequestMapping(value="/center/event/content")
	public String eventContent(
			@RequestParam(value="num")int num,
			@RequestParam(value="searchKey",defaultValue="subejct") String searchKey,
			@RequestParam(value="searchValue",defaultValue="")String searchValue,
			@RequestParam(value="pageNo")String page,
			HttpServletRequest req,
			Model model
			) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"uft-8");
		}
		
		Event dto = service.readEvent(num);
		System.out.println(":::::"+dto+":::::");
		if(dto==null) {
			return "center/event";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n","<br>"));
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("num", num);
		
		Event preReadDto = service.preReadEvent(map);
		Event nextReadDto = service.nextReadEvent(map);
		
		List<Event> listFile = service.listFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto",preReadDto);
		model.addAttribute("nextReadDto",nextReadDto);
		model.addAttribute("listFile",listFile);
		model.addAttribute("pageNo", page);
		
		return "center/event_content";
	}
	
	@RequestMapping(value="/center/event/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {
		model.addAttribute("pageNo","1");
		model.addAttribute("mode","created");
		return "center/event_create";
	}
	
	@RequestMapping(value="/center/event/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Event dto,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info.getMemberId().equals("admin")) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "event";
			
			dto.setMemberId(info.getMemberId());
			service.insertEvent(dto, pathname);
		} else {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/center/event/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int num,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info.getMemberId().equals("admin")) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "event";
			service.deleteEvent(num, pathname);
		} else {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/center/event/download")
	public void download(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "event";
		
		boolean b = false;
		
		Event dto = service.readEvent(fileNum);
		if(dto!=null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if(!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter pw = resp.getWriter();
				pw.println("<script> alert('파일 다운로드가 불가능합니다.'); history.back();</script>");
			} catch (Exception e) {
				
			}
		}
	}
	
	@RequestMapping(value="/center/event/deleteFile", method=RequestMethod.POST)
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "event";
		
		Event dto = service.readFile(fileNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field","fileNum");
		map.put("num", fileNum);
		service.deleteFile(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		return model;
	}
	
}