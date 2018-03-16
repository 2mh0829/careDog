package care.dog.myPage;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import care.dog.common.MyUtilGeneral;
import care.dog.member.SessionInfo;

@Controller("myPage.myPageController")
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	//@Autowired
	//private MyUtilGeneral util;

	@RequestMapping(value="/myPage/myPetList")
	public String myPetList() throws Exception {

		return "myPage/myPet/myPetList";
	}

	@RequestMapping(value="/myPage")
	public String main(
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
		// 블로그 메인or 블로그만들기
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		MyPageInfo myPageInfo=myPageService.readMyPageInfo(info.getMemberId());
		if(myPageInfo==null) {
			return "redirect:/myPage/created";
		}
		return "redirect:/myPage/"+myPageInfo.getMyPageId();
	}

	@RequestMapping(value="/myPage/created", method = RequestMethod.GET)
	public String myPageCreatedForm(
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		// 블로그 만들기 폼
		if (info == null) {
			return "redirect:/member/login";
		}
		
		//Map<String, Object> map=new HashMap<>();
	//	map.put("field", "b.userId");
	//	map.put("field_value", info.getMemberId());
//		MyPageInfo myPageInfo=myPageService.readMyPageInfo(info.getMemberId());
//		if(myPageInfo!=null) {
//			model.addAttribute("message", "블로그는 계정당 하나만 만들수 있습니다.");
//			return ".myPage.manage.message";
//		}
//		
//		List<MyPageTheme> listGroup=myPageService.listMyPageThemeGroup();

		MyPageInfo dto = new MyPageInfo();
		dto.setIsUserName(1);
		dto.setGender("남자");
		dto.setClosed(0);
		dto.setIsCity(1);
		dto.setIsGender(1);
		dto.setIsHobby(1);

		model.addAttribute("mode", "created");
		model.addAttribute("dto", dto);
	//	model.addAttribute("listGroup", listGroup);
		
		return ".myPage.manage.myPageCreated";
	}
	
	@RequestMapping(value="/myPage/created", method = RequestMethod.POST)
	public String myPageCreatedSubmit(
			MyPageInfo dto,
			HttpSession session,
			Model model) throws Exception {
		// 내 블로그 등록 완료
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"myPage"+
				File.separator+info.getMemberId();

		dto.setMemberId(info.getMemberId());
		int result=myPageService.insertMyPage(dto, pathname);
		if(result==0) {
			model.addAttribute("message", "블로그를 생성하지 못했습니다. 다시 시도 하시기 바랍니다.");
			return ".myPage.manage.message";
		}

		return "redirect:/myPage/"+dto.getMyPageId();
	}
	@RequestMapping(value="/myPage/{myPageId}")
	public String main(
			@PathVariable int myPageId,
			Model model,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception {
		
		// 개인 블로그 메인
		String cp=req.getContextPath();
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		MyPageInfo myPageInfo=myPageService.readMyPageInfoHome(myPageId);
		if(myPageInfo==null) {
			return "redirect:/nmyPage";
		}
		
		int owner=1;
		if(info==null|| ! info.getMemberId().equals(myPageInfo.getMemberId()))
			owner=0;
		
		Map<String, Object> map=new HashMap<>();
		String tableName="b_"+myPageId;
		map.put("tableName", tableName);
		map.put("owner", owner);
		
        // 블로그 방문자 수 및 포스트 조회수 증가
		try {
			boolean bMyPage=false;
			
			Cookie []cks=req.getCookies();
			for(Cookie c:cks) {
			
				if(c.getName().startsWith("myPageId")) {
					bMyPage=true;
				}
			}
			
			if(! bMyPage) {
				// 블로그 방문자 수 증가
				myPageService.updateMyPageVisitorCount(myPageId);
				
				Cookie ck=new Cookie("myPageId", Integer.toString(myPageId));
				ck.setMaxAge(-1);
				resp.addCookie(ck);
			}
			
		} catch (Exception e) {
		}
		
		
		// ---------------------------------------------------------		
 
		// ---------------------------------------------------------        
		model.addAttribute("myPageInfo", myPageInfo);
		model.addAttribute("myPageUrl", cp+"/myPage/"+myPageId);
		model.addAttribute("owner", owner);
		System.out.println("@@@#=>"+myPageInfo.toString());

		return ".myPageLayout";
	}

//	@RequestMapping(value="/nmyPage/me")
//	public String myPageMe(
//			HttpSession session) throws Exception {
//		// 내블로그
//		
//		SessionInfo info = (SessionInfo) session.getAttribute("member");
//		if (info == null) {
//			return "redirect:/member/login";
//		}
//
//		//Map<String, Object> map=new HashMap<>();
//	//	map.put("field", "b.userId");
//	//	map.put("field_value", info.getMemberId());
//		MyPageInfo myPageInfo=myPageService.readMyPageInfo(info.getMemberId());
//		
//		// 블로그가 없으면 생성
//		if(myPageInfo==null)
//			return "redirect:/nmyPage/created";
//		
//		// 내 블로그로 이동
//		return "redirect:/myPage/"+myPageInfo.getMyPageId();
//	}
	

}


