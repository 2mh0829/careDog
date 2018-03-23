<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
body {
	margin: 0;
	padding: 0;
}

a {
	color: white;
}

a:hover {
	color: white;
	text-decoration: none;
}

.header-right a {
	color: white;
}

#main-vidio {
	position: absolute;
	width: 100%;
	top: 0;
	left: 0;
}

video {
	/* position : fixed; */
	top: -50;
	left: 0;
	min-width: 100%;
	min-height: 100%;
	width: 100%;
	height: auto;
	z-index: -1;
}

.header-left {
	color: white;
	font-size: 30px;
	font-weight: bold;
}

.bgDiv {
	width: 100%;
	height: 2500px;
	background: white;
	-webkit-transition: 1s;
	transition: 1s;
}


/* -------------------------- */
.container {
	padding-top: 0;
}

.full-container {
	position: relative;
	top: -65px;
	box-sizing: border-box;
	width: 100%;
}

#admin-mungstar-1 {
	position: relative;
	width: 100%;
	top: -75px;
	left: 0;
}

#a-first {
	position: absolute;
	display: inline-block;
	width: 70px;
	height: 70px;
	margin: 20px 0 0 16px;
	top: 60%;
	right: 15%;
}

#a-first .square {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0.5;
	display: inline-block;
	width: 70px;
	height: 70px;
	z-index: 100;
}

#a-first .line-top {
	transition: width 0.3s ease-out;
	width: 100%;
	left: 0;
	top: 0;
}

#a-first .line-right {
	transition: height 0.3s ease-out 0.3s;
	height: 100%;
	top: 0;
	right: 0;
}

#a-first .line-bottom {
	transition: width 0.3s ease-out 0.6s;
	width: 100%;
	right: 0;
	bottom: 0;
}

#a-first .line-left {
	transition: height 0.3s ease-out .9s;
	height: 100%;
	bottom: 0;
	left: 0;
}

#a-first .line-h {
	display: inline-block;
	width: 8px;
	height: 0;
	background: #fff;
	position: absolute;
	z-index: 1;
}

#a-first .line-w {
	display: inline-block;
	width: 0;
	height: 8px;
	background: #fff;
	position: absolute;
	z-index: 1;
}

#a-first .btn_more2 {
	position: relative;
	margin-top: 28px;
	margin-left: -16px;
	z-index: 101;
	display: inline-block;
	color: #fff;
	vertical-align: middle;
	line-height: 14px;
}

/* --------------------------------------- */
.box_scroll {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.box_cover {
	position: relative;
	width: 100%;
	height: 949px;
	overflow: hidden;
}

.box_img {
	width: 100%;
	height: 100%;
}

.box_mask {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.mask {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #fff;
	z-index: 51;
	transform: translateX(0%) translateY(0%);
	-webkit-transform: translateX(0%) translateY(0%);
	-ms-transform: translateX(0%) translateY(0%);
}

#a-second {
	position: fixed;
	width: 180px;
	height: 180px;
	margin: 20px 0 0 16px;
	top: 50%;
	left: 15%;
	visibility: hidden;
}

#a-second .square {
	position: absolute;
	top: -250px;
	left: 0;
	display: inline-block;
	width: 180px;
	height: 180px;
	z-index: 100;
}

#a-second .line-bottom {
	transition: width 0.3s ease-out;
	width: 100%;
	right: 0;
	bottom: 0;
}

#a-second .line-left {
	transition: height 0.3s ease-out .3s;
	height: 100%;
	bottom: 0;
	left: 0;
}

#a-second .line-top {
	transition: width 0.3s ease-out .6s;
	width: 100%;
	left: 0;
	top: 0;
}

#a-second .line-right {
	transition: height 0.3s ease-out 0.9s;
	height: 100%;
	top: 0;
	right: 0;
}

#a-second .line-h {
	display: inline-block;
	width: 10px;
	height: 0;
	background: #fff;
	position: absolute;
	z-index: 1;
}

#a-second .line-w {
	display: inline-block;
	width: 0;
	height: 10px;
	background: #fff;
	position: absolute;
	z-index: 1;
}

