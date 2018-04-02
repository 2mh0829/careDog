<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>

.bener {
	width: 100%;
	left: 0;
}

.bener div {
	height: 30vw;
}

.carousel-inner div img {
	position: relative;
	top: -40px;
	width: 100%;
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
	font-size: 18px;
}

.product-price {
	margin-bottom: 5px;
	font-size: 20px;
}
 
.content div {
	text-align: center;
}

.roundBtn {
	border-radius: 30px;
	width: 140px;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
	margin-top: 50px;
}

.product-container {
	margin-top: 10px;
}

.btn-area {
	clear: both;
}

.event-title h2 {
	text-align: center;
	font-weight: 550; 
	/* font-weight: bold;
	margin-bottom: 20px; */
	margin-right: 0px;
    display: inline-block;
    width: 100%;
    margin-bottom: 10px;
}

.priceTxt {
	/* color: #f65039; */
}

.eventWrap {
	width: 100%;
	/* background-color: #e2e2e2; */
	background-color: #decfb8;
	padding-top: 15px;
	padding-bottom: 40px;
}

.event-container {
	margin-top: 10px;
	text-align: center;
}

.eventImg {
	width: 1000px;
}

.sub-title {
	text-align: center;
	margin-bottom: 30px;
	/* font-weight: 400; */
	padding: 0 10px 10px;
	display: block;
	position: relative;
}
 
.sub-title h2 {
    /* font-size: 28px; */
    font-weight: 550; 
    /* font-weight: bold; */
    margin-right: 0px;
    display: inline-block;
    width: 100%;
    margin-bottom: 10px;
}

.sub-title:after {
	width: 44px;
	height: 2px;
	background: #231815;
    position: absolute;
    content: '';
    left: 49.9%;
    bottom: 0;
    margin-left: -22px;
}
 
</style>

<script>

function article(productId) {
	var url="${articleUrl}&productId="+productId;
	location.href=url;
}

</script>

<div class="bener">

	<div id="myCarousel" class="carousel slide bener-slide" data-ride="carousel">
	
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">

			<div class="item active">
				<img src="<%=cp %>/resource/img/gif/11.gif" alt="slide1">
				<div class="carousel-caption">
					<h3>best items</h3>
					<p>best best best!</p>
				</div>
			</div>

			<div class="item">
				<img src="<%=cp %>/resource/img/gif/12.gif" alt="slide2">
				<div class="carousel-caption">
					<h3>new items</h3>
					<p>new new new!</p>
				</div>
			</div>

			<div class="item">
				<img src="<%=cp %>/resource/img/gif/13.gif" alt="slide3">
				<div class="carousel-caption">
					<h3>all items</h3>
					<p>all all all!</p>
				</div>
			</div>

		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> 
			<span class="sr-only">Previous</span>
		</a> 
		
		<a class="right carousel-control" href="#myCarousel" data-slide="next"> 
			<span class="glyphicon glyphicon-chevron-right"></span> 
			<span class="sr-only">Next</span>
		</a>
		
	</div>
	
</div>

<div class="body-container">	
	
	<div class="containerWrap">
	
		<div class="sub-title" style="margin-top: 100px;">
			<h2>NEW</h2>
		</div>
	
		<div class="product-container">
		
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="content section">
			
					<!-- 상품 이미지 -->
					<div class="product-image">
						<a href="javascript:article('${dto.productId}');">
							<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
							<%-- <img src="<%=cp%>/uploads/store/${dto.imageFilename}"> --%>
						</a>
					</div>
						
					<!-- 브랜드명 -->
					<div class="product-brand" onclick="javascript:article('${dto.productId}');">
						<span class="brand">
							${dto.brand}
						</span>
					</div>
					
					<!-- 상품 제목 -->
					<div class="product-title" onclick="javascript:article('${dto.productId}');">
						<span class="productName">
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
		</div>
		
		<div class="btn-area" align="center">
			<a href="<%=cp%>/store/list" class="">
				<button type="button" class="btn btn-default roundBtn">더보기</button>
			</a>
		</div>
		
	</div>
</div>
	
	<br><br><br>

<div class="eventWrap">
	<div class="event-title">
		<h2>EVENT ZONE</h2>
	</div>
	<div class="event-container" style="margin-top: 40px;">
		<!-- 공지사항의 이벤트 주소 -->
		<a href="http://www.oliveyoung.co.kr/store/planshop/getPlanShopDetail.do?dispCatNo=500000100230003">
			<img class="eventImg" src="<%=cp%>/resource/img/store/dog_bener.jpg">
		</a>
	</div>
</div>
	
	<br><br><br>

<div class="body-container">	
	<div class="containerWrap">
	
		<div class="sub-title">
			<h2>BEST SELLER</h2>
		</div>
		
		<div class="product-container">
		
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="content section">
			
					<!-- 상품 이미지 -->
					<div class="product-image">
						<a href="javascript:article('${dto.productId}');">
							<img src="<%=cp%>/resource/img/store/dog_snack1.jpg">
							<%-- <img src="<%=cp%>/uploads/store/${dto.imageFilename}"> --%>
						</a>
					</div>
						
					<!-- 브랜드명 -->
					<div class="product-brand" onclick="javascript:article('${dto.productId}');">
						<span class="brand">
							${dto.brand}
						</span>
					</div>
					
					<!-- 상품 제목 -->
					<div class="product-title" onclick="javascript:article('${dto.productId}');">
						<span class="productName">
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
			
		</div>
		<div class="btn-area" align="center">
			<a href="<%=cp%>/store/list" class="">
				<button type="button" class="btn btn-default roundBtn">더보기</button>
			</a>
		</div>
	</div>

</div>


