<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script>
	$(function() {
		$("#left-datepicker").datepicker(
				{
					dateFormat : "yy-mm-dd",
					showAnim : "slideDown",
					showMonthAfterYear : true,
					yearSuffix : '년',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					minDate : 0
				});
	});

	$(function() {
		$("#right-datepicker").datepicker(
				{
					dateFormat : "yy-mm-dd",
					showAnim : "slideDown",
					showMonthAfterYear : true,
					yearSuffix : '년',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					minDate : 0
				});
	});

	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : "yy-mm-dd",
					showAnim : "slideDown",
					showMonthAfterYear : true,
					yearSuffix : '년',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					minDate : 0,
					autoSize : true
				});
	});
</script>

<style>
.main-middle-inner .ui-datepicker {
	width: 335px;
	height: 190px;
}

#datepicker {
	display: inline-block;
	float: right;
	font-size: 12px;
}

li {
	list-style-type: none;
}

.main-top {
	padding-bottom: 6px;
	/* border: 1px solid blue; */
	height: 495px;
}

.main-top-slider {
	/* width: 633px;
	margin-right: 30px;
	float: left;
	border: 1px solid red; */
}

.photo-array {
	/* border: 1px solid blue; */
	margin-top: 20px;
}

.photo-array img {
	position: relative;
}

/* .photo-array li {
	margin-left: 5px; 
} */
.array-small {
	width: 31.3333%;
    height: 133px;
    float: left;
    margin-right: 20px;
    border: 3px dotted black;
    margin-bottom: 80px;
}

/* .array-small img {
	width: 201px;
	height: 134px;
} */
.main-top-detail {
	width: 335px;
	/* float: right; */
	/* height: 300px; */
	/* z-index: 97; */
	border: 1px solid #ffb861;
	display: inline-block;
}

.main-detail {
	margin-bottom: 60px;
	padding: 15px;
	/* border: 1px solid #cccccc; */
	/* height: 430px; */
}

.titleWord {
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
	padding-left: 12px;
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
	height: 40px;
}

