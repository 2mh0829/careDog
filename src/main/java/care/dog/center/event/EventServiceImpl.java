package care.dog.center.event;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;

@Service("event.eventService")
public class EventServiceImpl implements EventService{
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public int insertEvent(Event dto, String pathname) {
		int result = 0;
		try {
			int seq = dao.selectOne("event.seq");
			dto.setNum(seq);
			result = dao.insertData("event.insertEvent",dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if (mf.isEmpty()) 
						continue;
					
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						String originalFilename = mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						dto.setFileSize(fileSize);
						
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
	public int updateEvent(Event dto, String pathname) {
		int result = 0;
		try {
			result = dao.updateData("event.updateEvent",dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf: dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename != null) {
						String originalFilename = mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						dto.setFileSize(fileSize);
						
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
	public int deleteEvent(int num, String pathname) {
		int result = 0;
		try {
			List<Event> listFile = listFile(num);
			if(listFile!=null) {
				Iterator<Event> it = listFile.iterator();
				while(it.hasNext()) {
					Event dto = it.next();
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			result = dao.deleteData("event.deleteEvent",num);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list = null;
		try {
			list = dao.selectList("event.listEvent",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("event.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Event readEvent(int num) {
		Event dto = null;
		try {
			dto = dao.selectOne("event.readEvent",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Event preReadEvent(Map<String, Object> map) {
		Event dto = null;
		try {
			dto = dao.selectOne("event.preReadEvent",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Event nextReadEvent(Map<String, Object> map) {
		Event dto = null;
		try {
			dto = dao.selectOne("event.nextReadEvent",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int insertFile(Event dto) {
		int result = 0;
		try {
			result = dao.insertData("event.insertFile",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Event> listFile(int num) {
		List<Event> list = null;
		try {
			list = dao.selectList("event.listFile",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Event readFile(int fileNum) {
		Event dto = null;
		try {
			dto = dao.selectOne("event.readFile",fileNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.deleteData("event.deleteFile",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
