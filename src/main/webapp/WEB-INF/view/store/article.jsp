<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

.container-top {
	width: 900px;
	height: 650px;
}

.container-bottom {
	width: 900px;
}

.left_area {
	float: left;
	width: 440px;
	/* width: 50%; */
	height: 500px;
}

.left_area img {
	/* width: 80%; */
	width: 400px;
	float: right;
	padding-top: 50px;
	/* margin-right: 10px; */
}

.right_area {
	float: right;
	width: 410px;
	/* width: 50%; */
	/* height: 40vh; */
	height: 440px;
	/* padding: 10px; */
	
}

.txt_title {
	display: inline-block;
	width: 200px;
	text-align: left;
	font-size: 20px;
}

.txt_content {
	display: inline-block;
	text-align: right;
	width: 200px;
	font-size: 20px;
}

.txt_num {
	font-weight: bold;
}

.info_list {
	margin: 15px auto;
}

.product_info ul {
	list-style-type: none;
	/* display: inline-block; */
} 

.product_info li {
	box-sizing: border-box;
}

#sel1 {
	width: 400px;
	height: 40px;
	font-size: 18px;
}

.caret {
	margin-top: 10px;
	float: right;
}

.product_name {
	font-size: 30px;
}

.product_info {
	margin: 20px auto;
	height: 200px;
}

.product_option_box {
	margin: 10px auto;
	height: 60px;
}

.product_total_price {
	margin: 20px auto;
	height: 50px;
	border-bottom: 1px solid #e2e2e2;
}

.product_btn_area {
	padding: 20px auto;
	height: 80px;
}

.roundBtn {
	border-radius: 30px;
	width: 180px;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
}

.tab_txt {
	font-size: 20px;
	font-weight: bold;
	padding: 20px;
}

.tab-pane {
	font-size: 20px;
}

table {
	width: 800px;
}

tr {
	height: 50px;
}

th {
	background-color: #fafafa;
	width: 300px;
}

.thTxt {
	font-size: 13px;
}

.tdTxt {
	font-size: 13px;
}

.divTh {
	display: table;
	margin: 10px;
	font-size: 15px;
}

.divTh p {
	display: table-cell;
	vertical-align: middle;
}

.divTd {
	display: table;
	margin: 10px;
	/* height는 각자 태그에 맞게 */
}

.divTd p {
	/* font-size: 15px; */
	display: table-cell;
	vertical-align: middle;
}

.commentInsert {
	float: right;
	margin-bottom: 10px;
}

.commentInsertBtn {
	font-size: 15px;
	text-align: center;
	height: 30px;
	margin: 10px;
}

.qnaInsert h5 {
	float: left;
	margin-bottom: 20px;
	margin-top: 20px;
}

.qnaInsert button {
	float: right;
	margin: 20px;
}

.qnaInsertBtn {
	font-size: 15px;
	text-align: center;
	height: 30px;
	margin: 10px;
}

.hiddenRow {
	background: #fafafa;
}

.answer_mark {
	text-align: center;
	width: 100px;
	font-size: 30px;
	padding: 15px;
	float: left;
}

.answer_container {
	font-size: 15px;
	padding: 15px;
	width: 690px;
	float: left;
}

.qnaTxt {
	font-size: 15px;
}

/* .qna-list {
	border-collapse: collapse;
}
 */
 
.question-tr:hover { 
	cursor: pointer;
}

/* qna테이블의 모든 tr  */
/* .qna-list tbody tr {
	cursor: pointer;
} */
 
.modal-title {
	font-weight: bold;
	margin-left: 10px;
}
 
.reviews-write textarea{
	width: 550px;
	height: 200px;
	margin: 10px;
	border-radius: 5px;
}

.modal-body-txt {
	margin-bottom: 10px;
	margin-top: 5px;
	margin-left: 10px;
	margin-right: 10px;
	font-size: 14px;
	font-weight: bold;
}

.footer-buttonBox {
	text-align: center;
	margin: 10px;
}

.reviewCreate {
	width: 80px;
	height: 30px;
	font-size: 14px;
	font-weight: bold;
}

.reviewCancel {
	width: 80px;
	height: 30px;
	font-size: 14px;
	font-weight: bold;
}

.footer-txt {
	text-align: left;
	margin: 10px;
}

