package care.dog.myPage.myPet;

import org.springframework.web.multipart.MultipartFile;

public class MyPetInfo {
	private String memberId;
	private int havePet,myPetYear,myPetMonth;
	private String myPetName,myPetGender,myPetType,myPetWeight;
	private int registerMyPet,neutralization,friendly;
	private int bark,disease,ddong,territory,anxiety;
	private String whenBark,aboutDisease,whereDdong,whereTerritory,aboutAnxiety;
	private int heartWorm,vaccine,coronaEnteritis,kennelCough;
	private int isHospital;
	private String hospitalName,hospitalTel1,hospitalTel2,hospitalTel3;
	private String zipCode;
	private String addr1,addr2;
	private MultipartFile myPetPhoto;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getHavePet() {
		return havePet;
	}
	public void setHavePet(int havePet) {
		this.havePet = havePet;
	}
	public int getMyPetYear() {
		return myPetYear;
	}
	public void setMyPetYear(int myPetYear) {
		this.myPetYear = myPetYear;
	}
	public int getMyPetMonth() {
		return myPetMonth;
	}
	public void setMyPetMonth(int myPetMonth) {
		this.myPetMonth = myPetMonth;
	}
	public String getMyPetName() {
		return myPetName;
	}
	public void setMyPetName(String myPetName) {
		this.myPetName = myPetName;
	}
	public String getMyPetGender() {
		return myPetGender;
	}
	public void setMyPetGender(String myPetGender) {
		this.myPetGender = myPetGender;
	}
	public String getMyPetType() {
		return myPetType;
	}
	public void setMyPetType(String myPetType) {
		this.myPetType = myPetType;
	}
	public String getMyPetWeight() {
		return myPetWeight;
	}
	public void setMyPetWeight(String myPetWeight) {
		this.myPetWeight = myPetWeight;
	}
	public int getRegisterMyPet() {
		return registerMyPet;
	}
	public void setRegisterMyPet(int registerMyPet) {
		this.registerMyPet = registerMyPet;
	}
	public int getNeutralization() {
		return neutralization;
	}
	public void setNeutralization(int neutralization) {
		this.neutralization = neutralization;
	}
	public int getFriendly() {
		return friendly;
	}
	public void setFriendly(int friendly) {
		this.friendly = friendly;
	}
	public int getBark() {
		return bark;
	}
	public void setBark(int bark) {
		this.bark = bark;
	}
	public int getDisease() {
		return disease;
	}
	public void setDisease(int disease) {
		this.disease = disease;
	}
	public int getDdong() {
		return ddong;
	}
	public void setDdong(int ddong) {
		this.ddong = ddong;
	}
	public int getTerritory() {
		return territory;
	}
	public void setTerritory(int territory) {
		this.territory = territory;
	}
	public int getAnxiety() {
		return anxiety;
	}
	public void setAnxiety(int anxiety) {
		this.anxiety = anxiety;
	}
	public String getWhenBark() {
		return whenBark;
	}
	public void setWhenBark(String whenBark) {
		this.whenBark = whenBark;
	}
	public String getAboutDisease() {
		return aboutDisease;
	}
	public void setAboutDisease(String aboutDisease) {
		this.aboutDisease = aboutDisease;
	}
	public String getWhereDdong() {
		return whereDdong;
	}
	public void setWhereDdong(String whereDdong) {
		this.whereDdong = whereDdong;
	}
	public String getWhereTerritory() {
		return whereTerritory;
	}
	public void setWhereTerritory(String whereTerritory) {
		this.whereTerritory = whereTerritory;
	}
	public String getAboutAnxiety() {
		return aboutAnxiety;
	}
	public void setAboutAnxiety(String aboutAnxiety) {
		this.aboutAnxiety = aboutAnxiety;
	}
	public int getHeartWorm() {
		return heartWorm;
	}
	public void setHeartWorm(int heartWorm) {
		this.heartWorm = heartWorm;
	}
	public int getVaccine() {
		return vaccine;
	}
	public void setVaccine(int vaccine) {
		this.vaccine = vaccine;
	}
	public int getCoronaEnteritis() {
		return coronaEnteritis;
	}
	public void setCoronaEnteritis(int coronaEnteritis) {
		this.coronaEnteritis = coronaEnteritis;
	}
	public int getKennelCough() {
		return kennelCough;
	}
	public void setKennelCough(int kennelCough) {
		this.kennelCough = kennelCough;
	}
	public int getIsHospital() {
		return isHospital;
	}
	public void setIsHospital(int isHospital) {
		this.isHospital = isHospital;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getHospitalTel1() {
		return hospitalTel1;
	}
	public void setHospitalTel1(String hospitalTel1) {
		this.hospitalTel1 = hospitalTel1;
	}
	public String getHospitalTel2() {
		return hospitalTel2;
	}
	public void setHospitalTel2(String hospitalTel2) {
		this.hospitalTel2 = hospitalTel2;
	}
	public String getHospitalTel3() {
		return hospitalTel3;
	}
	public void setHospitalTel3(String hospitalTel3) {
		this.hospitalTel3 = hospitalTel3;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public MultipartFile getMyPetPhoto() {
		return myPetPhoto;
	}
	public void setMyPetPhoto(MultipartFile myPetPhoto) {
		this.myPetPhoto = myPetPhoto;
	}
	@Override
	public String toString() {
		return "MyPetInfo [memberId=" + memberId + ", havePet=" + havePet + ", myPetYear=" + myPetYear + ", myPetMonth="
				+ myPetMonth + ", myPetName=" + myPetName + ", myPetGender=" + myPetGender + ", myPetType=" + myPetType
				+ ", myPetWeight=" + myPetWeight + ", registerMyPet=" + registerMyPet + ", neutralization="
				+ neutralization + ", friendly=" + friendly + ", bark=" + bark + ", disease=" + disease + ", ddong="
				+ ddong + ", territory=" + territory + ", anxiety=" + anxiety + ", whenBark=" + whenBark
				+ ", aboutDisease=" + aboutDisease + ", whereDdong=" + whereDdong + ", whereTerritory=" + whereTerritory
				+ ", aboutAnxiety=" + aboutAnxiety + ", heartWorm=" + heartWorm + ", vaccine=" + vaccine
				+ ", coronaEnteritis=" + coronaEnteritis + ", kennelCough=" + kennelCough + ", isHospital=" + isHospital
				+ ", hospitalName=" + hospitalName + ", hospitalTel1=" + hospitalTel1 + ", hospitalTel2=" + hospitalTel2
				+ ", hospitalTel3=" + hospitalTel3 + ", zipCode=" + zipCode + ", addr1=" + addr1 + ", addr2=" + addr2
				+ "]";
	}
	
	
}
