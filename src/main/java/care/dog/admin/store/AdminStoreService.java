package care.dog.admin.store;

import java.util.List;
import java.util.Map;

public interface AdminStoreService {

	public int dataCount(Map<String, Object> map);
	public List<AdminProduct> listProduct(Map<String, Object> map);
	public int insertProduct(AdminProduct dto, String path);
	public int updateProduct(AdminProduct dto, String path);
	public AdminProduct readProduct(int productId);
	public List<String> readOption(int productId);
	public int deleteProduct(int productId, String imageFilename, String pathname);
	public int deleteOption(int optionId);
	
}