.option_total_content {
	margin: 5px; 
	height: 100px;
	background: #f9f9f9; 
	border: 1px solid #dddddd; 
	border-radius: 5px; 
	padding: 10px;
}


</style>

<script type="text/javascript">


$(document).ready(function(){
	
	var a=$('#sel1').attr("data-optionId");
	
 	if (a!=''){
		alert(${optionId});
		$('#sel1').val(${optionId});
		optionChanged();
		$('#sel1').attr("data-optionId",'');
 	}
	
	listPage(1);
})

function listPage(page) {
	var url="<%=cp%>/store/listProductReply";
	var productId="${dto.productId}";
	
	$.get(url, {productId:productId, pageNo:page}, function(data){
		$("#listProductReply").html(data);
	});
	
	var url2="<%=cp%>/store/listProductQna";
	var productId2="${dto.productId}";
	
	$.get(url2, {productId:productId2, pageNo:page}, function(data){
		$("#listProductQna").html(data);
	});
}

$(function() { 

	$("body").on("change", "#sel1", function() {

		optionChanged();
	});
	
});

function optionChanged(){
	//console.log($("#sel1").val());
	var value = $("#sel1").val(); //optionId
	var text = $("#sel1 option:selected").text(); //optionContent
	var price = ${dto.sellingPrice };
	var str = "";
	var i = 0;
	str += "<div id='option_content"+i+"' class='option_total_content'>";
	str += "<div style='height: 40px;'>";
	str += "<p style='float: left; font-size: 15px; font-weight: bold;'>"+text+"</p>";
	str += "<input type='hidden' value='"+ value +"' id='optionId'>";
	str += "<p style='float: right;'>";
	str += "<button type='button' class='btn btn-default delOptionBtn' onclick='delete_option("+i+")'>X</button>";
	str += "</p>";
	str += "</div>";
	str += "<div style='clear: both; height: 50px;'>";
	str += "<select id='amount' name='amount' class='form-control' style='width: 60px; float: left;'>";
	str += "<option value='1'>1</option>";
	str += "<option value='2'>2</option>";
	str += "<option value='3'>3</option>";
	str += "<option value='4'>4</option>";
	str += "<option value='5'>5</option>";
	str += "<option value='6'>6</option>";
	str += "<option value='7'>7</option>";
	str += "<option value='8'>8</option>";
	str += "<option value='9'>9</option>";
	str += "<option value='10'>10</option>";
	str += "</select>";
	str += "<p style='float: right; font-size: 20px; font-weight: bold;' id='dtoPrice'>"+price+"원</p>";
	str += "</div>";
	str += "</div>";
	
	$("#option_total").append(str);
	
	$("body").on("change", "#amount", function() {
		
		var final_price = $("#amount").val() * price;
		
		$("#changePrice").text(final_price);
		
	});
}

//옵션 삭제시
function delete_option(num) {
	var price = $("#dtoPrice").text();
	
	$("#option_content" + num).remove(); //옵션삭제
	$("#changePrice").text("price"); //가격 원상태로(dto의 sellingPrice)
}

//장바구니 버튼 클릭시
function listCart() {
	
	var memberInfo = $("#memberInfo").val();

	if(memberInfo == null || memberInfo == ""){
		if(confirm("로그인이 필요한 서비스입니다.")){
			location.href="<%=cp%>/member/login";
			<%-- location.href = "<%=cp%>/store/storeLogin?productId="+productId+"&optionId="+optionId; --%>
		}else
			return;
	} 
	
	var url = "<%=cp %>/store/stack";
	var productId = $("#productId").val();
	var amount = $("#amount").val();
	var optionId = $("#optionId").val();
	
	if(amount == null || amount == ""){
		alert("옵션을 선택해주세요.");
	}
	
	var data = {productId:productId, amount:amount, optionId:optionId};
	//console.log(data);
	$.ajax({
		url: url
		,data: data
		,type: "post"
		,dataType: "json"
		,success: function(data) {
			 var state = data.state;
			if(state==1){
				if(confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?")){
					location.href = "<%=cp%>/store/cart";
				}else
					return;
			} 
		}
		,error: function(e) {
			console.log(e.responseText);
		}
	});
}

