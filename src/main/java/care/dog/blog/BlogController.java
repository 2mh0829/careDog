package care.dog.blog;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import care.dog.common.MyUtilGeneral;
import care.dog.member.SessionInfo;


@Controller("caredog.blogController")
public class BlogController {
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private MyUtilGeneral util;

	@RequestMapping(value="/nblog")
	public String main(
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
		// 블로그 메인or 블로그만들기
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		BlogInfo blogInfo=blogService.readBlogInfo(info.getMemberId());
		if(blogInfo==null) {
			System.out.println("111@@");
			return blogCreatedForm(session, model);
		}
		System.out.println("2222@@");
		return ".blog.main.main";
	}

	@RequestMapping(value="/nblog/created", method = RequestMethod.GET)
	public String blogCreatedForm(
			HttpSession session,
			Model model) throws Exception {
		System.out.println("/nblog/createdddd");
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		// 블로그 만들기 폼
		
		if (info == null) {
			return "redirect:/member/login";
		}
		
		//Map<String, Object> map=new HashMap<>();
	//	map.put("field", "b.userId");
	//	map.put("field_value", info.getMemberId());
//		BlogInfo blogInfo=blogService.readBlogInfo(info.getMemberId());
//		if(blogInfo!=null) {
//			model.addAttribute("message", "블로그는 계정당 하나만 만들수 있습니다.");
//			return ".blog.manage.message";
//		}
//		
//		List<BlogTheme> listGroup=blogService.listBlogThemeGroup();

		BlogInfo dto = new BlogInfo();
		dto.setIsUserName(1);
		dto.setGender("남자");
		dto.setClosed(0);
		dto.setIsCity(1);
		dto.setIsGender(1);
		dto.setIsHobby(1);

		model.addAttribute("mode", "created");
		model.addAttribute("dto", dto);
	//	model.addAttribute("listGroup", listGroup);
		
		return ".blog.manage.blogCreated";
	}

	@RequestMapping(value="/nblog/themeList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> themeList(@RequestParam int groupNum) throws Exception {
		// AJAX(JSON)-블로그 생성 및 수정할 때 그룹별 주제(중분류)
		
		List<BlogTheme> listTheme = blogService.listBlogTheme(groupNum);

		Map<String, Object> model = new HashMap<>();
		model.put("listTheme", listTheme);

		return model;
	}

	@RequestMapping(value="/nblog/me")
	public String blogMe(
			HttpSession session) throws Exception {
		// 내블로그
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}

		//Map<String, Object> map=new HashMap<>();
	//	map.put("field", "b.userId");
	//	map.put("field_value", info.getMemberId());
		BlogInfo blogInfo=blogService.readBlogInfo(info.getMemberId());
		
		// 블로그가 없으면 생성
		if(blogInfo==null)
			return "redirect:/nblog/created";
		
		// 내 블로그로 이동
		return "redirect:/blog/"+blogInfo.getBlogId();
	}
	
	@RequestMapping(value="/nblog/created", method = RequestMethod.POST)
	public String blogCreatedSubmit(
			BlogInfo dto,
			HttpSession session,
			Model model) throws Exception {
		// 내 블로그 등록 완료
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"blog"+
				File.separator+info.getMemberId();

		dto.setMemberId(info.getMemberId());
		int result=blogService.insertBlog(dto, pathname);
		if(result==0) {
			model.addAttribute("message", "블로그를 생성하지 못했습니다. 다시 시도 하시기 바랍니다.");
			return ".blog.manage.message";
		}

		return "redirect:/blog/"+dto.getBlogId();
	}
}
