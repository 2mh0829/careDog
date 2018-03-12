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
	font-size: 15px;
}

.content {
	float: left;
	width: 25%;
	padding: 10px;
}

@media only screen and (max-width: 1000px) {
	.content {
		width: 33.3333%;
	}
}

@media only screen and (max-width: 800px) {
	.content {
		width: 49.9999%;
	}
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

.product-brand {
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 15px;
	font-weight: bold;
}

.product-title {
	margin: 5px auto;
	font-size: 15px;
}

.product-price {
	margin: 5px auto;
	font-size: 20px;
}
 
.content div {
	text-align: center;
}
	
.paging {
	clear: both;
	font-size: 23px;
	padding: 20px;
}
	
</style>

<div class="body-container">	

	<div class="list-header">

		<div class="list-title">
			<h3>ALL</h3>
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

	<c:forEach var="dto" items="${list}">
	
		<div class="content section">
	
			<!-- 상품 이미지 -->
			<div class="product-image">
				<a href="<%=cp%>/store/article">
					<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
					<%-- <img src="<%=cp%>/uploads/photo/${dto.imageFilename}"> --%>
				</a>
			</div>
			
			<!-- 브랜드명 -->
			<div class="product-brand">
				<!-- <a href="#">그리니즈</a> -->
				그리니즈
			</div>
			
			<!-- 상품 제목 -->
			<div class="product-title">
				<span class="productName" onclick="javascript:article('${dto.productId}');" >
					${dto.productName}
				</span>
			</div>
			
			<!-- 상품 가격 -->
			<div class="product-price">
				<span class="sellingPrice">
					<strong>${dto.sellingPrice}</strong>원
				</span>
			</div>
			
			<!-- new / best / sale 구분 이미지 -->
			<div class="product-icon">
				<img src="<%=cp%>/resource/img/store/new.gif">
			</div>
		</div>
	</c:forEach>
	
	<div class="paging" align="center">
		prev .. 1 2 3 .. next
	</div>
	
</div>	


	
	
	