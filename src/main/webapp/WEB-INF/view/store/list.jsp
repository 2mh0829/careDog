<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

	.content {
		padding: 20px 20px;
		float: left;
		width: 25%;
	}
	
	.paging {
		clear: both;
		font-size: 20px;
	}
	
</style>

<div class="body-container">	

	<div class="header">

		<div class="list-title">
			<h2>ALL</h2>
			<hr>
		</div>
	
		<div class="sort">
			<a href="#"> 최근등록순 |</a>
			<a href="#"> 판매수량순 |</a>
			<a href="#"> 높은가격순 |</a>
			<a href="#"> 낮은가격순 |</a>
			<a href="#"> 상품평순</a>
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
	
	<div class="content section03">
	
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
	
	<div class="content section04">
	
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
	
	<div class="content section05">
	
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
	
	<div class="paging" align="center">
		prev .. 1 2 3 .. next
	</div>
	
</div>	


	
	
	