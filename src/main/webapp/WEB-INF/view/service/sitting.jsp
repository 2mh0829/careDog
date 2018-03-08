<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="http://slidesjs.com/js/jquery.slides.min.js"></script>
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

$(function(){
	$("body").on('click','#typeDD li>a',function(){
		$('#typeText').text($(this).text());
	});
});

$(function(){
	$("body").on('click','#ageDD li>a',function(){
		$('#ageText').text($(this).text());
	});
});

$(function(){
	$("body").on('click','#sizeDD li>a',function(){
		$('#sizeText').text($(this).text());
	});
});

/* $('#careChoice li>a').on('click',function(){
	$('#careChoice').text($(this).text());
}); */

$(function(){
    $("#slides").slidesjs({
    	width: 800,
		height: 500,
      	navigation: {
	      active: false,
	      effect: "slide"
	    }    	
    });
});

</script>

<style>

.ui-datepicker{ 
	z-index: 9999 !important;
}

#slides {
      display:none;
}

li{
	list-style-type: none;
}

dt {
	font-weight: normal;
}

.checkbox {
    position: relative;
    display: inline;
    margin-top: 10px;
    margin-bottom: 10px;
}

.sitter-header{
	height:50px;
	background:#ffcb47;
	margin-bottom:15px;
}

.sitter-header p{
	float:left;
	/* list-style-type: none; */
	margin: 15px;
}

.sitter-header ul {
    margin-left: 30px;
    margin-top: 20px;
}

.sitter-search{
	padding: 12px 12px;
	height: 200px;
	background:#ffda7c;
}

.sitter-search>li{
	float: left;
	padding: 0 10px;
}

.sitter-search dt{
	margin-bottom: 5px;
}

.sitter-group{
	/* width:960px; */
	margin:0 auto;
	/* background:#ffe091; */
}

.sitter-group li{
	/* width:319px; */
	height:300px;
	background:#555;
	margin-top:15px;
	margin-bottom:15px;
	/* float:left; */
	background:#ffe091;
	list-style-type: none;
}

/* .sidebanner{
	position:absolute;
	top:100px;
	right:0px;
	width:100px;
	height:400px;
	background:#aaa;
} */

/* .sitter-footer{
	 width:960px; 
	 height:80px;
	 background:#ffe091;
	 margin:0 auto;
	 clear:both;
} */

/* .city-num{
	color: #ffffff;
	font-weight: bold;
} */

.sitter-header>li{
	float: left;
	list-style-type: none;
	text-align: center;
	margin-top: 14px;
	margin-left: 20px;
}

li>a>span{
	color: #ffffff;
	font-weight: bold;
}

.pull-left{
	float: left!important;
}

.sitter-header .dropdown-menu{
	width: 460px;
	padding: 8px 10px 15px 20px;
	top: 47px;
	left: -98px;
	border: 2px solid #ffcb47;
	font-size: 13px;
}

/* .dropdown-menu li{
	width: 33.3333%;
}*/

.myButton {
	background-color:#44c767;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	padding:2px 15px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
	float: right;
}
.myButton:hover {
	background-color:#5cbf2a;
}
.myButton:active {
	position:relative;
	top:1px;
}

.btn-link{
	border-color: transparent;
	text-decoration: underline;
	float: right;
}

/* .btn-close{
	margin: -35px 0 -10px 0 !important;
	padding: 0 5px !important;
	font-size: 40px;
	font-weight: 100;
	display: block!important;
	-webkit-appearance: none;
	cursor: pointer;
	background: 0 0;
	border: 0;
	float: right;
} */

.dropdown-menu input[type="checkbox"]+label{
	position: relative;
	display: inline-block;
	width: 105px;
	margin-right: 0 !important;
	padding: 0 5px 25px;
	color: #696969;
	font-weight: normal;
	cursor:pointer;
}

.filters>ul>li {
	padding: 15px 5px;
	float: left;
}

.col-dates {
	width: 305px;
}

