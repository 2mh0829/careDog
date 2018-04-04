package care.dog.service;

import java.util.List;
import java.util.Map;

public interface ServiceService {
	public int insertService(ServiceDto dto, String fileName);
	public int insertFile(ServiceDto dto);
	public int insertTag(ServiceDto dto);
	public int dataCount();
	public List<ServiceDto> sitterList(Map<String, Object> map);
	public List<ServiceDto> sitterPhotoList();
	public List<ServiceDto> sitterTag();
	public List<ServiceDto> selectTag(String tagName);
	public List<ServiceDto> selectSitter(ServiceDto dto);
	public ServiceDto readSitter(int sittingId);
	
}
