package care.dog.store;

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

import care.dog.common.MyUtil;
import care.dog.member.SessionInfo;

@Controller("store.storeController")
public class StoreController {

	@Autowired
	private ProductService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "/store")
	public String main(HttpServletRequest req, Model model) {
		
		int current_page = 1;
		String cp = req.getContextPath();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 4);

		String articleUrl = cp + "/store/article?page=" + current_page;
		articleUrl = cp + "/store/article?page=" + current_page;
		
		List<Product> list = service.listProduct(map);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);

		return ".store.main";
	}

	@RequestMapping(value = "/store/list")
	public String listProduct(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "productName") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue, HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 4;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);

		dataCount = service.dataCount(map);

		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;

		map.put("start", start);
		map.put("end", end);

		List<Product> list = service.listProduct(map);

		// 글번호 만들기
		int listNum, n = 0;
		Iterator<Product> it = list.iterator();
		while (it.hasNext()) {
			Product data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/store/list";
		String articleUrl = cp + "/store/article?page=" + current_page;

		if (searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/store/list?" + query;
			articleUrl = cp + "/store/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		return ".store.list";
	}

	@RequestMapping(value = "/store/article")
	public String articleProduct(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "productName") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			@RequestParam(value = "paging", defaultValue = "1") int page,
			@RequestParam(value = "productId") int productId, Model model) throws Exception {

		List<String> list_option = null;
		//List<Qna> listProductQna = null;

		String query = "page=" + page;

		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + searchValue;
		}

		searchValue = URLDecoder.decode(searchValue, "utf-8");

		// 읽을 상품의 정보 가져오기
		Product dto = service.readProduct(productId);
		if (dto == null)
			return "redirect:/store/list?" + query;

		// 상품의 옵션내용
		list_option = service.readOption(productId);

		// qna 리스트
		//listProductQna = service.listProductQna();

		model.addAttribute("dto", dto);
		model.addAttribute("list_option", list_option);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".store.article";
	}

	// 상품평 리스트 : AJAX-TEXT
	@RequestMapping(value = "/store/listProductReply")
	public String listProductReply(
			@RequestParam int productId, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(value = "paging", defaultValue = "1") int page,
			Model model
			) {
		
		List<Reply> listProductReply = null;
		
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		// 상품평 페이징
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productId", productId);

		// 상품평 수 count
		dataCount = service.dataCountReply(productId);
		
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;

		map.put("start", start);
		map.put("end", end);
		
		// 상품평(한줄 상품평) 리스트
		listProductReply = service.listProductReply(map);

		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listProductReply", listProductReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "store/listProductReply";
	}
	
	// Qna 리스트 : AJAX-TEXT
	@RequestMapping(value = "/store/listProductQna")
	public String listProductQna(
			@RequestParam int productId, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(value = "paging", defaultValue = "1") int page,
			Model model
			) {
			
		List<Qna> listProductQna = null;
			
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		// Qna 페이징
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productId", productId);

		// Qna 수 count
		dataCount = service.dataCountQna(productId);
			
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;

		map.put("start", start);
		map.put("end", end);
		
		// Qna 리스트
		listProductQna = service.listProductQna(map);
		
		// 엔터를 <br>
		Iterator<Qna> it = listProductQna.iterator();
		while(it.hasNext()) {
			Qna dto = it.next();
			dto.setQuestion(dto.getQuestion().replaceAll("\n", "<br>"));
			dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
		}

		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listProductQna", listProductQna);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("qnaCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "store/listProductQna";
	}

	@RequestMapping(value = "/store/order")
	public String productOrder() {
		return ".store.order";
	}
	
	@RequestMapping(value = "/store/stack")
	@ResponseBody
	public Map<String, Object> stackCart(
			@RequestParam int productId,
			@RequestParam int amount,
			@RequestParam int optionId,
			HttpSession session) {

		Map<String, Object> model = new HashMap<String, Object>();
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String memberId = info.getMemberId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("productId", productId);
		map.put("amount", amount);
		map.put("optionId", optionId);
		
		//cart에 상품 dto와 memberId를 insert
		int state = service.insertCart(map);
		
		model.put("state", state);
		
		return model;
		
	}

	@RequestMapping(value = "/store/cart")
	public String productCart(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) {
		
		int dataCount = 0;
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}
		String memberId = info.getMemberId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		
		dataCount = service.dataCountCart();
		
		map.put("start", 1);
		map.put("end", dataCount);

		List<Cart> listCart = service.listCart(map);

		model.addAttribute("listCart", listCart);
		model.addAttribute("dataCount", dataCount);
		/*model.addAttribute("total_page", total_page);*/
		/*model.addAttribute("articleUrl", articleUrl);*/
		model.addAttribute("page", current_page);
		/*model.addAttribute("paging", paging);*/
		
		return ".store.cart";
	}
	
	@RequestMapping(value="/store/deleteCart")
	@ResponseBody
	public Map<String, Object> deleteCart(
			@RequestParam int cartId,
			@RequestParam String memberId,
			HttpSession session
			) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String smemberId = info.getMemberId();
		
		System.out.println(cartId);
		
		int state = 0;
		if(smemberId.equals(memberId)) {
			state = service.deleteCart(cartId);
		}
		
		model.put("state", state);
		
		return model;
		
	}

}