.col-dates dd {
    width: 310px;
    padding: 0 30px 0 2px;
    border-radius: 5px;
    line-height: 30px;
}

.col-dates input {
    width: 110px;
    height: 34px;
    padding: 0;
    line-height: 33px;
    text-align: center;
    border-radius: 4px;
    border: 1px solid #ccc;
}

.col-type div {
	width: 120px;
}

.btnService {
	width: 120px;
	height: 34px;
	border-radius: 4px;
	border: 1px solid #ccc;
	background: white;
}

.btnAge {
	width: 120px;
	height: 34px;
	border-radius: 4px;
	border: 1px solid #ccc;
	background: white;
}

.btnWeight {
	width: 120px;
	height: 34px;
	border-radius: 4px;
	border: 1px solid #ccc;
	background: white;
}

/* .btnSearch {
	width: 40px;
    margin-top: 21px !important;
    padding: 8px 0 7px !important;
    border: none;
    background-color: #6eb9b5;
    color: #fff;
} */

.btnSearch {
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
	padding:4px 35px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
	float: right;
}
.btnSearch:hover {
	background-color:#5cbf2a;
}
.btnSearch:active {
	position:relative;
	top:1px;
}

.col-type .dropdown-menu {
    border: 1px solid #ccc;
    font-size: 14px;
    min-width: 100%;
}

::placeholder {
	color: black;
}

#col-btn {
	float: right;
}

.col-tag {
	width: 100%;
}

.col-tag label {
	/* font-weight: normal; */
    padding: 7px 6px;
    background-color: #dcbf6c;
    color: #fff;
    margin-right: 10px;
    border: none;
    border-radius: 4px;
}

/* hr {
	width: 100%; 
	text-align: center; 
	border: 0.5px solid gray;
} */

.col-tot {
    padding: 0 18px;
    color: #696969;
    line-height: 39px;
    font-size: 13px;
    /* border-bottom: 0.5px solid #696969; */
}

.sitter-body {
	width: 100%;
	height: 220px;
    padding: 0;
    margin: 0 auto;
    clear: both;
    position: relative;
    border: 1px solid #bcbcbc;
}

.sitter-list {
	/* border: 1px solid #ccc; */
	position: relative;
}

.sitter-room-photo {
	width: 35%;
	height: 220px;
    margin: 0;
    padding: 0;
    overflow: hidden;
    display: inline-block;
	float: left;
}

.sitter-room-photo img {
	position: absolute;
	top: 0;
	left: 0;
    width: 100%;
    height: 245px;
}

#slides-btn-left {
	position: relative; 
	top:-50px; 
	font-size: 30px;
	z-index:100;
	color: white;
}

#slides-btn-right {
	position: relative;
    top: -50px;
    left: 278px;
    font-size: 30px;
    z-index: 100;
    color: white;
}

#slides a {
	height: 200px;
	text-decoration:none;
}

/* .sitter-room-photo {
	display: inline-block;
	float: left;
} */

.sitter-room-content {
	color: black;
}

.sitter-room-content a {
	display: block;
    margin-bottom: 10px;
    color: #3a3a3a;
    line-height: 27px;
    font-size: 20px;
    font-weight: bold;
}

.sitter-room-content dl {
	float: right;
	width: 65%;
}

.sitter-room-content dt {
	
    border-bottom: solid 1px #e5e5e5;
    
}

.sitter-room-content label {
	color: #828282;
	font-size: 15px;
	margin-right: 12px;
}

.sitter-face {
	display: inline-block;
	width: 30px;
    height: 30px;
    border-radius: 50%;
    border: 1px solid #ccc;
}


.dogIcon {
	display: inline-block;
	width: 30px;
    height: 30px;
    border-radius: 50%;
}

.dogs {
	font-weight: normal;
}

.sitter-body dl {
	padding-left: 15px;
}

