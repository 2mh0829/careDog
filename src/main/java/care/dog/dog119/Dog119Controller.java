package care.dog.dog119;

import java.io.File;
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
import care.dog.dog119.dogHealthVo.DhReplyVo;
import care.dog.dog119.dogHealthVo.DogHealthVo;
import care.dog.dog119.dogMissingVo.DogMissingVo;
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
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="subject") String search,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req, Model model
			) {
		//search ==> 셀렉트박스
		//keyword ==> 검색
		
		String cp = req.getContextPath();

		int totalPage = 0;
		int rows=10;
		int dataCount = 0;
		int replyCount=0;
		
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
			replyCount=service.dhReplyCount(dhList.getBoardNum());
			dhList.setDhReplyCount(replyCount);
			n++;
		}
		
		String query = "";
		String dhListUrl = cp+"/dog119/dogHealth";
		String dhArticle = cp+"/dog119/dhArticle?page="+page;
		
		if(keyword.length() != 0) {
			try {
				query = "search="+search+"&keyword="+URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		if(query.length()!=0) {
			dhListUrl = cp+"/dog119/dogHealth?"+query;
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
	
	@RequestMapping(value="/dog119/dhReplyInsert", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> dhReplyInsert(
			DhReplyVo dto, HttpSession session
			) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		if(info==null) {
			state="loginFail";
		}else {
			dto.setMemberId(info.getMemberId());
			int result=service.insertDhReply(dto);
			if(result==0)
				state="false";
		}
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
	
	@RequestMapping(value="/dog119/dhReplyList")
	@ResponseBody
	public Map<String, Object> dhReplyList(@RequestParam int boardNum,
			@RequestParam(value="pageNo", defaultValue="1") int page
			) {
		int rows=5;
		int totalPage=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("boardNum", boardNum);
		
		dataCount=service.dhReplyCount(boardNum);
		totalPage=myUtilBootstrap.pageCount(rows, dataCount);
		if(page>totalPage)
			page=totalPage;
		
		int start=(page-1)*rows+1;
		int end=page*rows;
		
		map.put("start", start);
		map.put("end", end);
		List<DhReplyVo> listReply=service.listDhReply(map);
		
		for(DhReplyVo dto: listReply) {
			dto.setDhReplyContent(dto.getDhReplyContent().replaceAll("\n", "<br>"));
		}
		
		String paging=myUtilBootstrap.pagingMethod(page, totalPage, "listPage");
		
		Map<String, Object> model = new HashMap<>();
		//포워딩할 jsp로 넘길 데이터
		model.put("listReply", listReply);
		model.put("pageNo", page);
		model.put("replyCount", dataCount);
		model.put("totalPage", totalPage);
		model.put("paging", paging);
		
		return model;
	}
	
	@RequestMapping(value="/dog119/sido")
	@ResponseBody
	public Map<String, Object> sido(){
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = service.sido();
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value="/dog119/gugun")
	@ResponseBody
	public Map<String, Object> gugun(@RequestParam String admCode){
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = service.gugun(admCode);
		map.put("list", list);
		return map;
	}
	
	//실종등록
	@RequestMapping(value="/dog119/missing", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> missing(DogMissingVo dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info.getMemberId() != null) {
			dto.setMemberId(info.getMemberId());
		}
		
		String root = session.getServletContext().getRealPath("/");
		System.out.println("controller================"+root);
		String path = root+"uploads"+File.separator+"dog119";
		System.out.println("controller================"+path);
		
		service.dog119Input(dto, path);
		Map<String, Object> map = new HashMap<>();
		map.put("state", "true");
		
		return map;
	}
	
	//실종 리스트
	@RequestMapping(value="/dog119/list")
	@ResponseBody
	public Map<String, Object> missingDogList(@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="subject") String search,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req
		){
		
		String cp = req.getContextPath();
		
		int totalPage = 0;
		int rows=20;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			try {
				keyword = URLDecoder.decode(keyword, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		Map<String, Object> pagingmap = new HashMap<>();
		pagingmap.put("search", search);
		pagingmap.put("keyword", keyword);
		
		dataCount = service.dog119DataCount(pagingmap);
		if(dataCount!=0)
			totalPage = myUtilBootstrap.pageCount(rows, dataCount);
		
		
		if(totalPage < page) {
			page = totalPage;
		}
		
		int start = (page-1)*rows+1;
		int end = page*rows;
		pagingmap.put("start", start);
		pagingmap.put("end", end);
		
		Map<String, Object> map = new HashMap<>();
		List<DogMissingVo> list = service.missingDogList(pagingmap);
		
		String q = "";
		String dog119ListUrl = cp+"/dog119/list";
		if(keyword.length() != 0) {
			try {
				q = "search="+search+"&keyword="+URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		if(q.length()!=0) {
			dog119ListUrl = cp+"/dog119/dogHealth?"+q;
		}
		
		String paging = myUtilBootstrap.paging(page, totalPage, dog119ListUrl);
		
		map.put("paging", paging);
		map.put("list", list);
		map.put("page", page);
		map.put("totalPage", totalPage);
		map.put("dataCount", dataCount);
		return map;
	}
}
