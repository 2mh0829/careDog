package care.dog.dog119;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import care.dog.common.MyUtilBootstrap;
import care.dog.dog119.dogHealthVo.DogHealthVo;
import care.dog.member.SessionInfo;

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
	
	//애견 건강 메인
	@RequestMapping(value="/dog119/dogHealth") 
	public String dogHealth(
			@RequestParam Map<String, Object> map
			,HttpServletRequest req, Model model
			) {
		//search ==> 셀렉트박스
		//keyword ==> 검색
		
		String cp = req.getContextPath();
		String search = "";
		String keyword="";
		int page = 0;
		if(map.get("page") ==null) {
			page=1;
		}else if(map.get("search") ==null){
			search ="";
		}else if(map.get("keyword") ==null){
			keyword ="";
		} else {
			page = Integer.parseInt((String)map.get("page")); //현재페이지
			search = (String)map.get("search");
			keyword = (String)map.get("keyword");
		}
		int totalPage = 0;
		int rows=10;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			try {
				keyword = URLDecoder.decode(keyword, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		Map<String, Object> list = new HashMap<>();
		list.put("search", search);
		list.put("keyword", keyword);
		
		dataCount = service.dataCount(list);
		if(dataCount!=0)
			totalPage = myUtilBootstrap.pageCount(rows, dataCount);
		
		
		if(totalPage < page) {
			page = totalPage;
		}
		
		int start = (page-1)*rows+1;
		int end = page*rows;
		list.put("start", start);
		list.put("end", end);
		
		List<DogHealthVo> callList = service.listBoard(list);
		
		int listNum, n = 0;
		Iterator<DogHealthVo> it = callList.iterator();
		while(it.hasNext()) {
			DogHealthVo dhList = it.next();
			listNum = dataCount - (start+n-1);
			dhList.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String dhListUrl = cp+"/dog119/dhList";
		String dhArticle = cp+"/dog119/dhArticle?page="+page;
		
		if(keyword.length() != 0) {
			try {
				query = "search="+search+"&keyword="+URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		if(query.length()!=0) {
			dhListUrl = cp+"/dog119/dhList?"+query;
			dhArticle = cp+"/dog119/article?page="+page+"&"+query;
		}
		
		String paging = myUtilBootstrap.paging(page, totalPage, dhListUrl);
		System.out.println(callList);
		
		model.addAttribute("callList", callList);
		model.addAttribute("dhArticle",dhArticle);
		model.addAttribute("page",page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("paging", paging);
		
		
		return ".dog119.dogHealth";
	}
	
	@RequestMapping(value="/dog119/dhcreate")
	public String healthCreate() {
		
		return ".dog119.dogHealthCreate";
	}
	
	@RequestMapping(value="/dog119/dhArticle")
	public String healthArticle(
			@RequestParam Map<String, Object> map, Model model) {
		String query = "page="+map.get("page");
		int boardNum = Integer.parseInt((String)map.get("boardNum"));
		DogHealthVo dto = service.dhDetail(boardNum);
		dto.setLikeCnt(service.dhLikeCnt(boardNum));
		service.updateHitCount(boardNum);
		model.addAttribute("dto", dto);
		model.addAttribute("search", (String)map.get("search"));
		model.addAttribute("keyword", (String)map.get("keyword"));
		model.addAttribute("page", (String)map.get("page"));
		
		return ".dog119.dogHealthArticle";
	}
	
	@RequestMapping(value="/dog119/dhLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> healthRecommand(
			HttpSession session, @RequestParam int num
			) {
		Map<String, Object> map = new HashMap<>();
		String state = "true";
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> param = new HashMap<>();
		param.put("num", num);
		param.put("memberId", info.getMemberId());
		
		int result = service.insertDhLike(param);
		int cnt =0;
		if(result==0) {
			state = "false";
		} else {
			state = "true";
			cnt = service.dhLikeCnt(num);
		}
		map.put("state", state);
		map.put("likeCnt", cnt);
		return map;
	}
	
	@RequestMapping(value="/dog119/dogHospital")
	public String dogHospital() {
		return ".dog119.dogHospital";
	}
}