//구매하기 버튼 클릭시
<%-- function order() {
	
	var memberId = $("#memberInfo").val();
	
	if(memberId == null || memberId == ""){
		if(confirm("로그인이 필요한 서비스입니다.")){
			location.href="<%=cp%>/member/login";
		}else{
			return;
		}
	}else{
		
		if(confirm("선택한 상품을 주문하시겠습니까?")){
		
			//필요한 데이터 : 사용자가 선택한 상품의 productId, amount, totalPrice, optionContent
			var productId = $("#productId").val();
			var amount = $("#amount").val();
			var optionContent = $("#sel1 option:selected").text();
			var totalPrice = $("#changePrice").text();
			
			if(amount == null || amount == ""){
				alert("옵션을 선택해주세요.");
			}
			//주문페이지로 이동
			var data = {memberId:memberId, productId:productId, amount:amount,
					optionContent:optionContent, totalPrice:totalPrice}
			
			$.ajax({
			    url: "<%=cp%>/store/orderOne",
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
}
 --%>
 
function order() {
	
	var memberId = $("#memberInfo").val();
	
	if(memberId == null || memberId == ""){
		if(confirm("로그인이 필요한 서비스입니다.")){
			location.href="<%=cp%>/member/login";
			<%-- location.href = "<%=cp%>/store/storeLogin?productId="+productId+"&optionId="+optionId; --%>
		}else
			return;
	}else{
	
		if(confirm("선택한 상품을 주문하시겠습니까?")){
			
			var productId = $("#productId").val();
			var amount = $("#amount").val();
			var optionContent = $("#sel1 option:selected").text();
			var totalPrice = $("#changePrice").text();
			//var finalPrice = $("#finalPrice").text();
			
			if(amount == null || amount == ""){
				alert("옵션을 선택해주세요.");
			}
			
			var productIdList = [];
			var amountList = [];
			var optionContentList = [];
			var totalPriceList = [];
				
			productIdList.push(productId);
			amountList.push(amount);
			optionContentList.push(optionContent);
			totalPriceList.push(totalPrice);
			
			var data = {memberId:memberId, finalPrice:totalPrice, productIdList:productIdList.toString(),
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
}

//배송비 설정
function shipment() {
	var sellingPrice = $("#sellingPrice").text();
	//3만원이상 구매시 배송비 무료
	if(Number(sellingPrice) >= 30000 || Number(sellingPrice) == 0){
		$("#shipPrice").text("0");
	}else{
		$("#shipPrice").text("2500");
	}
}

</script>

<div class="body-container">

	<!-- 상단부 : 상품 이미지와 설명 -->
	<div class="container-top">
	
		<!-- 왼쪽 부분 -->
		<div class="left_area">
			<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
			<%-- <img src="<%=cp%>/uploads/store/${dto.imageFilename}"> --%>
		</div>
		
		<!-- 오른쪽 부분-->
		<div class="right_area">
		<input id="memberInfo" type="hidden" value="${memberId }">
			
			<!-- 상품정보 테이블 -->
			<div class="product_info">
			
				<p class="product_name" id="productName">${dto.productName }</p>
				<br>
				
				<input type="hidden" id="productId" value="${dto.productId }">
			
				<ul class="info_list">
					<li>
						<span class="txt_title">판매가</span>
						<span class="txt_content cur_price">
							<span class="txt_num" id="sellingPrice">${dto.sellingPrice }</span>원
						</span>
					</li>
					<li>
						<span class="txt_title">마일리지 적립금</span>
						<span class="txt_content mileage">
							<span class="txt_num">${dto.mileage }</span>원
						</span>
					</li>
					<li>
						<span class="txt_title">배송비</span>
						<span class="txt_content ship_price">
							<span class="txt_num" id="shipPrice">2,500</span>원
						</span>
					</li>
					
				</ul>
			
			</div>
			
			<!-- 옵션 박스 -->
			<div class="product_option_box">
			 
				 <select class="form-control" data-optionId="${optionId }" id="sel1">
	        		<option selected="selected" disabled="disabled">옵션을 선택해주세요.</option>
	        		<c:forEach var="optionDto"  items="${list_option}">
	        			<option value="${optionDto.optionId }">${optionDto.optionContent }</option>
	        		</c:forEach>
	      		</select>
			 
			</div>
			
			<!-- 선택한 옵션에 대한 개수와 가격정보 -->
			<div id="option_total"></div>
			
			<!-- 상품 금액 합계 -->
			<div id="product_total_price" class="product_total_price" style="clear: both;">
				<span class="txt_title">상품금액 합계</span>
				<span class="txt_content">
					<span id="changePrice" class="txt_num">${dto.sellingPrice }</span>원
				</span>
			</div>
			
			<!-- 버튼 -->
			<div class="product_btn_area">
				<%-- <button type="button" class="btn btn-default roundBtn btnCart" 
				onclick="location.href='<%=cp%>/store/cart'">
				장바구니
				</button> --%>
				<button type="button" class="btn btn-default roundBtn btnCart" 
				onclick="listCart();">
				장바구니
				</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-default roundBtn btnBuy" 
				onclick="order();">
				구매하기
				</button>
			</div>
		
		</div>
	
	</div>

	<!-- 하단부 : 탭 -->
	<div class="container-bottom">
	
		<div role="tabpanel">

			<!-- Nav tabs -->
			<ul class="nav nav-tabs nav-justified" role="tablist">
				<li role="presentation" class="active">
					<a href="#product_detail" aria-controls="product_detail" role="tab" data-toggle="tab">
						<span class="tab_txt">상세정보</span>
					</a>
				</li>
				<li role="presentation">
					<a href="#buy_detail" aria-controls="buy_detail" role="tab" data-toggle="tab">
						<span class="tab_txt">구매정보</span>
					</a>
				</li>
				<li role="presentation">
					<a href="#comment" aria-controls="comment" role="tab" data-toggle="tab">
						<span class="tab_txt">상품평</span>
					</a>
				</li>
				<li role="presentation">
					<a href="#qna" aria-controls="qna" role="tab" data-toggle="tab">
						<span class="tab_txt">QnA</span>
					</a>
				</li>
			</ul>
			
			<!-- Tab panes -->
			<div class="tab-content" style="margin-top: 50px;">
			
				<!-- 상품 상세 정보 탭-->
				<div role="tabpanel" class="tab-pane active" id="product_detail">
					<img src="<%=cp%>/resource/img/store/dog_snack1_detail.jpg">
				</div>
				
				<!-- 구매정보 탭 -->
				<div role="tabpanel" class="tab-pane" id="buy_detail">
					
					<form name="orderInfoForm" id="orderInfoForm" action="">
						<h3 class="sub-title product-info">상품정보 제공고시</h3>
		
						<!-- 상품정보 제공고시 테이블 -->
						<table class="table table-condensed product-info">
							<tbody>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">식품의 유형</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">덴탈껌</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">생산자(제조원) 및 소재지</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">S&M NUTEC</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">제조연월일(유통기한)</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">18개월</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">용량(중량), 수량</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">30p</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">원자재료명 및 함량</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">상세페이지 참고</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">영양성분 표시 대상 여부</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">상세페이지 참고</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">유전자 재조합 식품 여부</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">해당사항 없음</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">영유아식 또는 체중조절식품 안내</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">해당사항 없음</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">수입식품여부</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">식품위생법에 따른 수입신고를 필함</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh">
											<p class="thTxt">소비자상담 전화번호</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">010-6516-1180</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<br><br><br>
						
						<h3 class="sub-title delivery-info">배송안내</h3>
		
						<!-- 배송안내 테이블 -->
						<table class="table table-condensed delivery-info">
							<tbody>
								<tr>
									<th>
										<div class="divTh" style="height: 155px;">
											<p class="thTxt">배송비/배송가능일</p>
										</div>
									</th>
									<td>
										<div class="divTd">
											<p class="tdTxt">
												배송지역 : 전국<br>
												배송비 : 2,500원<br>
												동일 업체 배송 상품의 총 결제금액 30,000원 이상일 경우 무료배송 됩니다.<br>
												도서, 산간, 오지 일부 지역은 배송비가 추가될 수 있습니다.<br>
												배송가능일 : 3일<br>
												배송가능일이란 본 상품을 주문하신 고객님들께 상품 배송이 가능한 기간을 의미합니다. <br>
												단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.<br>
												예약 상품의 경우 예약된 날짜에 출고되며, 상품의 입고가 빠르게 진행된 경우 예약일 보다 일찍 배송될 수 있습니다.
											</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<br><br><br>
						
						<h3 class="sub-title others-info">교환/반품/환불 안내</h3>
		
						<!-- 교환/반품/환불 안내 테이블 -->
						<table class="table table-condensed others-info">
							<tbody>
								<tr>
									<th>
										<div class="divTh" style="height: 70px;">
											<p class="thTxt">교환/반품 신청 기간</p>
										</div>
									</th>
									<td>
										<div class="divTd" style="height: 70px;">
											<p class="tdTxt">
												교환, 반품 신청은 배송이 완료된 후 15일 이내 가능합니다.<br>
												고객님이 배송 받으신 상품의 내용이 표시∙광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 <br>
												배송 받으신 날로부터 3개월 이내, 혹은 그 사실을 알 수 있었던 날로 부터 30일 이내에 가능합니다.
											</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh" style="height: 90px;">
											<p class="thTxt">교환/반품/회수 비용</p>
										</div>
									</th>
									<td>
										<div class="divTd" style="height: 90px;">
											<p class="tdTxt">
												고객님의 사유에 의한 교환 및 반품은 회수 및 배송에 필요한 비용을 부담해주셔야 합니다.<br>
												기본 비용은 교환 5,000원(회수비+배송비), 반품 2,500원(회수비)입니다.<br>
												제주도 및 도서산간 지방에는 추가 운임이 발생합니다.<br>
												당사의 사유(상품의 하자, 배송의 오류 등)로 인한 경우 교환 및 반품에 필요한 비용은 당사에서 부담합니다.
											</p>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<div class="divTh" style="height: 155px;">
											<p class="thTxt">교환/반품 불가안내</p>
										</div>
									</th>
									<td>
										<div class="divTd" style="height: 155px;">
											<p class="tdTxt">
												고객님의 사유에 의한 교환 및 반품이 불가한 경우<br>
												1. 배송이 완료된 후 7일이 경과한 경우<br>
												2. 포장 훼손 및 사용 또는 일부 소비, 구성품 누락 및 상품의 결함 발생으로 인해 상품의 가치가 훼손된 경우<br><br>
												당사의 사유에 의한 교환 및 반품이 불가한 경우<br>
												1. 배송 받으신 날로부터 3개월, 혹은 그 사실을 알 수 있었던 날로 부터 30일이 경과한 경우<br>
												2. 당사의 귀책(상품의 불량, 생산 및 제조 및 배송 간의 파손 등)으로 인한 현상이 아닌 해당 상품의 고유한 특성, 혹은 상품 수령 후 고객님의 과실로 인한 문제임이 규명된 경우
											</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<br><br><br>
						
					</form>
					
				</div>
				
				<!-- 상품평 탭 -->
				<div role="tabpanel" class="tab-pane" id="comment">
					
					<h3 class="sub-title comment" style="text-align: center; margin: 20px;">한줄 상품평</h3>
					
					<div class="commentInsert">
						<button type="button" class="btn btn-default commentInsertBtn">상품평작성</button>
					</div>
					
					<div id="listProductReply"></div>
					
				</div>
				
				<!-- QnA 탭 -->
				<div role="tabpanel" class="tab-pane" id="qna">
				
					<div class="qnaInsert">
						<h5>★ 상품 문의사항이 아닌 반품/교환관련 문의는 고객센터 1:1 문의를 이용해주세요.</h5>
						<button type="button" class="btn btn-default qnaInsertBtn" data-toggle="modal" data-target="#myModal">상품문의</button>
					</div>
					
					<div id="listProductQna"></div>
					
				</div>
				
			</div>
			
		</div>
		
	</div>

</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
    
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">상품 Q&A 작성</h4>
			</div>
			<div class="modal-body">
				<p class="modal-body-txt">[그리니즈] 덴탈껌 30개입</p>
				<div class="reviews-write">
					<textarea rows="1" cols="5" id="reviewBox" name="reviewBox"
					placeholder="내용을 입력하세요(5자 ~ 250자)"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<div class="footer-buttonBox">
					<button type="button" class="btn btn-default reviewCreate" data-dismiss="modal">등록</button>
					<button type="button" class="btn btn-default reviewCancel" data-dismiss="modal">취소</button>
				</div>
				<div class="footer-txt">
					<p style="font-weight: bold;">* 이용안내</p>
					<p>재판매글, 상업성 홍보글, 미풍양속을 해치는 글 등 상품 Q&A의 취지에 어긋나는 글은 삭제될 수 있습니다.</p>
				</div>
			</div>
		</div>
      
	</div>
</div>

