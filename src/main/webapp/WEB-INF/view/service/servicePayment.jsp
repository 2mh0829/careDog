<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/strayDog/tempSupport.css" />
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/jquery.selectBoxIt.css" />
<script src="http://gregfranko.com/jquery.selectBoxIt.js/js/jquery.selectBoxIt.min.js"></script>

<!-- 결제 모듈 라이브러리 -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 결제 모듈 -->
<script>
var IMP = window.IMP; // 생략가능
$(document).ready(function(){
	IMP.init('imp89857995'); //가맹점 식별코드 
});	
	function jsf__pay(){
		var f = document.forms.order_info;
 
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : f.pay_method.value,
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '일시후원',
		    amount : f.good_mny.value,
		    buyer_email : f.buyr_mail.value,
		    buyer_name : f.buyr_name.value,
		    buyer_tel : f.buyr_tel2.value,
		    buyer_addr : '',
		    buyer_postcode : '',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		    	f.action ="<%=cp%>/strayDog/tmpSupInput";
		    	f.submit();
		    	return true;
		        /* var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num; */
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        return false;
		    }
		    alert(msg);
		});
	}
</script>

<div class="body-container">
   <div class="content" id="AnimalsContent">
				<h1 class="page-tit">서비스 결제</h1>

				<form name="order_info" method="post">

				<div class="temporary__header">
					<p class="temporary__txt"><span class="color1">결제</span>는 신용카드, 핸드폰, 온라인 계좌이체를 통하여 가능합니다.</p>
				</div>
				<div class="temporary__box">
					<h2 class="temporary__tit">개인정보취급방침</h2>
					<div class="temporary__terms">
						(사)careDog' 는 (이하 'careDog'는) 후원자의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. careDog는 개인정보취급방침을 통하여 후원자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br><br>

						■ 수집하는 개인정보 항목<br>
						careDog는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br><br>

						ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 회사전화번호 , 주민등록번호 , 신용카드 정보 , 은행계좌 정보 , 쿠키 , 접속 IP 정보<br>
						ο 개인정보 수집방법 : 홈페이지(회원가입,정기후원,일시후원,상담,입양신청) , 전화/팩스/서면/우편 을 통한 회원가입<br><br>


						■ 개인정보의 수집 및 이용목적<br>
						careDog는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br><br>

						ο 회원가입 및 후원 신청, 인터넷 서비스, 커뮤니케이션 서비스<br><br>


						■ 개인정보의 보유 및 이용기간<br>
						원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 기부금영수증 발행 등의 보존할 필요가 있는 경우 careDog는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br><br>

						 보존 항목 : 이름 , 연락처 , 주소 , 주민등록번호 , 후원 기록<br>
						 보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률, 법인세법, 국세기본법<br>
						 보존 기간 : 회원 탈퇴 시로부터 5년 이내<br><br>


						■ 개인정보의 파기절차 및 방법<br>
						careDog는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.<br><br>

						ο 파기절차<br>
						회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.<br>
						별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.<br><br>

						ο 파기방법<br>
						  - 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br>
						- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br><br>


						■ 개인정보 제공<br>
						careDog는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br>
						- 이용자들이 사전에 동의한 경우<br>
						- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br><br>


						■ 수집한 개인정보의 위탁<br>
						보다 나은 서비스 제공을 위하여 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.<br><br>

						1) 위탁기관명 : 금융결제원<br>
						위탁업무내용 : CMS자동이체를 통한 회비결제<br>
						위탁기간 : 회비납부 기간<br><br>

						2) 위탁기관명 : (주)한국사이버결제<br>
						위탁업무내용 : 신용카드를 통한 회비결제<br>
						위탁기간 : 회비납부 기간<br><br>

						3) 위탁기관명 : 휴먼소프트웨어<br>
						위탁업무내용 : 회원개인정보 보관 및 데이터 백업<br>
						위탁기간 : 회원관리솔루션 이용계약 해지 시까지<br><br>

						4) 위탁기관명 : (주)한국사이버결제<br>
						위탁업무내용 : 신용카드, 핸드폰, 은행계좌이체를 통한 일시후원 결제<br>
						위탁기간 : 전자결제 이용계약 해지 시까지<br><br>


						■ 개인정보의 안전성 확보 조치<br>
						careDog는 개인정보보호법 제29조 등에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.<br><br>

						1) 개인정보 취급 직원의 최소화 및 교육<br>
						개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br><br>

						2) 내부관리계획의 수립 및 시행<br>
						개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.<br><br>

						3) 개인정보의 암호화<br>
						이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br><br>

						4) 해킹 등에 대비한 기술적 대책<br>
						해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신, 점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.<br><br>

						5) 개인정보에 대한 접근 제한<br>
						개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.<br><br>

						6) 데이터서버에 대한 물리적 접근 차단<br>
						서버가 보관된 장소는 서버관리자만 가능하도록 통제하고 있습니다. 또한 폐쇄회로를 통한 출입자 모니터링 및 자동 추적, 지문인식, 카드리더, 경보장치를 통해 물리적 접근을 통제합니다<br><br>

						7) 문서보안을 위한 잠금장치 사용<br>
						개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.<br><br>

						8) 기타<br>
						회원가입 및 정보변경 웹페이지와 관련하여 로그인에 관한 정보는 모두 복호화 할 수 없는 암호화 처리를 합니다. 또한 홈페이지 상에서 대량의 개인정보를 취급하는 관리자 기능을 제공하지 않습니다<br><br>


						■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항<br>
						careDog는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 careDog의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. careDog는 다음과 같은 목적을 위해 쿠키를 사용합니다.<br><br>

						▶ 쿠키 등 사용 목적<br>
						 - 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공<br><br>

						  귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.<br><br>

						▶ 쿠키 설정 거부 방법<br>
						예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.<br><br>

						설정방법 예(인터넷 익스플로어의 경우)<br>
						: 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보<br><br>

						단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.<br><br>


						■ 개인정보에 관한 민원서비스<br>
						careDog는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다..<br><br>

						개인정보관리책임자 성명 : 손혜원 국장<br>
						전화번호 : 02)2292-6337<br>
						이메일 : hyewon@animals.or.kr<br><br>

						귀하께서는 careDog의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. careDog는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br><br>

						기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br><br>

						1.개인정보침해신고센터 (www.1336.or.kr/국번없이 118)<br>
						2.정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)<br>
						3.대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)<br>
						4.경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)
					</div>
					<div class="temporary__check">
						<input type="hidden" name="consent" value="동의">
						<input type="checkbox" name="checkbox2" id="temporary_check_01" class="checkbox01" value="checkbox"><label for="temporary_check_01">이용약관에 동의합니다.</label>
					</div>
				</div>
				<div class="temporary__box">
					<div class="table__area">
						<table class="table1">
							<thead>
								</thead><colgroup>
									<col width="216px">
									<col width="auto">
								</colgroup>
							
							<tbody>
								<!-- <tr class="table1__tr">
									<th class="table1__th">후원종류</th>
									<td class="table1__td">
										<div class="input__form"> onClick="catecheck(1);" onClick="catecheck(2);"
											<input type="radio" name="merchantreserved2" id="sponsor01" class="radio01" value="일시후원" checked=""><label for="sponsor01" class="label01">일시후원</label>
											<input type="radio" name="merchantreserved2" id="sponsor02" class="radio01" value="보호소후원"><label for="sponsor02" class="label01">보호소 후원</label>
										</div>
									</td>
								</tr>
								<tr class="table1__tr">
									<th class="table1__th">회원여부</th>
									<td class="table1__td">
										<div class="input__form">

											<input type="radio" name="mem_check" id="member01" class="radio01" value="회원" onclick="memcheck(1);"><label for="member01" class="label01">회원</label>
											<input type="radio" name="mem_check" id="member02" class="radio01" value="비회원" onclick="memcheck(2);" checked=""><label for="member02" class="label01">비회원</label>

										</div>
									</td>
								</tr> -->

								<tr class="table1__tr">
									<th class="table1__th">이름</th>
									<td class="table1__td">
										<div class="input__form">
											<input type="hidden" name="good_name" value="일시후원">
											<input type="text" name="buyr_name" class="input1 wd200" id="buyr_name" value="" maxlength="15">
										</div>
									</td>
								</tr>
								<tr class="table1__tr">
									<th class="table1__th">휴대폰</th>
									<td class="table1__td">
										<div class="input__form">
											<input type="text" name="buyr_tel2" class="input1 wd200" id="buyr_tel2" value="${sessionScope.member.tel}" maxlength="15">
											<span class="input__txt">“-” 포함하여 입력하세요. 예) 010-0000-1234</span>
										</div>
									</td>
								</tr>

								<tr class="table1__tr">
									<th class="table1__th">이메일</th>
									<td class="table1__td">
										<div class="input__form">
											<input type="text" class="input1 wd460" name="buyr_mail" id="buyr_mail" value="${sessionScope.member.email}">
										</div>
									</td>
								</tr>
								<tr class="table1__tr">
									<th class="table1__th">결제방법</th>
									<td class="table1__td">
										<div class="input__form type-another">
											<div class="input__form type-another wd120">
												<select class="wd120 select30" name="pay_method" style="display: none;">
													<option value="card">신용카드</option>
													<option value="phone">휴대폰</option>
													<option value="trans">계좌이체</option>	
												</select> 
										</div>
										<span class="sub__txt type-another">(카드사 방침에 따라 삼성과 현대카드는 사용하실 수 없습니다. 불편을 드려 죄송합니다.)</span>
									</div>
									</td>
								</tr>
								<tr class="table1__tr">
									<th class="table1__th">결제금액</th>
									<td class="table1__td">
										<div class="input__wrap">
											<div class="input__form type-another2 js-price" style="margin-bottom:15px;">
												<!-- <input type="radio" name="goods_check" id="price01" class="radio01" onclick="goods_checkok(this.form, this);" value="유" checked="checked"><label for="price01" class="label01">금액선택</label>
												<input type="radio" name="goods_check" id="price02" class="radio01" onclick="goods_checkok(this.form, this);" value="무"><label for="price02" class="label01">직접입력</label> -->
												<input type="text" name="good_mny" class="input1" value="${totPrice}" readonly>
											</div>
											<!-- <div id="option2" class="input__form wd460 type-another3 js-price-t" style="display:none;">
												<input type="text" class="input1 wd120" name="gprice2" id="gprice2" maxlength="10" onkeypress="filterKey('[0-9]');">
												<span class="input__txt">원 (*숫자로만 입력하세요.)</span>
											</div>
											<div id="option1" class="input__form wd240 type-another3 js-price-s">
												<select class="wd200 select30" name="gprice" id="gprice" style="display: none;">
													<option value="">[ 후원 금액을 선택하세요. ]
													</option><option value="5000">5,000원
													</option><option value="10000">10,000원
													</option><option value="20000">20,000원
													</option><option value="30000">30,000원
													</option><option value="50000">50,000원
													</option><option value="70000">70,000원
													</option><option value="100000">100,000원
													</option><option value="200000">200,000원
													</option><option value="300000">300,000원</option>
												</select>
											</div> -->
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- //delete__table -->
					<div class="center__group mt40">
						<a href="javascript:;" onclick="pay();" class="btn btn1 wd120">결제요청</a>
						<a href="#none" onclick="location.href='<%=cp%>/service/servicePayment?totPrice=${totPrice}';" class="btn btn2 wd120">다시작성</a>
					</div>
					<div class="temporary__box type-another" id="display_setup_message" style="display: block;">
						<p class="temporary__txt-small">결제를 계속 하시려면 상단의 노란색 표시줄을 클릭 하시거나 [수동설치]를 눌러 Payplus Plug-in을 설치하시기 바랍니다.</p>
						<ul class="temporary__list">
							<li>ㆍ[수동설치]를 눌러 설치하신 경우 새로고침(F5)키를 눌러 진행하시기 바랍니다.</li>
						</ul>
					</div>
				</div>

			</form>
		</div>