#a-second .btn_more2 {
	position: relative;
	margin-top: 28px;
	margin-left: -16px;
	z-index: 101;
	display: inline-block;
	color: #fff;
	vertical-align: middle;
	line-height: 14px;
}

/* -------------------------------------- */
.box_cover.over {
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	height: 100%;
}

.box_img2 {
	position: relative;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

.dim {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 40;
}

.type2 {
	top: 100%;
}

.span-title {
	position: relative;
	font-size: 100px;
	top: -197px;
	left: 57px;
	font-weight: bold;
}

.span-title sub {
	margin-left: 10px;
	bottom: -.47em;
}

.box_title {
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	height: 100%;
}

.list_magazine {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -280px;
	margin-left: -30px;
	z-index: 50;
}

.list_type.list_1 {
	margin-top: 0px;
	margin-left: 70px;
}

.list_type.list_2 {
	margin-top: 18px;
	margin-left: 140px;
}

.list_type.list_3 {
	margin-top: 0px;
	margin-left: 70px;
}

.list_magazine .list_type {
	clear: both;
	margin-bottom: 20px;
}

ol, ul, li {
	list-style: none;
}

#admin-mungstar-2 {
	position: relative;
	width: 100%;
	top: -85px;
	left: 0;
	z-index: 1;
}

.no {
	display: inline-block;
	margin-top: 8px;
	color: #fff;
	-webkit-transform: rotate(90deg);
	-ms-transform: rotate(90deg);
	transform: rotate(90deg);
}

.box_info {
	float: left;
	margin-left: 15px;
	color: #fff;
}

.box_info .tit {
	max-width: 186px;
	font-size: 18px;
	line-height: 22px;
}

.box_thumb, .img_thumb {
	position: relative;
	float: left;
}

.list_type.list_1 .img_thumb img, .list_type.list_4 .img_thumb img {
	width: 204px;
	height: 128px;
}

.list_type.list_2 .img_thumb img, .list_type.list_3 .img_thumb img {
	width: 144px;
	height: 192px;
}

img {
	vertical-align: top;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

/* --------------------------------------------------- */
#admin-mungstar-3 {
	position: relative;
	z-index: 2;
	background: #fff;
	top: 864px;
}

#admin-mungstar-3 img {
	width: 100%;
}
</style>

<script>

$("#menu-background").html("");
$(".header-left").html("<a href='<%=cp %>'><img src='<%=cp %>/resource/img/logo_white.png'></a>");

