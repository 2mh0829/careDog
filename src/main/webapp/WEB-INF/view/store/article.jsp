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

.dropdown-menu {
	width: 400px;
	font-size: 20px;
}

#dropdownMenu1 {
	width: 400px;
}

.txt_option {
	font-size: 20px;
	float: left;
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

</style>

<script type="text/javascript">

$('#myTab a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
})

$(".dropdown-menu li a").click(function(){

	alert($(this).text());
  $(this).parents(".dropdown").find('.txt_option').text($(this).text());
  $(this).parents(".dropdown").find('.txt_option').val($(this).text());

});

  
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
			
				<div class="dropdown">
				
				  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" 
				  data-toggle="dropdown" aria-expanded="true">
				    	<span class="txt_option">옵션을 선택해주세요</span>
				    	<span class="caret"></span>
				  </button>
				  
				  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">옵션1</a></li>
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">옵션2</a></li>
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">옵션3</a></li>
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">옵션4</a></li>
				  </ul>
				  
				</div>	
			
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
			
				<div role="tabpanel" class="tab-pane active" id="product_detail">
					상세정보
				</div>
				<div role="tabpanel" class="tab-pane" id="buy_detail">
					구매정보
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