</div>

<script>

	$(function() {
		$("select").selectBoxIt();
	});

	function l_img(img1) {
		window.open("l_img.asp?img1=" + img1, "winName1",
				"scrollbars=no,width=1,height=1,top=100,left=100,resizable=no")
	}

	function pay() {

		/* if (document.order_info.goods_check[0].checked == true) {
			document.order_info.good_mny.value = document.order_info.gprice.value;
		} else {
			document.order_info.good_mny.value = document.order_info.gprice2.value;
		} */

		var mailArray = document.order_info.buyr_mail.value
				.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/);
		if (document.order_info.checkbox2.checked == false) {
			alert("개인정보취급방침에 동의하셔야 온라인 후원이 됩니다.");
			document.order_info.checkbox2.focus();
			return false;
		}

		else if (document.order_info.buyr_name.value == "") {
			alert("이름을 입력하세요");
			document.order_info.buyr_name.focus();
			return false;
		}

		else if (document.order_info.buyr_tel2.value == "") {
			alert("본인 핸드폰 번호를 입력하세요.");
			document.order_info.buyr_tel2.focus();
			return false;
		} else if (document.order_info.buyr_mail.value == "") {
			alert("이메일 주소를 입력하세요.");
			return false;
		}

		else if (mailArray == null) {
			alert("이메일 주소가 잘못 되었습니다. 다시 입력하세요.");
			document.order_info.buyr_mail.focus();
			return false;

		}

		else if (document.order_info.pay_method.value == "") {
			alert("결제방법을 선택하세요.");
			document.order_info.pay_method.focus();
			return false;
		}

		else if (document.order_info.good_mny.value == "") {
			alert("후원금액을 선택 또는 입력하세요.");
			return false;
		}

		return jsf__pay();

	}

	function catecheck(num) {

		if (num == "1") {
			location.href = "cartoon01_2.asp?catecheck=1";
		} else if (num == "2") {
			location.href = "cartoon01_2.asp?catecheck=2";
		}

	}
	function goods_checkok(objform, objid) {
		if (objid.value == "유") {
			document.all.option1.style.display = 'block';
			document.all.option2.style.display = 'none';
			objform.gprice.disabled = 0;
			objform.gprice2.disabled = 1;
		}

		else {
			document.all.option1.style.display = 'none';
			document.all.option2.style.display = 'block';
			objform.gprice.disabled = 1;
			objform.gprice2.disabled = 0;
		}
	}

	function filterKey(filter) {
		if (filter)

		{
			var sKey = String.fromCharCode(event.keyCode);
			var re = new RegExp(filter);
			if (!re.test(sKey))
				event.returnValue = false;
		}
	}

	function memcheck(m) {
		if (m=="1" && sessionScope.member==null){
			location.href="<%=cp%>/member/login";
		}
		if (m=="2" && sessionScope.member!=null){
			$("#member01").attr('checked', true);
		}
	}
</script>