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
    $(".left-datepicker").datepicker({
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
    $(".right-datepicker").datepicker({
    	dateFormat: "yy-mm-dd",
    	showAnim: "slideDown",
    	showMonthAfterYear: true,
    	yearSuffix: '년',
    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
    	minDate: 0
    });
});

$(document).ready(function(){
	 $(".slides").slidesjs({
	    	width: 800,
			height: 500,
	      	navigation: {
		      active: false,
		      effect: "slide"
		    }    	
	    });
});

</script>



<script type="text/javascript">

$(document).ready(function(){
	/* var formS= new FormData(document.searchForm); */
	var reserDiv;
	var carableAge;
	var carableWeight;
	var address;
	
	$('body').on('click', '#reserDiv li', function(){
		$('#careTime').text($(this).text());
					
		reserDiv = ($(this).val());
	});
	
	$('body').on('click', '#carableAge li', function(){
		$('#ageText').text($(this).text());
					
		carableAge = ($(this).val());
	});
	
	$('body').on('click', '#carableWeight li', function(){
		$('#sizeText').text($(this).text());
					
		carableWeight = ($(this).val());
	});
	
	$('body').on('click','.sitter-header input[type=checkbox]', function(){
		
		address = ($(this).val());
		alert(address);
	});
	
	$('.btnSearch').on("click",function(){
		
		/* var reserDiv = $("#reserDiv").val();
		var carableAge = $("#carableAge").val();
		var carableWeight = $("#carableWeight").val(); */
		
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		
		var formS= new FormData(document.searchForm);
		
		formS.append("reserDiv",reserDiv);
		formS.append("carableWeight",carableWeight);
		formS.append("carableAge",carableAge);
		/* formS.append("address",address); */
		
		 $.ajax({
			type:"post",
			url:"<%=cp%>/service",
			data:formS,
			contentType:false,
			processData:false,
 			success:function(data){
 				$(".sitter-body-list").html(data);
			},
			error:function(e){
				alert(e.responseText);
			}
		});
	})
});

/* function check(){
	
	var f = form.searchForm;
	
	if(f.address.checked == true){
		alert(f.address.value);
	}
	
	return true;
} */
</script>

<style>

.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: red; }

.ui-datepicker{ 
	z-index: 9999 !important;
}

.slides {
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
	margin-left: 5px;
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
	width: 150px;
	height: 34px;
	border-radius: 4px;
	border: 1px solid #ccc;
	background: white;
}

.btnWeight {
	width: 150px;
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
	/* float: right; */
	margin-left : 35px;
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
    /* border: 1px solid #bcbcbc; */
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
    height: 220px;
}

.slides-btn-left {
	position: relative; 
	top:-50px; 
	font-size: 30px;
	z-index:100;
	color: white;
}

.slides-btn-right {
	position: relative;
    top: -50px;
    left: 278px;
    font-size: 30px;
    z-index: 100;
    color: white;
}

.slides a {
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
    color: black;
}

.evaluation {
	/* height: 36px; */
    background-color: #ffe5aa;
    /* top: 0px; */
    /* position: relative; */
    width: 65%;
    float: right;
    padding-bottom: 1px;
}

.inner {
	width: 100%;
	height: 220px;
	border: 1px solid orange;
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
	width: 40px;
}

.evaluation pull-left {
	top: 100px;
}

#rating {
	position: relative;
    top: -2px;
    margin-left: 12px;
    width: 30px;
}

.imgCursor {
	margin: 10px;
}

</style>