.sitter-tag span{
	display: inline-block;
    width: 70px;
    margin: 10px 5px 0 0;
    padding: 9px 0 8px;
    border-radius: 5px;
    border: 1px solid #18ab29;
    color: #18ab29;
    line-height: 1;
    font-size: 12px;
    font-weight: normal;	
}

.price {
	margin-top: 15px;
	text-align: right;
}

.price strong {
	margin-left: 2px;
    font-weight: 600;
    font-size: 20px;
}

#stay {
    color: #fac058;
}

.evaluation {
	height: 36px;
    background-color: #ffe5aa;
    /* top: 0px; */
    /* position: relative; */
    width: 65%;
    float: right;
}

.inner {
	width: 100%;
	height: 220px;
}

.pull-right{
	float: right;
}

.evaluation label {
	margin-left: 12px;
    font-weight: normal;
    margin-top: 9px;
}

.evaluation img {
	width: 110px;
}

.evaluation pull-left {
	top: 100px;
}

</style>

<div class="body-container">
	
	<div class="sitter-header">
		<!-- <div id="city-navigator">
		</div> -->
		<li>
			<a href="#">전체 <span>195</span>
			</a>
		</li>
		<li class="dropdown">
			<a href= "#" data-toggle="dropdown">서울 <span class="city-num">96</span>
			</a>
			<div class="dropdown-menu">
				<ul class="clearfix">
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state8" class="checkbox" value="8">
						<label for="state8">
							강남구 (7)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state16" class="checkbox" value="16">
						<label for="state16">
							강동구 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state57" class="checkbox" value="57">
						<label for="state57">
							강북구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state37" class="checkbox" value="37">
						<label for="state37">
							강서구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state7" class="checkbox" value="7">
						<label for="state7">
							관악구 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state41" class="checkbox" value="41">
						<label for="state41">
							광진구 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state15" class="checkbox" value="15">
						<label for="state15">
							구로구 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state3" class="checkbox" value="3">
						<label for="state3">
							금천구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state4" class="checkbox" value="4">
						<label for="state4">
							노원구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state32" class="checkbox" value="32">
						<label for="state32">
							도봉구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state39" class="checkbox" value="39">
						<label for="state39">
							동대문구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state23" class="checkbox" value="23">
						<label for="state23">
							동작구 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state19" class="checkbox" value="19">
						<label for="state19">
							마포구 (7)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state22" class="checkbox" value="22">
						<label for="state22">
							서대문구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state6" class="checkbox" value="6">
						<label for="state6">
							서초구 (7)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state27" class="checkbox" value="27">
						<label for="state27">
							성동구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state12" class="checkbox" value="12">
						<label for="state12">
							성북구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state34" class="checkbox" value="34">
						<label for="state34">
							송파구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state40" class="checkbox" value="40">
						<label for="state40">
							양천구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state45" class="checkbox" value="45">
						<label for="state45">
							영등포구 (7)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state9" class="checkbox" value="9">
						<label for="state9">
							용산구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state28" class="checkbox" value="28">
						<label for="state28">
							은평구 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state25" class="checkbox" value="25">
						<label for="state25">
							종로구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state54" class="checkbox" value="54">
						<label for="state54">
							중랑구 (2)
						</label>
					</li>
				</ul>
				<button type="button" data-loading="검색 중..." class="myButton">확인</button>
				<button type="button" class="btn btn-link">선택 초기화</button>
				<!-- <button type="button" class="btn-close" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button> -->
				</div>
			
		</li>
		<li class="dropdown">
			<a href="#" data-toggle="dropdown">경기 <span class="city-num">87</span>
			</a>
			<div class="dropdown-menu">
				<ul class="clearfix">
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state10" class="checkbox" value="10">
						<label for="state10">
							고양시 (13)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state24" class="checkbox" value="24">
						<label for="state24">
							광주시 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state43" class="checkbox" value="43">
						<label for="state43">
							군포시 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state49" class="checkbox" value="49">
						<label for="state49">
							김포시 (5)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state26" class="checkbox" value="26">
						<label for="state26">
							수원시 (8)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state17" class="checkbox" value="17">
						<label for="state17">
							시흥시 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state18" class="checkbox" value="18">
						<label for="state18">
							안산시 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state61" class="checkbox" value="61">
						<label for="state61">
							양평군 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state21" class="checkbox" value="21">
						<label for="state21">
							용인시 (8)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state62" class="checkbox" value="62">
						<label for="state62">
							의왕시 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state11" class="checkbox" value="11">
						<label for="state11">
							의정부시 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state58" class="checkbox" value="58">
						<label for="state58">
							파주시 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state44" class="checkbox" value="44">
						<label for="state44">
							평택시 (5)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state56" class="checkbox" value="56">
						<label for="state56">
							화성시 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state6" class="checkbox" value="6">
						<label for="state6">
							서초구 (7)
						</label>
					</li>
				</ul>
				<button type="button" data-loading="검색 중..." class="myButton">확인</button>
				<button type="button" class="btn btn-link">선택 초기화</button>
				<!-- <button type="button" class="btn-close" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button> -->
			</div>
		</li>
		<li class="dropdown">
			<a href="#" data-toggle="dropdown">인천 <span class="city-num">12</span>
			</a>
				<div class="dropdown-menu">
				<ul class="clearfix">
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state36" class="checkbox" value="36">
						<label for="state36">
							계양구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state52" class="checkbox" value="52">
						<label for="state52">
							남구 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state38" class="checkbox" value="38">
						<label for="state38">
							부평구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state55" class="checkbox" value="55">
						<label for="state55">
							서구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state14" class="checkbox" value="14">
						<label for="state14">
							연수구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" name="states[]" id="state60" class="checkbox" value="60">
						<label for="state60">
							중구 (1)
						</label>
					</li>
				</ul>
				<button type="button" data-loading="검색 중..." class="myButton">확인</button>
				<button type="button" class="btn btn-link">선택 초기화</button>
				<!-- <button type="button" class="btn-close" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button> -->
				</div>
			</li>
	</div>
	<div class="sitter-search">
		<li class="col-type">
		<dl>
			<dt>서비스</dt>
			<dd>
				<div class="dropdown">
					<button type="button" class="btnService" data-toggle="dropdown">
						<span id="typeText">24시간 돌봄</span>
						&nbsp;
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" id="typeDD">
						<li><a href="#">24시간 돌봄</a></li>
						<li><a href="#">데이 케어</a></li>
					</ul>
				</div>
			</dd>
		</dl>
		</li>
		<li class="col-dates">
			<dl>
				<dt>예약일을 알려주세요!</dt>
				<dd>
					<i class="glyphicon glyphicon-calendar"></i>
					<input type="text" id="left-datepicker" placeholder="시작 날짜">
					<span>></span>
					<i class="glyphicon glyphicon-calendar"></i>
					<input type="text" id="right-datepicker" placeholder="마침 날짜">
				</dd>
			</dl>
		</li>
		<li class="col-age">
			<dl>
			<dt>반려견 나이</dt>
			<dd>
				<div class="dropdown">
					<button type="button" class="btnAge" data-toggle="dropdown">
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
		</li>
		<li class="col-size">
			<dl>
			<dt>반려견 무게</dt>
			<dd>
				<div class="dropdown">
					<button type="button" class="btnWeight" data-toggle="dropdown">
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
			</dl>
		</li>
		<li class="col-btn" id="col-btn">
			<dl>
				<dt>&nbsp;</dt>
				<dd>
					<button type="button" class="btnSearch">검색</button>
				</dd>
			</dl>
		</li>
		<li class="col-tag">
			<dl>
				<dt>원하는 태그를 모두 선택해주세요!</dt>
				<dd>
					<div class="btn-group" data-toggle="buttons">
					<label for="apt" class="btn">
						<input type="checkbox" id="apt" class="checkbox">아파트
					</label>
					<label for="yard" class="btn">
						<input type="checkbox" id="yard" class="checkbox">마당
					</label>
					<label for="oldDogCare" class="btn">
						<input type="checkbox" id="oldDogCare" class="checkbox">노령견케어
					</label>
					<label for="sickDogCare" class="btn">
						<input type="checkbox" id="sickDogCare">환자견케어
					</label>
					<label for="license" class="btn">
						<input type="checkbox" id="license">자격증보유
					</label>
					<label for="outdoor" class="btn">
						<input type="checkbox" id="outdoor">실외배변
					</label>
					<label for="pickUp" class="btn">
						<input type="checkbox" id="pickUp">픽업가능
					</label>
					<label for="handmade" class="btn">
						<input type="checkbox" id="handmade">수제간식
					</label>
					<label for="noDog" class="btn">
						<input type="checkbox" id="noDog">반려견없는곳
					</label>
					<label for="emergency" class="btn">
						<input type="checkbox" id="emergency">응급처치
					</label>
					<label for="pillAble" class="btn">
						<input type="checkbox" id="pillAble">투약가능
					</label>
					<label for="bigDog" class="btn">
						<input type="checkbox" id="bigDog">대형견
					</label>
					</div>
				</dd>
			</dl>
		</li>
	</div>
	<!-- <hr> -->
	<div class="col-tot">
		<strong>###명</strong>
		의 펫시터가 검색되었습니다!
		<a href="#" style="float: right; text-decoration: underline">검색 설정 초기화</a>
	</div>
	<div class="sitter-body">
	<ul class="inner">
		<li class="sitter-list">
			<div class="sitter-room-photo">
				<div id="slides">
					<img src="http://cfile6.uf.tistory.com/image/2544613F51CF074D104D69">
					<img src="http://cfile4.uf.tistory.com/image/0148133F51CF074F0EE545">
					<img src="http://cfile26.uf.tistory.com/image/2162173F51CF0752036923">
					<img src="http://cfile6.uf.tistory.com/image/233B073F51CF075D14D7CA">
				<a href="#" id="slides-btn-left" class="slidesjs-previous slidesjs-navigation">
					<i class="glyphicon glyphicon-chevron-left"></i>
				</a>
				<a href="#" id="slides-btn-right" class="slidesjs-next slidesjs-navigation">
					<i class="glyphicon glyphicon-chevron-right"></i>
				</a>
				</div>
			</div>
			<div class="sitter-room-content">
				<dl>
					<dt>
						<a href="<%=cp%>/service/sitting_detail">당신의 강아지... 이제 더이상 외롭지 않아요...</a>
						<label class="name">
							<img class="sitter-face" 
							src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_80%2Cw_300/MTE5NTU2MzE2MTk1NTU0ODI3/daniel-day-lewis-9268727-2-402.jpg">
							김경애
						</label>
						<label class="dogs">
							<img class="dogIcon" 
							src="https://www.iconexperience.com/_img/o_collection_png/green_dark_grey/512x512/plain/dog.png">
							반려견
							<strong>
								#
							</strong>
							마리							
						</label>
					</dt>
					<dd class="sitter-tag">
						<span class="label">아파트</span>
						<span class="label">노령견케어</span>
						<span class="label">실외배변</span>
						<span class="label">픽업가능</span>
						<span class="label">수제간식</span>
						<span class="label">투약가능</span>
					</dd>
					<dd class="price">
						<label class="daycare">
							Day Care / 
							<strong>22,000원</strong>
						</label>
						<label id="stay">
							1박 / 
							<strong>30,000원</strong>
						</label>
					</dd>
				</dl>
				<div class="evaluation">
					<label class="pull-left">
						<img src="<%=cp%>/resource/img/service/grade_img.png">
						펫시터 총점</label>
					<label class="pull-right">
						<i class="glyphicon glyphicon-list-alt"></i>
						고객 후기 ##개
					</label>
					<label class="pull-right">
						<i class="glyphicon glyphicon-user"></i>
						정기 고객 ##명
					</label>
				</div>
			</div>
		</li>
	</ul>
	</div>
	
</div>