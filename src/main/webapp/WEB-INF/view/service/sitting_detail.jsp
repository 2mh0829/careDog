<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script>

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
});

$(function(){
    $("#right-datepicker").datepicker({
    	dateFormat: "yy-mm-dd",
    	showAnim: "slideDown",
    	showMonthAfterYear: true,
    	yearSuffix: '년',
    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    	minDate: 0
    });
});

</script>

<style>

li{
	list-style-type: none;
}

.main-top {
	padding-bottom: 6px;
	/* border: 1px solid blue; */
	height: 495px;
}

.main-top-slider {
	width: 630px;
	margin-right: 30px;
	float: left;
	/* border: 1px solid red; */
	
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
    /* height: 300px; */
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
	padding: 15px 110px;
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
	border: 1px solid black;
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
	/* border-top: 1px solid #ccc; */
	border: 1px solid blue;
	margin-left: 1px;
    /* margin-right: auto; */
    width: 621px;
    /* padding: 40px 0; */
    height: 190px;
}

.row img {
	width: 100px;
	height: 80px;
	margin-top: 35px;
}

.inner {
	border: 1px solid red;
}

.row dl {
	margin-left: 120px;
    top: -80px;
    position: relative;
    width: 190px;
    border: 1px solid;
}

.row dt {
	margin-bottom: 10px;
}

</style>

<div class="body-container">
	<div class="main-top">
		<div class="main-top-slider">
			<div class="main-photos">
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
			</ul>
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
							<span class="won">30,000원</span>
							<div class="dropdown">
							<button type="button" class="weight" data-toggle="dropdown">
								15kg 미만 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="weightDD">
								<li><a href="#">15kg 미만</a></li>
								<li><a href="#">15kg 이상</a></li>
							</ul>
							</div>
						</dd>
						<dd class="pet-add">
							반려견 추가당 
							<span class="add-price">20,000원</span>
						</dd>
					</dl>
					<dl class="price-detail">
						<dt>
							1박
						</dt>
						<dd>
							<span class="oneDayPrice">30,000원</span>
						</dd>
						<dt>
							반려견 추가
							<div class="btn-group">
								<button type="button" class="btn">
									<i class="glyphicon glyphicon-plus"></i>
								</button>
								<button type="button" class="btn">
									<i class="glyphicon glyphicon-minus"></i>
								</button>
							</div>
						</dt>
						<dd>
							<span class="pet-add-price">30,000원</span>
						</dd>
						<dt>
							부가세
						</dt>
						<dd>
							<span class="oneDayPrice">30,000원</span>
						</dd>
						<dt>
							<span class="price-tot-text">합계</span>
						</dt>
						<dd class="price-tot">
							<span class="">30,000원</span>
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
						강아지, 성견, 노령견 케어 가능합니다.
					</dd>
				</dl>
			</div>
		</div>
	</div>
</div>


