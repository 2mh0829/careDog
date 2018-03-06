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
	margin: 10px;
}

.tdTxt {
	font-size: 13px;
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
			<!-- 
				<div class="dropdown">
				
				  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" 
				  data-toggle="dropdown" aria-expanded="true">
				    	옵션을 선택해주세요
				    	<span class="caret"></span>
				  </button>
				  
				  <ul id="dropul" class="dropdown-menu" role="menu" aria-labelledby="searchType">
				    <li role="presentation">
				    	<a role="menuitem" tabindex="-1" href="#" value="옵션1">옵션1</a>
				    </li>
				    <li role="presentation">
				    	<a role="menuitem" tabindex="-1" href="#" value="옵션2">옵션2</a>
				    </li>
				    <li role="presentation">
				    	<a role="menuitem" tabindex="-1" href="#" value="옵션3">옵션3</a>
				    </li>
				    <li role="presentation">
				    	<a role="menuitem" tabindex="-1" href="#" value="옵션4">옵션4</a>
				    </li>
				  </ul>
				  
				</div>	
			 -->
			 
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
			
				<!-- 상품 상세 정보 -->
				<div role="tabpanel" class="tab-pane active" id="product_detail">
					<img src="<%=cp%>/resource/img/store/dog_snack1_detail.jpg">
				</div>
				
				<!-- 구매정보 -->
				<div role="tabpanel" class="tab-pane" id="buy_detail">
					
					<form name="orderInfoForm" id="orderInfoForm" action="">
						<h3 class="sub-title product-info">상품정보 제공고시</h3>
		
						<!-- 상품정보 제공고시 테이블 -->
						<table class="table table-condensed product-info">
							<tbody>
								<tr>
									<th scope="row"><p class="thTxt">식품의 유형</p></th>
									<td><p class="tdTxt">덴탈껌</p></td>
								</tr>
								<tr>
									<th scope="row"><p class="thTxt">생산자(제조원) 및 소재지</p></th>
									<td><p class="tdTxt">S&M NUTEC</p></td>
								</tr>
								<tr>
									<th scope="row"><p class="thTxt">제조연월일(유통기한)</p></th>
									<td><p class="tdTxt">18개월</p></td>
								</tr>
								<tr>
									<th scope="row"><p class="thTxt">용량(중량), 수량</p></th>
									<td><p class="tdTxt">30p</p></td>
								</tr>
								<tr>
									<th scope="row"><p class="thTxt">원자재료명 및 함량</p></th>
									<td><p class="tdTxt">상세페이지 참고</p></td>
								</tr>
								<tr>
									<th scope="row"><p class="thTxt">영양성분 표시 대상 여부</p></th>
									<td><p class="tdTxt">상세페이지 참고</p></td>
								</tr>
								<tr>
									<th scope="row"><p class="thTxt">유전자 재조합 식품 여부</p></th>
									<td><p class="tdTxt">해당사항 없음</p></td>
								</tr>
								<tr>
									<th scope="row"><p class="thTxt">영유아식 또는 체중조절식품 안내</p></th>
									<td><p class="tdTxt">해당사항 없음</p></td>
								</tr>
								<tr>
									<th scope="row"><p class="thTxt">수입식품여부</p></th>
									<td><p class="tdTxt">식품위생법에 따른 수입신고를 필함</p></td>
								</tr>
								<tr>
									<th scope="row"><p class="thTxt">소비자상담 전화번호</p></th>
									<td><p class="tdTxt">010-6516-1180</p></td>
								</tr>
							</tbody>
						</table>
						
						<br><br><br>
						
						<h3 class="sub-title delivery-info">배송안내</h3>
		
						<!-- 배송안내 테이블 -->
						<table class="table table-condensed delivery-info">
							<tbody>
								<tr>
									<th scope="row">
										<p class="thTxt" >배송비/배송가능일</p>
									</th>
									<td>
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
									</td>
								</tr>
							</tbody>
						</table>
						
						<br><br><br>
						
					</form>
					
				</div>
				<div role="tabpanel" class="tab-pane" id="comment">
					상품평
				</div>
				<div role="tabpanel" class="tab-pane" id="qna">
					QnA
				</div>
				
			</div>
			
		</div>
		
	</div>

</div>