<div class="body-container">
	<form name="searchForm" method="post">
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
						<input type="checkbox" id="state8" class="checkbox" name="address" value="강남구">
						<label for="state8">
							강남구 (7)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state16" class="checkbox" name="address" value="강동구">
						<label for="state16">
							강동구 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state57" class="checkbox" name="address" value="강북구">
						<label for="state57">
							강북구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state37" class="checkbox" name="address" value="강서구">
						<label for="state37">
							강서구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state7" class="checkbox" name="address" value="관악구">
						<label for="state7">
							관악구 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state41" class="checkbox" name="address" value="광진구">
						<label for="state41">
							광진구 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state15" class="checkbox" name="address" value="구로구">
						<label for="state15">
							구로구 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state3" class="checkbox" name="address" value="금천구">
						<label for="state3">
							금천구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state4" class="checkbox" name="address" value="노원구">
						<label for="state4">
							노원구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state32" class="checkbox" name="address" value="도봉구">
						<label for="state32">
							도봉구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state39" class="checkbox" name="address" value="동대문구">
						<label for="state39">
							동대문구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state23" class="checkbox" name="address" value="동작구">
						<label for="state23">
							동작구 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state19" class="checkbox" name="address" value="마포구">
						<label for="state19">
							마포구 (7)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state22" class="checkbox" name="address" value="서대문구">
						<label for="state22">
							서대문구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state6" class="checkbox" name="address" value="서초구">
						<label for="state6">
							서초구 (7)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state27" class="checkbox" name="address" value="성동구">
						<label for="state27">
							성동구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state12" class="checkbox" name="address" value="성북구">
						<label for="state12">
							성북구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state34" class="checkbox" name="address" value="송파구">
						<label for="state34">
							송파구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state40" class="checkbox" name="address" value="양천구">
						<label for="state40">
							양천구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state45" class="checkbox" name="address" value="영등포구">
						<label for="state45">
							영등포구 (7)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state9" class="checkbox" name="address" value="용산구">
						<label for="state9">
							용산구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state28" class="checkbox" name="address" value="은평구">
						<label for="state28">
							은평구 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state25" class="checkbox" name="address" value="종로구">
						<label for="state25">
							종로구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state54" class="checkbox" name="address" value="중랑구">
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
						<input type="checkbox" id="state10" class="checkbox" name="address" value="고양시">
						<label for="state10">
							고양시 (13)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state24" class="checkbox" value="광주시" name="address">
						<label for="state24">
							광주시 (6)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state43" class="checkbox" name="address" value="군포시">
						<label for="state43">
							군포시 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state49" class="checkbox" value="김포시" name="address">
						<label for="state49">
							김포시 (5)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state26" class="checkbox" name="address" value="수원시">
						<label for="state26">
							수원시 (8)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state17" class="checkbox" name="address" value="시흥시">
						<label for="state17">
							시흥시 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state18" class="checkbox" name="address" value="안산시">
						<label for="state18">
							안산시 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state61" class="checkbox" name="address" value="양평군">
						<label for="state61">
							양평군 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state21" class="checkbox" name="address" value="용인시">
						<label for="state21">
							용인시 (8)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state62" class="checkbox" name="address" value="의왕시">
						<label for="state62">
							의왕시 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state11" class="checkbox" name="address" value="의정부시">
						<label for="state11">
							의정부시 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state58" class="checkbox" name="address" value="파주시">
						<label for="state58">
							파주시 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state44" class="checkbox" name="address" value="평택시">
						<label for="state44">
							평택시 (5)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state56" class="checkbox" name="address" value="화성시">
						<label for="state56">
							화성시 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state6" class="checkbox" name="address" value="서초구">
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
						<input type="checkbox" id="state36" class="checkbox" name="address" value="계양구">
						<label for="state36">
							계양구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state52" class="checkbox" name="address" value="남구">
						<label for="state52">
							남구 (2)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state38" class="checkbox" name="address" value="부평구">
						<label for="state38">
							부평구 (4)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state55" class="checkbox" name="address" value="서구">
						<label for="state55">
							서구 (1)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state14" class="checkbox" name="address" value="연수구">
						<label for="state14">
							연수구 (3)
						</label>
					</li>
					<li class="pull-left">
						<input type="checkbox" id="state60" class="checkbox" name="address" value="중구">
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
						<span id="careTime">선택하세요</span>
						&nbsp;
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" id="reserDiv">
						<li class="imgCursor" value=1>24시간 돌봄</li>
						<li class="imgCursor" value=2>데이 케어</li>
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
					<input type="text" id="startDate" class="left-datepicker" name="startDate" placeholder="시작 날짜">
					<span>></span>
					<i class="glyphicon glyphicon-calendar"></i>
					<input type="text"  id="endDate" class="right-datepicker" name="endDate" placeholder="마침 날짜">
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
					<ul class="dropdown-menu" id="carableAge">
						<li class="imgCursor" value=1>강아지 (0~4세)</li>
						<li class="imgCursor" value=2>성견 (5~9세)</li>
						<li class="imgCursor" value=3>노령견 (10세 이상)</li>
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
					<ul class="dropdown-menu" id="carableWeight">
						<li class="imgCursor" value=1>소형견 (0~4.9kg)</li>
						<li class="imgCursor" value=2>중형견 (5~14.9kg)</li>
						<li class="imgCursor" value=3>대형견 (15kg 이상)</li>
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
		</form>
		<li class="col-tag">
			<dl>
				<dt>원하는 태그를 모두 선택해주세요!</dt>
				<dd>
					<div class="btn-group" data-toggle="buttons">
					<label for="apt" class="btn">
						<input type="checkbox" id="apt" class="checkbox" value="아파트">아파트
					</label>
					<label for="yard" class="btn">
						<input type="checkbox" id="yard" class="checkbox" value="마당">마당
					</label>
					<label for="oldDogCare" class="btn">
						<input type="checkbox" id="oldDogCare" class="checkbox" value="노령견케어">노령견케어
					</label>
					<label for="sickDogCare" class="btn">
						<input type="checkbox" id="sickDogCare" value="환자견케어">환자견케어
					</label>
					<label for="license" class="btn">
						<input type="checkbox" id="license" value="자격증보유">자격증보유
					</label>
					<label for="outdoor" class="btn">
						<input type="checkbox" id="outdoor" value="실외배변">실외배변
					</label>
					<label for="pickUp" class="btn">
						<input type="checkbox" id="pickUp" value="픽업가능">픽업가능
					</label>
					<label for="handmade" class="btn">
						<input type="checkbox" id="handmade" value="수제간식">수제간식
					</label>
					<label for="noDog" class="btn">
						<input type="checkbox" id="noDog" value="반려견없는곳">반려견없는곳
					</label>
					<label for="emergency" class="btn">
						<input type="checkbox" id="emergency" value="응급처치">응급처치
					</label>
					<label for="pillAble" class="btn">
						<input type="checkbox" id="pillAble" value="투약가능">투약가능
					</label>
					<label for="bigDog" class="btn">
						<input type="checkbox" id="bigDog" value="대형견">대형견
					</label>
					</div>
				</dd>
			</dl>
		</li>
	</div>
	<!-- <hr> -->
	<div class="col-tot">
		<strong>${dataCount}</strong>명의 펫시터가 검색되었습니다!
		<a href="#" style="float: right; text-decoration: underline">검색 설정 초기화</a>
	</div>
	
	<div class="sitter-body sitter-body-list">
	<c:forEach var="dto" items="${list}">
	<ul class="inner">
		<li class="sitter-list">
			<div class="sitter-room-photo">
			 	<div class="slides"> 
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
				</div> 
			</div>
			<div class="sitter-room-content" id="sitter-room-contentId">
				<dl>
					<dt>
						<a href="<%=cp%>/service/sitting_detail?sittingId=${dto.sittingId}">${dto.title}</a>
						<label class="name">
							<img class="sitter-face" 
							src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_80%2Cw_300/MTE5NTU2MzE2MTk1NTU0ODI3/daniel-day-lewis-9268727-2-402.jpg">
							${dto.memberId}
						</label>
						<label class="dogs">
							<img src="<%=cp%>/resource/img/service/redHeart.JPG" id="rating">
							<strong>
								4.7
							</strong>
							점				
						</label>
					</dt>
					<dd class="sitter-tag">
						<c:forEach var="tagg" items="${listTag}">
						<c:if test="${dto.sittingId == tagg.sittingId}">
						<span class="label">${tagg.tagName}</span>
						</c:if>
						</c:forEach>
					</dd>
					<dd class="price">
						<!-- <label class="daycare">
							Day Care / 
							<strong>22,000원</strong>
						</label> -->
						<label id="stay">
						<c:if test="${dto.reserDiv==1}">24시간 / </c:if>
						<c:if test="${dto.reserDiv==2}">데이케어 / </c:if>
							<strong>${dto.reserCost}원</strong>
						</label>
					</dd>
				</dl>
				<div class="evaluation">
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
	</c:forEach>
	</div>
	
</div>