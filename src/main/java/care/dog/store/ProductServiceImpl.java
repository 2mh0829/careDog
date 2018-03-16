package care.dog.store;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;

@Service("store.productServiceImpl")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<Product> listProduct(Map<String, Object> map) {
		List<Product> list = null;
		try {
			list = dao.selectList("store.listProduct", map);
			//System.out.println(list);
		} catch (Exception e) {
		}
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("store.dataCount", map);
			//System.out.println("dataCount: " + result);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Reply> listProductReply(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			list = dao.selectList("store.listProductReply", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public Product readProduct(int productId) {
		Product dto = null;
		try {
			dto = dao.selectOne("store.readProduct", productId);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public List<String> readOption(int productId) {
		List<String> list = null;
		try {
			list = dao.selectList("store.readOption", productId);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int dataCountReply(int productId) {
		int result = 0;
		try {
			result = dao.selectOne("store.dataCountReply", productId);
		} catch (Exception e) {
		}
		return result;
	}

	
	
}
