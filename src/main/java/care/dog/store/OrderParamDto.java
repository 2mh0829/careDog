package care.dog.store;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

public class OrderParamDto {
	
	private String memberId;
	private int orderAllPrice;
	private List<Integer> productIdList;
	private List<Integer> amountList;
	private List<String> optionContentList;
	private List<Integer> totalPriceList;

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public List<Integer> getProductIdList() {
		return productIdList;
	}
	public void setProductIdList(List<Integer> productIdList) {
		this.productIdList = productIdList;
	}
	public List<Integer> getAmountList() {
		return amountList;
	}
	public void setAmountList(List<Integer> amountList) {
		this.amountList = amountList;
	}
	public List<String> getOptionContentList() {
		return optionContentList;
	}
	public void setOptionContentList(List<String> optionContentList) {
		this.optionContentList = optionContentList;
	}
	public List<Integer> getTotalPriceList() {
		return totalPriceList;
	}
	public void setTotalPriceList(List<Integer> totalPriceList) {
		this.totalPriceList = totalPriceList;
	}
	public int getOrderAllPrice() {
		return orderAllPrice;
	}
	public void setOrderAllPrice(int orderAllPrice) {
		this.orderAllPrice = orderAllPrice;
	}
	@Override
	public String toString() {
		return "OrderParamDto [memberId=" + memberId + ", orderAllPrice=" + orderAllPrice + ", productIdList="
				+ productIdList + ", amountList=" + amountList + ", optionContentList=" + optionContentList
				+ ", totalPriceList=" + totalPriceList + "]";
	}
	
}
