package care.dog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ServiceDto {

	private String sittingId;
	private String memberId;
	private String title;
	private String content;
	private String startDate;
	private String endDate;
	private int reserDiv;
	private String reserCost;
	private int addPet;
	private String addPetCost;
	private int carableWeight;
	private int catableAge;
	private String space;
	private String subway;
	private String yard;
	private String baby;
	private String family;
	private String other;
	private String sitterPhoto;
	private String tag;
	
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getSitterPhoto() {
		return sitterPhoto;
	}
	public void setSitterPhoto(String sitterPhoto) {
		this.sitterPhoto = sitterPhoto;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getSittingId() {
		return sittingId;
	}
	public void setSittingId(String sittingId) {
		this.sittingId = sittingId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getReserDiv() {
		return reserDiv;
	}
	public void setReserDiv(int reserDiv) {
		this.reserDiv = reserDiv;
	}
	public String getReserCost() {
		return reserCost;
	}
	public void setReserCost(String reserCost) {
		this.reserCost = reserCost;
	}
	public int getAddPet() {
		return addPet;
	}
	public void setAddPet(int addPet) {
		this.addPet = addPet;
	}
	public String getAddPetCost() {
		return addPetCost;
	}
	public void setAddPetCost(String addPetCost) {
		this.addPetCost = addPetCost;
	}
	public int getCarableWeight() {
		return carableWeight;
	}
	public void setCarableWeight(int carableWeight) {
		this.carableWeight = carableWeight;
	}
	public int getCatableAge() {
		return catableAge;
	}
	public void setCatableAge(int catableAge) {
		this.catableAge = catableAge;
	}
	
	public String getSpace() {
		return space;
	}
	public void setSpace(String space) {
		this.space = space;
	}
	public String getSubway() {
		return subway;
	}
	public void setSubway(String subway) {
		this.subway = subway;
	}
	public String getYard() {
		return yard;
	}
	public void setYard(String yard) {
		this.yard = yard;
	}
	public String getBaby() {
		return baby;
	}
	public void setBaby(String baby) {
		this.baby = baby;
	}
	public String getFamily() {
		return family;
	}
	public void setFamily(String family) {
		this.family = family;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
}
