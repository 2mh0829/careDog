<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
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

</script>

<style>

li{
	list-style-type: none;
}

ul{
	list-style: disc;
}

dt {
	font-weight: normal;
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

.dropdown-menu input.checkbox[type=checkbox]+label{
	position: relative;
	display: inline-block;
	width: 105px;
	margin-right: 0 !important;
	padding: 10px 0 10px 25px;
	color: #696969;
	font-weight: normal;
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
	padding:16px 31px;
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

.col-type .dropdown-menu {
    border: 1px solid #ccc;
    font-size: 14px;
    min-width: 100%;
}

::placeholder {
	color: black;
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
		<li class="col-btn">
			<dl>
				<dd>
					<button type="button" class="btnSearch">검색</button>
				</dd>
			</dl>
		</li>
	</div>
</div>

