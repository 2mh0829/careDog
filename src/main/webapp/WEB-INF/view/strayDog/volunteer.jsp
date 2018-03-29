<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="<%=cp%>/resource/css/strayDog/volunteer.css">

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
	 
	if (document.board.name.value=="") {
		alert("신청인 성명을 입력해주세요.");
		document.board.name.focus();
		return;
	}
	if (document.board.gender[0].checked==false && document.board.gender[1].checked==false) {
		alert("성별을 선택해주세요.");
		document.board.gender.focus();
		return;
	}
	if (document.board.age.value=="") {
		alert("연령을 입력해주세요.");
		document.board.age.focus();
		return;
	}
	if(isNaN(document.board.age.value)){
	    document.board.age.value="";
	    alert("연령은 숫자로만 입력하세요");
		document.board.age.focus();
	  return;
	}

	if (document.board.tel_1.value=="") {
		alert("전화번호를 입력해주세요.");
		document.board.tel_1.focus();
		return;
	}
	if (document.board.tel_2.value=="") {
		alert("전화번호를 입력해주세요.");
		document.board.tel_2.focus();
		return;
	}	
	if (document.board.tel_3.value=="") {
		alert("전화번호를 입력해주세요.");
		document.board.tel_3.focus();
		return;
	}		
	if (document.board.email.value=="") {
		alert("이메일을 입력해주세요.");
		document.board.email.focus();
		return;
	} else {
		var mailArray = document.board.email.value.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/);
							
		if (mailArray == null) {
			alert("이메일 주소가 잘못 되었습니다. 다시 입력하세요.");
			document.board.email.focus();
			return;
		}
	}
	if (document.board.area.value=="") {
		alert("사시는 지역을 입력해주세요.");
		document.board.area.focus();
		return;
	}
	if (document.board.peopleCnt.value=="") {
		alert("봉사 신청 인원 수를 입력해주세요.");
		document.board.peopleCnt.focus();
		return;
	}
	if (document.board.vKind[0].checked==false && document.board.vKind[1].checked==false && document.board.vKind[2].checked==false && document.board.vKind[3].checked==false) {
		alert("자원봉사 신청 종류를 선택해주세요.");
		document.board.vKind[0].focus();
		return;
	}
	if (document.board.experience[0].checked==false && document.board.experience[1].checked==false) {
		alert("자원봉사 경험 유무를 선택해주세요.");
		document.board.experience[0].focus();
		return;
	}
	if (document.board.necessity[0].checked==false && document.board.necessity[1].checked==false) {
		alert("봉사확인증 필요 유무를 선택해주세요.");
		document.board.necessity[0].focus();
		return;
	}
	if (document.board.vOption[0].checked==false && document.board.vOption[1].checked==false && document.board.vOption[2].checked==false && document.board.vOption[3].checked==false) {
		alert("희망하는 자원봉사를 선택해주세요.");
		document.board.vOption[0].focus();
		return;
	}
	if (document.board.fdate1.value=="") {
		alert("봉사 가능 날짜를 선택하세요.");
		document.board.fdate1.focus();
		return;
	}
	if (document.board.time.value=="") {
		alert("봉사 가능 시간을 선택하세요.");
		document.board.time.focus();
		return;
	}	
	if (document.board.selfIntroduce.value=="") {
		alert("간단하게 자기소개를 입력해주세요.");
		document.board.selfIntroduce.focus();
		return;
	}
	submitOk();
}

function submitOk(){
	var f = document.board;
	f.action = "<%=cp%>/strayDog/apply";
	f.submit();
	return true;
}

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
				- 자원봉사는 careDog 반려동물복지센터(남양주시 화도읍 소재)에서 진행됩니다.<br>
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
				- 봉사 확인증 발급은 가능하나, careDog 자체 양식이므로 제출 기관에 가능 여부 확인 후 요청바랍니다. <br>
				&nbsp;&nbsp;(careDog 반려동물복지센터는 1365, VMS 등 자원봉사 포털에 가입되어 있지 않습니다.)
			</dd>

		</dl>
	</div>
	<form name="board" method="post">
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
							<input type="text" class="input1 wd240" name="name">
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">성별</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="radio" name="gender" id="gender01" class="radio01" value="남"><label for="gender01" class="label01">남</label>
							<input type="radio" name="gender" id="gender02" class="radio01" value="여"><label for="gender02" class="label01">여</label>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">연령</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd60" name="age">
							<span class="input__txt">세</span>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">전화번호</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd60" name="tel_1">
							<span class="dash">-</span>
							<input type="text" class="input1 wd60" name="tel_2">
							<span class="dash">-</span>
							<input type="text" class="input1 wd60" name="tel_3">
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th" >이메일</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd240" name="email" value="${sessionScope.member.email}">
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">사시는 지역</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd240" name="area">
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">봉사활동 인원 수</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="text" class="input1 wd60" name="peopleCnt">
							<span class="input__txt">명</span>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">자원봉사 신청 종류</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="radio" name="vKind" id="service01" class="radio01" value="정기봉사(월1회, 주1회 등)"><label for="service01" class="label01">정기봉사(월1회, 주1회 등)</label>
							<input type="radio" name="vKind" id="service02" class="radio01" value="비정기봉사"><label for="service02" class="label01">비정기봉사</label>
							<input type="radio" name="vKind" id="service03" class="radio01" value="입양을 전제로한 봉사"><label for="service03" class="label01">입양을 전제로한 봉사</label>
							<input type="radio" name="vKind" id="service04" class="radio01" value="동물보호교육"><label for="service04" class="label01">동물보호교육</label>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">자원봉사 경험</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="radio" name="experience" id="experience01" class="radio01" value="유"><label for="experience01" class="label01">유</label>
							<input type="radio" name="experience" id="experience02" class="radio01" value="무"><label for="experience02" class="label01">무</label>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">봉사확인증</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="radio" name="necessity" id="necessity01" class="radio01" value="필요함"><label for="necessity01" class="label01">필요함</label>
							<input type="radio" name="necessity" id="necessity02" class="radio01" value="필요하지 않음"><label for="necessity02" class="label01">필요하지 않음</label>
						</div>
					</td>
				</tr>
				<tr class="table1__tr">
					<th class="table1__th">자원봉사 선택</th>
					<td class="table1__td">
						<div class="input__form">
							<input type="checkbox" name="vOption" id="option_check_01" class="checkbox01" value="미용"><label for="option_check_01">미용</label>
							<input type="checkbox" name="vOption" id="option_check_02" class="checkbox01" value="목욕"><label for="option_check_02">목욕</label>
							<input type="checkbox" name="vOption" id="option_check_03" class="checkbox01" value="청소 및 산책"><label for="option_check_03">청소 및 산책</label>
							<input type="checkbox" name="vOption" id="option_check_04" class="checkbox01" value="차량봉사 등"><label for="option_check_04">차량봉사 등</label>
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
							<select class="wd100 select30" name="time" style="display: none;">
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
							<textarea rows="3" cols="3" class="textarea1 wd100p" name="selfIntroduce"></textarea>
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
