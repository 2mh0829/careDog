package care.dog.store;

public class Cart {

	private int listNum, num;
	private int cartId;
	private String enrollDate;
	private int amountAll;
	private int productId;
	private String memberId;
	private int optionId;
	private String brand;
	private String productName;
	private String optionContent;
	private int totalPrice;//상품가격  * 수량
	private int sellingPrice;//상품가격
	
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
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getAmountAll() {
		return amountAll;
	}
	public void setAmountAll(int amountAll) {
		this.amountAll = amountAll;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getOptionId() {
		return optionId;
	}
	public void setOptionId(int optionId) {
		this.optionId = optionId;
	}
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOptionContent() {
		return optionContent;
	}
	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public int getSellingPrice() {
		return sellingPrice;
	}
	public void setSellingPrice(int sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	
	@Override
	public String toString() {
		return "Cart [listNum=" + listNum + ", num=" + num + ", cartId=" + cartId + ", enrollDate=" + enrollDate
				+ ", amountAll=" + amountAll + ", productId=" + productId + ", memberId=" + memberId + ", optionId="
				+ optionId + ", brand=" + brand + ", productName=" + productName + ", optionContent=" + optionContent
				+ ", totalPrice=" + totalPrice + ", sellingPrice=" + sellingPrice + "]";
	}
	
}
