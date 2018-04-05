package care.dog.store;

import java.net.URLDecoder;
import java.net.URLEncoder;
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
	public String main(
			@RequestParam(value="categoryId", defaultValue = "0") int categoryId,
			HttpServletRequest req, 
			Model model) {
		
		int current_page = 1;
		String cp = req.getContextPath();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("end", 4);

		String articleUrl = cp + "/store/article?page=" + current_page;
		articleUrl = cp + "/store/article?page=" + current_page;
		
		map.put("categoryId", categoryId);//분류 없음
		
		List<Product> list = service.listProduct(map);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);

		return ".store.main";
	}

	@RequestMapping(value = "/store/list")
	public String listProduct(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "productName") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue, 
			@RequestParam(value="categoryId", defaultValue = "0") int categoryId,
			@RequestParam(value="sortField", defaultValue = "inputDate") String sortField,
			@RequestParam(value="sortMode", defaultValue = "desc") String sortMode,
			HttpServletRequest req,
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
		
		map.put("categoryId", categoryId);
		map.put("sortField", sortField);
		map.put("sortMode", sortMode);

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
		model.addAttribute("categoryId", categoryId);

		return ".store.list";
	}

	@RequestMapping(value = "/store/article")//!@#
	public String articleProduct(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "productName") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			@RequestParam(value = "paging", defaultValue = "1") int page,
			@RequestParam(value = "productId", defaultValue ="0") int productId,
			Model model,
			HttpSession session) throws Exception {

//		List<String> list = (List<String>) session.getAttribute("data");
//		if(list!=null) {
//			productId=Integer.valueOf(list.get(0));
//		}
		
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

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String memberId = null;
		if(info != null)
			memberId = info.getMemberId();
		
		model.addAttribute("dto", dto);
		model.addAttribute("list_option", list_option);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("memberId", memberId);
//		if(list!=null)
//		model.addAttribute("optionId", list.get(1));
		session.removeAttribute("data");

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
	
	
	/* order list 출력 */
	@RequestMapping(value = "/store/orderList")
	public String listOrder(
			@RequestParam String memberId,
			HttpSession session,
			Model model
			) {
		
		int dataCount = 0;
		
		//세션에서 회원의 정보 받아옴
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if (info == null) {
			return "redirect:/member/login";
		}
		String tel = info.getTel();
		String email = info.getEmail();
		
		String tel1 = tel.substring(0, 3);
		String tel2 = tel.substring(4, 8);
		String tel3 = tel.substring(9, 13);
		
		String emailArr[] = email.split("@");
		
		//orderList 개수
		dataCount = service.dataCountOrder(memberId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("start", 1);
		map.put("end", dataCount);
		
		//orderList 출력
		List<Order> listOrder = service.listOrder(map);

		model.addAttribute("listOrder", listOrder);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("tel1", tel1);
		model.addAttribute("tel2", tel2);
		model.addAttribute("tel3", tel3);
		model.addAttribute("email1", emailArr[0]);
		model.addAttribute("email2", emailArr[1]);
		model.addAttribute("email", email);
		model.addAttribute("tel", tel);
		
		return ".store.order";
	}
	
	/* order input */
	@RequestMapping(value = "/store/order")
	public String order(
			OrderParamDto dto,
			HttpSession session,
			Model model
			) {
		
		//sequence 호출
		int orderSeq = service.orderSeq();
				
		Order orderDto = new Order();
		orderDto.setMemberId(dto.getMemberId());
		orderDto.setOrderId(orderSeq);
		orderDto.setOrderAllPrice(dto.getOrderAllPrice());
		
		//1. productOrder(주문내역) 테이블에 insert
		service.insertProductOrder(orderDto);
		
		//2. payment(결제) 테이블에 insert
		service.insertPayment(orderDto);
		
		for(int i=0; i<dto.getProductIdList().size(); i++) {
			orderDto.setProductId(dto.getProductIdList().get(i));
			orderDto.setOrderAmount(dto.getAmountList().get(i));
			orderDto.setNote(dto.getOptionContentList().get(i));
			orderDto.setOrderPrice(dto.getTotalPriceList().get(i));
		
			//3. OrderDetail(주문상세) 테이블에 insert
			service.insertOrderDetail(orderDto);
		}
		
		return ".store.order";
		
	}
	
	/* order input one */
	/*@RequestMapping(value = "/store/orderOne")
	public void orderOne(
			@RequestParam String memberId,
			@RequestParam int productId,
			@RequestParam int amount,
			@RequestParam String optionContent,
			@RequestParam int totalPrice,
			HttpSession session,
			Model model
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("productId", productId);
		map.put("amount", amount);
		map.put("optionContent", optionContent);
		map.put("totalPrice", totalPrice);
		
		//주문한 상품 orderDetail, productOrder 테이블에 insert
		service.insertOrderOne(map);
		
	}
	*/
	
	/*@RequestMapping(value="/store/storeLogin", method=RequestMethod.GET)
	public String storeLoginForm(
			@RequestParam String productId,
			//@RequestParam String amount,
			@RequestParam String optionId,
			HttpSession session) {
		List<String> list = new ArrayList<>();
		list.add(productId);
		list.add(optionId);
		//list.add(amount);
		//list.add(optionId);
		session.setAttribute("redirectUrl","/store/article");
		session.setAttribute("data",list);
		return "redirect:/member/login";
	}*/
	
	@RequestMapping(value = "/store/stack")
	@ResponseBody
	public Map<String, Object> stackCart(
			@RequestParam (value = "productId", defaultValue = "1") int productId,
			@RequestParam (value = "amount", defaultValue = "1") int amount,
			@RequestParam (value = "optionId", defaultValue = "1") int optionId,
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
		
		dataCount = service.dataCountCart(memberId);
		
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
		
		int state = 0;
		if(smemberId.equals(memberId)) {
			state = service.deleteCart(cartId);
		}
		
		model.put("state", state);
		
		return model;
		
	}
	
	@RequestMapping(value="/store/updateCart")
	@ResponseBody
	public Map<String, Object> updateCart(
			@RequestParam int cartId,
			@RequestParam String memberId,
			@RequestParam int productId,
			@RequestParam int optionId,
			@RequestParam int amount,
			HttpSession session
			) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String smemberId = info.getMemberId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartId", cartId);
		map.put("memberId", memberId);
		map.put("productId", productId);
		map.put("optionId", optionId);
		map.put("amount", amount);
		
		int state = 0;
		if(smemberId.equals(memberId)) {
			state = service.updateCart(map);
		}
		
		model.put("state", state);
		
		return model;
		
	}

}
