package care.dog.mungstargram.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

public class MungstarPVO extends MungstarDVO {
	@Setter @Getter
	private List<MultipartFile> files;
}
