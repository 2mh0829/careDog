package care.dog.store;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import care.dog.common.MyUtil;

@Controller("store.storeController")
public class StoreController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/store")
	public String main() {
		return ".store.main";
	}
	
	@RequestMapping(value="/store/list")
	public String productList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="productName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		String cp = req.getContextPath();
		
		int rows = 4;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        dataCount = service.dataCount(map);
		
        if(dataCount != 0)
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
        String listUrl = cp+"/store/list";
        String articleUrl = cp+"/store/article?page=" + current_page;
        
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	             "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/store/list?" + query;
        	articleUrl = cp+"/store/article?page=" + current_page + "&"+ query;
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
	
	//댓글 리스트 출력
	//model을 던져야되나,,,?
	public String listProductReply() {
		return ".store.article";
	}
	
	@RequestMapping(value="/store/article")
	public String productDetail(
			@RequestParam(value="searchKey", defaultValue="productName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="paging", defaultValue="1") int page,
			@RequestParam(value="productId") int productId,
			Model model
			) throws Exception{
		
		List<String> list_option = null;
		
		String query="page="+page;
		
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		//읽을 상품의 정보 가져오기
		Product dto = service.readProduct(productId);
		System.out.println("dto : " + dto);
		if (dto == null)
			return "redirect:/store/list?"+query;
		
		//상품의 옵션내용을 productDetail 테이블에서 가져오기
		list_option = service.readOption(productId);

		model.addAttribute("dto", dto);
		model.addAttribute("list_option", list_option);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".store.article";
	}
	
	@RequestMapping(value="/store/order")
	public String productOrder() {
		return ".store.order";
	}
	
	@RequestMapping(value="/store/cart")
	public String productCart() {
		return ".store.cart";
	}
	
}
