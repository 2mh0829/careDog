package care.dog.center;

import java.util.List;
import java.util.Map;

public interface GongjiService {
	public int insertGongji(Gongji dto, String pathname);
	public int updateGongji(Gongji dto, String pathname);
	public int deleteGongji(int num, String pathname);
	public List<Gongji> listGongji(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public Gongji readGongji(int num);
	public Gongji preReadGongji(Map<String, Object> map);
	public Gongji nextReadGongji(Map<String, Object> map);
	
	public int insertFile(Gongji dto);
	public List<Gongji> listFile(int num);
	public Gongji readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
}
