package care.dog.blog;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;


@Service("caredog.blogService")
public class BlogServiceImpl implements BlogService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int maxBlogId() {
		int result=0;
		try {
			result=dao.selectOne("blog.maxBlogId");
			if(result<10000)
				result=10000;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertBlog(BlogInfo dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String filename=fileManager.doFileUpload(
						dto.getUpload(), pathname);
				dto.setProfilePhoto(filename);
			}
			
			int blogId=maxBlogId()+1;
			dto.setBlogId(blogId);
			dao.insertData("blog.insertBlogInfo", dto);
			dao.insertData("blog.insertBlogProfile", dto);
			dao.updateData("blog.updateProfilePhoto", dto);
			createBlogTable(blogId);
			
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<BlogTheme> listBlogThemeGroup() {
		List<BlogTheme> list=null;
		try {
			list=dao.selectList("blog.listBlogThemeGroup");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<BlogTheme> listBlogTheme(int themeNum) {
		List<BlogTheme> list=null;
		try {
			list=dao.selectList("blog.listBlogTheme", themeNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<BlogTheme> listBlogThemeAll() {
		List<BlogTheme> list=null;
		try {
			list=dao.selectList("blog.listBlogThemeAll");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int updateBlog(BlogInfo dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				if(dto.getProfilePhoto().length()!=0) {
					fileManager.doFileDelete(dto.getProfilePhoto(), pathname);
				}
				
				String filename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setProfilePhoto(filename);
			}			
			
			dao.updateData("blog.updateBlogInfo", dto);
			dao.updateData("blog.updateBlogProfile", dto);
			dao.updateData("blog.updateProfilePhoto", dto);
			result=1;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteImage(int blogId, String pathname, String filename) {
		int result=0;
		try {
			fileManager.doFileDelete(filename, pathname);
			
			result=dao.updateData("blog.deleteBlogProfileImage", blogId);
		} catch (Exception e) {
		}
		return result;
	}
	
	@Override
	public int deleteBlog(int blogId, String pathname) {
		int result=0;
		try {
			// 개인 블로그 파일 폴더 및 파일 삭제  
			fileManager.removePathname(pathname);
			
			dao.deleteData("blog.deleteBlogProfile", blogId);
			dao.deleteData("blog.deleteBlogInfo", blogId);
			
			// 테이블 지우기
			dropBlogTable(blogId);
			
			result=1;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCountBlog(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("blog.dataCountBlog", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<BlogInfo> listBlog(Map<String, Object> map) {
		List<BlogInfo> list=null;
		try {
			list=dao.selectList("blog.listBlog", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public BlogInfo readBlogInfo(String memberId) {
		BlogInfo dto=null;
		try {
			dto=dao.selectOne("blog.readBlogInfo", memberId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public BlogInfo readBlogInfoHome(int blogId) {
		BlogInfo dto=null;
		try {
			dto=dao.selectOne("blog.readBlogInfoHome", blogId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public BlogInfo readBlogInfoProfile(int blogId) {
		BlogInfo dto=null;
		try {
			dto=dao.selectOne("blog.readBlogInfoProfile", blogId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBlogVisitorCount(int blogId) {
		int result=0;
		try {
			result=dao.updateData("blog.updateBlogVisitorCount", blogId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int createBlogTable(int blogId) {
		int result=0;
		try {
			dao.updateData("blog.createBoardTable", blogId);
			dao.updateData("blog.createBoardLikeTable", blogId);
			dao.updateData("blog.createBoardFileTable", blogId);
			dao.updateData("blog.createBoardReplyTable", blogId);
			dao.updateData("blog.createBoardReplyLikeTable", blogId);
			dao.updateData("blog.createGuestTable", blogId);
			dao.updateData("blog.createPhotoTable", blogId);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dropBlogTable(int blogId) {
		int result=0;
		try {
			dao.updateData("blog.dropBoardReplyLikeTable", blogId);
			dao.updateData("blog.dropBoardReplyTable", blogId);
			dao.updateData("blog.dropBoardFileTable", blogId);
			dao.updateData("blog.dropBoardLikeTable", blogId);
			dao.updateData("blog.dropBoardTable", blogId);
			dao.updateData("blog.dropBoardCategoryTable", blogId);
			dao.updateData("blog.dropGuestTable", blogId);
			dao.updateData("blog.dropPhotoTable", blogId);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
