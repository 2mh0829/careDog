<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

.sort {
	margin: 30px auto;
	font-size: 20px;
}

.content {
	float: left;
	width: 320px;
	height: 400px;
	/* width: 25%; */
}

.product-image {
	position: relative;
	width: 100%;
	height: 70%;
}

.product-image img {
	width: 100%;
	height: 100%;
}

.product-title {
	margin: 5px auto;
	font-size: 20px;
}

.product-price {
	margin: 5px auto;
	font-size: 18px;
}
 
.content div {
	text-align: center;
}
	
.paging {
	clear: both;
	font-size: 23px;
}
	
</style>

<div class="body-container">	

	<div class="header">

		<div class="list-title">
			<h2>ALL</h2>
			<hr>
		</div>
	
		<div class="sort">
			<a href="#"> 최근 등록 순  |</a>
			<a href="#">  판매 수량 순  |</a>
			<a href="#">  높은 가격 순  |</a>
			<a href="#">  낮은 가격 순  |</a>
			<a href="#">  상품평 순</a>
		</div>

	</div>

	<div class="content section01">
	
		<!-- 상품 이미지 -->
		<div class="product-image">
			<a href="#">
				<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
			</a>
		</div>
		
		<!-- 상품 제목 -->
		<div class="product-title">
			<a href="#">개껌 30개입</a>
		</div>
		
		<!-- 상품 가격 -->
		<div class="product-price">
			<strong>40000</strong>원
		</div>
		
		<!-- new / best / sale 구분 이미지 -->
		<div class="product-icon">
			<img src="<%=cp%>/resource/img/store/new.gif">
		</div>
		
	</div>
	
	<div class="content section02">
	
		<div class="product-image">
			<a href="#">
				<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
			</a>
		</div>
		
		<div class="product-title">
			<a href="#">개껌 30개입</a>
		</div>
		
		<div class="product-price">
			<strong>40000</strong>원
		</div>
		
		<div class="product-icon">
			<img src="<%=cp%>/resource/img/store/new.gif">
		</div>
		
	</div>
	
	<div class="content section03">
	
		<div class="product-image">
			<a href="#">
				<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
			</a>
		</div>
		
		<div class="product-title">
			<a href="#">개껌 30개입</a>
		</div>
		
		<div class="product-price">
			<strong>40000</strong>원
		</div>
		
		<div class="product-icon">
			<img src="<%=cp%>/resource/img/store/new.gif">
		</div>
		
	</div>
	
	<div class="content section04">
	
		<div class="product-image">
			<a href="#">
				<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
			</a>
		</div>
		
		<div class="product-title">
			<a href="#">개껌 30개입</a>
		</div>
		
		<div class="product-price">
			<strong>40000</strong>원
		</div>
		
		<div class="product-icon">
			<img src="<%=cp%>/resource/img/store/new.gif">
		</div>
		
	</div>
	
	<div class="content section05">
	
		<div class="product-image">
			<a href="#">
				<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
			</a>
		</div>
		
		<div class="product-title">
			<a href="#">개껌 30개입</a>
		</div>
		
		<div class="product-price">
			<strong>40000</strong>원
		</div>
		
		<div class="product-icon">
			<img src="<%=cp%>/resource/img/store/new.gif">
		</div>
		
	</div>
	
	<div class="paging" align="center">
		prev .. 1 2 3 .. next
	</div>
	
</div>	


	
	
	