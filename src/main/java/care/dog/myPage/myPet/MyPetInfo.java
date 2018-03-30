package care.dog.myPage.myPet;

import org.springframework.web.multipart.MultipartFile;

public class MyPetInfo {
	private int myPetInfoId;
	private String memberId;
	private String havePet,myPetYear,myPetMonth;
	private String myPetName,myPetGender,myPetType,myPetWeight;
	private String registerMyPet,neutralization,friendly;
	private String bark,disease,ddong,territory,anxiety;
	private String whenBark,aboutDisease,whereDdong,whereTerritory,aboutAnxiety;
	private String heartWorm,vaccine,coronaEnteritis,kennelCough;
	private String isHospital;
	private String hospitalName,hospitalTel1,hospitalTel2,hospitalTel3;
	private String zipCode;
	private String addr1,addr2;
	private MultipartFile upload;
	private String myPetPhoto;
	public int getMyPetInfoId() {
		return myPetInfoId;
	}
	public void setMyPetInfoId(int myPetInfoId) {
		this.myPetInfoId = myPetInfoId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getHavePet() {
		return havePet;
	}
	public void setHavePet(String havePet) {
		this.havePet = havePet;
	}
	public String getMyPetYear() {
		return myPetYear;
	}
	public void setMyPetYear(String myPetYear) {
		this.myPetYear = myPetYear;
	}
	public String getMyPetMonth() {
		return myPetMonth;
	}
	public void setMyPetMonth(String myPetMonth) {
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
	public String getRegisterMyPet() {
		return registerMyPet;
	}
	public void setRegisterMyPet(String registerMyPet) {
		this.registerMyPet = registerMyPet;
	}
	public String getNeutralization() {
		return neutralization;
	}
	public void setNeutralization(String neutralization) {
		this.neutralization = neutralization;
	}
	public String getFriendly() {
		return friendly;
	}
	public void setFriendly(String friendly) {
		this.friendly = friendly;
	}
	public String getBark() {
		return bark;
	}
	public void setBark(String bark) {
		this.bark = bark;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public String getDdong() {
		return ddong;
	}
	public void setDdong(String ddong) {
		this.ddong = ddong;
	}
	public String getTerritory() {
		return territory;
	}
	public void setTerritory(String territory) {
		this.territory = territory;
	}
	public String getAnxiety() {
		return anxiety;
	}
	public void setAnxiety(String anxiety) {
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
	public String getHeartWorm() {
		return heartWorm;
	}
	public void setHeartWorm(String heartWorm) {
		this.heartWorm = heartWorm;
	}
	public String getVaccine() {
		return vaccine;
	}
	public void setVaccine(String vaccine) {
		this.vaccine = vaccine;
	}
	public String getCoronaEnteritis() {
		return coronaEnteritis;
	}
	public void setCoronaEnteritis(String coronaEnteritis) {
		this.coronaEnteritis = coronaEnteritis;
	}
	public String getKennelCough() {
		return kennelCough;
	}
	public void setKennelCough(String kennelCough) {
		this.kennelCough = kennelCough;
	}
	public String getIsHospital() {
		return isHospital;
	}
	public void setIsHospital(String isHospital) {
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
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getMyPetPhoto() {
		return myPetPhoto;
	}
	public void setMyPetPhoto(String myPetPhoto) {
		this.myPetPhoto = myPetPhoto;
	}

}
