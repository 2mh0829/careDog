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
	
	shipment(); //배송비 결정
	finalPrice(); //총결제금액 결정
	
	//체크박스 전체체크된 상태로 시작
	$("#checkAll").prop("checked",true);
	
	if($("#checkAll").prop("checked")){
		
        //input태그의 name이 check인 태그들을 찾아서 checked옵션을 true로 정의
        $("input[name=check]").prop("checked",true);
        checkBoxChange();
        shipment(); //배송비 결정
        finalPrice(); //총결제금액 결정
    }
	
	$("input[name=check]").change(function(){
		
		checkBoxChange();
		shipment(); //배송비 결정
		finalPrice(); //총결제금액 결정
	})
	
	//최상단 체크박스 클릭
    $("#checkAll").click(function(){
        //클릭되었으면
        if($("#checkAll").prop("checked")){
            //input태그의 name이 check인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            checkBoxChange();
            shipment(); //배송비 결정
            finalPrice(); //총결제금액 결정
        //클릭이 안되있으면
        }else{
            //input태그의 name이 check인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
            checkBoxChange();
            shipment(); //배송비 결정
            finalPrice(); //총결제금액 결정
        }
    })
    
    changeSel();
	
});

//수량 셀렉트박스 변경시
function changeSel() {
	$("body").on("click", ".select", function() {
		
		var amount = $(this).val(); //변경된 수량
		var sellingPrice = $(this).attr("data-price"); //변경된 상품의 sellingPrice
		
		var totalPrice = (Number(amount) * Number(sellingPrice));

		//totalPrice 변경
		$(this).parent().parent().parent().siblings().find(".totalPrice").text(totalPrice);
	
		checkBoxChange();
		shipment();
		finalPrice();
		
		var memberId = $(".memberId").val();
		var cartId = $(this).parent().parent().parent().siblings().find(".cartId").val();
		var productId = $(this).parent().parent().parent().siblings().find(".productId").val();
		var optionId = $(this).parent().parent().parent().siblings().find(".optionId").val();
		var url = "<%=cp%>/store/updateCart";
		var data = {amount:amount, cartId:cartId, memberId:memberId, productId:productId, optionId:optionId};
		
		//update
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
		
	});
}

//장바구니 상품 총가격 계산
function checkBoxChange() {
	
	var cartId = "";
	var totalPrice = "";
	var allPrice = "0";
	
 $("input[name=check]:checked").each(function() {
	 
	//선택된 체크박스의 value값이 cartId
	cartId = $(this).val();
	totalPrice = Number($("#totalPrice"+cartId+" p").text());
	  
	//int형으로 변환
	allPrice = Number(allPrice);
	
	//cartId로 totalPrice불러와서 합계구하기 >> text수정
	allPrice += totalPrice;
	  
  })
  //console.log(allPrice);
  $("#allPrice").text(allPrice);
}

function deleteCart(cartId) {
	
	if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){
		
		var memberId = $(".memberId").val();
		var url = "<%=cp%>/store/deleteCart";
		var data = {cartId:cartId, memberId:memberId};
		
		$.ajax({
			url: url
			,data: data
			,type: "post"
			,dataType: "json"
			,success: function(data) {
				var state = data.state;
				checkBoxChange();
				changeSel();
				shipment(); //배송비 결정
				finalPrice(); //총결제금액 결정
			}
			,error: function(e) {
				console.log(e.responseText);
			}
		});
		
		$("#cartTr"+cartId).remove();
	}
	
}

//배송비 설정
function shipment() {
	var allPrice = $("#allPrice").text();
	//3만원이상 구매시 배송비 무료
	if(Number(allPrice) >= 30000 || Number(allPrice) == 0){
		$("#shipPrice").text("0");
	}else{
		$("#shipPrice").text("2500");
	}
}

//총결제 금액 설정
function finalPrice() {
	var allPrice = $("#allPrice").text();
	var shipPrice = $("#shipPrice").text();
	var finalPrice = Number(allPrice) + Number(shipPrice);
	$("#finalPrice").text(finalPrice);
}

