package care.dog.mungstargram.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MungstarDVO {
	// mungstar 
	private int num;			// pk
	private String context;
	private int hitCount;
	private Date created;
	private int userNum;		// fk_member1
	
	// mungstarPhoto
	private int photoNum;		// pk
	private String filename;
//	private int num				// fk_mungstar
	
}