.price-detail dd {
	margin-right: 5px;
	text-align: right;
	width: 38%;
	margin-left: 60%;
	padding: 3px 5px 6px 0;
	border-top: 1px solid #F0F0F0;
	line-height: 200%;
	height: 40px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.btnRequire {
	background-color: #44c767;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	border: 1px solid #18ab29;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 17px;
	padding: 15px 133px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #2f6627;
	float: left;
}

.btnRequire:hover {
	background-color: #5cbf2a;
}

.btnRequire:active {
	position: relative;
	top: 1px;
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
	/* margin-left: 1px; */
	/* margin-right: auto; */
	width: 621px;
	/* padding: 40px 0; */
	height: 345px;
	float: right;
    margin-right: 20px;
	display: inline-block;
}

.row img {
	width: 90px;
	height: 80px;
	margin-left: 20px;
}

.inner {
	/* border: 1px solid red; */
	height: 600px;
	margin-top: 130px;
}

.row .carryAble {
	margin-left: 15px;
	margin-right: 15px;
	top: 40px;
	position: relative;
	/* width: 202px; */
	/* border: 1px solid black; */
	display: inline-block;
	margin-bottom: 60px;
}

.row .carryAble-time {
	margin-left: 17px;
	margin-right: 5px;
	top: 30px;
	position: relative;
	/* width: 180px; */
	/* border: 1px solid black; */
	display: inline-block;
}

.row dt {
	margin-bottom: 10px;
	font-size: 20px;
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
	float: right;
	/* border:1px solid blue; */
	width: 50%;
	height: 133px;
}

.area-name {
	padding-left: 12px;
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
	margin-right: 10px;
}

.sitter-face {
	display: inline-block;
	width: 70px;
	height: 70px;
	border-radius: 50%;
	border: 1px solid #ccc;
}

.sitter {
	border-bottom: 1px solid #cccccc;
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
	border: 1px solid;
	margin-top: 40px;
}

.main-middle-environ h3 {
	margin-left: 12px;
}

.sitter-title {
	height: 100px;
	/* border: 1px solid; */
	margin-bottom: 20px;
}

.sitter-title h1 {
	float: left;
	margin-left: 20px;
	margin-top: 30px;
}

.textTitle {
	margin-top: 30px;
	width: 800px;
	height: 44px;
	margin-left: 20px;
	font-size: 25px;
	/* border: 1px solid #ffb861; */
}

.inputBtn {
	border-radius: 4px;
	border: none;
	background: white;
	/* width: 120px; */
	/* margin-left: -10px; */
	margin-top: 2px;
	font-size: 15px;
}

.inputMoney {
	border: 1px solid #cccccc;
	/* margin-left: 30px; */
	margin-top: 2px;
	font-size: 15px;
	border-radius: 4px;
	color: #8f8f8f;
}

.input-title {
	font-size: 15px;
	line-height: 30px;
}

.input-title-tot {
	font-size: 15px;
	line-height: 30px;
	font-weight: bold;
}

.price-detail .dropdown-menu {
	/* left: -11px; */
}

.main-photos {
	border: 3px dotted black;
	height: 410px;
	width: 980px;
}

.main-photos img {
	width: 100%;
	height: 100%;
	padding-right: 9px;
}

.sub-photos {
	border: 3px solid;
    width: 330px;
    height: 330px;
    float: right;
}

.carable-text {
	border: 1px solid #cccccc;
    /* margin-left: 30px; */
    margin-top: 2px;
    font-size: 15px;
    border-radius: 4px;
    color: #8f8f8f;
}

.environ-text {
	text-align: center;
    border: none;
    background: none;
}

.btnSer {
	width: 120px;
    height: 34px;
    border-radius: 4px;
    border: 1px solid #ccc;
    background: white;
}

</style>

<div class="body-container">
	<div class="sitter-title">
		<h1>글 제목</h1>
		<input type="text" class="textTitle">
	</div>
	<div class="main-top">
		<div class="main-top-slider">
			<div class="main-photos"></div>
			<ul class="photo-array">
				<li class="array-small"></li>
				<li class="array-small"></li>
				<li class="array-small"></li>
			</ul>
		</div>
	</div>
	<div class="inner">
		<div class="main-middle-inner">
				<div class="main-top-detail">
			<form class="main-detail">
				<div class="reser-date">
					<dl>
						<dt class="titleWord">가능한 날짜를 선택해주세요!</dt>
						<dd>
							<i class="glyphicon glyphicon-calendar"></i> <input type="text"
								id="left-datepicker" placeholder="시작 날짜"> <span>></span>
							<i class="glyphicon glyphicon-calendar"></i> <input type="text"
								id="right-datepicker" placeholder="마침 날짜">
						</dd>
					</dl>
					<dl class="price-detail">
						<dt>
							<div class="dropdown">
								<button type="button" class="inputBtn" data-toggle="dropdown">
									<span id="">24시간 돌봄</span> <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">24시간 돌봄</a></li>
									<li><a href="#">데이케어</a></li>
								</ul>
							</div>
						</dt>
						<dd>
							<input type="text" class="inputMoney" value="입력하세요">원
							<!-- <span class="oneDayPrice">30,000원</span> -->
						</dd>
						<dt>
							<!-- <span class="input-title">반려견 추가비용</span> -->
							<!-- <div class="btn-group">
								 <button type="button" class="btn">
									<i class="glyphicon glyphicon-plus"></i>
								</button>
								<button type="button" class="btn">
									<i class="glyphicon glyphicon-minus"></i>
								</button>
							</div> -->
							<div class="dropdown">
								<button type="button" class="inputBtn" data-toggle="dropdown">
									<span id="">반려견 추가비용</span> <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">반려견 추가비용</a></li>
									<li><a href="#">반려견 추가 X</a></li>
								</ul>
							</div>
						</dt>
						<dd>
							<input type="text" class="inputMoney" value="입력하세요">원
						</dd>
						<dt>
							<span class="input-title">부가세</span>
						</dt>
						<dd>
							<span class="oneDayPrice">10%</span>
						</dd>
						<dt>
							<span class="input-title-tot">합계</span>
						</dt>
						<dd class="price-tot">
							<span class="">30,000원</span>
						</dd>
					</dl>
				</div>
				<button type="button" class="btnRequire">등록</button>
				<!-- <a href="#" class="reserQA"> <i
					class="glyphicon glyphicon-comment"></i> 예약문의하기
				</a> -->
			</form>
		</div>
			<div class="row">
				<img src="<%=cp%>/resource/img/service/dogIcon.png">
				<dl class="carryAble">
					<dt>돌봄가능한 강아지 크기 & 나이</dt>
					<dd>
						<i class="glyphicon glyphicon-check"></i>
						몇 Kg부터 몇 Kg 까지 케어 가능한가요?
						<div class="dropdown">
							<button type="button" class="btnSer" data-toggle="dropdown">
								<span id="sizeText">선택하세요</span>
								&nbsp;
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="sizeDD">
								<li><a href="#">소형견 (0~4.9kg)</a></li>
								<li><a href="#">중형견 (5~14.9kg)</a></li>
								<li><a href="#">대형견 (15kg 이상)</a></li>
							</ul>
						</div>
					</dd>
					<dd>
						<i class="glyphicon glyphicon-check"></i> 케어 가능한 반려견 나이는요?
						<div class="dropdown">
							<button type="button" class="btnSer" data-toggle="dropdown">
								<span id="ageText">선택하세요</span>
								&nbsp;
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="ageDD">
								<li><a href="#">강아지 (0~4세)</a></li>
								<li><a href="#">성견 (5~9세)</a></li>
								<li><a href="#">노령견 (10세 이상)</a></li>
							</ul>
						</div>
					</dd>
				</dl>
				<img src="<%=cp%>/resource/img/service/clock.png">
				<dl class="carryAble-time">
					<dt>데이케어 & 하루종일</dt>
					<dd>
						<i class="glyphicon glyphicon-check"></i> 데이케어 : 9~6시
					</dd>
					<dd>
						<i class="glyphicon glyphicon-check"></i> 하루종일 : 24시간
					</dd>
				</dl>
			</div>
<!-- 			<div id="datepicker"></div> -->
		</div>
		<div class="main-middle-environ">
			<h3>돌봄 환경</h3>
			<div class="environ-area-left">
				<dl class="environ-title">
					<dt class="colored pull-left">
						<img src="<%=cp%>/resource/img/service/house.JPG"> <label
							class="area-name">돌봄 공간</label>
					</dt>
					<dd class="colored pull-right">
						<input type="text" class="environ-text" value="입력하세요">
					</dd>
					<dt class="pull-left">
						<img src="<%=cp%>/resource/img/service/subway.JPG"> <label
							class="area-name">근처 지하철역</label>
					</dt>
					<dd class="pull-right">
						<input type="text" class="environ-text" value="입력하세요">
					</dd>
					<dt class="colored pull-left">
						<img src="<%=cp%>/resource/img/service/yard.JPG"> <label
							class="area-name">마당 유무</label>
					</dt>
					<dd class="colored pull-right">
						<input type="text" class="environ-text" value="입력하세요">
					</dd>
				</dl>
			</div>
			<div class="environ-area-right">
				<dl class="environ-title">
					<dt class="colored pull-left">
						<img src="<%=cp%>/resource/img/service/baby.JPG"> <label
							class="area-name">14세 미만 아동</label>
					</dt>
					<dd class="colored pull-right">
						<input type="text" class="environ-text" value="입력하세요">
					</dd>
					<dt class="pull-left">
						<img src="<%=cp%>/resource/img/service/family.JPG"> <label
							class="area-name">가족 동거 유무</label>
					</dt>
					<dd class="pull-right">
						<input type="text" class="environ-text" value="입력하세요">
					</dd>
					<dt class="colored pull-left">
						<img src="<%=cp%>/resource/img/service/cat.JPG"> <label
							class="area-name">다른 동물 유무</label>
					</dt>
					<dd class="colored pull-right">
						<input type="text" class="environ-text" value="입력하세요">
					</dd>
				</dl>
			</div>
		</div>
		<div class="sitter-infor">
			<label class="sitter"> <img class="sitter-face"
				src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_80%2Cw_300/MTE5NTU2MzE2MTk1NTU0ODI3/daniel-day-lewis-9268727-2-402.jpg">
				<label class="sitter-name">김경애</label> <i
				class="glyphicon glyphicon-map-marker">고양시 일산서구 대화동</i>
			</label> <label class="sitter"> <img class="sitter-face"
				src="http://cfile5.uf.tistory.com/image/2737C53656F686912C5801">
				<label class="dog-name">검둥이<br></label> <label class="dog-info">말티즈,
					남, 7세</label>
			</label>
		</div>
		<!-- <div class="customer-rating">
			<h1>후기</h1>
		</div> -->
	</div>
</div>


