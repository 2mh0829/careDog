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
	width: 400px;
	text-align: center;
}

.right_area {
	float: left;
	width: 450px;
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

.product_name {
	font-size: 30px;
}

.product_info {
	margin: 25px auto;
}

.product_option_box {
	margin: 25px auto;
}

.product_total_price {
	margin: 25px auto;
}

.product_btn_area {
	padding: 25px auto;
	text-align: center;
}

.roundBtn {
	border-radius: 30px;
	width: 180px;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
}

</style>

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
			
				<p class="sel_option">옵션을 선택해주세요</p>	
			
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
				<button type="button" class="btn btn-default roundBtn btnCart" onclick="">장바구니</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-default roundBtn btnBuy" onclick="">구매하기</button>
			</div>
		
		</div>
	
	</div>
	
	<!-- 하단부 : 탭 -->
	<div class="container bottom">
	
	</div>

</div>