package care.dog.admin.strayDog;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import care.dog.admin.strayDogVo.AdminFixSupportVo;
import care.dog.admin.strayDogVo.AdminTempSupportVo;
import care.dog.admin.strayDogVo.VolunteerJSONVO;
import care.dog.admin.strayDogVo.VolunteerVO;
import care.dog.common.MyUtilBootstrap;

@Controller("strayDog.adminStrayDogController")
public class AdminStrayDogController {
	@Autowired
	private AdminStrayDogService service;
	@Autowired
	private MyUtilBootstrap myUtilBootstrap;
	
	@RequestMapping(value="/admin/strayDog")
	public String admimFixSupport() {
		return ".admin.strayDog.fixSupport";
	}
	
	@RequestMapping(value="/admin/strayDog/adminTempSupport")
	public String adminTempSupport() {
		return ".admin.strayDog.tempSupport";
	}
	
	@RequestMapping(value="/admin/strayDog/volunteer")
	public String volunteer() {
		return ".admin.strayDog.volunteer";
	}
	
	@RequestMapping(value="/admin/strayDog/fixSupport")
	@ResponseBody
	public Map<String, Object> fixSupportList(
			@RequestParam(defaultValue="1") int page,
			@RequestParam(value="rows", defaultValue="10") int rows,
			@RequestParam(value="searchField", defaultValue="pname") String search,
			@RequestParam(value="searchOper", defaultValue="eq") String type,
			@RequestParam(value="searchString", defaultValue="") String keyword,
			HttpServletRequest req, Model model
			){
		
		System.out.println("controller=================================>"+search);
		System.out.println("controller=================================>"+type);
		System.out.println("controller=================================>"+keyword);
		int totalPage = 0;
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
		pagingmap.put("type", type);
		pagingmap.put("keyword", keyword);
		
		dataCount = service.fixSupportDataCnt(pagingmap);
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
		List<AdminFixSupportVo> list = service.fixSupportList(pagingmap);
		
		map.put("rows", list);
		map.put("page", page);
		map.put("total_page", totalPage);
		map.put("dataCount", dataCount);
		return map;
	}
	
	//일시후원
	@RequestMapping(value="/admin/strayDog/tempSupport")
	@ResponseBody
	public Map<String, Object> map(@RequestParam(defaultValue="1") int page,
			@RequestParam(value="rows", defaultValue="10") int rows,
			@RequestParam(value="searchField", defaultValue="subject") String search,
			@RequestParam(value="searchType", defaultValue="") String type,
			@RequestParam(value="searchValue", defaultValue="") String keyword,
			HttpServletRequest req, Model model
			){
		int totalPage = 0;
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
		pagingmap.put("type", type);
		pagingmap.put("keyword", keyword);
		
		dataCount = service.tempSupportDataCnt(pagingmap);
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
		List<AdminTempSupportVo> list = service.tempSupportList(pagingmap);
		
		map.put("rows", list);
		map.put("page", page);
		map.put("total_page", totalPage);
		map.put("dataCount", dataCount);
		return map;
	}
	
	//자원봉사
	@RequestMapping(value="/admin/strayDog/month")
	@ResponseBody
	public Map<String, Object> month(
			@RequestParam(value="start") String start,
			@RequestParam(value="end") String end,
			@RequestParam(value="group", defaultValue="all") String group,
			HttpSession session
			){
		Map<String, Object> map = new HashMap<>();
		map.put("group", group);
		map.put("start", start);
		map.put("end", end);
		
		List<VolunteerVO> list = service.listMonthSchedule(map);
		List<VolunteerJSONVO> listJSON = new ArrayList<>();
		
		Iterator<VolunteerVO> it = list.iterator();
		while(it.hasNext()) {
			VolunteerVO vv = it.next();
			
			VolunteerJSONVO dto = new VolunteerJSONVO();
			dto.setId(vv.getVolunteerId());
			dto.setUserName(vv.getName());
			dto.setContent(vv.getPeopleCnt());
			dto.setTitle(vv.getvKind());
			if(vv.getvOption().equals("미용")) {
				dto.setColor("blue");
			} else if(vv.getvOption().equals("목욕")) {
				dto.setColor("black");
			} else if(vv.getvOption().equals("청소 및 산책")) {
				dto.setColor("green");
			} else if(vv.getvOption().equals("차량봉사 등")) {
				dto.setColor("red");
			}
			dto.setStart(vv.getFdate1());
			dto.setEnd(vv.getFdate1());
			dto.setCreated(vv.getFdate1());
			listJSON.add(dto);
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", listJSON);
		
		return model;
	}
}
