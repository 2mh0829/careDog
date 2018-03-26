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
.table1 { width: 100%; border-spacing: 0; border-collapse: collapse; text-align: left; }
.table1__tr { border-top: 1px solid #dedede; }
.table1__th { padding: 22px 30px; background-color: #fafafa; border-bottom: 1px solid #dedede; font-size: 14px; color: #222; text-align:left;}
.table1__td { padding: 22px 30px; border-bottom: 1px solid #dedede; }
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

<!-- 결제 모듈 라이브러리 -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 결제 모듈 -->
<script>
var IMP = window.IMP; // 생략가능
$(document).ready(function(){
	IMP.init('imp89857995'); //가맹점 식별코드 
	
	$(".payAll").on("click",function(){
		var f = document.forms.writeform;
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '정기후원',
		    amount : f.pmoney.value,
		    buyer_email : f.email.value,
		    buyer_name : f.pname.value,
		    buyer_tel : f.phone1.value+'-'+f.phone2.value+'-'+f.phone3.value,
		    buyer_addr : f.addr.value+' '+f.addr2.value,
		    buyer_postcode : f.zipcode.value,
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	});
});
</script>

<!-- datepicker -->
<script>
$(document).ready(function(){
	  $("#e_date").datepicker({
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

	$("#e_date_Icon").click(function() {
		$("#e_date").datepicker("show");
	});

});
</script>

<div class="body-container">
<div class="wrap_sub">
<div class="board_request">
	<h1>정기후원 신청</h1>	
	<form name="writeform" id="writeform" method="post">
		<table class="table1 mt10">
			<caption>정기후원신청</caption><caption>
			</caption><colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="30%">
			</colgroup>
			<tbody>
				<tr class="table1__tr">
					<th scope="row" class="table1__th">후원방법</th>
					<td class="table1__td">
						<label for="paymode" class="alternate">후원방법</label>
						<select name="paymode" id="paymode">
							<option value="3007" selected="selected">신용카드 </option>
							<!-- option value="6101">핸드폰결제 </option -->
							</select>
					</td>
					<th scpoe="row" class="table1__th">후원분류</th>
					<td class="table1__td">
						<label for="prodname" class="alternate">후원분류</label>
						<input type="text" name="prodname" id="prodname" maxlength="100" value="정기후원" readonly="readonly">
					</td>
				</tr>
				<tr class="table1__tr">
					<th scope="row" class="table1__th">후원금액</th>
					<td colspan="3" class="table1__td">
						매월: 
						<label for="pmoney" class="alternate">후원금액</label>
						<input type="text" maxlength="10" name="pmoney" id="pmoney" value=""> 원 
						<span>※ 콤마 없이 숫자만 입력</span>
					</td>
				</tr>
				<tr class="table1__tr">
					<th scope="row" class="table1__th">첫 결제일</th>
					<td colspan="3" class="table1__td">
						<label for="s_date" class="alternate">첫 결제일</label>
						<input type="text" id="s_date" name="s_date" style="ime-mode:disabled" value="" readonly=""> 
					</td>
				</tr>
				<tr class="table1__tr">
					<th scope="row" class="table1__th">최종 결제일</th>
					<td colspan="3" class="table1__td">
						<label for="e_date" class="alternate">최종 결제일</label>
						<input type="text" id="e_date" name="e_date" style="ime-mode:disabled" value="" readonly="" maxlength="10"> 
						<img src="<%=cp%>/resource/img/strayDog/btn_month.jpg" style="cursor:pointer" id="e_date_Icon">&nbsp;&nbsp;
						<button type="button" onclick="cal();" style="margin-bottom:0;">계산하기</button><br>
						<span>※ 최종결제일은 결제일자의 다음날이어야 합니다.<br>
						예: 첫 결재일이 <b>21</b>일이면 최종 결재일은 <b>22</b>일</span>
					</td>
				</tr>
				<tr class="table1__tr">
					<th scope="row" class="table1__th">납부개월 수</th>
					<td class="table1__td">
						총: 
						<label for="Install" class="alternate">납부개월 수</label>
						<input type="text" maxlength="10" id="Install" name="Install" value="" placeholder="자동입력" readonly="" class="num">
						개월
					</td>
					<th scope="row" class="table1__th">총 금액</th>
					<td class="table1__td">
						총: 
						<label for="totalAmount" class="alternate">총금액</label>
						<input type="text" maxlength="10" id="totalAmount" name="totalAmount" value="" placeholder="자동입력" readonly="" class="num">
						원
					</td>
				</tr>
				<tr class="table1__tr">
					<th scope="row" class="table1__th">성명</th>
					<td colspan="3" class="table1__td">
						<label for="pname" class="alternate">성명</label>
						<input type="text" name="pname" id="pname" size="15" value="" style="ime-mode:active;">
					</td>
				</tr>
				<tr class="table1__tr">
					<th scope="row" class="table1__th">연락처</th>
					<td colspan="3" class="table1__td">
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
				<tr class="table1__tr">
					<th scope="row" class="table1__th">이메일</th>
					<td colspan="3" class="table1__td">
						<label for="email" class="alternate">이메일</label>
						<input type="text" maxlength="100" name="email" value="${sessionScope.member.email}" style="ime-mode:inactive;">
					</td>
				</tr>
				<tr class="table1__tr">
					<th scope="row" class="table1__th">주소</th>
					<td colspan="3" class="table1__td">			
						<label for="sample6_postcode" class="alternate">우편번호</label>
						<input type="text" id="sample6_postcode" name="zipcode" value="${sessionScope.member.zipCode}" maxlength="7" class="post mb">
						<button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
<!-- 다음 주소 찾기 div -->						
						<div id="wrap" style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
									<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
										id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
										onclick="foldDaumPostcode()" alt="접기 버튼">
						</div> 

						<input type="text" id="sample6_address" name="addr" value="${sessionScope.member.address1}" class="full mb" placeholder="주소">
						<label for="sample6_address2" class="alternate">상세주소</label>
						<input type="text" id="sample6_address2" style="ime-mode:active" name="addr2" value="${sessionScope.member.address2}" class="full mb" placeholder="상세주소">	
					</td>
				</tr>
				<tr class="table1__tr">
					<th scope="row" class="table1__th">동의</th>
					<td colspan="3" class="table1__td">
						<input type="checkbox" name="agree" id="agree"><label for="agree">선택한 후원방법에 따라 자동결제되는 것에 동의합니다.</label>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="btn_area">
			<a href="javascript:;" class="payAll">결제</a>
			<a href="javascript:void(0);" onclick="history.go(-1);">취소</a>
		</div><!--E:btn_area-->
	</form>
<div class="request_info">
		<!-- <span>※ 결제사에서 제공하는 결제모듈은 인터넷익스플로러 11까지만 지원됩니다. 엣지에서는 아직 지원되지 않습니다.</span> -->
</div><!--E:request_info-->
</div><!--E:board_request-->

<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample6_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
                
                document.getElementById('sample6_address2').focus();

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>

<script>
	$(document).ready(function(){
		CalAddCss();
//		initCal({id:"s_date",type:"day",today:"y"});
//		initCal({id:"e_date",type:"day",today:"y"});


	});

	function chkForm(fm) {

		if(fm.use_sdate.value=="") {
			alert("결재 날짜를 선택해 주세요.");
			fm.use_sdate.focus();
			return false;
		}
	}

	// 오늘 날짜 넣기
	function CalAddCss(){
		var tDay = new Date();
		var tMonth = tDay.getMonth()+1;
		var tDate = tDay.getDate();
		if ( tMonth < 10) tMonth = "0"+tMonth;
		if ( tDate < 10) tDate = "0"+tDate;
		document.getElementById("s_date").value = tDay.getFullYear()+"-"+tMonth+"-"+tDate;
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