$(function() {
	$("#a-first").one("hover", function() {
		$("#a-first .line-w").css("width", "70px");
		$("#a-first .line-h").css("height", "70px");
	});
	
	$("#a-first").trigger("hover");
	

	
	$(window).scroll(function() {
		if($(window).scrollTop() >= 100) {
			if($(window).scrollTop() >= 3800){
				$(".bgDiv").one("hover", function() {
					$(".bgDiv").css("background", "white");
				});
				 
				$(".bgDiv").trigger("hover");
			}else if($(window).scrollTop() >= 3400){
				$(".bgDiv").one("hover", function() {
					$(".bgDiv").css("background", "#5f84bd");
				});
				 
				$(".bgDiv").trigger("hover");
			}else if($(window).scrollTop() >= 3000){
				$(".bgDiv").one("hover", function() {
					$(".bgDiv").css("background", "#39b0a2");
				});
		
				$(".bgDiv").trigger("hover");
			}else{
				$(".bgDiv").one("hover", function() {
					$(".bgDiv").css("background", "white");
				});
				 
				$(".bgDiv").trigger("hover");
			}
			
			if($(window).scrollTop() <= 400){
				$("#a-first").one("hover", function() {
					$("#a-first .line-w").css("width", "70px");
					$("#a-first .line-h").css("height", "70px");
				});
				
				$("#a-first").trigger("hover");
			}
			
			var ts = ($(window).scrollTop() - 300) / 5;
			var ts2 = (2600 - $(window).scrollTop()) / 5;
			if(ts2 <= 0){
				ts2 = 0;
			}
			if(ts >= 400){
				ts = 100;
				$("#a-second").one("hover", function() {
					$("#square-2").html("");
					$("#a-second .line-w").css("width", "0");
					$("#a-second .line-h").css("height", "0");
					$("#square-2").html("<span class='line-w line-top'></span><span class='line-h line-right'></span><span class='line-w line-bottom'></span><span class='line-h line-left'></span>");
				});
				
				$("#a-second").trigger("hover");
				$("#a-second").css("visibility", "hidden");
			}else if(ts >= 350){
				ts = 100;
				$("#a-second").css("visibility", "visible");
				
				$("#a-second").one("hover", function() {
					$("#a-second .line-w").css("width", "180px");
					$("#a-second .line-h").css("height", "180px");
					$("#a-second .line-right").css("height", "100px");
				});
				
				$("#a-second").trigger("hover");
			}else if(ts >= 100){
				ts = 100;
				
				//$("#a-second").css("position", "fixed");
				
				$("#square-1").html("");
				$("#a-first .line-w").css("width", "0");
				$("#a-first .line-h").css("height", "0");
				$("#square-1").html("<span class='line-w line-top'></span><span class='line-h line-right'></span><span class='line-w line-bottom'></span><span class='line-h line-left'></span>");
			}else if(ts >= 80){
				
				$("#a-second").css("visibility", "visible");
				
				$("#a-second").one("hover", function() {
					$("#a-second .line-w").css("width", "180px");
					$("#a-second .line-h").css("height", "180px");
					$("#a-second .line-right").css("height", "100px");
				});
				
				$("#a-second").trigger("hover");
				
			}else if(ts <= 79){
				$("#a-second").one("hover", function() {
					$("#square-2").html("");
					$("#a-second .line-w").css("width", "0");
					$("#a-second .line-h").css("height", "0");
					$("#square-2").html("<span class='line-w line-top'></span><span class='line-h line-right'></span><span class='line-w line-bottom'></span><span class='line-h line-left'></span>");
				});
				
				$("#a-second").trigger("hover");
				$("#a-second").css("visibility", "hidden");
			}
			
			$("#box_mask_top").css("transform", "translateX("+ts+"%)");
			$("#box_mask_right").css("transform", "translateY(-"+ts+"%)");
			
			$("#box_mask2_bottom").css("transform", "translateX("+ts2+"%)");
			$("#box_mask2_right").css("transform", "translateY("+ts2+"%)");
			
		}
	});
	
});

</script>

