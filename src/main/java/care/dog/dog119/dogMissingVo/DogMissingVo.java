package care.dog.dog119.dogMissingVo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DogMissingVo {
	private int missingId;
	private String memberId;
	private String phone1;
	private String phone2;
	private String petname;
	private String kind;
	private String kind_more;
	private String sex;
	private int age;
	private String whenis;
	private String city;
	private String country;
	private String whereis;
	private String mark;
	private String posx;
	private String posy;
	private String story;
	private String reward;
	private String filename;
	private List<MultipartFile> upload;
	
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public int getMissingId() {
		return missingId;
	}
	public void setMissingId(int missingId) {
		this.missingId = missingId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPetname() {
		return petname;
	}
	public void setPetname(String petname) {
		this.petname = petname;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getKind_more() {
		return kind_more;
	}
	public void setKind_more(String kind_more) {
		this.kind_more = kind_more;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getWhenis() {
		return whenis;
	}
	public void setWhenis(String whenis) {
		this.whenis = whenis;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getWhereis() {
		return whereis;
	}
	public void setWhereis(String whereis) {
		this.whereis = whereis;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getPosx() {
		return posx;
	}
	public void setPosx(String posx) {
		this.posx = posx;
	}
	public String getPosy() {
		return posy;
	}
	public void setPosy(String posy) {
		this.posy = posy;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getReward() {
		return reward;
	}
	public void setReward(String reward) {
		this.reward = reward;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	
}
