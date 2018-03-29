package care.dog.service;

import java.util.List;
import java.util.Map;

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
			
			// 태그
			if(!dto.getTag().isEmpty()) {
				for(String ls: dto.getTag()) {
					if(ls.isEmpty()) {
						continue;
					}
					String tag = ls;
					
					dto.setTagName(tag);
					insertTag(dto);
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
	
	@Override
	public int insertTag(ServiceDto dto) {
		int result = 0;
		
		try {
			result = dao.insertData("service.insertSitterTag", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int dataCount() {
		int result = 0;
		
		try {
			result = dao.selectOne("service.sitterTot");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<ServiceDto> sitterList() {

		List<ServiceDto> list = null;
		
		try {
			list = dao.selectList("service.sitterList");
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public List<ServiceDto> sitterPhotoList() {
		
		List<ServiceDto> listPhoto = null;
		
		try {
			listPhoto = dao.selectList("service.sitterPhotoList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return listPhoto;
	}

	@Override
	public List<ServiceDto> sitterTag() {
		
		List<ServiceDto> listTag = null;
		
		try {
			listTag = dao.selectList("service.sitterTagList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return listTag;
	}

}
