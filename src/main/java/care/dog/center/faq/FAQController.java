package care.dog.center.faq;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
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

import care.dog.common.MyUtil;
import care.dog.member.SessionInfo;

@Controller("faq.faqController")
public class FAQController {
	@Autowired
	private FAQService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/center/faq")
	public String faqMain() {
		return ".center.faqmain";
	}
	
	@RequestMapping(value="/center/taball")
	public String faqAllList(
			@RequestParam(value="pageNo", defaultValue="1") int cur_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		// 페이징
		int rows = 10;
		int tot_page = 10;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("faqsort", 0);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			tot_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(tot_page < cur_page)
			tot_page = cur_page;
		
		int start = (cur_page-1)* rows+1;
		int end = cur_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FAQ> list = service.listFaq(map);
		
		int listNum, n = 0;
		Iterator<FAQ> it = list.iterator();
		while(it.hasNext()) {
			FAQ data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
		}
		
		String paging = myUtil.paging(cur_page, tot_page);
		
		model.addAttribute("list",list);
		model.addAttribute("pageNo",cur_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",tot_page);
		model.addAttribute("paging",paging);
		
		return "center/faq";
	}
	
	@RequestMapping(value="/center/tabfmember")
	public String faqMember(
			@RequestParam(value="pageNo", defaultValue="1") int cur_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		// 페이징
		int rows = 10;
		int tot_page = 10;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("faqsort", 2);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			tot_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(tot_page < cur_page)
			tot_page = cur_page;
		
		int start = (cur_page-1)* rows+1;
		int end = cur_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FAQ> list = service.listFaqMember(map);
		
		int listNum, n = 0;
		Iterator<FAQ> it = list.iterator();
		while(it.hasNext()) {
			FAQ data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
		}
		
		String paging = myUtil.paging(cur_page, tot_page);
		
		model.addAttribute("list",list);
		model.addAttribute("pageNo",cur_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",tot_page);
		model.addAttribute("paging",paging);
		
		return "center/faqmember";
	}
	
	@RequestMapping(value="/center/tabfbuy")
	public String faqBuy(
			@RequestParam(value="pageNo", defaultValue="1") int cur_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		// 페이징
		int rows = 10;
		int tot_page = 10;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("faqsort", 3);
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			tot_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(tot_page < cur_page)
			tot_page = cur_page;
		
		int start = (cur_page-1)* rows+1;
		int end = cur_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FAQ> list = service.listFaqBuy(map);
		
		int listNum, n = 0;
		Iterator<FAQ> it = list.iterator();
		while(it.hasNext()) {
			FAQ data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
		}
		
		String paging = myUtil.paging(cur_page, tot_page);
		
		model.addAttribute("list",list);
		model.addAttribute("pageNo",cur_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",tot_page);
		model.addAttribute("paging",paging);
		
		return "center/faqbuy";
	}
	
	@RequestMapping(value="/center/tabfdelivery")
	public String faqdelivery(
			@RequestParam(value="pageNo", defaultValue="1") int cur_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		//변수
		int row = 10;
		int tot_page = 0;
		int dataCount = 0;
		
		//decode
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		//검색키, 값
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("faqsort", 4);
		//전체데이터 개수
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			tot_page = myUtil.pageCount(row, dataCount);
		}
		
		
		//페이지
		if(tot_page < cur_page)
			tot_page = cur_page;
		
		//페이지 처음 끝
		int start = (cur_page-1)*row+1;
		int end = cur_page*row;
		map.put("start", start);
		map.put("end", end);
		
		//데이터
		List<FAQ> list = service.listFaqDelivery(map);
		
		int listNum, n = 0;
		Iterator<FAQ> it = list.iterator();
		while(it.hasNext()) {
			FAQ data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
		}
		
		//페이징처리
		String paging = myUtil.paging(cur_page, tot_page);
		
		model.addAttribute("pageNo",cur_page);
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("paging",paging);
		model.addAttribute("total_page",tot_page);
		
		return "center/faqdelivery";
	}
	
	@RequestMapping(value="/center/tabfrefund")
	public String faqRefund(
			@RequestParam(value="pageNo", defaultValue="1") int cur_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			)throws Exception {
		
		int rows = 10;
		int tot_page = 10;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")){
			searchValue = URLDecoder.decode(searchValue,"uft-8");
		}
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("faqsort", 5);
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			tot_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(tot_page < cur_page)
			tot_page = cur_page;
		
		
		int start = (cur_page-1)*rows+1;
		int end = cur_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FAQ> list = service.listFaqRefund(map);
		
		int listNum, n = 0;
		Iterator<FAQ> it = list.iterator();
		while(it.hasNext()) {
			FAQ data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
		}
		
		String paging = myUtil.paging(cur_page, tot_page);
		
		model.addAttribute("paging",paging);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("pageNo",cur_page);
		model.addAttribute("total_page",tot_page);
		model.addAttribute("list",list);
		
		return "center/faqrefund";
	}
	
	@RequestMapping(value="/center/tabfevent")
	public String faqEvent(
			@RequestParam(value="pageNo", defaultValue="1") int cur_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int rows = 10;
		int tot_page = 10;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "uft-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("faqsort", 6);
		dataCount = service.dataCount(map);
		if(dataCount!= 0) {
			tot_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(tot_page < cur_page)
			tot_page = cur_page;
		
		int start = (cur_page - 1) * rows+1;
		int end = cur_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FAQ> list = service.listFaqEvent(map);
		
		int listNum, n = 0;
		Iterator<FAQ> it = list.iterator();
		while(it.hasNext()) {
			FAQ data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
		}
		
		String paging = myUtil.paging(cur_page, tot_page);
		
		model.addAttribute("pageNo",cur_page);
		model.addAttribute("list",list);
		model.addAttribute("total_page",tot_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("paging",paging);
		
		return "center/faqevent";
	}
	
	@RequestMapping(value="/center/tabfetc")
	public String faqEtc(
			@RequestParam(value="pageNo",defaultValue="1") int cur_page,
			@RequestParam(value="searchKey",defaultValue="subejct") String searchKey,
			@RequestParam(value="searchValue",defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int rows = 10;
		int tot_page = 10;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("faqsort", 7);
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			tot_page = myUtil.pageCount(rows, dataCount);
		}
		
		int start = (cur_page - 1) * rows+1;
		int end = cur_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<FAQ> list = service.listFaqEtc(map);
		
		int listNum, n = 0;
		Iterator<FAQ> it = list.iterator();
		while(it.hasNext()) {
			FAQ data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
		}
		
		String paging = myUtil.paging(cur_page, tot_page);
		
		model.addAttribute("paging",paging);
		model.addAttribute("list", list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",tot_page);
		model.addAttribute("pageNo",cur_page);
		
		return "center/faqetc";
	}
	
	@RequestMapping(value="/center/faq/content")
	public String faqContent(
			@RequestParam(value="num") int num,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="pageNo", defaultValue="1") int page,
			@RequestParam(value="faqsort") int faqsort,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		if(req.getMethod().equalsIgnoreCase("get")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		FAQ dto = service.readFAQ(num);
		if(dto == null)
			return "center/faqmain";
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("faqsort", faqsort);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);*/
		
		model.addAttribute("faqsort",faqsort);
		model.addAttribute("dto",dto);
		model.addAttribute("pageNo",page);
		
		return "center/faq_content";
	}
	
	@RequestMapping(value="/center/faq/create", method=RequestMethod.GET)
	public String createForm(
			Model model
			) throws Exception{
		model.addAttribute("pageNo","1");
		model.addAttribute("mode","create");
		return "center/faq_create";
	}
	
	@RequestMapping(value="/center/faq/create", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createsubmit(
			FAQ dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		System.out.println("========"+dto);
		
		if(info.getMemberId().equals("admin")) {
			dto.setMemberId(info.getMemberId());
			service.insertFaq(dto);
		} else {
			state = "false";
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/center/faq/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="num") int num,
			@RequestParam(value="pageNo") String page,
			HttpSession session,
			Model model
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		FAQ dto = service.readFAQ(num);
		if(dto==null) {
			return "center/faq";
		}
		
		model.addAttribute("mode","update");
		model.addAttribute("num",num);
		model.addAttribute("pageNo",page);
		
		return "center/faq_create";
	}
	
	@RequestMapping(value="/center/faq/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			FAQ dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info.getMemberId().equals("admin")) {
			dto.setMemberId(info.getMemberId());
			service.updateFaq(dto);
		} else {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/center/faq/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam(value="num") int num,
			@RequestParam(value="pageNo") String page,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info.getMemberId().equals("admin")) {
			service.deleteFaq(num);
		} else {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
}
