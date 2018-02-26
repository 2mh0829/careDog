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
	public int insertPhoto(MungstarPVO pvo, String pathname) {
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
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int mungstarCount() {
		int result = 0;
		try {
			result = dao.selectOne("mungstar.mungstarCount");
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

}
