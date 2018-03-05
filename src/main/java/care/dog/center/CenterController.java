package care.dog.center;
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
//hihi
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.common.FileManager;
import care.dog.common.MyUtil;
import care.dog.member.SessionInfo;

@Controller("center.centerController")
public class CenterController {
	@Autowired
	private GongjiService service;
	@Autowired
	private MyUtil myutil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/center")
	public String main() {
		return ".center.main";
	}
	
	@RequestMapping(value="/gongji")
	public String gongjiList(
			@RequestParam(value="pageNo",defaultValue="1") int current_page,
			@RequestParam(value="searchKey",defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		int rows = 10; 
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount!=0)
			total_page = myutil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Gongji> list = service.listGongji(map);
		
		Date endDate = new Date();
		long gap;
		int listNum, n = 0;
		Iterator<Gongji> it = list.iterator();
		while(it.hasNext()) {
			Gongji data = (Gongji)it.next();
			listNum = dataCount - (start + n -1);
			data.setListnum(listNum);
			
			SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS");
			Date beginDate = formatter.parse(data.getCreated());
			
			gap = (endDate.getTime() - beginDate.getTime()) / (60*60*1000);
			data.setGap(gap);
			
			data.setCreated(data.getCreated().substring(0, 10));
			
			n++;
		}
		
		String paging = myutil.paging(current_page, total_page);
		
		model.addAttribute("list",list);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		return ".center.gongji";
	}
	
	@RequestMapping(value="/gongji/content")
	public String gongjiContent(
			@RequestParam(value="num") int num,
			@RequestParam(value="searchKey", defaultValue="subject") String SearchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="pageNo") String page,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"uft-8");
		}
		
		Gongji dto = service.readGongji(num);
		if(dto==null) {
			return ".center.main";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchKey", SearchKey);
		map.put("searchValue", searchValue);
		map.put("num", num);
		
		Gongji preReadDto = service.preReadGongji(map);
		Gongji nextReadDto = service.nextReadGongji(map);
		
		List<Gongji> listFile = service.listFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto",preReadDto);
		model.addAttribute("nextReadDto",nextReadDto);
		model.addAttribute("listFile",listFile);
		model.addAttribute("pageNo", page);
		
		return ".center.gongji_content";
	}
	
	@RequestMapping(value="/gongji/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception{
		model.addAttribute("pageNo","1");
		model.addAttribute("mode","created");
		return ".center.gongji_created";
	}
	
	@RequestMapping(value="/gongji/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Gongji dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info.getMemberId().equals("admin")) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "gongji";
			
			dto.setUserId(info.getMemberId());
			service.insertGongji(dto, pathname);
		} else {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/gongji/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="num") int num,
			@RequestParam(value="pageNo") String page,
			HttpSession session,
			Model model
			)throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Gongji dto = service.readGongji(num);
		if(dto==null) {
			return ".center.main";
		}
		if(! info.getMemberId().equals(dto.getUserId())) {
			return ".center.main";
		}
		
		List<Gongji> listFile = service.listFile(num);
		
		model.addAttribute("mode","update");
		model.addAttribute("pageNo", page);
		model.addAttribute("dto",dto);
		model.addAttribute("listFile",listFile);
		
		return ".gongji.created";
	}
	
	@RequestMapping(value="/gongji/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Gongji dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info.getMemberId().equals("admin")) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "gongji";
			
			dto.setUserId(info.getMemberId());
			service.updateGongji(dto, pathname);
		} else {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/gongji/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int num,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info.getMemberId().equals("admin")) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "gongji";
			service.deleteGongji(num, pathname);
		} else {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/gongji/download")
	public void download(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session
			)throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "gongji";
		
		boolean b = false;
		
		Gongji dto = service.readGongji(fileNum);
		if(dto!=null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if(!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script> alert('파일 다운로드가 불가능합니다.'); history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	@RequestMapping(value="/gongji/deleteFile", method=RequestMethod.POST)
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "gongji";
		
		Gongji dto = service.readFile(fileNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field", "fileNum");
		map.put("num", fileNum);
		service.deleteFile(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		return model;
	}
}
