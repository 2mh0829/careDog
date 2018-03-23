<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
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
