package care.dog.store;

import java.util.List;
import java.util.Map;

public interface ProductService {
	
	public List<Product> listProduct(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	//public int dataCount();

}
