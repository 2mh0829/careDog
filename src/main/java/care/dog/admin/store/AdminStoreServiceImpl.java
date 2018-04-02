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
	public int insertProduct(AdminProduct dto, String path) {
		int result = 0;
		try {
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()) {
				// 파일 업로드
				String newFilename=fileManager.doFileUpload(dto.getUpload(), path);
				dto.setImageFilename(newFilename);

				int productSeq = dao.selectOne("adminStore.productSeq");
				
				dto.setProductId(productSeq);
				dto.setPrice(dto.getSellingPrice());
				dto.setAmount(dto.getInputAmount());
				
				result = dao.insertData("adminStore.insertProduct", dto);
				for(int i=0; i<dto.getOptionList().size(); i++) {
					dto.setOptionContent(dto.getOptionList().get(i));
					result = dao.insertData("adminStore.insertProductOption", dto);
				}
				result = dao.insertData("adminStore.insertInputProduct", dto);
				
				result = 1;
			}
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateProduct(AdminProduct dto, String path) {
		int result = 0;
		try {
			//업로드한 파일이 존재한 경우
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), path);
		
				if (newFilename != null) {
					// 이전 파일 지우기
					AdminProduct vo = readProduct(dto.getProductId());
					if(vo!=null && vo.getImageFilename()!=null) {
						fileManager.doFileDelete(vo.getImageFilename(), path);
					}
					dto.setImageFilename(newFilename);
				}
			}
				
			dto.setPrice(dto.getSellingPrice());
			dto.setAmount(dto.getInputAmount());
			System.out.println("dto : " + dto);
				
			result=dao.updateData("adminStore.updateProduct", dto);
			result=dao.updateData("adminStore.updateProductInput", dto);
			//result=dao.updateData("adminStore.updateProductOption", dto);
			for(int i=0; i<dto.getOptionList().size(); i++) {
				dto.setOptionContent(dto.getOptionList().get(i));
				result = dao.insertData("adminStore.insertProductOption", dto);
			}
			result = 1;
		} catch (Exception e) {
		}
		return result;
	}

	public AdminProduct readProduct(int productId) {
		AdminProduct dto = null;
		try {
			dto = dao.selectOne("adminStore.readProduct", productId);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public List<String> readOption(int productId) {
		List<String> list = null;
		try {
			list = dao.selectList("adminStore.readOption", productId);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int deleteProduct(int productId, String imageFilename, String pathname) {
		int result=0;
		try {
			
			if(imageFilename!=null)
				fileManager.doFileDelete(imageFilename, pathname);
			
			result=dao.deleteData("adminStore.deleteInputProduct", productId);
			result=dao.deleteData("adminStore.deleteProductOption", productId);
			result=dao.deleteData("adminStore.deleteProduct", productId);
			result = 1;
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteOption(int optionId) {
		int result=0;
		try {
			result = dao.deleteData("adminStore.deleteOnlyOption", optionId);
		} catch (Exception e) {
		}
		return result;
	}
	
}
