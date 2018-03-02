package care.dog.blog;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.blog.post.Category;
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
				dto.setPhotoFilename(filename);
			}
			
			int blogId=maxBlogId()+1;
			dto.setBlogId(blogId);
			dao.insertData("blog.insertBlogInfo", dto);
			dao.insertData("blog.insertBlogProfile", dto);
			
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
				if(dto.getPhotoFilename().length()!=0) {
					fileManager.doFileDelete(dto.getPhotoFilename(), pathname);
				}
				
				String filename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setPhotoFilename(filename);
			}			
			
			dao.updateData("blog.updateBlogInfo", dto);
			dao.updateData("blog.updateBlogProfile", dto);
			result=1;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteImage(long blogSeq, String pathname, String filename) {
		int result=0;
		try {
			fileManager.doFileDelete(filename, pathname);
			
			result=dao.updateData("blog.deleteBlogProfileImage", blogSeq);
		} catch (Exception e) {
		}
		return result;
	}
	
	@Override
	public int deleteBlog(long blogSeq, String pathname) {
		int result=0;
		try {
			// 개인 블로그 파일 폴더 및 파일 삭제  
			fileManager.removePathname(pathname);
			
			dao.deleteData("blog.deleteBlogProfile", blogSeq);
			dao.deleteData("blog.deleteBlogInfo", blogSeq);
			
			// 테이블 지우기
			dropBlogTable(blogSeq);
			
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
	public BlogInfo readBlogInfoHome(long blogSeq) {
		BlogInfo dto=null;
		try {
			dto=dao.selectOne("blog.readBlogInfoHome", blogSeq);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public BlogInfo readBlogInfoProfile(long blogSeq) {
		BlogInfo dto=null;
		try {
			dto=dao.selectOne("blog.readBlogInfoProfile", blogSeq);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBlogVisitorCount(long blogSeq) {
		int result=0;
		try {
			result=dao.updateData("blog.updateBlogVisitorCount", blogSeq);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int createBlogTable(long blogSeq) {
		int result=0;
		try {
			dao.updateData("blog.createBoardCategoryTable", blogSeq);
			dao.updateData("blog.createBoardTable", blogSeq);
			dao.updateData("blog.createBoardLikeTable", blogSeq);
			dao.updateData("blog.createBoardFileTable", blogSeq);
			dao.updateData("blog.createBoardReplyTable", blogSeq);
			dao.updateData("blog.createBoardReplyLikeTable", blogSeq);
			dao.updateData("blog.createGuestTable", blogSeq);
			dao.updateData("blog.createPhotoTable", blogSeq);
			
			// 공지 테이블 추가
			Category dto=new Category();
			dto.setCategoryNum(1);
			dto.setClassify("공지");
			dto.setTableName("b_"+blogSeq);
			dao.insertData("boardCategory.insertCategory", dto);
			
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dropBlogTable(long blogSeq) {
		int result=0;
		try {
			dao.updateData("blog.dropBoardReplyLikeTable", blogSeq);
			dao.updateData("blog.dropBoardReplyTable", blogSeq);
			dao.updateData("blog.dropBoardFileTable", blogSeq);
			dao.updateData("blog.dropBoardLikeTable", blogSeq);
			dao.updateData("blog.dropBoardTable", blogSeq);
			dao.updateData("blog.dropBoardCategoryTable", blogSeq);
			dao.updateData("blog.dropGuestTable", blogSeq);
			dao.updateData("blog.dropPhotoTable", blogSeq);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
