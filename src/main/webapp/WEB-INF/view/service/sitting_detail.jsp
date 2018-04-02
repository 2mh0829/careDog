<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="http://slidesjs.com/js/jquery.slides.min.js"></script>
<script>
$(document).ready(function(){
	$(function(){
	    $("#left-datepicker").datepicker({
	    	dateFormat: "yy-mm-dd",
	    	showAnim: "slideDown",
	    	showMonthAfterYear: true,
	    	yearSuffix: '년',
	    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	    	minDate: 0
	    });
	
	    $("#right-datepicker").datepicker({
	    	dateFormat: "yy-mm-dd",
	    	showAnim: "slideDown",
	    	showMonthAfterYear: true,
	    	yearSuffix: '년',
	    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	    	minDate: 0
	    });
	
	    $("#datepicker").datepicker({
	    	dateFormat: "yy-mm-dd",
	    	showAnim: "slideDown",
	    	showMonthAfterYear: true,
	    	yearSuffix: '년',
	    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	    	minDate: 0,
	    	autoSize: true
	    });
	});

	$(function(){
	    $("#slides").slidesjs({
	      width: 623,
	      height: 455,
	      navigation : {
	    	  active : false,
	    	  effect : "slide"
	     }
	    });
	});
	
	$(function(){
		$('body').on('click','#addPetUp',function(){
			var oneDayPrice = $('.pet-add-price').text();
			oneDayPrice = oneDayPrice*2;
			$('.pet-add-price').html(oneDayPrice);
		})
		
		$('body').on('click','#addPetDown',function(){
			var oneDayPrice = $('.pet-add-price').text();
			oneDayPrice = oneDayPrice/2;
			$('.pet-add-price').html(oneDayPrice);
			
		})
		
		$('body').on('click','.btn',function(){
			var oneDayPrice = parseInt($('.oneDayPrice').text());
			var petAddPrice = parseInt($('.pet-add-price').text());
			var added = ((oneDayPrice + petAddPrice) * 1/10);
			var tot = oneDayPrice + petAddPrice + added;
			tot = Math.floor(tot/10)*10;
			
			$('.price-tot').html(tot);
		});
		
		$(function(){
		var oneDayPrice = parseInt($('.oneDayPrice').text());
		var petAddPrice = parseInt($('.pet-add-price').text());
		var added = ((oneDayPrice + petAddPrice) * 1/10);
		var tot = oneDayPrice + petAddPrice + added;
		tot = Math.floor(tot/10)*10;
		
		$('.price-tot').html(tot);
		})
	});
});
</script>


<style>

.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: red; }

.main-middle-inner .ui-datepicker {
	width: 335px;
	height: 190px;
	
}

#datepicker {
	display: inline-block;
	float: right;
	font-size: 12px;
}

li{
	list-style-type: none;
}

.main-top {
	padding-bottom: 6px;
	/* border: 1px solid blue; */
	height: 495px;
}

.main-top-slider {
	width: 623px;
	height: 455px;
	margin-right: 30px;
	float: left;
	border: 1px solid #ffb861;
}

.main-photos {
	/* border: 1px solid black; */
	height: 310px;
	
}

.main-photos img {
	width: 100%;
	height: 100%;
	padding-right: 9px;
}

.photo-array {
	/* border: 1px solid blue; */
	margin-top: 10px;
}

.photo-array img{
	position: relative;
}

/* .photo-array li {
	margin-left: 5px; 
} */

.array-small {
    display: inline;
    width: 33.3333%;
    float: left;
    padding-right: 7px;
}

.array-small img {
	width: 201px;
	height: 134px;
}

.main-top-detail {
	width: 335px;
    float: right;
    height: 455px;
    /* z-index: 97; */
    border: 1px solid #ffb861;
}

.main-detail {
	margin-bottom: 20px;
    padding: 15px;
    /* border: 1px solid #cccccc; */
}

.titleWord{
	text-align: center;
	margin-bottom: 10px;
	
}

.reser-date input {
	width: 90px;
	text-align: center;
}

.reser-date dd {
	margin-left: 30px;
}

.price {
	margin-top: 10px;
	padding-left: 45px;
}

.won {
	font-size: 180%;
    font-weight: bold;
    color: orange;
    margin-top: 15px;
}

.weight {
    width: 100px;
    height: 30px;
    border-radius: 4px;
    border: 1px solid #ccc;
    background: white;
}

