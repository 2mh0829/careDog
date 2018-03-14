package care.dog.center.faq;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import care.dog.common.MyUtil;

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
		
		List<FAQ> listmember = service.listFaqMember(map);
		
		int listNum, n = 0;
		Iterator<FAQ> it = listmember.iterator();
		while(it.hasNext()) {
			FAQ data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
		}
		
		String paging = myUtil.paging(cur_page, tot_page);
		
		model.addAttribute("list",listmember);
		model.addAttribute("pageNo",cur_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",tot_page);
		model.addAttribute("paging",paging);
		
		return "center/faqmember";
	}
	
}
