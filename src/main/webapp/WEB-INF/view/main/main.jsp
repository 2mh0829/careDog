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
	position: relative;
	top: -400px;
	width: 100%;
	height: 3500px;
	background: white;
	-webkit-transition: 1s;
	transition: 1s;
}

.go-top {
	position: fixed;
	right: 0;
	bottom: 0;
	z-index: 500;
}

.go-top .btn {
	width: 50px;
	height: 50px;
	background: black;
	color: white;
	border: none;
	outline: none;
}

.go-top .btn:active, .go-top .btn:focus {
	outline: none;
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

#a-second .span-title sub {
	margin-left: -3px;
	bottom: -.4em;
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
	top: 900px;
}

.now_list {
	position: absolute;
	top: 400px;
	width: 960px;
	left: 50%;
	margin-left: -480px;
	z-index: 10;
}

.list_thumb {
	position: relative;
	zoom: 1;
	margin-left: -16px;
}

.list_thumb li {
	width: 25%;
	vertical-align: top;
	float: left;
	position: relative;
	-webkit-transition: margin-top 2s;
	transition: margin-top 2s;
}

.list_poster .box_thumb {
	padding-top: 0 !important;
	border: 0;
}

.img_thumb {
	height: 100%;
	position: relative;
}

.box_title.txt_thumb_type {
	position: absolute;
	top: 20px;
	left: 16px;
	right: 16px;
	z-index: 2;
	color: white;
}

.box_title .tit {
	display: block;
	padding-bottom: 10px;
}

.txt_thumb .txt_explain {
	display: table;
	width: 100%;
	position: relative;
	top: -100px;
}

.txt_explain .info {
	display: block;
	display: -webkit-box;
	position: relative;
	margin-left: 10px;
	overflow: hidden;
	width: 90%;
	height: 56px;
	font-size: 20px;
	line-height: 28px;
	text-overflow: ellipsis;
	word-wrap: break-word;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.txt_tag {
	overflow: hidden;
	height: 28px;
	margin-top: 15px;
	position: relative;
	top: -115px;
	left: 10px;
}

/* ------------------------------------------------- */
#admin-mungstar-4 {
	position: relative;
	z-index: 5;
	top: 1500px;
	width: 100%;
}

#plain-area {
	width: 100%;
	overflow: hidden;
}

#admin-mungstar-4 .plain {
	margin-left: 1000px;
	-webkit-transition: margin-left 10s linear;
	transition: margin-left 10s linear;
}

/* --------------------------------------------------- */
#admin-mungstar-5 {
	position: relative;
	z-index: 5;
	top: 1900px;
	width: 100%;
}

#admin-mungstar-5 #stray-img {
	width: 100%;
	-webkit-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0);
}

.box_explain {
	position: relative;
	top: -80px;
	left: 0;
	color: #fff;
}

.box_explain .line11 {
	width: 80px;
	height: 4px;
	background: white;
	display: block;
	margin-bottom: 50px;
}

.box_explain .subject {
	margin-top: 50px;
}

