package care.dog.center.faq;

import java.util.List;
import java.util.Map;

public interface FAQService {
	public int insertFaq(FAQ dto, String pathname);
	public int updateFaq(FAQ dto, String pathname);
	public int deleteFaq(int num, String pathname);
	public List<FAQ> listFaq(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public FAQ readFAQ(int num);
	public FAQ preReadFAQ(Map<String, Object> map);
	public FAQ nextReadFAQ(Map<String, Object> map);

}
