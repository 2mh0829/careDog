package care.dog.center.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import care.dog.common.dao.CommonDAO;

public class FAQServiceImpl implements FAQService{
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertFaq(FAQ dto, String pathname) {
		int result = 0;
		try {
			result = dao.insertData("faq.insertfaq",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateFaq(FAQ dto, String pathname) {
		int result = 0;
		try {
			result = dao.updateData("faq.updatefaq",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteFaq(int num, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FAQ> listFaq(Map<String, Object> map) {
		List<FAQ> list = null;
		try {
			list = dao.selectList("faq.listfaq",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int DataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FAQ readFAQ(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FAQ preReadFAQ(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FAQ nextReadFAQ(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
