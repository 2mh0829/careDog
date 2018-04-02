package care.dog.admin.store;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AdminProduct {
	
	private int listNum, num; // 페이징

	private int productId; // 상품id - 시퀀스
	private String productName;
	private String brand;
	private int sellingPrice; // 판매가
	private int price; // 정가
	private int amount; // 재고수량
	private int isContinued; // 단종여부 - number(1) default 1
	private int mileage;
	private int categoryId; // 분류id
	private String categoryName; // 분류명
	
	private int optionId; 
	private List<String> optionList;
	private String optionContent;

	private String imageFilename; // 상품 이미지
	private MultipartFile upload;
	
	//입고일, 입고가격, 입고수량, 유통기한
	private String inputDate;
	private int inputPrice;
	private int inputAmount;
	private String expireDate;
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getSellingPrice() {
		return sellingPrice;
	}
	public void setSellingPrice(int sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getIsContinued() {
		return isContinued;
	}
	public void setIsContinued(int isContinued) {
		this.isContinued = isContinued;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getOptionId() {
		return optionId;
	}
	public void setOptionId(int optionId) {
		this.optionId = optionId;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	public int getInputPrice() {
		return inputPrice;
	}
	public void setInputPrice(int inputPrice) {
		this.inputPrice = inputPrice;
	}
	public int getInputAmount() {
		return inputAmount;
	}
	public void setInputAmount(int inputAmount) {
		this.inputAmount = inputAmount;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	public List<String> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<String> optionList) {
		this.optionList = optionList;
	}
	public String getOptionContent() {
		return optionContent;
	}
	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}
	@Override
	public String toString() {
		return "AdminProduct [listNum=" + listNum + ", num=" + num + ", productId=" + productId + ", productName="
				+ productName + ", brand=" + brand + ", sellingPrice=" + sellingPrice + ", price=" + price + ", amount="
				+ amount + ", isContinued=" + isContinued + ", mileage=" + mileage + ", categoryId=" + categoryId
				+ ", categoryName=" + categoryName + ", optionId=" + optionId + ", optionList=" + optionList
				+ ", optionContent=" + optionContent + ", imageFilename=" + imageFilename + ", upload=" + upload
				+ ", inputDate=" + inputDate + ", inputPrice=" + inputPrice + ", inputAmount=" + inputAmount
				+ ", expireDate=" + expireDate + "]";
	}
	
}
