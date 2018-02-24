package care.dog.mungstargram;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;
import care.dog.mungstargram.vo.MungstarPVO;

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
}
