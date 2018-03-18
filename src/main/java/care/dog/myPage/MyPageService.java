package care.dog.myPage;
//aa
import java.util.List;
import java.util.Map;

public interface MyPageService {
	public int maxMyPageId();
	public int insertMyPage(MyPageInfo dto, String pathname);

	public int updateMyPage(MyPageInfo dto, String pathname);
	public int deleteImage(int myPageId, String pathname, String filename);
	
	public int deleteMyPage(int myPageId, String pathname);
	
	public int dataCountMyPage(Map<String, Object> map);
	public List<MyPageInfo> listMyPage(Map<String, Object> map);

	public MyPageInfo readMyPageInfo(String memberId);
	public MyPageInfo readMyPageInfoHome(int myPageId);
	
	public int updateMyPageVisitorCount(int myPageId);

	public int createMyPageTable(int myPageId);
	public int dropMyPageTable(int myPageId);
}
