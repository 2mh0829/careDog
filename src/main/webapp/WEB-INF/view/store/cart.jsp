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

<script>

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkAll").click(function(){
        //클릭되었으면
        if($("#checkAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    })
})

function deleteCart(cartId) {
	
	if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){
		$("#cartTr"+cartId).remove();
		
		var memberId = $("#memberId").val();
		var url = "<%=cp%>/store/deleteCart";
		var data = {cartId:cartId, memberId:memberId};
		
		$.ajax({
			url: url
			,data: data
			,type: "post"
			,dataType: "json"
			,success: function(data) {
				var state = data.state;
				//console.log(state);
			}
			,error: function(e) {
				console.log(e.responseText);
			}
		});
		
	}
	
}


</script>

<div class="body-container">

	<div class="cart-content">
		
		<form name="cartForm" id="cartForm" action="">
		
			<h3>장바구니</h3>
			
			<table class="table table-condensed cart-list" style="width: 850px">
				<tbody>
					<tr>
						<th>
							<div class="divTh" style="width: 50px;">
								<input type="checkbox" id="checkAll">
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
					<c:forEach var="dto" items="${listCart }">
					<tr id="cartTr${dto.cartId }">
						<td>
							<div class="divTd" style="width: 50px;">
								<p><input type="checkbox" name="check"></p>
							</div>
						</td>
						<td>
							<div class="divFloat product_img" style="width: 110px;">
								<img src="<%=cp%>/resource/img/store/dog_snack1.jpg" 
								style="width: 100px;">
							</div>
							<div class="divFloat product_name" style="width: 350px;">
								<p class="pNameTxt1">${dto.brand }</p>
								<p class="pNameTxt2">${dto.productName }</p>
								<p class="pNameTxt3">${dto.optionContent }</p>
								<input type="hidden" value="${dto.amountAll }" id="amountAll">
								<input type="hidden" value="${dataCount }" id="dataCount">
								<input type="hidden" value="${dto.cartId }" id="cartId">
								<input type="hidden" value="${dto.memberId }" id="memberId">
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>
									<select name="amountSel" class="select"
									style="width: 90px;">
										<option value="${dto.amountAll }">${dto.amountAll }</option>
									</select>
								</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>${dto.totalPrice }</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>
									<button type="button" class="btn btn-default deleteBtn"
									onclick="deleteCart(${dto.cartId });">
									X
									</button>
								</p>
							</div>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				
			</table>
			
			<br><br><br>
			
			<div class="order_box">
				<h3 class="sub-title order-info">주문 요약</h3>
			
				<table class="table table-condensed order-info-tbl-cart">
					<tr>
						<td><p class="left_txt">총 상품금액</p></td>
						<td><p class="right_txt">0원</p></td>
					</tr>
					<tr>
						<td><p class="left_txt">배송비</p></td>
						<td><p class="right_txt">2500원</p></td>
					</tr>
					<tr>
						<td><p class="left_txt">총 결제금액</p></td>
						<td><p class="right_txt">0원</p></td>
					</tr>
					<tr>
						<td>
							<button type="button" class="btn btn-default cartBtn"
							onclick="location.href='<%=cp%>/store/order'">
								주문하기
							</button>
						</td>
						<td>
							<button type="button" class="btn btn-default cartBtn"
							onclick="location.href='<%=cp%>/store/list'">
								쇼핑계속하기
							</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		
	</div>
	
</div>





