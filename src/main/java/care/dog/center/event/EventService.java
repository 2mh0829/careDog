package care.dog.center.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public int insertEvent(Event dto, String pathname);
	public int updateEvent(Event dto, String pathname);
	public int deleteEvent(int num, String pathname);
	public List<Event> listEvent(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public Event readEvent(int num);
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
	
	public int insertFile(Event dto);
	public List<Event> listFile(int num);
	public Event readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
}
