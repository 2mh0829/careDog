package care.dog.admin.store;

import java.util.List;
import java.util.Map;

public interface AdminStoreService {

	public int dataCount(Map<String, Object> map);
	public List<AdminProduct> listProduct(Map<String, Object> map);
	public int insertProduct(AdminProduct dto);

	
}
