package care.dog.mungstargram.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MungstarDVO {
	// mungstar 
	private int num;
	private String context;
	private Date created;
	private int userNum;
	
	// mungstarImage
	private int imageNum;
	private String filename;
}
