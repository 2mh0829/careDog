package care.dog.center.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import care.dog.common.dao.CommonDAO;

@Service("faq.faqService")
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
		int result = 0;
		try {
			result = dao.deleteData("faq.deletefaq",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
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
	public List<FAQ> listFaqMember(Map<String, Object> map) {
		List<FAQ> list = null;
		try {
			list = dao.selectList("faq.listfaqMember",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("faq.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public FAQ readFAQ(int num) {
		FAQ dto = null;
		try {
			dto = dao.selectOne("faq.readfaq",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<FAQ> listFaqBuy(Map<String, Object> map) {
		List<FAQ> list = null;
		try {
			list = dao.selectList("faq.listfaqBuy",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<FAQ> listFaqDelivery(Map<String, Object> map) {
		List<FAQ> list = null;
		try {
			list = dao.selectList("faq.listfaqDelivery",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<FAQ> listFaqRefund(Map<String, Object> map) {
		List<FAQ> list = null;
		try {
			list = dao.selectList("faq.listfaqRefund", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<FAQ> listFaqEvent(Map<String, Object> map) {
		List<FAQ> list = null;
		try {
			list = dao.selectList("faq.listfaqEvent",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<FAQ> listFaqEtc(Map<String, Object> map) {
		List<FAQ> list = null;
		try {
			list = dao.selectList("faq.listfaqEtc",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}


}
