package care.dog.store;

import java.util.List;
import java.util.Map;

public interface ProductService {
	
	public List<Product> listProduct(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	//public int dataCount();
	//상품평(productReply) 리스트
	public List<Product> listProductReply(Map<String, Object> map);
	public Product readProduct(int productId);
	//상품의 옵션정보
	public List<String> readOption(int productId);

}
