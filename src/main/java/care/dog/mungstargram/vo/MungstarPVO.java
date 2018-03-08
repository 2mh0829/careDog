package care.dog.mungstargram.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MungstarPVO extends MungstarDVO {
	private List<MultipartFile> files;		
	private List<String> tags;				// 사진등록시 사용자가 입력한 태그
	
	
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	
}
