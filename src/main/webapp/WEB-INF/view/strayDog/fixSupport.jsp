<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.wrap_sub {width:100%; height:auto; min-width:1100px; overflow-x:hidden; background:#fcfcfc; min-height:800px;}
 .board_request {width:1100px; height:auto; margin:40px auto 50px auto;}
.board_request table {width:100%; border-collapse:collapse; margin-bottom:20px;}
.board_request table thead , .board_request table tbody {border-top:3px solid #26579c;}
.board_request table thead + tbody {border-top:0;}
.board_request table thead th, .board_request table tbody th{background:#f3f3f3; border-bottom:1px solid #ccc;font-family: 'NanumGothicWeb'!important; line-height:40px; font-weight:normal;}
.board_request table span {color:#26579c;}
.board_request table span b {font-family: 'NanumGothicWebBold'!important; font-weight:normal; color:#444;}
.board_request table thead th img {vertical-align:middle; margin-right:5px;}
.board_request table td {text-align:left; font-size:16px; color:#444; line-height:40px; background:#fff; border-bottom:1px solid #ccc; padding:10px; }
.board_request table td button {background:#26579c; color:#fff; text-align:center; width:112px; height:35px; font-size:14px; display:inline-block; vertical-align:middle;margin-bottom:10px;}
.board_request table td input[type="text"] ,.board_request table td select {width:390px;height:33px; border:1px solid #ccc; background:#fff; padding:0 5px;}
.board_request table td input[type="text"].full {width:99%;}
.board_request table td input[type="text"].num {width:120px; display:inline-block; vertical-align:middle;}
.board_request table td input[type="text"].post {width:255px; display:inline-block; vertical-align:middle; }
.board_request table td input[type="text"].mb {margin-bottom:10px;}
.board_request table td label {font-size:16px; color:#444;margin-right:15px; margin-left:5px; display:inline-block; vertical-align:middle;}
.board_request table td textarea {padding:5px; font-size:16px; color:#444; background:#fff!important;}

.request_info {background:#fff; font-size:16px; color:#666; line-height:30px; border:2px solid #ccc; padding:20px; margin-bottom:20px;}
.request_info strong {font-family: 'NanumGothicWebBold'!important; font-weight:normal; color:#444;}
.request_info span {color:#26579c;}
.request_info u {text-decoration:none; border-bottom:1px solid #666;}
 h1 {font-size:24px; color:#26579c; font-family: 'NanumGothicWebBold'!important; padding:35px 0 25px 0; position:relative;}
h1 a {color:#26579c; font-family: 'NanumGothicWebBold'!important; }
h1 a {position:absolute;top:-145px;}
h1 span {font-size:16px; color:#444;}
p {font-size:16px; color:#444; line-height:30px;}
p span {font-size:24px; color:#64afd7; font-family: 'NanumGothicWebBold'!important; }
p i {background:url(../images_new/sub/sub_bullet.jpg) left center no-repeat; width:10px; height:30px; margin-right:5px; display:block; float:left;}
 input[type="text"]{height:21px;padding-top:2px;padding-bottom:2px;border:1px solid #dfdfdf;vertical-align:middle;color:#666;background:#f3f3f3;}
input[type="number"]{height:21px;padding-top:2px;padding-bottom:2px;border:1px solid #dfdfdf;vertical-align:middle;color:#666;background:#f3f3f3;}
input[type="tel"]{height:21px;padding-top:2px;padding-bottom:2px;border:1px solid #dfdfdf;vertical-align:middle;color:#666;background:#f3f3f3;}
input[type="email"]{height:21px;padding-top:2px;padding-bottom:2px;border:1px solid #dfdfdf;vertical-align:middle;color:#666;background:#f3f3f3;}
input[type="password"]{height:21px;padding-top:2px;padding-bottom:2px;border:1px solid #dfdfdf;vertical-align:middle;color:#666;background:#f3f3f3;}
input[type="file"]{height:21px;padding-top:2px;padding-bottom:2px;border:1px solid #dfdfdf;vertical-align:middle;color:#666;background:#f3f3f3;}
input[type="checkbox"]{vertical-align:middle;}
input[type="radio"]{vertical-align:middle;}
select{border:1px solid #dfdfdf;height:26px;vertical-align:middle;color:#666;background:#f3f3f3;}
textarea{padding-top:2px;resize:none;border:1px solid #dfdfdf;color:#666;background:#f3f3f3;}
img,fieldset{border:0;}
/*img{vertical-align:top;}*/
ul,ol,menu{list-style:none;margin:0;padding:0;}  
em,address{font-style:normal;}
caption{position:absolute;top:-1000em;left:-1000em;width:0;height:0;overflow:hidden;font-size:0;color:#fff;line-height:0;text-indent:-1000em;}
a{text-decoration:none;cursor:pointer;/*outline:none;*/}  
a:hover,a:active{text-decoration:none;}
.b {font-weight:bold;}
body {height:100%; line-height:18px; -webkit-text-size-adjust:none;margin:0;padding:0;}
body, p, h1, h2, h3, h4, h5, h6, table, th, td, form, fieldset, legend, input, textarea, button,pre {margin:0; padding:0; -webkit-text-size-adjust:none;
-webkit-margin-before: 0px;
-webkit-margin-after: 0px;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;}
button { cursor:pointer;}
textarea, select, button, table {font-family:inherit; font-size:inherit; line-height:inherit;}
legend{display:none; overflow:hidden; visibility:hidden; height:0; font-size:0; line-height:0;} /* For Screen Reader */
img, fieldset, button {border:0;}
img{vertical-align:middle;}
fieldset, button, input {vertical-align:middle;}
ul, ol, li, dl, dt, dd {list-style:none;margin:0;padding:0;}
em, i, address {font-style:normal; font-weight:normal;}
textarea, button {line-height:1.2; /* 입력폼에서 춤추지 않는 최소 줄간 1.2 */ vertical-align: bottom;}
input {vertical-align:middle;border:none;background:none;}
label {cursor:pointer; vertical-align:middle;}
a {text-decoration:none; color:#555;}
a:hover, a:active, a:focus {text-decoration:none; color:#555;}
.fixed {table-layout:fixed;} /* table사이즈를 고정 */
.hide {width:1px; height:1px; overflow:hidden; visibility:hidden; font-size:0; line-height:0;}
.dnone{display:none; overflow:hidden; visibility:hidden; height:0; font-size:0; line-height:0;}
.alternate{/*display:none; overflow:hidden; visibility:hidden; height:0; font-size:0; line-height:0;*/position:absolute;top:-1000em;left:-1000em;width:0;height:0;overflow:hidden;font-size:0;color:#fff;line-height:0;text-indent:-1000em;}
iframe{border:none;overflow-y:hidden}
.both{
	clear:both;
	overflow:hidden;
	width:100%;
}
a:focus , button:focus {outline:1px dotted #ccc;}
/* Tag Standard ***********************************************************************/
/* Tag그룹요소 */
div {  } /* block */ 
span {  } /* inline */

/* Tag표제(Heading) */
h1, h2, h3 { margin: 0; padding: 0; font-weight: normal; font-size: 0%; line-height:20px; } 

/* Tag문단(Paragraph) */
p {  }

/* Tag구문(Construction) */
strong {font-family: 'NanumGothicWebBold' !important; } /* 강조 */
::selection {
    background: #26579c;
    color: #fff;
}
.btn_area {width:1100px; height:auto; margin:40px auto 50px auto; text-align:right;}
.btn_area a {width:88px; height:33px; line-height:35px; display:inline-block; vertical-align:top; color:#26579c; border:1px solid #26579c; background:#fff; text-align:center; margin-left:5px; font-size:16px;}


</style>
<div class="body-container">
	<div class="wrap_sub">
<script>
/* 결제 요청 함수 (결제창 호출) */
	function reqPayment2() {
		var f = document.writeform;
		if(f.paymode.value == ""){ alert("후원방법을 선택하세요."); f.paymode.focus(); }
		else if(f.pmoney.value == "" || f.pmoney.value == ""){ alert("매월 후원하실 금액을 입력하세요."); f.pmoney.focus(); }
//		else if(f.prodname.value == ""){ alert("후원종류를 선택하세요."); f.prodname.focus(); }
		else if(f.Install.value == "" || f.totalAmount.value == ""){ alert("계산하기 버튼을 클릭하세요."); return false; }
		else if(f.pname.value == ""){ alert("후원자 성명을 입력하세요."); f.pname.focus(); }
		else if(f.phone1.value == ""){ alert("후원자 연락처를 입력하세요."); f.phone1.focus(); }
		else if(f.phone2.value == ""){ alert("후원자 연락처를 정확히 입력하세요."); f.phone2.focus(); }
		else if(f.phone3.value == ""){ alert("후원자 연락처를 정확히 입력하세요."); f.phone3.focus(); }
//		else if(f.email.value == ""){ alert("후원자 이메일을 입력하세요."); f.email.focus(); }

//		else if(f.zipcode.value == ""){ alert("후원자 우편번호를 입력하세요."); f.zipcode.focus(); }
//		else if(f.addr.value == ""){ alert("후원자 주소를 입력하세요."); f.addr.focus(); }

//		else if(f.pstartdate.value == ""){ alert("납부 시작일을 입력하세요."); f.pstartdate.focus(); }
		else if(f.s_date.value == ""){ alert("자동결제일을 입력하세요."); f.s_date.focus(); }
		else if(f.agree.checked != true){ alert("자동결제에 동의하셔야 합니다."); }
		else{		

			initValue();
			setSmode(); // 예제 테스트를 위한 함수 (Smode_tmp->Smode)	

			$("#writeform").attr("target", "hidden_page");
			$("#writeform").attr("action", "./pay_f2.php").submit();

//			document.charset="euc-kr";
			var form = document.payform;
			
			PAY_REQUEST(form);
		}
	}
    
    /**
        거래시간은 편의상 구매자 PC 시간을 사용합니다.
        실제로는 쇼핑몰 서버의 시간을 사용해야 합니다.
    */
    function setTxTime() {
        var time = new Date();
        var year = time.getYear() + "";
        var month = time.getMonth()+1;
        var date = time.getDate();
        var hour = time.getHours();
        var min = time.getMinutes();
        var sec = time.getSeconds();
        if(month<10) month = "0" + month;
        if(date<10) date = "0" + date;
        if(hour<10) hour = "0" + hour;
        if(min<10) min = "0" + min;
        if(sec<10) sec = "0" + sec;       
        return year + month + date + hour + min + sec;
    }

    /**    
        거래번호(MxIssueNO), 거래일시(MxIssueDate) 생성 예제
        예제에서는 편의상 거래시간을 거래번호로 사용합니다.
        실제로는 쇼핑몰의 고유 주문번호를 사용해야 합니다. 
    */    
    function initValue() {
        var tmp = setTxTime();
        document.payform.MxIssueNO.value = "KRM_"+tmp;
        document.payform.MxIssueDate.value = tmp;
        document.writeform.MxIssueNO.value = "KRM_"+tmp;
        document.writeform.MxIssueDate.value = tmp;
    }

    /**
        예제 테스트를 위해, 선택한 결제 수단 값(Smode_tmp)을 Smode에 설정
        실제로, Smode1 ~ Smode8은 hidden으로 설정
    */
    function setSmode() {
        document.payform.Smode.value = document.writeform.paymode.value;
		document.payform.Amount.value = document.writeform.pmoney.value;
		document.payform.AutoBillAmount.value = document.writeform.pmoney.value;
		document.payform.CcProdDesc.value = document.writeform.prodname.value;
		document.payform.CcNameOnCard.value = document.writeform.pname.value;

		document.payform.PhoneNO.value = document.writeform.phone1.value + "-" + document.writeform.phone2.value + "-" + document.writeform.phone3.value;

		document.payform.email.value = document.writeform.email.value;
		document.payform.ZipCode.value = document.writeform.zipcode.value;
		document.payform.Addr.value = document.writeform.addr.value + " " + document.writeform.addr2.value;

		var bill_date_chk = document.writeform.s_date.value;
		var bill_date = bill_date_chk.substr(8,2);
		document.payform.AutoBillDate.value = bill_date; // 결제일

		var bill_sdate_chk = document.writeform.s_date.value;
		var bill_sdate = bill_sdate_chk.replace(/[^0-9]/g,'');

		var bill_edate_chk = document.writeform.e_date.value;
		var bill_edate = bill_edate_chk.replace(/[^0-9]/g,'');
		
		document.payform.AutoBillSDate.value = bill_sdate; // 시작일
		document.payform.AutoBillEDate.value = bill_edate; // 종료일

//		document.payform.AutoBillSDate.value = document.writeform.s_date.value;
//		document.payform.AutoBillEDate.value = document.writeform.e_date.value;

		document.payform.ItemInfo.value = "1|"+document.writeform.pmoney.value+"|1|12S0Hz0000|karma868";//핸드폰결제정보
		

		document.payform.MSTR.value = document.writeform.paymode.value + "| " + document.writeform.pmoney.value + "| " + document.writeform.prodname.value + "| " + document.writeform.pname.value + "| " + document.writeform.phone1.value + "-" + document.writeform.phone2.value + "-" + document.writeform.phone3.value + "| " + document.writeform.zipcode.value + "| " + document.writeform.addr.value + " " + document.writeform.addr2.value + "| " + document.writeform.email.value + "| " + document.writeform.s_date.value + "| " + document.writeform.Install.value;

		document.payform.UserName.value = document.writeform.pname.value;
		document.payform.UserEMail.value = document.writeform.email.value;
		document.payform.UserPhone.value = document.writeform.phone1.value + "-" + document.writeform.phone2.value + "-" + document.writeform.phone3.value;
    }
	
</script>          
<!-- 폼 시작 -->      
<form name="payform" method="post">
<!-- 결제 결과의 REDIRPATH 페이지 전송을 위한 parameter 시작 (수정하지 말것) -->
    <input type="hidden" name="ReplyCode" value="">
    <input type="hidden" name="ReplyMessage" value="">
    <input type="hidden" name="CcCode" value="">
	<input type="hidden" name="Installment" value="">
    <input type="hidden" name="TxNO" value="">
<!-- 결제 결과의 REDIRPATH 페이지 전송을 위한 parameter 끝 -->

<!-- 
    #################### 서비스별 Smode 설명 ####################
    3001 : 신용카드 - dbpath 비정상 응답 시, '결과확인요망'으로 상태 저장
    3005 : 신용카드 - dbpath 비정상 응답 등, 결과 응답 메시지 무시
    3007 : 신용카드 - dbpath 비정상 응답 시, 자동 취소
    2500 : 금결원 계좌이체 - dbpath 비정상 응답 시, '결과확인요망'으로 상태 저장
    2501 : 금결원 계좌이체 - dbpath 비정상 응답 시, 자동 취소
    2201 : 핑거 계좌이체 - 신규 서비스 종료
    2401 : 뱅크타운 계좌이체 - 신규 서비스 종료
    6101 : 휴대폰결제 - 결제 금액의 이동 통신사 통신료 합산 과금 서비스
    8801 : ARS전화결제 - 결제 금액의 한국통신(KT) 통신료 합산 과금 서비스
    2601 : 가상계좌 - 가상계좌 번호 부여 및 자동 입금 통보 서비스
    5101 : 상품권 - 도서상품권 및 해피머니, 틴캐쉬를 이용한 지불 서비스
    5301 : 복합결제 - 신규 서비스 종료
    0001 : 현금영수증 - 무통장 입금에 대한 현금 영수증 무료 발행 서비스(구매자 입력 방식)
    0002 : 현금영수증 - 무통장 입금에 대한 현금 영수증 무료 발행 서비스(업체 전송 방식)
    0003 : 현금영수증 - 현금 영수증 발급 취소
    #############################################################
-->

<!-- 해당되는 결제 수단의 parameter를 다음과 같이 설정합니다. -->
<!-- parameter에 대한 자세한 설명은 매뉴얼을 참고 바랍니다. -->

<!-- 공통 parameter 설정 시작 -->
    <input type="hidden" name="MxID" value="karma868"> <!-- 가맹점 ID -->
    <input type="hidden" name="MxIssueNO"> <!-- 거래 번호(가맹점 생성) -->
    <input type="hidden" name="MxIssueDate"> <!-- 거래 일자(가맹점 생성, YYYYMMDDhhmmss) -->
    <input type="hidden" name="Amount" value=""> <!-- 거래 금액 -->    
    <input type="hidden" name="Currency" value="KRW"> <!-- 화폐 구분 -->
    <input type="hidden" name="CcMode" value="11"> <!-- 거래 모드(신용카드-'00':데모,'11':실거래 | 기타거래-'10':실거래) -->
    
    <input type="hidden" name="Smode"> <!-- 결제 수단 구분(위의 설명) -->
    <input type="hidden" name="CcProdDesc"> <!-- 상품명 -->
    <input type="hidden" name="CcNameOnCard"> <!-- 구매자 성명 -->
    <input type="hidden" name="MSTR" value="TEST"> <!-- 가맹점 return 값, DBPATH로 전달-->
    <input type="hidden" name="MSTR2" value="TEST"> <!-- 가맹점 return 값, REDIRPATH로 전달-->
    
    <input type="hidden" name="URL" value="www.karma.or.kr"> <!-- 가맹점 서버 URL('http://' 제외, 예:'www.test.com') -->
	<input type="hidden" name="DBPATH" value="/Account/dbpath2.php">
	<input type="hidden" name="REDIRPATH" value="/Account/redirpath">
    <input type="hidden" name="connectionType" value="http"> <!-- 가맹점 서버 프로토콜(http, https) -->
    
    <input type="hidden" name="bannerImage" value=""> <!-- 결제 창 로고 이미지(124 X 28) 경로 -->
    <input type="hidden" name="signType" value="1"> <!-- 암호화 결정(1:비암호화, 2:암호화-JSP만 해당) -->
    <input type="hidden" name="dbpathType" value=""> <!-- 소켓방식 사용여부('tls':사용) -->
    <input type="hidden" name="tgssl_ip" value=""> <!-- 소켓방식 사용시, 서버 IP -->
    <input type="hidden" name="tgssl_port" value=""> <!-- 소켓방식 사용시, 서버 Port -->
        
    <input type="hidden" name="Smode1" value=""> <!-- 결제 창에 타 결제 수단 이동 버튼 추가 -->
    <input type="hidden" name="Smode2" value="">
    <input type="hidden" name="Smode3" value="">
    <input type="hidden" name="Smode4" value="">
    <input type="hidden" name="Smode5" value="">
    <input type="hidden" name="Smode6" value="">
    <input type="hidden" name="Smode7" value="">
    <input type="hidden" name="Smode8" value="">
<!-- 공통 parameter 설정 끝 --> 

<!-- 신용카드 parameter 설정 시작 -->
    <input type="hidden" name="PID" value="-"> <!-- 사용자 주민등록번호('-' 생략) -->
    <input type="hidden" name="PhoneNO" value=""> <!-- 사용자 전화번호 -->
    <input type="hidden" name="Country" value="KR"> <!-- 배송지 국가코드('KR') -->
    <input type="hidden" name="ZipCode" value=""> <!-- 배송지 우편번호 -->
    <input type="hidden" name="Addr" value=""> <!-- 배송지 주소(한글 32자까지) -->
    <input type="hidden" name="Install" value=""> <!-- 할부개월(기본:전체개월, 예-'0:2:3':3개월까지) -->

    <input type="hidden" name="email" value=""> <!-- 결제 결과를 전달받을 사용자 email 주소 -->
    <input type="hidden" name="BillType" value="00"> <!-- 출력 영수증 구분('00':과세, '10':비과세) -->
    <input type="hidden" name="InstallType" value="00"> <!-- 가맹점 할부 수수료 부담('00':미부담, '01':부담) -->
    <input type="hidden" name="PAN" value=""><!-- 결제 카드사 지정(선택) -->
<!-- 신용카드 parameter 설정 끝 --> 


<!-- 휴대폰결제 parameter 설정 시작 -->
    <input type="hidden" name="ItemType" value="Amount"> <!-- 핸드폰 결제 고정값 -->
    <input type="hidden" name="ItemCount" value="1"> <!-- 핸드폰 결제 고정값 -->
    <input type="hidden" name="ItemInfo" value=""> <!-- 종류|금액|1|상품코드|가맹점 -->
<!-- 휴대폰결제 parameter 설정 끝 -->

<!-- 자동결제 파라미터 설정 시작 -->
	<input type="hidden" name="AutoBillAmount" value=""> <!-- 자동결제금액 -->
	<input type="hidden" name="AutoBillDate" value=""> <!-- 자동결제일자 -->
	<input type="hidden" name="AutoBillSDate" value=""> <!-- 자동결제시작일 -->
	<input type="hidden" name="AutoBillEDate" value=""> <!-- 자동결제종료일 -->
<!-- 자동결제 파라미터 설정 종료 -->

    <input type="hidden" name="ReqType" value="0"> <!--  용도 구분 (0:소득공제 용, 1:비용처리 용)  -->
    <input type="hidden" name="PIDS" value="2098260407"> <!--  본인정보:주민번호/사업자번호/전화번호 등 ('-'생략) 13byte -->
    <input type="hidden" name="UserName"> <!--  발급 대상자 이름 30byte -->
    <input type="hidden" name="UserEMail"> <!--  발급 대상자 email 32byte -->
    <input type="hidden" name="UserPhone"> <!--  발급 대상자 연락처 ('-'생략) 15byte -->

</form> 

<div class="board_request">
	<h1>정기후원 신청</h1>	
	<form name="writeform" id="writeform" method="post">
		<input type="hidden" name="MxIssueNO"> <!-- 거래 번호(가맹점 생성) -->
		<input type="hidden" name="MxIssueDate"> <!-- 거래 일자(가맹점 생성, YYYYMMDDhhmmss) -->
		<input type="hidden" name="bid" value="Obb">
		<table cellpadding="0" cellspacing="0" summary="정기후원신청 게시판입니다.">
			<caption>정기후원신청</caption><caption>
			</caption><colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="30%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">후원방법</th>
					<td>
						<label for="paymode" class="alternate">후원방법</label>
						<select name="paymode" id="paymode">
							<option value="3007" selected="selected">신용카드 </option>
							<!-- option value="6101">핸드폰결제 </option -->
							</select>
					</td>
					<th scpoe="row">후원분류</th>
					<td>
						<label for="prodname" class="alternate">후원분류</label>
						<input type="text" name="prodname" id="prodname" maxlength="100" value="정기후원" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th scope="row">후원금액</th>
					<td colspan="3">
						매월: 
						<label for="pmoney" class="alternate">후원금액</label>
						<input type="text" maxlength="10" name="pmoney" id="pmoney" value=""> 원 
						<span>※ 콤마 없이 숫자만 입력</span>
					</td>
				</tr>
				<tr>
					<th scope="row">첫 결제일</th>
					<td colspan="3">
						<label for="s_date" class="alternate">첫 결제일</label>
						<input type="text" id="s_date" name="s_date" style="ime-mode:disabled" value="2018-03-10" readonly=""> 
					</td>
				</tr>
				<tr>
					<th scope="row">최종 결제일</th>
					<td colspan="3">
						<label for="e_date" class="alternate">최종 결제일</label>
						<input type="text" id="e_date" name="e_date" style="ime-mode:disabled" value="2018-05-11" readonly="" maxlength="10"> 
						<img src="<%=cp%>/resource/img/strayDog/btn_month.jpg" style="cursor:pointer" id="e_date_Icon">&nbsp;&nbsp;
						<button type="button" onclick="cal();" style="margin-bottom:0;">계산하기</button><br>
						<span>※ 최종결제일은 결제일자의 다음날이어야 합니다.<br>
						예: 첫 결재일이 <b>21</b>일이면 최종 결재일은 <b>22</b>일</span>
					</td>
				</tr>
				<tr>
					<th scope="row">납부개월 수</th>
					<td>
						총: 
						<label for="Install" class="alternate">납부개월 수</label>
						<input type="text" maxlength="10" id="Install" name="Install" value="" placeholder="자동입력" readonly="" class="num">
						개월
					</td>
					<th scope="row">총 금액</th>
					<td>
						총: 
						<label for="totalAmount" class="alternate">총금액</label>
						<input type="text" maxlength="10" id="totalAmount" name="totalAmount" value="" placeholder="자동입력" readonly="" class="num">
						원
					</td>
				</tr>
				<tr>
					<th scope="row">성명</th>
					<td colspan="3">
						<label for="pname" class="alternate">성명</label>
						<input type="text" name="pname" id="pname" size="15" value="" style="ime-mode:active;">
					</td>
				</tr>
				<tr>
					<th scope="row">연락처</th>
					<td colspan="3">
						<label for="phone1" class="alternate">연락처 앞자리</label>
						<input type="text" maxlength="3" name="phone1" id="phone1" value="" style="ime-mode:inactive;" class="num">
						&nbsp;-&nbsp;
						<label for="phone2" class="alternate">연락처 중간자리</label>
						<input type="text" maxlength="4" name="phone2" id="phone2" value="" style="ime-mode:inactive;" class="num">
						&nbsp;-&nbsp;
						<label for="phone2" class="alternate">연락처 뒷자리</label>
						<input type="text" maxlength="4" name="phone3" id="phone3" value="" style="ime-mode:inactive;" class="num">
					</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td colspan="3">
						<label for="email" class="alternate">이메일</label>
						<input type="text" maxlength="100" name="email" value="" style="ime-mode:inactive;">
					</td>
				</tr>
				<tr>
					<th scope="row">주소</th>
					<td colspan="3">			
						<label for="sample6_postcode" class="alternate">우편번호</label>
						<input type="text" id="sample6_postcode" name="zipcode" value="" maxlength="7" class="post mb">
						<button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
						<label for="sample6_address" class="alternate">주소</label>
						<input type="text" id="sample6_address" name="addr" value="" class="full mb" placeholder="주소">
						<label for="sample6_address2" class="alternate">상세주소</label>
						<input type="text" id="sample6_address2" style="ime-mode:active" name="addr2" value="" class="full mb" placeholder="상세주소">	
					</td>
				</tr>
				<tr>
					<th scope="row">동의</th>
					<td colspan="3">
						<input type="checkbox" name="agree" id="agree"><label for="agree">선택한 후원방법에 따라 자동결제되는 것에 동의합니다.</label>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="btn_area">
			<a href="javascript:void(0);" onclick="reqPayment2();">결제</a>
			<a href="javascript:void(0);" onclick="history.go(-1);">취소</a>
		</div><!--E:btn_area-->
	</form>
	<div class="request_info">
		<span>※ 결제사에서 제공하는 결제모듈은 인터넷익스플로러 11까지만 지원됩니다. 엣지에서는 아직 지원되지 않습니다.</span>
	</div><!--E:request_info-->
</div><!--E:board_request-->


	




<script>
	$(document).ready(function(){

		CalAddCss();
//		initCal({id:"s_date",type:"day",today:"y"});
		initCal({id:"e_date",type:"day",today:"y"});

	});


	function chkForm(fm) {

		if(fm.use_sdate.value=="") {
			alert("결재 날짜를 선택해 주세요.");
			fm.use_sdate.focus();
			return false;
		}

	}

function cal() 
{ 
var input1 = document.getElementById('s_date').value;
var input2 = document.getElementById('e_date').value;

var day = 1000*60*60*24;
var month = day*30;
var year = month*12;

var date1 = new Date(input1.substr(0,4),input1.substr(5,2)-1,input1.substr(8,2));
var date2 = new Date(input2.substr(0,4),input2.substr(5,2),input2.substr(8,2));
var date1_chk = input1.substr(8,2);
var date2_chk = input2.substr(8,2);
var month1_chk = input1.substr(0,7);
var month2_chk = input2.substr(0,7);

var newDate = new Date();
var yy = newDate.getFullYear();
var mm = newDate.getMonth()+1;
if (mm < 10)
{
	mm = "0" + mm;
}
var dd = newDate.getDate();
if (dd < 10)
{
	dd = "0" + dd;
}

var toDay = yy + "-" + mm + "-" + dd;

//alert(toDay);
//alert(date2_chk);
	if(input1 < toDay) {
		alert(toDay);
		document.writeform.s_date.focus();
		document.getElementById('Install').value = "";
		document.getElementById('totalAmount').value = "";
		return false;
	}

	if(month1_chk == month2_chk) {
		alert("오류! 첫 결제 연월이 최종결제 연월과 같습니다.");
		document.writeform.e_date.focus();
		document.getElementById('Install').value = "";
		document.getElementById('totalAmount').value = "";

		return false;
	}

	if(date1_chk >= 28) {
		alert("결제일자는 1일에서 27일 사이 날짜를 선택하셔야 합니다.");
		document.writeform.s_date.focus();
		document.getElementById('Install').value = "";
		document.getElementById('totalAmount').value = "";
		return false;
	}

	if(date1_chk >= date2_chk) {
		alert("최종결제일자는 첫 결제일자의 다음날짜이어야 합니다.");
		document.writeform.e_date.focus();
		document.getElementById('Install').value = "";
		document.getElementById('totalAmount').value = "";
		return false;
	}

var interval = date2 - date1;

	if(parseInt(interval/month) < 3) {
		alert("정기후원은 3개월 이상이어야 합니다.");
		document.writeform.e_date.focus();
		return false;
	}
//alert("개월수: " + parseInt(interval/month) + "개월");

document.getElementById('Install').value = parseInt(interval/month);
document.getElementById('totalAmount').value = document.getElementById('Install').value * document.getElementById('pmoney').value;

} 

</script>
</div>
</div>