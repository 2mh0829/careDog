package care.dog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;

@Service("service.serviceService")
public class ServiceServiceImpl implements ServiceService{

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertService(ServiceDto dto, String pathname) {
		int result=0;
		try {
			int seq = dao.selectOne("service.seq");
			dto.setSittingId(seq);
			result=dao.insertData("service.insertSitterInfo",dto);
			
			// 이미지 파일 업로드
			if (! dto.getFileName().isEmpty()) {
				for(MultipartFile mf : dto.getFileName()) {
					if(mf.isEmpty()) {
						continue;
					}
					String saveFileName = fileManager.doFileUpload(mf, pathname);
					if(saveFileName != null) {
						dto.setImageFilename(saveFileName);
						
						insertFile(dto);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public int insertFile(ServiceDto dto) {
		int result=0;
		try {
			result=dao.insertData("service.insertSitterPhoto", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}	

	

}
