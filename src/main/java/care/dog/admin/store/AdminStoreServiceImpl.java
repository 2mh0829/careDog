package care.dog.admin.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;

@Service("admin.storeServiceImpl")
public class AdminStoreServiceImpl implements AdminStoreService{

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("adminStore.dataCount", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<AdminProduct> listProduct(Map<String, Object> map) {
		List<AdminProduct> list = null;
		try {
			list = dao.selectList("adminStore.listProduct", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int insertProduct(AdminProduct dto) {
		int result = 0;
		try {
			int productSeq = dao.selectOne("adminStore.productSeq");
			dto.setProductId(productSeq);
			dto.setPrice(dto.getSellingPrice());
			dto.setAmount(dto.getInputAmount());
			dto.setCategoryId(Integer.parseInt(dto.getCategoryName()));
			result = dao.insertData("adminStore.insertProduct", dto);
			result = dao.insertData("adminStore.insertProductOption", dto);
			result = dao.insertData("adminStore.insertInputProduct", dto);
			result = 1;
		} catch (Exception e) {
		}
		return result;
	}
	
}
