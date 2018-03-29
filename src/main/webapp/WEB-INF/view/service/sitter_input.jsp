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

// 왼쪽 달력
$(function() {
	$(".left-datepicker").datepicker({
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

// 오른쪽 달력
$(function() {
	$(".right-datepicker").datepicker({
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

// 돌봄비용 * 부가세 (소수점 절삭, 1의자리 0으로)
$(function(){
	$("body").on('change','.inputMoney',function(){
		// 돌봄비용 + 반려견 추가비용
		var sum = parseInt($("#reserCost").val());
		tot = (sum + sum * 1/10);
		
		// 소수점 절삭, 1의자리 0으로
		tot = Math.floor(tot/10)*10;
		
		$('.totPrice').html(tot);
	})
});

</script>

<script type="text/javascript">

// 반려견 X 선택시 버튼 비활성화
function setDisabled() {
	document.getElementById('addPetCost').value='0';
	document.getElementById('addPetCost').readOnly=true;
}

// 반려견 추가 선택시 버튼 재활성화
function setAbled(){
	document.getElementById('addPetCost').readOnly=false;
	document.getElementById('addPetCost').value='';
}

// input창에 숫자만 가능하게 (except. Korean 자음)
function inputOnlyNum(){
	 var acode = event.keyCode;
	 if(acode == 37 || acode == 39 || acode == 8 || acode == 127 || acode == 9 || (acode>47 && acode<58) || (acode>95 && acode<106)) {
	 } else {
		alert("ONLY NUMBER !!");
	  	return false;
	 }
}

// -------


</script>

<style>
.ui-datepicker-calendar>tbody td.ui-datepicker-week-end:last-child a {
	color: red;
}

.main-middle-inner .ui-datepicker {
	width: 335px;
	height: 190px;
}

.imgCursor {
	cursor: pointer;
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
	/* height: 564px; */
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
	border: 3px dotted orange;
	margin-bottom: 80px;
}

/* .array-small img {
	width: 201px;
	height: 134px;
} */
.main-top-detail {
	width: 335px;
	/* float: right; */
	height: 345px;
	/* z-index: 97; */
	border: 1px solid orange;
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
	margin-top: 20px;
}

.reser-date input {
	width: 90px;
	text-align: center;
}

.reser-date dd {
	margin-left: 45px;
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
	margin-left: 10px;
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
	/* float: left; */
	margin-left: 15px;
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
	border: 1px solid orange;
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
	width: 50px;
	height: 40px;
	margin-left: 20px;
	margin-top: -85px;
}

.inner {
	/* border: 1px solid red; */
	height: 1000px;
	/* margin-top: 130px; */
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
	display: inline-block;
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
	border: 3px solid orange;
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
	/* border: 3px dotted orange; */
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
	width: 148px;
	height: 34px;
	border-radius: 4px;
	border: 1px solid #ccc;
	background: white;
}

.col-tag i {
	margin-left: 30px;
	font-size: 30px;
}

.btn-group {
	margin-left: 85px;
}

.main-text {
	resize: none;
	/* margin: 25px; */
	border: none;
	font-size: 20px;
}

.col-tag label {
	padding: 7px 6px;
	margin-right: 10px;
	border-radius: 4px;
	border: 1px solid #ccc;
	margin-top: 5px;
}

.hi {
	border: 1px solid orange;
	height: 250px;
	margin-top: 60px;
	margin-right: 20px;
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

#btnInputImg {
	width: 30px;
	height: 30px;
	margin-bottom: 10px;
	margin-left: 5px;
	/* margin-left: 425px; */
	/* margin-top: 120px; */
}

input[type=file] {
	display: none;
}

.my_button {
	display: inline-block;
	width: 200px;
	text-align: center;
	padding: 10px;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}

.imgs_wrap {
	border: 3px dotted orange;
	margin-bottom: 40px;
	padding-top: 10px;
	padding-bottom: 10px;
	margin-right: 20px;
	height: 200px;
}

.imgs_wrap img {
	max-width: 150px;
	margin-left: 10px;
	margin-right: 10px;
}

.roomPhotos {
	border: 3px dotted orange;
	width: 49%;
	height: 49%;
	display: inline-block;
	margin-left: 5px;
	margin-top: 1.5px;
}

#roomTxt {
	margin-left: 5px;
}

.dropdown li {
	margin: 5px;
}

</style>

<script type="text/javascript">
/* var formData = new FormData(); */
$(document).ready(function(){
	/* var tagList = []; */
	var carableWeight;
	var carableAge;
	var reserDiv;
	var addPet;
	/* $("input[type='file']").on("change", function(){

		var file = this.files[0];       

		formData.append("imgFile", file);
	}); */
	
	//태그 값 불러오기
	$("body").on("click",'.btn',function(){
		/* var tagName = $('.btn').eq($(this).index()).text().trim(); */
		
		/* tagList += tagName + " "; */
	})
	
	// 드롭다운 선택시 버튼에 텍스트 표시 and 해당 value값 전송
	$("body").on("click",'#carableWeight li',function(){
		$('#sizeText').text($(this).text());
		var data = $(this).val();
		carableWeight = data;
		/* alert(carableWeight); */
	})
	
	$("body").on("click",'#carableAge li',function(){
		$('#ageText').text($(this).text());
		var data = $(this).val();
		carableAge = data;
		/* alert(carableAge); */
	})
	
	$("body").on('click','#addPet li',function(){
		$('#payTxt').text($(this).text());
		var data = $(this).val();
		addPet = data;
		/* alert(addPet); */
	});
	
	$("body").on('click','#reserDiv li',function(){
		$('#careTime').text($(this).text());
		var data = $(this).val();
		reserDiv = data;
		/* alert(reserDiv); */
	});
	

	$("#sitterConfirm").on("click",function(){
		
		var title = $('#title').val();
		var content = $('#content').val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var reserCost = $("#reserCost").val();
		var addPetCost = $("#addPetCost").val();
		var space = $('#space').val();
		var subway = $('#subway').val();
		var yard = $('#yard').val();
		var baby = $('#baby').val();
		var family = $('#family').val();
		var other = $('#other').val();
		var memberId = $('.sitter-name').val();
		
		var formD = new FormData(document.inputForm);
		
		formD.append("reserDiv",reserDiv);
		formD.append("carableWeight",carableWeight);
		formD.append("carableAge",carableAge);
		formD.append("addPet",addPet);
		
		/* formD.append("tag",tagList); */
		
		formD.append("memberId",memberId);
		
		/* var param = "memberId="+memberId+"&title="+title+"&content="+content+"&startDate="+startDate+"&endDate="+endDate+"&reserDiv="+reserDiv
					+"&reserCost="+reserCost+"&addPet="+addPet+"&addPetCost="+addPetCost+"&carableWeight="+carableWeight
					+"&carableAge="+carableAge+"&tag="+tagList+"&space="+space+"&subway="+subway+"&yard="+yard+"&baby="+baby
					+"&family="+family+"&other="+other; */
		
		$.ajax({
			type:"post",
			url:"<%=cp%>/service/sitter_input",
			data:formD,
			contentType:false,
			processData:false,
 			success:function(data){
				alert(tag);
			location.href="<%=cp%>/service";
			},
			error:function(e){
				alert(e.responseText);
			}
		});
					
					
	});
});

// 이미지 파일 선택 및 미리보기
function imgFileUpload(){
	$("#input_imgs").trigger('click');
}

$(document).ready(function() {
    $("#input_imgs").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e) {
	sel_files = [];
	
    $(".imgs_wrap").empty();

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);
    var index = 0;
    
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("Only .img File Available !!");
            return;
        }

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
            $(".imgs_wrap").append(html);
            index++;

        }
        reader.readAsDataURL(f);
    });
}
// -- 이미지 파일 선택 및 미리보기 끝

// 이미지 파일 삭제
function deleteImageAction(index) {
	console.log("index : "+index);
	console.log("sel length : "+sel_files.length);
	
	sel_files.splice(index, 1);
	
	var img_id = "#img_id_"+index;
	$(img_id).remove(); 
}

<%-- function sendOk() {
    var f = document.inputForm;
    
	var str = f.title.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.title.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

	f.action="<%=cp%>/service/sitter_input";

	f.submit();
} --%>



</script>

<div class="body-container">
	<form name="inputForm" method="post" enctype="multipart/form-data">
		<div class="sitter-title">
			<h1>글 제목</h1>
			<input type="text" class="textTitle" id="title" name="title" placeholder="입력하세요">
		</div>

		<!-- <div>
		<div class="input_wrap">
			<a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
			<input type="file" id="input_imgs" multiple>
		</div>
	</div>
	<div>
		<div class="imgs_wrap">
			<img id="img">
		</div>
	</div> 
	<a href="javascript:" class="my_button" onclick="submitAction();">업로드</a> -->
		<div class="main-top">
			<div class="main-top-slider">
				<img src="<%=cp%>/resource/img/service/uploadButton.png"
					class="imgCursor" id="btnInputImg" onclick="imgFileUpload();">
				<span id="roomTxt">방 사진을 추가해주세요! (4장)</span> 
				<input type="file" name="fileName" id="input_imgs" multiple>
				<div>
					<div class="imgs_wrap">
						<img id="img" />
					</div>
				</div>
				<!-- <div class="main-photos">
				<div class="roomPhotos" id="imgs_wrap"></div>
				<div class="roomPhotos" id="imgs_wrap1"></div>
				<div class="roomPhotos" id="imgs_wrap2"></div>
				<div class="roomPhotos" id="imgs_wrap3"></div>
			</div> -->
				<!-- <div>
				<div class="imgs_wrap"></div>
			</div> -->
				<!-- <ul class="photo-array">
				<li class="array-small"></li>
				<li class="array-small"></li>
				<li class="array-small"></li>
			</ul> -->
			</div>
		</div>
		<div class="inner">
			<div class="main-middle-inner">
				<div class="main-top-detail">

					<div class="reser-date">
						<dl>
							<dt class="titleWord">가능한 날짜를 선택해주세요!</dt>
							<dd>
								<i class="glyphicon glyphicon-calendar"></i> 
								<input type="text" class="left-datepicker" placeholder="시작 날짜" id="startDate" name="startDate">
								<span>></span> 
								<i class="glyphicon glyphicon-calendar"></i>
								<input type="text" class="right-datepicker" placeholder="마침 날짜" id="endDate" name="endDate">
							</dd>
						</dl>
						<dl class="price-detail">
							<dt>
								<div class="dropdown">
									<button type="submit" class="inputBtn" data-toggle="dropdown">
										<span id="careTime">24시간 돌봄</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" id="reserDiv">
										<li value="1" class="imgCursor">24시간 돌봄</li>
										<li value="2" class="imgCursor">데이케어</li>
									</ul>
								</div>
							</dt>
							<dd>
								<input type="text" name="reserCost" id="reserCost"
									class="inputMoney" placeholder="입력하세요" onkeydown="return inputOnlyNum();">원
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
										<span id="payTxt">반려견 추가비용</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" id="addPet">
										<li class="imgCursor" value="1" onclick="setAbled()">반려견 추가비용</li>
										<li class="imgCursor" value="2" onclick="setDisabled()">반려견 추가 X</li>
									</ul>
								</div>
							</dt>
							<dd>
								<input type="text" id="addPetCost" class="inputMoney"
									name="addPetCost" placeholder="입력하세요" onkeydown='return inputOnlyNum();'>원
							</dd>
							<dt>
								<span class="input-title">부가세</span>
							</dt>
							<dd>
								<span class="oneDayPrice">10%</span>
							</dd>
							<dt>
								<span class="input-title-tot">하루당 비용</span>
							</dt>
							<dd class="price-tot">
								<span class="totPrice"></span>원
							</dd>
						</dl>
					</div>
					<button type="button" id="sitterConfirm" class="btnRequire">등록</button>
					<!-- <a href="#" class="reserQA"> <i
					class="glyphicon glyphicon-comment"></i> 예약문의하기
				</a> -->

				</div>
				<div class="row">
					<img src="<%=cp%>/resource/img/service/dogIcon.png">
					<dl class="carryAble">
						<dt>돌봄가능한 강아지 크기 & 나이</dt>
						<dd>
							<i class="glyphicon glyphicon-check"></i> 몇 Kg부터 몇 Kg 까지 케어
							가능한가요?
							<div class="dropdown">
								<button type="button" class="btnSer" data-toggle="dropdown">
									<span id="sizeText">선택하세요</span> &nbsp; <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" id="carableWeight">
									<li class="imgCursor" value="1" id="sizeSmall">소형견
										(0~4.9kg)</li>
									<li class="imgCursor" value="2" id="sizeMedium">중형견
										(5~14.9kg)</li>
									<li class="imgCursor" value="3" id="sizeLarge">대형견
										(15kg 이상)</li>
								</ul>
							</div>
						</dd>
						<dd>
							<i class="glyphicon glyphicon-check"></i> 케어 가능한 반려견 나이는요?
							<div class="dropdown">
								<button type="button" class="btnSer" data-toggle="dropdown">
									<span id="ageText">선택하세요</span> &nbsp; <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" id="carableAge">
									<li class="imgCursor" value="1">강아지
										(0~4세)</li>
									<li class="imgCursor" value="2">성견
										(5~9세)</li>
									<li class="imgCursor" value="3">노령견
										(10세 이상)</li>
								</ul>
							</div>
						</dd>
					</dl>

					<%-- <img src="<%=cp%>/resource/img/service/clock.png"> --%>
					<li class="col-tag">
						<dl>
							<i class="glyphicon glyphicon-tag"></i>
							<dt>&nbsp;&nbsp;&nbsp;&nbsp;원하는 태그를 모두 선택해주세요!</dt>
							<dd>
								<div class="btn-group" data-toggle="buttons" id="tagBtn">
									<label for="apt" class="btn"> 
										<input type="checkbox" id="apt" name="tag" class="checkbox sitterTags" value="아파트">아파트
									</label> 
									<label for="yard" class="btn">
										<input type="checkbox"	id="yard" name="tag" class="checkbox sitterTags" value="마당">마당
									</label> 
									<label for="oldDogCare" class="btn">
										<input type="checkbox" id="oldDogCare" name="tag" class="checkbox sitterTags" value="노령견케어">노령견케어
									</label>
									<label for="sickDogCare" class="btn">
										<input class="sitterTags" type="checkbox" name="tag" id="sickDogCare" value="환자견케어">환자견케어
									</label> 
									<label for="license" class="btn"> 
										<input class="sitterTags" type="checkbox" name="tag" id="license" value="자격증보유">자격증보유
									</label>
									<label for="outdoor" class="btn"> 
										<input class="sitterTags" type="checkbox" name="tag" id="outdoor" value="실외배변">실외배변
									</label> 
									<label for="pickUp" class="btn"> 
										<input class="sitterTags" type="checkbox" name="tag" id="pickUp" value="픽업가능">픽업가능
									</label> 
									<label for="handmade" class="btn">
										<input class="sitterTags" type="checkbox" name="tag" id="handmade" value="수제간식">수제간식
									</label>
									<label for="noDog" class="btn"> 
										<input class="sitterTags" type="checkbox" name="tag" id="noDog" value="반려견없는곳">반려견없는곳
									</label> 
									<label for="emergency" class="btn"> 
										<input class="sitterTags" type="checkbox" name="tag" id="emergency" value="응급처치">응급처치
									</label> 
									<label for="pillAble" class="btn"> 
										<input type="checkbox" name="tag" id="pillAble" value="투약가능">투약가능
									</label> 
									<label for="bigDog" class="btn"> 
										<input type="checkbox" name="tag" id="bigDog" value="대형견">대형견
									</label>
								</div>
							</dd>
						</dl>
					</li>
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
							<input type="text" class="environ-text" id="space" placeholder="입력하세요" name="space">
						</dd>
						<dt class="pull-left">
							<img src="<%=cp%>/resource/img/service/subway.JPG"> <label
								class="area-name">근처 지하철역</label>
						</dt>
						<dd class="pull-right">
							<input type="text" class="environ-text" id="subway" placeholder="입력하세요" name="subway">
						</dd>
						<dt class="colored pull-left">
							<img src="<%=cp%>/resource/img/service/yard.JPG"> <label
								class="area-name">마당 유무</label>
						</dt>
						<dd class="colored pull-right">
							<input type="text" class="environ-text" id="yard" placeholder="입력하세요" name="yard">
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
							<input type="text" class="environ-text" id="baby" placeholder="입력하세요" name="baby">
						</dd>
						<dt class="pull-left">
							<img src="<%=cp%>/resource/img/service/family.JPG"> <label
								class="area-name">가족 동거 유무</label>
						</dt>
						<dd class="pull-right">
							<input type="text" class="environ-text" id="family" placeholder="입력하세요" name="family">
						</dd>
						<dt class="colored pull-left">
							<img src="<%=cp%>/resource/img/service/cat.JPG"> <label
								class="area-name">다른 동물 유무</label>
						</dt>
						<dd class="colored pull-right">
							<input type="text" class="environ-text" id="other" placeholder="입력하세요" name="other">
						</dd>
					</dl>
				</div>
			</div>
			<div class="sitter-infor">
				<label class="sitter"> 
				<img class="sitter-face"
					src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_80%2Cw_300/MTE5NTU2MzE2MTk1NTU0ODI3/daniel-day-lewis-9268727-2-402.jpg">
					<label class="sitter-name">${sessionScope.member.userName}</label>
					<i class="glyphicon glyphicon-map-marker">${sessionScope.member.address1}</i>
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
					<div class="hi-sitter">
						<span style="font-weight: bold;">${sessionScope.member.userName}</span> 펫시터님의 한마디
					</div>
				</div>
				<div class="hi-body">
					<textarea class="main-text" id="content" cols="104" rows="6" placeholder="입력하세요" name="content"></textarea>
				</div>
			</div>
		</div>
	</form>
</div>


