<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

<style>
.content { float: left; width: 954px; /*min-height:800px;*/}
.content.page-main { float: none; width: auto; }
.page-tit { margin: 30px 0; color: #222; line-height: 1; margin-left: -2px; font-size: 32px; position:relative; }/* 20171027 수정 */
.page-tit:before { display: block; width: 30px; margin-bottom: 12px; margin-left: 2px; border-top: 3px solid #1991d7; content: ''; }
.volunteer__info { width: 100%; height: 683px; padding: 0px 60px; background-image: url("<%=cp%>/resource/img/strayDog/service_bg.jpg"); -webkit-box-sizing: border-box; box-sizing: border-box; }
.volunteer__tit { margin: 0px; padding-top: 80px; font-size: 28px; color: #222; text-align: center; -webkit-box-sizing: border-box; box-sizing: border-box; }
.volunteer__dl { margin-top: 40px; }
.volunteer__dt { font-size: 16px; color: #222; font-weight: 700; }
.volunteer__dd { margin: 10px 0px 0px; padding-left: 25px; line-height:1.5;}
.volunteer__dd + .volunteer__dt { margin-top: 20px; }
.inline-block { display: inline-block !important; }

.wd40 { width: 40px !important; }

.wd60 { width: 60px !important; }

.wd80 { width: 80px !important; }

.wd100 { width: 100px !important; }

.wd120 { width: 120px !important; }

.wd160 { width: 160px !important; }

.wd240 { width: 240px !important; }

.wd250 { width: 250px !important; }

.wd320 { width: 320px !important; }

.wd460 { width: 460px !important; }

.wd600 { width: 600px !important; }

.wd704 { width: 704px !important; }

.wd100p { width: 100% !important; }

.hg100 { height: 100px !important; }

.hg140 { height: 140px !important; }

.hg180 { height: 180px !important; }

.hg550 { height: 550px !important; }

.hg560 { height: 560px !important; }

.hg720 { height: 720px !important; }

/*margin*/
.mt0 { margin-top: 0px !important; }

.mt10 { margin-top: 10px !important; }

.mt15 { margin-top: 15px !important; }

.mt20 { margin-top: 20px !important; }

.mt30 { margin-top: 30px !important; }

.mt40 { margin-top: 40px !important; }

.mt50 { margin-top: 50px !important; }

.mt60 { margin-top: 60px !important; }

/*폰트사이즈*/
.fs0 { font-size: 0 !important; }

.txt_c { text-align: center !important; }

.left__group { text-align: left; font-size: 0; }

.center__group { text-align: center; font-size: 0; }

.right__group { text-align: right; font-size: 0; }

.btn + .btn { margin-left: 10px; }

.btn { display: inline-block; width: 120px; height: 40px; text-align: center; line-height: 38px; font-size: 14px; -webkit-box-sizing: border-box; box-sizing: border-box; }

.btn1 { background-color: #1991d7; color: #fff; border: 1px solid #1991d7; }

.btn2 { border: 1px solid #666666; color: #666666; }

.btn3 { background-color: #f24443; color: #fff; border: 1px solid #f24443; }

.btn4 { border: 1px solid #cccccc; color: #767676; background-color: #fff; }

.bt { border-top: 1px solid #dedede !important; }

.fl_r { float: right; }
.table1 { width: 100%; border-spacing: 0; border-collapse: collapse; text-align: left; }
.table1__tr { border-top: 1px solid #dedede; }
.table1__th { padding: 22px 30px; background-color: #fafafa; border-bottom: 1px solid #dedede; font-size: 14px; color: #222; text-align:left;}
.table1__td { padding: 22px 30px; border-bottom: 1px solid #dedede; }
.input1 { -webkit-box-sizing: border-box; box-sizing: border-box; height: 30px; padding: 5px; border: 1px solid #dddddd; vertical-align: middle; font-size: 14px; line-height: 1; }
.input1 + .input1 { margin-left: 5px; }

.input__form { margin: -7px 0px; font-size: 0; }
.input__form.type-another { position: relative; }
.input__txt { font-size: 14px; vertical-align: middle; }
.input__calender { overflow: hidden; position: relative; left: -1px; display: inline-block; text-indent: -9999px; width: 30px; height: 30px; background-image: url("<%=cp%>/resource/img/strayDog/calender_icon.jpg"); vertical-align: middle; }

.input1 + .input__txt { margin-left: 10px; }

.input__calender + .input__txt { margin-left: 10px; }

.input__wrap { display: inline-block; }
.input__wrap + .input__wrap { margin-top: 5px; }
b, strong { font-weight: bold; }

a { color: inherit; text-decoration: none; }

p { line-height: 1.5; margin: 1em 0; }

input:not([type='checkbox']), input:not([type='radio']), textarea, select { border-radius: 0; }

input:not([type='checkbox']), input:not([type='radio']), textarea, select { -webkit-appearance: none; -moz-appearance: none; appearance: none; }

button, input[type='checkbox'], input[type='radio'], input[type='button'], input[type='submit'], input[type='image'] { cursor: pointer; }

.font1 { font-family: "Nanum Gothic", sans-serif; }

.font2 { font-family: "Open Sans", sans-serif; }

.gray1 { color: #767676; }

.gray2 { color: #222; }

.color1 { color: #1991d7 !important; }

.color2 { color: #009e52; }

.color3 { color: #f24443; }

.h180 { height: 180px !important; }

.h200 { height: 200px !important; }

.hidden { overflow: hidden; position: absolute; width: 0; height: 0; }
.hidden.is-view { position: static; width: auto; height: auto; }
.radio01 { overflow: hidden; position: absolute; top: auto; width: 1px; height: 1px; padding: 0; margin: -1px; border: 0; clip: rect(0, 0, 0, 0); }
  .radio01 + .label01:before { content: ""; position: absolute; top: 4px; left: 0; -webkit-box-sizing: border-box; box-sizing: border-box; width: 12px; height: 12px; margin: auto; border: 1px solid #666; border-radius: 50%; }
  .radio01:checked + .label01:after { content: ""; position: absolute; top: 7px; left: 3px; width: 6px; height: 6px; margin: auto; border-radius: 50%; background: #767676; }
  .radio01 + .label01 { position: relative; font-size: 14px; font-weight: 500; color: #898989; padding-left: 21px; display: inline-block; height: 20px; line-height: 20px; margin-left: 0; cursor: pointer; }
  .radio01 + .label01.other { font-size: 12px; color: #555; line-height: 20px; }
  .radio01 + label + .radio01 + label { margin-left: 20px; } }
.radio01 + label + .radio01 { margin-left: 20px; }
checkbox01 { overflow: hidden; position: absolute; top: auto; width: 1px; height: 1px; padding: 0; margin: -1px; border: 0; clip: rect(0, 0, 0, 0); }
  .checkbox01 + label.solo.type-cart { float: left; width: 0px; margin-top: 15px; padding-left: 12px; }
  .checkbox01 + label { position: relative; margin-left: 0; padding-left: 20px; cursor: pointer; }
  .checkbox01 + label:before { position: absolute; top: 0; bottom: 0; left: 0; -webkit-box-sizing: border-box; box-sizing: border-box; width: 12px; height: 12px; margin: auto; border: 1px solid #dddddd; background-color: #fff; content: ''; cursor: pointer; }
  .checkbox01.type-another + label:before { border: 1px solid #767676; }
  .checkbox01:checked + label:after { position: absolute; top: -3px; left: 2px; bottom: 0; width: 6px; height: 4px; margin: auto; border-left: 2px solid #222; border-bottom: 2px solid #222; -webkit-transform: rotate(-48deg); -ms-transform: rotate(-48deg); transform: rotate(-48deg); background-repeat: no-repeat; cursor: pointer; content: ''; }
  .checkbox01 + label { margin-right: 20px; }
  .checkbox01:last-of-type + label { margin-right: 0; }
  .checkbox01.disabled + label:before { position: absolute; top: 0; bottom: 0; left: 0; -webkit-box-sizing: border-box; box-sizing: border-box; width: 12px; height: 12px; margin: auto; border: 1px solid #dddddd; background-color: #ddd; content: ''; cursor: pointer; } }
.checkbox01 + label.solo { overflow: hidden; text-indent: -9999px; min-height: 12px; width: 0px; }
.checkbox01 + label { display: inline-block; margin-left: 5px; margin-right: 10px; font-size: 14px; }
.textarea1 { height: 300px; padding: 5px; border: 1px solid #ddd; -webkit-box-sizing: border-box; box-sizing: border-box; font-size:13px; }/* 20171023 수정 */
.dash {
    margin: 0px 10px;
    font-size: 14px;
    vertical-align: middle;
}
</style>

<script>
$(document).ready(function(){
	  $("#fdate1").datepicker({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
	  });

	$("#cal").click(function() {
		$("#fdate1").datepicker("show");
	});

});

function memcheck(m) { 
	if (m=="1" && sessionScope.member==null){
		location.href="<%=cp%>/member/login";				
	}
} 

function join(){
	 
	if (document.board.a1.value=="") {
		alert("신청인 성명을 입력해주세요.");
		document.board.a1.focus();
		return;
	}
	if (document.board.a2[0].checked==false && document.board.a2[1].checked==false) {
		alert("성별을 선택해주세요.");
		document.board.a2.focus();
		return;
	}
	if (document.board.a3.value=="") {
		alert("연령을 입력해주세요.");
		document.board.a3.focus();
		return;
	}
	if(isNaN(document.board.a3.value)){
	    document.board.a3.value="";
	    alert("연령은 숫자로만 입력하세요");
		document.board.a3.focus();
	  return;
	}

	if (document.board.a4_1.value=="") {
		alert("전화번호를 입력해주세요.");
		document.board.a4_1.focus();
		return;
	}
	if (document.board.a4_2.value=="") {
		alert("전화번호를 입력해주세요.");
		document.board.a4_2.focus();
		return;
	}	
	if (document.board.a4_3.value=="") {
		alert("전화번호를 입력해주세요.");
		document.board.a4_3.focus();
		return;
	}		
	if (document.board.a5.value=="") {
		alert("이메일을 입력해주세요.");
		document.board.a5.focus();
		return;
	} else {
		var mailArray = document.board.a5.value.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/);
							
		if (mailArray == null) {
			alert("이메일 주소가 잘못 되었습니다. 다시 입력하세요.");
			document.board.a5.focus();
			return;
		}
	}
	if (document.board.a6.value=="") {
		alert("사시는 지역을 입력해주세요.");
		document.board.a6.focus();
		return;
	}
	if (document.board.a7.value=="") {
		alert("봉사 신청 인원 수를 입력해주세요.");
		document.board.a7.focus();
		return;
	}
	if (document.board.a8[0].checked==false && document.board.a8[1].checked==false && document.board.a8[2].checked==false && document.board.a8[3].checked==false) {
		alert("자원봉사 신청 종류를 선택해주세요.");
		document.board.a8[0].focus();
		return;
	}
	if (document.board.a9[0].checked==false && document.board.a9[1].checked==false) {
		alert("자원봉사 경험 유무를 선택해주세요.");
		document.board.a9[0].focus();
		return;
	}
	if (document.board.a10[0].checked==false && document.board.a10[1].checked==false) {
		alert("봉사확인증 필요 유무를 선택해주세요.");
		document.board.a10[0].focus();
		return;
	}
	if (document.board.a11[0].checked==false && document.board.a11[1].checked==false && document.board.a11[2].checked==false && document.board.a11[3].checked==false) {
		alert("희망하는 자원봉사를 선택해주세요.");
		document.board.a11[0].focus();
		return;
	}
	if (document.board.fdate1.value=="") {
		alert("봉사 가능 날짜를 선택하세요.");
		document.board.fdate1.focus();
		return;
	}
	if (document.board.a14.value=="") {
		alert("봉사 가능 시간을 선택하세요.");
		document.board.a14.focus();
		return;
	}	
	if (document.board.a12.value=="") {
		alert("간단하게 자기소개를 입력해주세요.");
		document.board.a12.focus();
		return;
	}
	submit();
}

function submit(){
	var url:"<%=cp%>/strayDog/apply";
	var q = $("form[name=board]").serialize();
	$.ajax({
		type:'post',
		url:url,
		data:q,
		dataType:'json',
		success:function(){
			
		}
	});
}
//-->
</script>

<div class="body-container">
   <div class="content" id="AnimalsContent">
				<h1 class="page-tit">자원봉사신청</h1>

<div class="volunteer">
	<div class="volunteer__info">
		<h2 class="volunteer__tit">반려동물복지센터 봉사신청 안내사항</h2>
		<dl class="volunteer__dl">
			<dt class="volunteer__dt">01 개인 신청은 봉사 희망 일로부터 최소 일주일 전에 해주세요. (일회성 봉사보다 정기봉사 우선 신청 받습니다.)</dt>
			<dd class="volunteer__dd">일일 최대 수용 인원은 10~15명입니다. 봉사 희망 일에 촉박해 신청하시면 인원 마감으로 봉사하실 수 없습니다.</dd>
			<dt class="volunteer__dt color1">02 봉사신청서 작성 후 봉사 가능여부는 신청일 기준 3일 이내에 전화가 아닌 메일로 답변 드립니다.</dt>
			<dd class="volunteer__dd">가능 여부에 대한 소모성 전화가 많아 업무가 가중되고 있으니 정확한 메일 기재 후 메일을 확인해 주세요.</dd>
			<dt class="volunteer__dt">03 처음 방문하는 봉사자는 매주 금,토요일(첫째주 제외) 오후 1시 반~3시 반까지 봉사하실 수 있습니다.</dt>
			<dd class="volunteer__dd">
				- 자원봉사는 동물자유연대 반려동물복지센터(남양주시 화도읍 소재)에서 진행됩니다.<br>
				- 오후 1시 반, 첫 봉사자를 위한 봉사 교육이 있으니 시간을 꼭 지켜주세요.<br>
				- 동물미용봉사(전문가) 신청자는 날짜 상관없이 신청 가능합니다.
			</dd>
			<dt class="volunteer__dt">04 10명 이상 단체봉사는 최소 한 달 전에 신청해 주세요.</dt>
			<dd class="volunteer__dd">단체봉사는 반려동물복지센터 내부 사정에 따라 가능하지 않을 수 있습니다.</dd>
			<dt class="volunteer__dt">05 청소년 동물보호교육+자원봉사 안내</dt>
			<dd class="volunteer__dd">
				- 청소년 동물보호교육은 매월 첫째주 토요일 / 1시 반~3시 반 / 반려동물복지센터(남양주 소재)에서 진행됩니다.<br>
				- 2018년 3월부터 진행되며, 반려동물복지센터 내부 사정으로 교육이 취소될 경우 다음주로 연기되지 않습니다.<br>
				- 보호자(부모님 또는 선생님) 동반 시에만 참여 가능하며, 초등학생은 안전상의 이유로 참여 불가합니다.<br>
				- 일일 최대 참여 인원은 20명입니다.(보호자 10명+학생 10명)<br>
				- 봉사 확인증 발급은 가능하나, 동물자유연대 자체 양식이므로 제출 기관에 가능 여부 확인 후 요청바랍니다. <br>
				&nbsp;&nbsp;(동물자유연대 반려동물복지센터는 1365, VMS 등 자원봉사 포털에 가입되어 있지 않습니다.)
			</dd>

		</dl>
	</div>
	<form name="board">
	<div class="table__area mt50">
		<table class="table1">
			<thead>
				</thead><colgroup>
					<col width="216px">
					<col width="auto">
				</colgroup>
			
			<tbody>
				<tr class="table1__tr">
					<th class="table1__th">회원여부</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="radio" name="mem_check" id="member01" class="radio01" onclick="memcheck(1);">
								<label for="member01" class="label01">회원</label>
							<input type="radio" name="mem_check" id="member02" class="radio01" onclick="memcheck(2);" checked="">
								<label for="member02" class="label01">비회원</label>
						</div>
					</td>
				</tr>

				<tr class="table1__tr">
					<th class="table1__th" >신청인 성명</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd240" name="a1">
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">성별</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="radio" name="a2" id="gender01" class="radio01" value="남"><label for="gender01" class="label01">남</label>
							<input type="radio" name="a2" id="gender02" class="radio01" value="여"><label for="gender02" class="label01">여</label>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">연령</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd60" name="a3">
							<span class="input__txt">세</span>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">전화번호</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd60" name="a4_1">
							<span class="dash">-</span>
							<input type="text" class="input1 wd60" name="a4_2">
							<span class="dash">-</span>
							<input type="text" class="input1 wd60" name="a4_3">
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th" >이메일</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd240" name="a5" value="${sessionScope.member.memberId}">
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">사시는 지역</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd240" name="a6">
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">봉사활동 인원 수</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd60" name="a7">
							<span class="input__txt">명</span>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">자원봉사 신청 종류</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="radio" name="a8" id="service01" class="radio01" value="정기봉사(월1회, 주1회 등)"><label for="service01" class="label01">정기봉사(월1회, 주1회 등)</label>
							<input type="radio" name="a8" id="service02" class="radio01" value="비정기봉사"><label for="service02" class="label01">비정기봉사</label>
							<input type="radio" name="a8" id="service03" class="radio01" value="입양을 전제로한 봉사"><label for="service03" class="label01">입양을 전제로한 봉사</label>
							<input type="radio" name="a8" id="service04" class="radio01" value="동물보호교육"><label for="service04" class="label01">동물보호교육</label>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">자원봉사 경험</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="radio" name="a9" id="experience01" class="radio01" value="유"><label for="experience01" class="label01">유</label>
							<input type="radio" name="a9" id="experience02" class="radio01" value="무"><label for="experience02" class="label01">무</label>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">봉사확인증</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="radio" name="a10" id="necessity01" class="radio01" value="필요함"><label for="necessity01" class="label01">필요함</label>
							<input type="radio" name="a10" id="necessity02" class="radio01" value="필요하지 않음"><label for="necessity02" class="label01">필요하지 않음</label>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">자원봉사 선택</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="checkbox" name="a11" id="option_check_01" class="checkbox01" value="미용"><label for="option_check_01">미용</label>
							<input type="checkbox" name="a11" id="option_check_02" class="checkbox01" value="목욕"><label for="option_check_02">목욕</label>
							<input type="checkbox" name="a11" id="option_check_03" class="checkbox01" value="청소 및 산책"><label for="option_check_03">청소 및 산책</label>
							<input type="checkbox" name="a11" id="option_check_04" class="checkbox01" value="차량봉사 등"><label for="option_check_04">차량봉사 등</label>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">봉사 희망 날짜</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd100" name="fdate1" id="fdate1">
							<a href ="javascript:;" id="cal" class="input__calender">달력선택</a>
							<span class="input__txt">(직접 입력할 땐 2014-01-01 형식으로 입력)</span>
						</div>
					</td>
				</tr>
				<tr class="table1__tr" style="display:none">
					<th class="table1__th">봉사 가능 시간</th>
					<td class="table1__td">
						<div class="input__form wd100">
							<select class="wd100 select30" name="a14" style="display: none;">
								   <option value="3시간">3시간</option>
									<option value="5시간">5시간</option>
									<option value="하루종일">하루종일</option>
							</select><span id="" class="selectboxit-container selectboxit-container" role="combobox" aria-autocomplete="list" aria-haspopup="true" aria-expanded="false" aria-owns="" aria-labelledby=""><span id="" class="selectboxit wd100 select30 selectboxit-enabled selectboxit-btn" name="a14" tabindex="0" unselectable="on"><span class="selectboxit-option-icon-container"><i id="" class="selectboxit-default-icon selectboxit-option-icon selectboxit-container" unselectable="on"></i></span><span id="" class="selectboxit-text" unselectable="on" data-val="3시간" aria-live="polite" style="max-width: 1803px;">3시간</span><span id="" class="selectboxit-arrow-container" unselectable="on"><i id="" class="selectboxit-arrow selectboxit-default-arrow" unselectable="on"></i></span></span><ul class="selectboxit-options selectboxit-list" tabindex="-1" role="listbox" aria-hidden="true"><li data-id="0" data-val="3시간" data-disabled="false" class="selectboxit-option  selectboxit-option-first selectboxit-selected" role="option"><a class="selectboxit-option-anchor"><span class="selectboxit-option-icon-container"><i class="selectboxit-option-icon  selectboxit-container"></i></span>3시간</a></li><li data-id="1" data-val="5시간" data-disabled="false" class="selectboxit-option" role="option"><a class="selectboxit-option-anchor"><span class="selectboxit-option-icon-container"><i class="selectboxit-option-icon  selectboxit-container"></i></span>5시간</a></li><li data-id="2" data-val="하루종일" data-disabled="false" class="selectboxit-option  selectboxit-option-last" role="option"><a class="selectboxit-option-anchor"><span class="selectboxit-option-icon-container"><i class="selectboxit-option-icon  selectboxit-container"></i></span>하루종일</a></li></ul></span>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">간단한 자기소개</th>
					<td class="table1__td">
						<div class="input__form">
							<textarea rows="3" cols="3" class="textarea1 wd100p" name="a12"></textarea>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- //delete__table -->
	<div class="center__group mt40">
		<a href="javascript:join();" class="btn btn1 wd80">확인</a>
		<a href="javascript:document.board.reset();" class="btn btn2 wd80">취소</a>
	</div>
</form>
		</div>
	</div>
</div>
