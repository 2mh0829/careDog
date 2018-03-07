<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

.left_area {
	float: left;
	/* width: 400px; */
	width: 50%;
}

.left_area img {
	width: 80%;
	padding: 10px;
	float: right;
	margin-right: 20px;
}

.right_area {
	float: right;
	/* width: 450px; */
	width: 50%;
	padding: 10px;
	height: 40vh;
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
	margin: 25px auto;
	height: 40%;
}

.product_option_box {
	margin: 25px auto;
	height: 20%;
}

.product_total_price {
	margin: 25px auto;
	height: 20%;
}

.product_btn_area {
	padding: 25px auto;
	height: 20%;
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
	/* height: 100px; */
	margin: 10px;
	font-size: 15px;
}

.divTd p {
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

</style>

<script type="text/javascript">

$('#dropul li').on('click', function(){

	//alert($(this).attr('value'));
	$('#dropdownMenu1').text($(this).text());

});

$('#myTab a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
})

  
</script>

<div class="body-container">

	<!-- 상단부 : 상품 이미지와 설명 -->
	<div class="container top">
	
		<!-- 왼쪽 부분 -->
		<div class="left_area">
			<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
		</div>
		
		<!-- 오른쪽 부분-->
		<div class="right_area">
		
			<!-- 상품정보 테이블 -->
			<div class="product_info">
			
				<p class="product_name">[그리니즈] 덴탈껌 30개입</p>
			
				<ul class="info_list">
					<li>
						<span class="txt_title">판매가</span>
						<span class="txt_content cur_price">
							<span class="txt_num">42,000</span>원
						</span>
					</li>
					<li>
						<span class="txt_title">마일리지 적립금</span>
						<span class="txt_content mileage">
							<span class="txt_num">200</span>원
						</span>
					</li>
					<li>
						<span class="txt_title">배송비</span>
						<span class="txt_content ship_price">
							<span class="txt_num">2,500</span>원
						</span>
					</li>
					
				</ul>
			
			</div>
			
			<!-- 옵션 박스 -->
			<div class="product_option_box">
			 
				 <select class="form-control" id="sel1">
	        		<option selected="selected">옵션을 선택해주세요.</option>
	        		<option>1</option>
	        		<option>2</option>
	        		<option>3</option>
	        		<option>4</option>
	      		</select>
			 
			</div>
			
			<!-- 상품 금액 합계 -->
			<div class="product_total_price">
				<span class="txt_title">상품금액 합계</span>
				<span class="txt_content">
					<span class="txt_num">0</span>원
				</span>
			</div>
			
			<!-- 버튼 -->
			<div class="product_btn_area">
				<button type="button" class="btn btn-default roundBtn btnCart" 
				onclick="location.href='<%=cp%>/store/cart'">
				장바구니
				</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-default roundBtn btnBuy" 
				onclick="location.href='<%=cp%>/store/order'">
				구매하기
				</button>
			</div>
		
		</div>
	
	</div>
	
	<!-- 하단부 : 탭 -->
	<div class="container bottom">
	
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
					
					<form name="commentForm" id="commentForm" action="">
						<table class="table table-condensed comment-list" style="width: 850px">
							<tbody>
								<tr>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">별점이미지</p>
											<!-- <img alt="" src=""> -->
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 550px;">
											<p class="tdTxt">저렴하게 구매했어요</p>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">han</p>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">2018.03.01</p>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">별점이미지</p>
											<!-- <img alt="" src=""> -->
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 500px;">
											<p class="tdTxt">진짜 잘먹어요</p>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">spring</p>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">2018.02.28</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					
				</div>
				
				<!-- QnA 탭 -->
				<div role="tabpanel" class="tab-pane" id="qna">
				
					<div class="qnaInsert">
						<h5>★ 상품 문의사항이 아닌 반품/교환관련 문의는 고객센터 1:1 문의를 이용해주세요.</h5>
						<button type="button" class="btn btn-default qnaInsertBtn">상품문의</button>
					</div>
					
					<form name="qnaForm" id="qnaForm" action="">
						<table class="table table-condensed qna-list" style="width: 850px">
							<tbody>
								<tr>
									<td>
										<div class="divTd" style="width: 100px;">
											<!-- 답변완료 여부 버튼 이미지로? -->
											<button type="button" class="btn btn-default qnaOkBtn" disabled="disabled">답변완료</button>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 550px;">
											<p class="tdTxt">도대체 언제 배송하세요?</p>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">han</p>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">2018.03.01</p>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="divTd" style="width: 100px;">
											<!-- 답변완료 여부 버튼 이미지로? -->
											<button type="button" class="btn btn-default qnaOkBtn" disabled="disabled">답변완료</button>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 500px;">
											<p class="tdTxt">주문했는데 언제 받을수있나요?</p>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">spring</p>
										</div>
									</td>
									<td>
										<div class="divTd" style="width: 100px;">
											<p class="tdTxt">2018.02.28</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					
				</div>
				
			</div>
			
		</div>
		
	</div>

</div>