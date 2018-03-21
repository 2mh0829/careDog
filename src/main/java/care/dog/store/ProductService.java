package care.dog.store;

import java.util.List;
import java.util.Map;

public interface ProductService {
	
	public List<Product> listProduct(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	//public int dataCount();
	//상품평(productReply) 리스트
	public List<Reply> listProductReply(Map<String, Object> map);
	public Product readProduct(int productId);
	//상품의 옵션정보
	public List<String> readOption(int productId);
	//상품평 수
	public int dataCountReply(int productId);
	//qna 리스트
	public List<Qna> listProductQna(Map<String, Object> map);
	//qna 수
	public int dataCountQna(int productId);
	public int insertCart(Map<String, Object> map);
	public int dataCountCart();
	public List<Cart> listCart(Map<String, Object> map);
	public int deleteCart(int cartId);

}
