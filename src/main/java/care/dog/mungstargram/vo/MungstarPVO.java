package care.dog.mungstargram.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class MungstarPVO extends MungstarDVO {
	private List<MultipartFile> files;
}