.list_type.cgv {
	position: absolute;
	display: inline-block;
	left: 50%;
	top: 135px;
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
			if($(window).scrollTop() >= 4800){
				$(".bgDiv").one("hover", function() {
					$(".bgDiv").css("background", "white");
				});
				$(".bgDiv").trigger("hover");
			}else if($(window).scrollTop() >= 4600){
				$(".bgDiv").one("hover", function() {
					$(".bgDiv").css("background", "#5f84bd");
				});
				$(".bgDiv").trigger("hover");
			}else if($(window).scrollTop() >= 4200){
				$(".plain").css("transition", "margin-left .1s");
				$(".plain").one("hover", function() {
					$(".plain").css("margin-left", "1000px");
				});
				$(".plain").trigger("hover");
			}else if($(window).scrollTop() >= 3900){
				$(".plain").css("transition", "margin-left 10s linear");
				$(".plain").css("-webkit-transition", "margin-left 10s linear");
				$(".plain").one("hover", function() {
					$(".plain").css("margin-left", "-1000px");
				});
				$(".plain").trigger("hover");
			}else if($(window).scrollTop() >= 3800){
				$(".bgDiv").one("hover", function() {
					$(".bgDiv").css("background", "#5f84bd");
				});
				$(".bgDiv").trigger("hover");
			}else if($(window).scrollTop() >= 3100){
				$(".plain").css("transition", "margin-left 10s linear");
				$(".plain").css("-webkit-transition", "margin-left 10s linear");
				$(".plain").one("hover", function() {
					$(".plain").css("margin-left", "-1000px");
				});
				$(".plain").trigger("hover");	
			}else if($(window).scrollTop() >= 2800){
				$(".bgDiv").one("hover", function() {
					$(".bgDiv").css("background", "#b386c2");
				});
				$(".bgDiv").trigger("hover");
			}else if($(window).scrollTop() >= 2500){
				$(".plain").css("transition", "margin-left .1s");
				$(".plain").one("hover", function() {
					$(".plain").css("margin-left", "1000px");
				});
				$(".plain").trigger("hover");
				
				$(".list_thumb li:eq(0)").css("transition", "margin-top .8s ease-in-out 0.1s");
				$(".list_thumb li:eq(1)").css("transition", "margin-top .8s ease-out 0.6s");
				$(".list_thumb li:eq(2)").css("transition", "margin-top .8s ease-in-out 0.2s");
				$(".list_thumb li:eq(3)").css("transition", "margin-top .8s ease-out 0.4s");
				
				$(".list_thumb li").one("hover", function() {
					$(".list_thumb li:eq(0)").css("margin-top", "0");
					$(".list_thumb li:eq(1)").css("margin-top", "60px");
					$(".list_thumb li:eq(2)").css("margin-top", "0");
					$(".list_thumb li:eq(3)").css("margin-top", "60px");
				});
				$(".list_thumb li").trigger("hover");
				
				$(".bgDiv").one("hover", function() {
					$(".bgDiv").css("background", "white");
				});
				$(".bgDiv").trigger("hover");
			}else{
				
				$(".list_thumb li").one("hover", function() {
					$(".list_thumb li:eq(0)").css("margin-top", "500px");
					$(".list_thumb li:eq(1)").css("margin-top", "500px");
					$(".list_thumb li:eq(2)").css("margin-top", "500px");
					$(".list_thumb li:eq(3)").css("margin-top", "500px");
				});
				$(".list_thumb li").trigger("hover");
				
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
			var ts3 = ($(window).scrollTop() - 3900) / 500;
			if(ts3 >= 1)
				ts3 = 1;
			
			if($(window).scrollTop() >= 3900){
				$("#admin-mungstar-5 #stray-img").css("transform", "scale("+ts3+")");
			}else if(ts >= 400){
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
			<div id="t1" class="box_cover over" style="height: 949px;">
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
				<span class="span-title">멍<sub>★</sub></span>
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
		<div align="center">
			<img src="<%=cp %>/resource/img/store/dog_bener.jpg" width="1200">
		</div>

		<div class="mod_thumb mod_poster poster_type col_4 now_list">
			<ul class="list_thumb list_poster">
				<!-- list_poster -->

				<li class="list_type skrollable skrollable-after"
					data-1000-top="margin-top:300px" data-650-top="margin-top:0px"
					style="margin-top: 500px;">
					<div class="box_thumb box_thumb_style">
						<!-- [d] : now 스타일 -->
						<div class="img_thumb box_poster">
							<!-- box_poster -->
							<a href="./cj_now/view.asp?bs_seq=13866&amp;schBsTp=3">
								<div class="img_box">

									<img
										src="http://images.cj.net/upfiles/bbs/0000005742144004935937696.jpg"
										alt="">

									<div class="dim"></div>
								</div>
							</a>
						</div>
						<div class="box_title txt_thumb_type">
							<!--div class="date"></div-->
							<!-- 2017.12.05 -->
							<strong class="tit">사회공헌활동</strong>
						</div>
						<div class="txt_thumb txt_thumb_type">
							<div>
								<div class="txt_explain">
									<p class="info">
										<a href="./cj_now/view.asp?bs_seq=13866&amp;schBsTp=3">CJ대한통운,
											택배기사 자녀 위해 학자금 35억원 지원</a>
									</p>
								</div>

								<p class="txt_tag">
									<span><a href="/search/hash_search.asp?schTxt=CJ대한통운">#CJ대한통운</a></span>
								</p>

							</div>
						</div>
					</div>
				</li>

				<li class="list_type skrollable skrollable-between"
					data-1000-top="margin-top:500px" data-500-top="margin-top:0px"
					style="margin-top: 500px;">
					<div class="box_thumb box_thumb_style">
						<!-- [d] : now 스타일 -->
						<div class="img_thumb box_poster">
							<!-- box_poster -->
							<a href="./cj_now/view.asp?bs_seq=13845&amp;schBsTp=1">
								<div class="img_box">

									<img
										src="http://images.cj.net/upfiles/bbs/0000005711904005159333619.jpg"
										alt="">

									<div class="dim"></div>
								</div>
							</a>
						</div>
						<div class="box_title txt_thumb_type">
							<!--div class="date"></div-->
							<!-- 2017.12.05 -->
							<strong class="tit">뉴스</strong>
						</div>
						<div class="txt_thumb txt_thumb_type">
							<div>
								<div class="txt_explain">
									<p class="info">
										<a href="./cj_now/view.asp?bs_seq=13845&amp;schBsTp=1">CJ
											CGV, 터키서 월 4백만 관객 돌파... 진출 ...</a>
									</p>
								</div>

								<p class="txt_tag">
									<span><a href="/search/hash_search.asp?schTxt=CJCGV">#CJCGV</a></span>
								</p>

							</div>
						</div>
					</div>
				</li>

				<li class="list_type skrollable skrollable-after"
					data-1000-top="margin-top:500px" data-700-top="margin-top:0px"
					style="margin-top: 500px;">
					<div class="box_thumb box_thumb_style">
						<!-- [d] : now 스타일 -->
						<div class="img_thumb box_poster">
							<!-- box_poster -->
							<a href="./cj_now/view.asp?bs_seq=13867&amp;schBsTp=2">
								<div class="img_box">

									<img
										src="http://images.cj.net/upfiles/bbs/0000005744736005730859949.jpg"
										alt="">

									<div class="dim"></div>
								</div>
							</a>
						</div>
						<div class="box_title txt_thumb_type">
							<!--div class="date"></div-->
							<!-- 2017.12.05 -->
							<strong class="tit">포커스</strong>
						</div>
						<div class="txt_thumb txt_thumb_type">
							<div>
								<div class="txt_explain">
									<p class="info">
										<a href="./cj_now/view.asp?bs_seq=13867&amp;schBsTp=2">코덕과
											셀럽, 인플루언서, 뷰티 브랜드가 한 자리에? ...</a>
									</p>
								</div>

								<p class="txt_tag">
									<span><a href="/search/hash_search.asp?schTxt=CJ그룹">#CJ그룹</a></span><span><a
										href="/search/hash_search.asp?schTxt=겟잇뷰티">#겟잇뷰티</a></span>
								</p>

							</div>
						</div>
					</div>
				</li>

				<li class="list_type skrollable skrollable-between"
					data-1000-top="margin-top:500px" data-600-top="margin-top:0px"
					style="margin-top: 500px;">
					<div class="box_thumb box_thumb_style">
						<!-- [d] : now 스타일 -->
						<div class="img_thumb box_poster">
							<!-- box_poster -->
							<a href="./cj_now/view.asp?bs_seq=13872&amp;schBsTp=3">
								<div class="img_box">

									<img
										src="http://images.cj.net/upfiles/bbs/0000005748192004155956832.jpg"
										alt="">

									<div class="dim"></div>
								</div>
							</a>
						</div>
						<div class="box_title txt_thumb_type">
							<!--div class="date"></div-->
							<!-- 2017.12.05 -->
							<strong class="tit">사회공헌활동</strong>
						</div>
						<div class="txt_thumb txt_thumb_type">
							<div>
								<div class="txt_explain">
									<p class="info">
										<a href="./cj_now/view.asp?bs_seq=13872&amp;schBsTp=3">CJ나눔재단,
											‘CJ도너스캠프 창의학교' 문 열어</a>
									</p>
								</div>

								<p class="txt_tag">
									<span><a href="/search/hash_search.asp?schTxt=CJ그룹">#CJ그룹</a></span><span><a
										href="/search/hash_search.asp?schTxt=CJ나눔재단">#CJ나눔재단</a></span>
								</p>

							</div>
						</div>
					</div>
				</li>

			</ul>
		</div>

	</div>
	
	<div id="admin-mungstar-4">
		
		<div style="position: absolute; top: -100px; left: 400px;"><img src="http://images.cj.net/images/index/main_csv_deco_08.png"></div>
		<div style="position: absolute; top: 150px; left: 250px;"><img src="http://images.cj.net/images/index/main_csv_deco_07.png"></div>
		<div style="position: absolute; top: -200px; left: 1150px;"><img src="http://images.cj.net/images/index/main_csv_deco_06.png"></div>
		<div style="position: absolute; top: -20px; left: 850px;"><img src="http://images.cj.net/images/index/main_csv_deco_05.png"></div>
		<div style="position: absolute; top: 250px; left: 600px;"><img src="http://images.cj.net/images/index/main_csv_deco_04.png"></div>
		<div style="position: absolute; top: 200px; left: 650px;"><img src="http://images.cj.net/images/index/main_csv_deco_03.png"></div>
		<div style="position: absolute; top: 150px; left: 50px;"><img src="http://images.cj.net/images/index/main_csv_deco_02.png"></div>
		<div style="position: absolute; top: 200px; left: 1200px;"><img src="http://images.cj.net/images/index/main_csv_deco_01.png"></div>
			
		<div id="plain-area"><img class="plain" src="<%=cp %>/resource/img/store/plain.png"></div>
	</div>
	
	<div id="admin-mungstar-5">
		<div align="center">
			<img id="stray-img" src="<%=cp %>/resource/img/strayDog/stray-dog.png">
		</div>

		<div class="list_type cgv skrollable skrollable-after" data-800-top="top:600px" data-600-top="top:135px" style="top: 450px; margin-left: -350px;">
			<div class="box_img3">
				<a href="/cj_now/view.asp?bs_seq=13863">
					<img src="http://images.cj.net/upfiles/main_tsmm_brand/0000005737824006544571415.png"
						alt="놀러오락! 오락 전문 채널" width="350px;">
				</a>
			</div>
			<div class="box_explain">
				<span class="line11"></span>
				<span class="subject">놀러오락! 오락 전문 채널</span><span class="explain"><br></span>
			</div>
		</div>
		
		<div class="list_type cgv skrollable skrollable-after" data-800-top="top:600px" data-600-top="top:135px" style="top:350px; margin-left: 200px;">
			<div class="box_img3">
				<a href="/cj_now/view.asp?bs_seq=13863">
					<img src="http://images.cj.net/upfiles/main_tsmm_brand/0000005737824006544571415.png"
						alt="놀러오락! 오락 전문 채널" width="350px;">
				</a>
			</div>
			<div class="box_explain">
				<span class="line11"></span>
				<span class="subject">놀러오락! 오락 전문 채널</span><span class="explain"><br></span>
			</div>
		</div>

	</div>

	<div class="bgDiv"></div>
	
	<div class="go-top"><button id="MOVE_TOP_BTN" class="btn">next</button></div>
	
</div>

<script>
	$(function() {
		$("#MOVE_TOP_BTN").click(
				function() {
					var st = 0;
					var t1 = $("#t1").offset();
					var t2 = $("#admin-mungstar-3").offset();
					var t4 = $("#admin-mungstar-5").offset();
					console.log(t1.top);

					if ($(window).scrollTop() < t1.top - 1) {
						st = t1.top;
					} else if ($(window).scrollTop() >= t1.top - 1
							&& $(window).scrollTop() < t2.top - 1) {
						st = t2.top;
					} else if ($(window).scrollTop() >= t2.top - 1
							&& $(window).scrollTop() < 3600) {
						st = 3600;
					} else if ($(window).scrollTop() >= 3600
							&& $(window).scrollTop() < t4.top - 1) {
						st = t4.top;
					} else {
						st = 0;
					}
					$('html, body').animate({
						scrollTop : st
					}, 2000);
					return false;
				});

		$(window).scroll(function() {
			if ($(window).scrollTop() < 4200) {
				$("#MOVE_TOP_BTN").text("next");
			} else {
				$("#MOVE_TOP_BTN").text("top");
			}
		});

	});
</script>


