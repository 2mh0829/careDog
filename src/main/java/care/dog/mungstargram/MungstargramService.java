package care.dog.mungstargram;

import java.util.List;
import java.util.Map;

import care.dog.mungstargram.vo.MungstarPVO;
import care.dog.mungstargram.vo.MungstarRVO;

public interface MungstargramService {
	public int insertPhoto(MungstarPVO pvo, String pathname) throws Exception;
	public int mungstarCount(Map<String, Object> map);
	public List<Integer> mungstarPhotoCount(Map<String, Object> map);
	public List<MungstarRVO> mungstarList(Map<String, Object> map);
	public List<MungstarRVO> mungstarPhotoList(int num);
	public MungstarRVO selectContent(int num);
	public List<MungstarRVO> searchList(String tag);
}