<div class="full-container">
	<div id="admin-mungstar-1">
		<video autoplay loop>
			<source src="<%=cp%>/resource/vidio/main_vidio.mp4">
		</video>

		<a href="" id="a-first">
			<div class="btn_more2">
				더보기&nbsp;<span class="glyphicon glyphicon-arrow-right"></span>
			</div>
			<span id="square-1" class="square">
				<span class="line-w line-top"></span>
				<span class="line-h line-right"></span>
				<span class="line-w line-bottom"></span>
				<span class="line-h line-left"></span>
			</span>
		</a>
	
	</div>

	<div id="admin-mungstar-2">
		<div class="box_scroll">
			<div class="box_mask">
            	<div id="box_mask_top" class="mask skrollable skrollable-between" data-300-top="transform: translateX(100%)" data-1000-top="transform: translateX(0%)" style="transform: translateX(0%);"></div>
                <div id="box_mask_right" class="mask skrollable skrollable-between" data-300-top="transform: translateY(-100%)" data-1000-top="transform: translateY(0%)" style="transform: translateY(-0%);"></div>
            </div>
            <div class="box_mask type2">
			    <div id="box_mask2_bottom" class="mask skrollable skrollable-before" data--200-top="transform: translateX(100%)" data--1500-top="transform: translateX(0%)" style="transform: translateX(100%);"></div>
			    <div  id="box_mask2_right" class="mask skrollable skrollable-before" data--200-top="transform: translateY(100%)" data--1500-top="transform: translateY(0%)" style="transform: translateY(100%);"></div>
			</div>
			<div class="box_cover">
				<div class="box_img" style="background: url(http://images.cj.net/upfiles/main_theme/0000005736960006425453887.jpg) fixed 50% 0; background-size: cover;"></div>
			</div>
			<div class="box_cover over" style="height: 949px;">
				<div class="box_img2"
					style="background: url(http://images.cj.net/upfiles/main_theme/0000005736960006425899013.jpg) fixed 50% 0; background-size: cover;">
					<div class="dim skrollable skrollable-before"
						data-500-top="opacity:0" data-200-top="opacity:1"
						style="opacity: 0;"></div>
				</div>
			</div>
		</div>
		
		<div id="a-second">
			<div class="btn_more2">
				<span class="span-title">펫<sub>#</sub></span>
			</div>
			<span id="square-2" class="square"></span>
		</div>

		<div class="box_title">
			<ul class="list_magazine">

				<li class="list_type list_1 skrollable skrollable-between"
					data-600-top="margin-top:100px" data-400-top="margin-top:0px"
					style="margin-top: 14.5px; height: 90px;">
					<!-- 180306 ComingSoon 처리 --> <a href="./thema/view.asp?ai_seq=45">
						<div class="box_thumb">
							<span class="no">No.01</span> <span class="img_thumb"><img
								src="http://images.cj.net/upfiles/main_theme/0000005736960006429916743.1_204x128.jpg"
								alt="LIVE NEW,<br>세상의 새로움이 되다"></span>
						</div>
				</a>
				<div class="box_info">
						<a href="./thema/view.asp?ai_seq=45">
							<p class="tit">
								LIVE NEW,<br>세상의 새로움이 되다
							</p>
						</a><a href="./thema/view.asp?ai_seq=45" class="btn_more2">더보기<span
							class="btn_iconPack icon_go"></span></a>
					</div> <!-- 180306 ComingSoon 처리 -->
				</li>

				<li class="list_type list_2 skrollable skrollable-between"
					data-700-top="margin-top:100px" data-300-top="margin-top:0px"
					style="margin-top: 69.25px; height: 120px;">
					<!-- 180306 ComingSoon 처리 --> <a href="./thema/view.asp?ai_seq=46">
						<div class="box_thumb">
							<span class="no">No.02</span> <span class="img_thumb"><img
								src="http://images.cj.net/upfiles/main_theme/0000005744736006846786082.2_144x192.jpg"
								alt="어쩌다 어른의 김상중,<br>인생은 도전의<br>연속이죠!"></span>
						</div>
				</a>
				<div class="box_info">
						<a href="./thema/view.asp?ai_seq=46">
							<p class="tit">
								어쩌다 어른의 김상중,<br>인생은 도전의<br>연속이죠!
							</p>
						</a><a href="./thema/view.asp?ai_seq=46" class="btn_more2">더보기<span
							class="btn_iconPack icon_go"></span></a>
					</div> <!-- 180306 ComingSoon 처리 -->
				</li>

				<li class="list_type list_3 skrollable skrollable-before"
					data-800-top="margin-top:100px" data-600-top="margin-top:0px"
					style="margin-top: 100px;">
					<!-- 180306 ComingSoon 처리 --> <a href="./thema/view.asp?ai_seq=47">
						<div class="box_thumb">
							<span class="no">No.03</span> <span class="img_thumb"><img
								src="http://images.cj.net/upfiles/main_theme/0000005747328005751804700.3_144x192.jpg"
								alt="CJ 직딩썰,<br>1년차 vs. 3년차<br>CJ人이 말하는<br>진짜 CJ의 모습"></span>
						</div>
				</a>
				<div class="box_info">
						<a href="./thema/view.asp?ai_seq=47">
							<p class="tit">
								CJ 직딩썰,<br>1년차 vs. 3년차<br>CJ人이 말하는<br>진짜 CJ의 모습
							</p>
						</a><a href="./thema/view.asp?ai_seq=47" class="btn_more2">더보기<span
							class="btn_iconPack icon_go"></span></a>
					</div> <!-- 180306 ComingSoon 처리 -->
				</li>

			</ul>
		</div>

	</div>
	
	<div id="admin-mungstar-3">
		<img src="<%=cp %>/resource/img/mungstar/mungstar.png">
	</div>
	
	<div class="bgDiv"></div>
	
</div>
