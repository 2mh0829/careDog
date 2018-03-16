package care.dog.store;

import org.springframework.web.multipart.MultipartFile;

//펫상품DTO
public class Product {

	private int listNum, num; // 페이징

	private int productId; // 상품id - 시퀀스
	private String productName;
	private String brand;
	private int sellingPrice; // 판매가
	private int price; // 정가
	private int amount; // 수량
	private int isContinued; // 단종여부 - number(1) default 1
	private int mileage;
	private int categoryId; // 분류id
	
	private int optionId; 
	private String optionContent;

	private String imageFilename; // 상품 이미지
	private MultipartFile upload;
	
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
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	@Override
	public String toString() {
		return "Product [listNum=" + listNum + ", num=" + num + ", productId=" + productId + ", productName="
				+ productName + ", brand=" + brand + ", sellingPrice=" + sellingPrice + ", price=" + price + ", amount="
				+ amount + ", isContinued=" + isContinued + ", mileage=" + mileage + ", categoryId=" + categoryId
				+ ", optionId=" + optionId + ", optionContent=" + optionContent + ", imageFilename=" + imageFilename
				+ ", upload=" + upload + "]";
	}
	
	public int getOptionId() {
		return optionId;
	}
	public void setOptionId(int optionId) {
		this.optionId = optionId;
	}
	public String getOptionContent() {
		return optionContent;
	}
	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}
	
}
