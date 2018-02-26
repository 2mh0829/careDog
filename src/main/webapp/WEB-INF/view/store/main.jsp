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

.resize {
	position: relative;
	margin: 0;
	padding: 0;
	width: 100%;
	left: 0;
}


.roundBtn {
	border-radius: 30px;
	width: 150px;
	height: 60px;
	font-size: 20px;
	font-weight: bold;
}

</style>



<div class="bener">

	<div id="myCarousel" class="carousel slide resize" data-ride="carousel">
	
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">

			<div class="item active">
				<img src="<%=cp %>/resource/img/gif/11.gif" alt="slide1" style="width: 100%;">
				<div class="carousel-caption">
					<h3>best items</h3>
					<p>best best best!</p>
				</div>
			</div>

			<div class="item">
				<img src="<%=cp %>/resource/img/gif/12.gif" alt="slide2" style="width: 100%;">
				<div class="carousel-caption">
					<h3>new items</h3>
					<p>new new new!</p>
				</div>
			</div>

			<div class="item">
				<img src="<%=cp %>/resource/img/gif/13.gif" alt="slide3" style="width: 100%;">
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
	
	<div class="content section01">
		<div class="sub-title" style="margin-top: 100px;">
			<h2 align="center">NEW</h3>
			<hr>
		</div>
		<div class="container">
			<!-- 내용 -->
		</div>
		<div class="btn-area" align="center">
			<a href="#" class="">
				<button type="button" class="btn btn-default roundBtn">더보기</button>
			</a>
		</div>
	</div>
	
	<br><br><br>
	
	<div class="content section02">
		<div class="sub-title">
			<h2 align="center">EVENT ZONE</h3>
			<hr>
		</div>
		<div class="container">
			<!-- 내용 -->
		</div>
	</div>
	
	<br><br><br>
	
	<div class="content section03">
		<div class="sub-title">
			<h2 align="center">BEST SELLER</h3>
			<hr>
		</div>
		<div class="container">
			<!-- 내용. -->
		</div>
		<div class="btn-area" align="center">
			<a href="#" class="">
				<button type="button" class="btn btn-default roundBtn">더보기</button>
			</a>
		</div>
	</div>

</div>

