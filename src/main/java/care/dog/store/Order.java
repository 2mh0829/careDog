package care.dog.store;

public class Order {
	
	private int orderId;
	private int orderAllPrice;
	private String orderDate;
	private String orderstate;
	private int orderDetailId;
	private String memberId;
	private int orderAmount; //상품의 amount
	private int orderPrice; //상품의 totalPrice
	private String note; //optionContent default : '옵션없음'
	private int productId;
	
	private String brand;
	private String productName;
	
	//결제id, 결제일 (결제테이블 요소)
	private int payId;
	private String payDate;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getOrderAllPrice() {
		return orderAllPrice;
	}
	public void setOrderAllPrice(int orderAllPrice) {
		this.orderAllPrice = orderAllPrice;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(String orderstate) {
		this.orderstate = orderstate;
	}
	public int getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
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
	public int getPayId() {
		return payId;
	}
	public void setPayId(int payId) {
		this.payId = payId;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderAllPrice=" + orderAllPrice + ", orderDate=" + orderDate
				+ ", orderstate=" + orderstate + ", orderDetailId=" + orderDetailId + ", memberId=" + memberId
				+ ", orderAmount=" + orderAmount + ", orderPrice=" + orderPrice + ", note=" + note + ", productId="
				+ productId + ", brand=" + brand + ", productName=" + productName + ", payId=" + payId + ", payDate="
				+ payDate + "]";
	}
	
}
