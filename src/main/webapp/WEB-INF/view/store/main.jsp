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

.roundBtn {
	border-radius: 30px;
	width: 140px;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
}

</style>


<div class="bener">

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	
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
			<h2 align="center">NEW</h2>
			<hr>
		</div>
	
		<div class="container">
				
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
				
		</div>
		
		<div class="btn-area" align="center">
			<a href="#" class="">
				<button type="button" class="btn btn-default roundBtn">더보기</button>
			</a>
		</div>
		
	</div>
	
	<br><br><br>
	
	<div class="containerWrap">
		<div class="sub-title">
			<h2 align="center">EVENT ZONE</h2>
			<hr>
		</div>
		<div class="container">
			<a href="#">
				<img src="<%=cp%>/resource/img/store/main_bener.jpg">
			</a>
		</div>
	</div>
	
	<br><br><br>
	
	<div class="containerWrap">
		<div class="sub-title">
			<h2 align="center">BEST SELLER</h2>
			<hr>
		</div>
		<div class="container">
		
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
		</div>
		<div class="btn-area" align="center">
			<a href="#" class="">
				<button type="button" class="btn btn-default roundBtn">더보기</button>
			</a>
		</div>
	</div>

</div>