.pet-add {
	padding-left: 40px;
    padding-top: 12px;
}

.add-price {
	color: orange;
}

.price-detail dt {
    float: left;
    width: 60%;
    padding: 3px 0 3px 5px;
    border-top: 1px solid #F0F0F0;
    line-height: 200%;
    font-weight: normal;
}

.price-detail dd {
    margin-right: 5px;
    text-align: right;
    width: 38%;
    margin-left: 60%;
    padding: 3px 5px 6px 0;
    border-top: 1px solid #F0F0F0;
    line-height: 200%;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.btnRequire {
	background-color:#44c767;
	-moz-border-radius:4px;
	-webkit-border-radius:4px;
	border-radius:4px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding: 15px 116px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
	float: left;
}
.btnRequire:hover {
	background-color:#5cbf2a;
}
.btnRequire:active {
	position:relative;
	top:1px;
}

.reserQA {
	margin-left: 90px;
}

.main-middle-inner {
	/* border: 1px solid black; */
}

.price-tot {
	font-weight: bold;
}

.price-tot-text {
	font-weight: bold;
}

.sitter-face {
    display: inline-block;
    width: 80px;
    height: 80px;
    border-radius: 50%;
    border: 1px solid #ccc;
}

.row {
	border: 1px solid #ffb861;
	/* border: 1px solid blue; */
	margin-left: 1px;
    /* margin-right: auto; */
    width: 621px;
    /* padding: 40px 0; */
    height: 190px;
    display: inline-block;
}

.row img {
	width: 90px;
	height: 80px;
	/* margin-top: 35px; */
}

.inner {
	/* border: 1px solid red; */
	/* height: 600px; */
}

.row .carryAble {
	margin-left: 5px;
	margin-right: 15px;
    top: 40px;
    position: relative;
    width: 202px;
    /* border: 1px solid black; */
    display: inline-block;
}

.row .carryAble-time {
	margin-left: 17px;
	margin-right: 5px;
    top: 30px;
    position: relative;
    width: 180px;
    /* border: 1px solid black; */
    display: inline-block;
}

.row dt {
	margin-bottom: 10px;
}

.row dd {
	margin-bottom: 5px;
}

.environment {
	padding-top: 40px;
}

.environment h3 {
	margin-bottom: 15px;
    color: #18ab29;
    font-size: 18px;
    font-weight: bold;
}

.row-environment {
	border: 1px solid black;
}

.main-middle-environ {
	/* padding: 40px 0; */
    /* border: 1px solid #dcdcdc; */
    /* border: 1px solid; */
    width: 623px;
    height: 190px;
    display: inline-block;
    margin-top: 40px;
}

/*.environ-area {
	border: 1px solid;
	width: 50%;
}*/

 .environ-title img {
	width: 20px;
	height: 20px;
}

.environ-title dt {
	width: 45%;
	border-bottom: 1px solid #cccccc;
	height: 40px;
	line-height: 2.5;
}

.environ-title dd {
	width: 55%;
	border-bottom: 1px solid #cccccc;
	height: 40px;
	line-height: 2.5;
   
}

.environ-area-left {
	float: left;
	/* border: 1px solid; */
	width: 50%;
	height: 133px;
}

.environ-area-right {
	float:right;
	/* border:1px solid blue; */
	width: 50%;
	height: 133px;
}

.area-name {
	padding-left: 12px;
}

.environ-text {
	float: right;
	margin-right: 15px;
}

.colored {
	background-color: #f0f0f0;
}

.sitter-information {
	border: 1px solid;
}

.sitter-infor {
	/* border: 1px solid #cccccc; */
    /* display: inline-block; */
    height: 190px;
    width: 335px;
    float: right;
    margin-top: 40px;
}

.sitter-face {
	display: inline-block;
	width: 70px;
    height: 70px;
    border-radius: 50%;
    border: 1px solid #ccc;
}

.sitter {
	border-bottom:1px solid #cccccc;
	margin-top: 10px;
	margin-left: 10px;
	width: 310px;
}

.sitter-name {
	padding-left: 30px;
	font-size: 20px;
    font-weight: 500;
   /*  float: right; */
    
}

.sitter i {
	float: right;
	/* padding-bottom: 20px; */
	top: -15px;
}

.dog-name {
	padding-left: 30px;
	font-size: 20px;
    font-weight: 500;
}

.dog-info {
	font-size: 15px;
    font-weight: 500;
    float: right;
    margin-top: 40px;
}

.customer-rating {
	border: 1px solid #ccc;
	margin-top: 40px;
}

.main-middle-environ h3 {
	margin-left: 12px;
}

.hi {
	border: 1px solid orange;
	height: 150px;
    margin-top: 60px;
}

.hi-sitter {
	font-size: 18px;
    padding-bottom: 10px;
    margin: 12px;
    border-bottom: 1px solid #ccc;
}

.hi-body {
	padding: 12px;
}

#slides {
	display : none;
}

