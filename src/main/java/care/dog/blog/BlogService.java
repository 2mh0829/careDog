package care.dog.blog;

import java.util.List;
import java.util.Map;

public interface BlogService {
	public int maxBlogId();
	public int insertBlog(BlogInfo dto, String pathname);
	
	public List<BlogTheme> listBlogThemeGroup();
	public List<BlogTheme> listBlogTheme(int groupNum);
	public List<BlogTheme> listBlogThemeAll();
	
	public int updateBlog(BlogInfo dto, String pathname);
	public int deleteImage(int blogId, String pathname, String filename);
	
	public int deleteBlog(int blogId, String pathname);
	
	public int dataCountBlog(Map<String, Object> map);
	public List<BlogInfo> listBlog(Map<String, Object> map);

	public BlogInfo readBlogInfo(String memberId);
	public BlogInfo readBlogInfoHome(int blogId);
	public BlogInfo readBlogInfoProfile(int blogId);
	
	public int updateBlogVisitorCount(int blogId);

	public int createBlogTable(int blogId);
	public int dropBlogTable(int blogId);
}
