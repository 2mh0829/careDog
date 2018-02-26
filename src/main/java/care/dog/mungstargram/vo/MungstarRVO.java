package care.dog.mungstargram.vo;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class MungstarRVO extends MungstarDVO {
	private int photoCount;

	@Override
	public String toString() {
		return "MungstarRVO [photoCount=" + photoCount + ", " + super.toString() + "]";
	}
	
	
}
