package care.dog.service;

import java.util.List;
import java.util.Map;

public interface ServiceService {
	public int insertService(ServiceDto dto, String fileName);
	public int insertFile(ServiceDto dto);
	public int insertTag(ServiceDto dto);
	public int dataCount();
	public List<ServiceDto> sitterList();
	public List<ServiceDto> sitterPhotoList();
	public List<ServiceDto> sitterTag();
	
}
