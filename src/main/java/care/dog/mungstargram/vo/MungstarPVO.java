package care.dog.mungstargram.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;

public class MungstarPVO extends MungstarDVO {
	@Getter
	private List<MultipartFile> files;
}
