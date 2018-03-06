package care.dog.mungstargram;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;
import care.dog.mungstargram.vo.MungstarPVO;
import care.dog.mungstargram.vo.MungstarRVO;

@Service("mungstargram.mungstargramServiceImpl")
public class MungstargramServiceImpl implements MungstargramService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertPhoto(MungstarPVO pvo, String pathname) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("mungstar.insertContext", pvo);
			pvo.setNum(dao.selectOne("mungstar.selectMungstarNum"));
			
			for(int i=0; i<pvo.getFiles().size(); i++) {
				String filename = fileManager.doFileUpload(pvo.getFiles().get(i), pathname);
				if(filename != null) {
					pvo.setFilename(filename); 
					dao.insertData("mungstar.insertPhoto", pvo);
				}
			}
			
			for(int i=0; i<pvo.getTags().size(); i++) {
				String tag = pvo.getTags().get(i);
				pvo.setTag(tag);
				dao.insertData("mungstar.insertTag", pvo);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}

	@Override
	public int mungstarCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("mungstar.mungstarCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<MungstarRVO> mungstarList(Map<String, Object> map) {
		List<MungstarRVO> list = null;
		try {
			list = dao.selectList("mungstar.mungstarList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<MungstarRVO> mungstarPhotoList(int num) {
		List<MungstarRVO> list = null;
		try {
			dao.updateData("mungstar.updateHitCount", num);
			list = dao.selectList("mungstar.mungstarPhotoList", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Integer> mungstarPhotoCount(Map<String, Object> map) {
		List<Integer> list = null;
		try {
			list = dao.selectList("mungstar.mungstarPhotoCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public MungstarRVO selectContent(MungstarPVO pvo) {
		MungstarRVO rvo = null;
		try {
			rvo = dao.selectOne("mungstar.mungstarContent", pvo);
			rvo.setLikeInfo(dao.selectOne("mungstar.selectMungstarLike", pvo));
			rvo.setLikeCount(dao.selectOne("mungstar.mungstarLikeCount", pvo));
			rvo.setReplyList(dao.selectList("mungstar.mungstarReplyList", pvo));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return rvo;
	}

	@Override
	public List<MungstarRVO> searchList(String tag) {
		List<MungstarRVO> list = null;
		try {
			list = dao.selectList("mungstar.selectTag", tag);
			list.addAll(dao.selectList("mungstar.selectMemberId", tag));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertMungstarLike(MungstarPVO pvo) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("mungstar.insertMungstarLike", pvo);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}

	@Override
	public int deleteMungstarLike(MungstarPVO pvo) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("mungstar.deleteMungstarLike", pvo);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}

	@Override
	public List<Integer> mungsterLikeCount(Map<String, Object> map) {
		List<Integer> list = null;
		try {
			list = dao.selectList("mungstar.likeCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertMungstarReply(MungstarPVO pvo) {
		int result = 0;
		try {
			result = dao.insertData("mungstar.insertMungstarReply", pvo);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Integer> mungstarReplyCount(Map<String, Object> map) {
		List<Integer> list = null;
		try {
			list = dao.selectList("mungstar.replyCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}


}
