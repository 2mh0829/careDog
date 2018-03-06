<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

tr {
	height: 50px;
}

th {
	background-color: #fafafa;
}

.divTh {
	text-align: center;
	margin: 10px;
	font-size: 15px; 
}

.divFloat {
	float: left;
	margin: 10px;
}

.divTd {
	display: table;
	height: 100px; 
	margin: 10px;
	font-size: 15px;
}

.divTd p {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.pNameTxt1 {
	font-size: 15px;
	font-weight: bold;
	margin-top: 5px;
}

.pNameTxt2 {
	font-size: 16px;
}

.pNameTxt3 {
	font-size: 14px;
}

.select {
	border-radius: 5px;
	height: 25px;
}

.cartBtn {
	font-size: 15px;
	text-align: center;
	width: 99%;
	height: 40px;
	margin: 15px auto;
}

.order_box {
	background-color: #fafafa;
	padding: 15px;
}

.order-info {
	margin: 15px;
}

.left_txt {
	text-align: left;
	margin: 10px;
	font-size: 15px;
	width: 99%;
}

.right_txt {
	text-align: right;
	margin: 10px;
	font-size: 15px;
	width: 99%;
}

</style>

<div class="body-container">

	<div class="cart-content">
		
		<form name="cartForm" id="cartForm" action="">
		
			<h3>장바구니</h3>
			
			<table class="table table-condensed cart-list" style="width: 850px">
				<tbody>
					<tr>
						<th>
							<div class="divTh" style="width: 50px;">
								<input type="checkbox" id="check_th_cart">
							</div>
						</th>
						<th>
							<div class="divTh" style="width: 500px;">상품정보</div>
						</th>
						<th>
							<div class="divTh" style="width: 100px;">수량</div>
						</th>
						<th>
							<div class="divTh" style="width: 100px;">상품금액</div>
						</th>
						<th>
							<div class="divTh" style="width: 100px;">삭제</div>
						</th>
					</tr>
					<!-- 후에 tr추가되도록 수정 -->
					<tr>
						<td>
							<div class="divTd" style="width: 50px;">
								<p><input type="checkbox" id="check_td_cart"></p>
							</div>
						</td>
						<td>
							<div class="divFloat product_img" style="width: 110px;">
								<img src="<%=cp%>/resource/img/store/dog_snack1.jpg" 
								style="width: 100px;">
							</div>
							<div class="divFloat product_name" style="width: 350px;">
								<p class="pNameTxt1">서울우유</p>
								<p class="pNameTxt2">[서울우유] 아이펫밀크 180ml x 10ea</p>
								<p class="pNameTxt3">옵션 : 180ml x 10ea</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>
									<select id="productCntSel" name="productCntSel" class="select"
									style="width: 90px;">
										<option value="1" selected="selected">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select>
								</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>30,000원</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>
									<button type="button" class="btn btn-default deleteBtn">X</button>
								</p>
							</div>
						</td>
					</tr>
					<!-- 후에 삭제될 tr -->
					<tr>
						<td>
							<div class="divTd" style="width: 50px;">
								<p><input type="checkbox" id="check_td_cart"></p>
							</div>
						</td>
						<td>
							<div class="divFloat product_img" style="width: 110px;">
								<img src="<%=cp%>/resource/img/store/dog_snack1.jpg" 
								style="width: 100px;">
							</div>
							<div class="divFloat product_name" style="width: 350px;">
								<p class="pNameTxt1">서울우유</p>
								<p class="pNameTxt2">[서울우유] 아이펫밀크 180ml x 10ea</p>
								<p class="pNameTxt3">옵션 : 180ml x 10ea</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>
									<select id="productCntSel" name="productCntSel" class="select"
									style="width: 90px;">
										<option value="1" selected="selected">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select>
								</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>30,000원</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>
									<button type="button" class="btn btn-default deleteBtn">X</button>
								</p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			
			<br><br><br>
			
			<div class="order_box">
				<h3 class="sub-title order-info">주문 요약</h3>
			
				<table class="table table-condensed order-info-tbl-cart">
					<tr>
						<td><p class="left_txt">총 상품금액</p></td>
						<td><p class="right_txt">16,800원</p></td>
					</tr>
					<tr>
						<td><p class="left_txt">배송비</p></td>
						<td><p class="right_txt">0원</p></td>
					</tr>
					<tr>
						<td><p class="left_txt">총 결제금액</p></td>
						<td><p class="right_txt">16,800원</p></td>
					</tr>
					<tr>
						<td>
							<button type="button" class="btn btn-default cartBtn">
								주문하기
							</button>
						</td>
						<td>
							<button type="button" class="btn btn-default cartBtn">
								쇼핑계속하기
							</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		
	</div>
	
</div>





