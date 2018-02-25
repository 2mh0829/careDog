package care.dog.mungstargram;

import org.springframework.transaction.annotation.Transactional;

import care.dog.mungstargram.vo.MungstarPVO;

@Transactional
public interface MungstargramService {
	@Transactional
	public int insertPhoto(MungstarPVO pvo, String pathname);
}
