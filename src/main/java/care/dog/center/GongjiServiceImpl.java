package care.dog.center;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import care.dog.common.FileManager;
import care.dog.common.dao.CommonDAO;

@Service("gongji.gongjiService")
public class GongjiServiceImpl implements GongjiService{
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public int insertGongji(Gongji dto, String pathname) {
		int result = 0;
		try {
			int seq = dao.selectOne("gongji.seq");
			dto.setNum(seq);
			result = dao.insertData("gongji.insertGongji", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename = fileManager.doFileUpload(mf,pathname);
					if(saveFilename!=null) {
						String originalFilename = mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						dto.setFileSize(fileSize);
						
						insertFile(dto);
					}
				}
			}
			
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateGongji(Gongji dto, String pathname) {
		int result = 0;
		try {
			result = dao.updateData("gongji.updateGongji",dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf : dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename != null) {
						String originalFilename = mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						dto.setFileSize(fileSize);
						
						insertFile(dto);
					}
				}
			}
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteGongji(int num, String pathname) {
		int result = 0;
		try {
			List<Gongji> listFile =listFile(num);
			if(listFile!=null) {
				Iterator<Gongji> it = listFile.iterator();
				while(it.hasNext()) {
					Gongji dto = it.next();
					fileManager.doFileDelete(dto.getSaveFilename(),pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			
			result = dao.deleteData("gongji.deleteGongji",num);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Gongji> listGongji(Map<String, Object> map) {
		List<Gongji> list = null;
		try {
			list = dao.selectList("gongji.listGongji", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public Gongji readGongji(int num) {
		Gongji dto = null;
		try {
			dto = dao.selectOne("gongji.readGongji",num);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public Gongji preReadGongji(Map<String, Object> map) {
		Gongji dto = null;
		try {
			dto = dao.selectOne("gongji.preReadGongji",map);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public Gongji nextReadGongji(Map<String, Object> map) {
		Gongji dto = null;
		try {
			dto = dao.selectOne("gongji.nextReadGongji", map);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public int insertFile(Gongji dto) {
		int result = 0;
		try {
			result = dao.insertData("gongji.insertFile", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Gongji> listFile(int num) {
		List<Gongji> listFile = null;
		try {
			listFile = dao.selectList("gongji.listFile", num);
		} catch (Exception e) {
		}
		return listFile;
	}

	@Override
	public Gongji readFile(int fileNum) {
		Gongji dto = null;
		try {
			dto = dao.selectOne("gongji.readFile", fileNum);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.deleteData("gongji.deleteFile", map);
		} catch (Exception e) {
		}
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("gongji.dataCount", map);
		} catch (Exception e) {
		}
		return result;
	}
}