//주문페이지로 이동
function order() {
	
	if(confirm("선택한 상품을 주문하시겠습니까?")){
		
		var memberId = $(".memberId").val();
		var productId = "";
		var amount =  "";
		var optionContent = "";
		var totalPrice = "";
		var finalPrice = $("#finalPrice").text();
		
		var productIdList = [];
		var amountList = [];
		var optionContentList = [];
		var totalPriceList = [];
		
		$("input[name=check]:checked").each(function() {
		
			productId = $(this).parent().parent().parent().parent().find(".productId").val();
			amount = $(this).parent().parent().parent().parent().find(".amount").val();
			optionContent = $(this).parent().parent().parent().parent().find(".optionContent").text();
			totalPrice = $(this).parent().parent().parent().parent().find(".totalPrice").text();
			
		<%-- 	var data = "productId=" + productId + "&amount=" + amount + 
			"&optionContent=" + optionContent + "&totalPrice=" + totalPrice + "&memberId=" + memberId;
			location.href="<%=cp%>/store/order?" + data; --%>
			
			productIdList.push(productId);
			amountList.push(amount);
			optionContentList.push(optionContent);
			totalPriceList.push(totalPrice);
		});
		
		var data = {memberId:memberId, finalPrice:finalPrice, productIdList:productIdList.toString(),
			amountList:amountList.toString(), optionContentList:optionContentList.toString(), 
			totalPriceList:totalPriceList.toString()};
		
		$.ajax({
		    url: "<%=cp%>/store/order",
		    data: data,
		    type: "post",
		    success: function() {
		    	location.href="<%=cp%>/store/orderList?memberId=" + memberId;
		    },
		    error: function(e) {
		    	console.log(e.responseText);
		    }
		});
		 
		
	}else{
		return;
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
					
					<c:forEach var="dto" items="${listCart }">
					<tr id="cartTr${dto.cartId }">
						<td>
							<div class="divTd" style="width: 50px;">
								<p><input type="checkbox" name="check" id="check${dto.cartId }" value="${dto.cartId }" ></p>
							</div>
						</td>
						<td>
							<div class="divFloat product_img" style="width: 110px;">
								<img src="<%=cp%>/resource/img/store/dog_snack1.jpg" 
								style="width: 100px;">
							</div>
							<div class="divFloat product_name" style="width: 350px;">
								<p class="pNameTxt1"><strong class="brand">${dto.brand }</strong></p>
								<p class="pNameTxt2"><strong class="productName">${dto.productName }</strong></p>
								<p class="pNameTxt3"><strong class="optionContent">${dto.optionContent }</strong></p>
								<input type="hidden" value="${dto.amountAll }" class="amount">
								<input type="hidden" value="${dataCount }" class="dataCount"> 
								<input type="hidden" value="${dto.cartId }" class="cartId">
								<input type="hidden" value="${dto.memberId }" class="memberId">
								<input type="hidden" value="${dto.sellingPrice }" class="sellingPrice">
								<input type="hidden" value="${dto.optionId }" class="optionId">
								<input type="hidden" value="${dto.productId }" class="productId">
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p>
									<select id="amountSel" name="sel" class="select" data-price="${dto.sellingPrice }"
									style="width: 90px;">
										<option value="1" ${dto.amountAll == 1 ? "selected":"" }>1</option>
										<option value="2" ${dto.amountAll == 2 ? "selected":"" }>2</option>
										<option value="3" ${dto.amountAll == 3 ? "selected":"" }>3</option>
										<option value="4" ${dto.amountAll == 4 ? "selected":"" }>4</option>
										<option value="5" ${dto.amountAll == 5 ? "selected":"" }>5</option>
										<option value="6" ${dto.amountAll == 6 ? "selected":"" }>6</option>
										<option value="7" ${dto.amountAll == 7 ? "selected":"" }>7</option>
										<option value="8" ${dto.amountAll == 8 ? "selected":"" }>8</option>
										<option value="9" ${dto.amountAll == 9 ? "selected":"" }>9</option>
										<option value="10" ${dto.amountAll == 10 ? "selected":"" }>10</option>
									</select>
								</p>
							</div>
						</td>
						<td>
							<div class="divTd" id="totalPrice${dto.cartId }" style="width: 100px;">
								<p class="totalPrice">${dto.totalPrice }</p>
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
				
				<tfoot>
					<tr height='50'>
	            		<td colspan='5' style="font-size: 16px; font-weight: bold; padding: 10px;">
	              		* 3만원이상 구매시 배송비 무료입니다.
	            		</td>
	           		</tr>
				</tfoot>
				
			</table>
			
			<br><br><br>
			
			<div class="order_box">
				<h3 class="sub-title order-info">주문 요약</h3>
			
				<table class="table table-condensed order-info-tbl-cart">
					<tr>
						<td><p class="left_txt">총 상품금액</p></td>
						<td>
							<p class="right_txt"><strong id="allPrice">0</strong>원</p>
						</td>
					</tr>
					<tr>
						<td><p class="left_txt">배송비</p></td>
						<td>
							<p class="right_txt"><strong id="shipPrice">2500</strong>원</p>
						</td>
					</tr>
					<tr>
						<td><p class="left_txt">총 결제금액</p></td>
						<td>
							<p class="right_txt"><strong id="finalPrice">0</strong>원</p>
						</td>
					</tr>
					<tr>
						<td>
							<button type="button" class="btn btn-default cartBtn"
							onclick="order();">
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