.slides-btn-left {
	position: relative; 
	top:-50px; 
	font-size: 30px;
	z-index:100;
	color: white;
	left : 10px;
}

.slides-btn-right {
	position: relative;
    top: -50px;
    left: 540px;
    font-size: 30px;
    z-index: 100;
    color: white;
}

#slides img{
	width : 100%;
	height : 100%;
}

</style>

<div class="body-container">
	<div class="main-top">
		<div class="main-top-slider" id="slides">
			<c:forEach var="photo" items="${listPhoto}">
				<c:if test="${dto.sittingId == photo.sittingId}">
					<img src="<%=cp%>/uploads/service/${photo.imageFilename}">
				</c:if>
		    </c:forEach>
		    <a href="#" class="slides-btn-left slidesjs-previous slidesjs-navigation">
				<i class="glyphicon glyphicon-chevron-left"></i>
			</a>
			<a href="#" class="slides-btn-right slidesjs-next slidesjs-navigation">
				<i class="glyphicon glyphicon-chevron-right"></i>
			</a>
			<!-- <div class="main-photos">
				<img src="http://cfile6.uf.tistory.com/image/2544613F51CF074D104D69">
			</div>
			<ul class="photo-array">
				<li class="array-small">
					<img src="http://cfile4.uf.tistory.com/image/0148133F51CF074F0EE545">
				</li>
				<li class="array-small">
					<img src="http://cfile6.uf.tistory.com/image/233B073F51CF075D14D7CA">
				</li>
				<li class="array-small">
					<img src="http://cfile25.uf.tistory.com/original/1528E9114BA1CECF492663">
				</li>
			</ul> -->
		</div>
		<div class="main-top-detail">
			<form class="main-detail">
				<div class="reser-date">
					<dl>
						<dt class="titleWord">예약일을 알려주세요!</dt>
						<dd>
							<i class="glyphicon glyphicon-calendar"></i>
							<input type="text" id="left-datepicker" placeholder="시작 날짜">
							<span>></span>
							<i class="glyphicon glyphicon-calendar"></i>
							<input type="text" id="right-datepicker" placeholder="마침 날짜">
						</dd>
						<dd class="price">
							하루
							<span class="won">${dto.reserCost}원</span>
							<div class="dropdown">
							<!-- <button type="button" class="weight" data-toggle="dropdown">
								15kg 미만 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="weightDD">
								<li><a href="#">15kg 미만</a></li>
								<li><a href="#">15kg 이상</a></li>
							</ul> -->
							</div>
						</dd>
						<dd class="pet-add">
							반려견 추가당 
							<span class="add-price">${dto.addPetCost}원</span>
						</dd>
					</dl>
					<dl class="price-detail">
						<dt>
							<c:if test="${dto.reserDiv==1}">24시간</c:if>
							<c:if test="${dto.reserDiv==2}">데이케어</c:if>
						</dt>
						<dd>
							<span class="oneDayPrice">${dto.reserCost}원</span>
						</dd>
						<dt>
							반려견 추가
							<div class="btn-group">
								<button type="button" class="btn" id="addPetUp">
									<i class="glyphicon glyphicon-plus"></i>
								</button>
								<button type="button" class="btn" id="addPetDown">
									<i class="glyphicon glyphicon-minus"></i>
								</button>
							</div>
						</dt>
						<dd>
							<span class="pet-add-price">${dto.addPetCost}</span>원
						</dd>
						<dt>
							부가세
						</dt>
						<dd>
							<span class="oneDayPrice">10%</span>
						</dd>
						<dt>
							<span class="price-tot-text">합계</span>
						</dt>
						<dd class="">
							<span class="price-tot"></span>
							<strong>원</strong>
						</dd>
					</dl>
				</div>
				<button type="button" class="btnRequire">예약요청</button>
				<a href ="#" class="reserQA">
					<i class="glyphicon glyphicon-comment"></i>
				예약문의하기</a>
			</form>
		</div>
	</div>
	<div class="inner">
		<div class="main-middle-inner">
			<div class="row">
				<img src="<%=cp%>/resource/img/service/dogIcon.png">
				<dl class="carryAble">
					<dt>
						돌봄가능한 강아지 크기 & 나이
					</dt>
					<dd>
						<i class="glyphicon glyphicon-check"></i>
						1kg 부터 모두 가능합니다.
					</dd>
					<dd>
						<i class="glyphicon glyphicon-check"></i>
						<c:if test="${dto.reserDiv==1}">강아지 </c:if>
						<c:if test="${dto.reserDiv==2}">성견 </c:if>
						<c:if test="${dto.reserDiv==3}">노령견 </c:if>
						케어 가능합니다.
					</dd>
				</dl>
				<img src="<%=cp%>/resource/img/service/clock.png">
				<dl class="carryAble-time">
					<dt>
						데이케어 & 하루종일
					</dt>
					<dd>
						<i class="glyphicon glyphicon-check"></i>
						데이케어 : 9~6시
					</dd>
					<dd>
						<i class="glyphicon glyphicon-check"></i>
						하루종일 : 24시간
					</dd>
				</dl>
			</div>
			<div id="datepicker">
				
			</div>
		</div>
		<div class="main-middle-environ">
			<h3>돌봄 환경</h3>
			<div class="environ-area-left">
					<dl class="environ-title">
					<dt class="colored pull-left">
						<img src="<%=cp%>/resource/img/service/house.JPG">
						<label class="area-name">돌봄 공간</label>
					</dt>
					<dd class="colored pull-right">
						<label class="environ-text">${dto.space}</label>
					</dd>
					<dt class="pull-left">
						<img src="<%=cp%>/resource/img/service/subway.JPG">
						<label class="area-name">근처 지하철역</label>
					</dt>
					<dd class="pull-right">
						<label class="environ-text">${dto.subway}</label>
					</dd>
					<dt class="colored pull-left">
						<img src="<%=cp%>/resource/img/service/yard.JPG">
						<label class="area-name">마당 유무</label>
					</dt>
					<dd class="colored pull-right">
						<label class="environ-text">${dto.yard}</label>
					</dd>
			</div>
			<div class="environ-area-right">
				<dl class="environ-title">
				<dt class="colored pull-left">
					<img src="<%=cp%>/resource/img/service/baby.JPG">
					<label class="area-name">14세 미만 아동</label>
				</dt>
				<dd class="colored pull-right">
					<label class="environ-text">${dto.baby}</label>
				</dd>
				<dt class="pull-left">
					<img src="<%=cp%>/resource/img/service/family.JPG">
					<label class="area-name">가족 동거 유무</label>
				</dt>
				<dd class="pull-right">
					<label class="environ-text">${dto.family}</label>
				</dd>
				<dt class="colored pull-left">
					<img src="<%=cp%>/resource/img/service/cat.JPG">
					<label class="area-name">다른 동물 유무</label>
				</dt>
				<dd class="colored pull-right">
					<label class="environ-text">${dto.other}</label>
				</dd>	
				</dl>	
			</div>
		</div>
		<div class="sitter-infor">
			<label class="sitter">
				<img class="sitter-face" 
				src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_80%2Cw_300/MTE5NTU2MzE2MTk1NTU0ODI3/daniel-day-lewis-9268727-2-402.jpg">
				<label class="sitter-name">${dto.userName}</label>
					<i class="glyphicon glyphicon-map-marker">${dto.address1}</i>
			</label>
			<label class="sitter">
				<img class="sitter-face" 
				src="http://cfile5.uf.tistory.com/image/2737C53656F686912C5801">
				<label class="dog-name">검둥이<br></label>
				<label class="dog-info">말티즈, 남, 7세</label>
			</label>
		</div>
		<div class="hi">
			<div class="hi-header">
				<div class="hi-sitter"><span style="font-weight: bold;">${dto.userName}</span> 펫시터님의 한마디</div>
			</div>
			<div class="hi-body">
				${dto.content}
			</div>
		</div>
		<div class="customer-rating">
			<h1>후기</h1>
		</div>
	</div>
</div>


