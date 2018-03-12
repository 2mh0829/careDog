<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 

<style>
pre {
	max-height: 480px;
}
</style>

<script type="text/javascript">
function memberOk() {
	var f = document.memberForm;
	var str;

	str = f.userId.value;
	str = str.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}
	f.userId.value = str;

	str = f.userPwd.value;
	str = str.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value = str;

	if(str!= f.userPwdCheck.value) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwdCheck.focus();
        return;
	}
	
    str = f.userName.value;
	str = str.trim();
    if(!str) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    f.userName.value = str;

    str = f.birth.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel2.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email1.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }

    var mode="${mode}";
    if(mode=="created") {
    	f.action = "<%=cp%>/";
    } else if(mode=="update") {
    	f.action = "<%=cp%>/";
    }

    f.submit();
}

function changeEmail() {
    var f = document.memberForm;
	    
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

function userIdCheck() {
	
}

function open_terms() {
	$(".modal").modal();
}

</script>
<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> ${mode=="created"?"회원 가입":"회원 정보 수정"} </h3>
    </div>
    
        <div>
			<form name="memberForm" method="post">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">아이디</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="userId" id="userId" value="${dto.userId}"
                         onchange="userIdCheck();" style="width: 95%;"
                         ${mode=="update" ? "readonly='readonly' ":""}
                         maxlength="15" class="boxTF" placeholder="아이디">
			        </p>
			        <p class="help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</p>
			      </td>
			  </tr>
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">패스워드</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="password" name="userPwd" maxlength="15" class="boxTF"
			                       style="width:95%;" placeholder="패스워드">
			        </p>
			        <p class="help-block">패스워드는 5~10자 이내이며, 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</p>
			      </td>
			  </tr>
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">패스워드 확인</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="password" name="userPwdCheck" maxlength="15" class="boxTF"
			                       style="width: 95%;" placeholder="패스워드 확인">
			        </p>
			        <p class="help-block">패스워드를 한번 더 입력해주세요.</p>
			      </td>
			  </tr>
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">이름</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="userName" value="${dto.userName}" maxlength="30" class="boxTF"
		                      style="width: 95%;"
		                      ${mode=="update" ? "readonly='readonly' ":""}
		                      placeholder="이름">
			        </p>
			      </td>
			  </tr>
			
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">생년월일</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="birth" value="${dto.birth}" maxlength="10" 
			                       class="boxTF" style="width: 95%;" placeholder="생년월일">
			        </p>
			        <p class="help-block">생년월일은 2000-01-01 형식으로 입력 합니다.</p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">이메일</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="email1" value="${dto.email1}" size="13" maxlength="30"  class="boxTF">
			            @ 
			            <input type="text" name="email2" value="${dto.email2}" size="13" maxlength="30"  class="boxTF" readonly="readonly">
			            <select name="selectEmail" onchange="changeEmail();" class="selectField">
			                <option value="">선 택</option>
			                <option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
			                <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
			                <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
			                <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
			                <option value="direct">직접입력</option>
			            </select>
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">전화번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <select class="selectField" id="tel1" name="tel1" >
			                <option value="">선 택</option>
			                <option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
			                <option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
			                <option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
			                <option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
			                <option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
			                <option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
			            </select>
			            -
			            <input type="text" name="tel2" value="${dto.tel2}" class="boxTF" maxlength="4">
			            -
			            <input type="text" name="tel3" value="${dto.tel3}" class="boxTF" maxlength="4">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">우편번호</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="zip" value="${dto.zip}"
			                       class="boxTF" readonly="readonly">
			            <button type="button" class="btn" >우편번호</button>          
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">주소</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="addr1" value="${dto.addr1}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="기본 주소" readonly="readonly">
			        </p>
			        <p style="margin-bottom: 5px;">
			            <input type="text" name="addr2" value="${dto.addr2}" maxlength="50" 
			                       class="boxTF" style="width: 95%;" placeholder="나머지 주소">
			        </p>
			      </td>
			  </tr>
			  <c:if test="${mode=='created'}">
				  <tr>
				      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
				            <label style="font-weight: 900;">약관동의</label>
				      </td>
				      <td style="padding: 0 0 15px 15px;">
				        <p style="margin-top: 7px; margin-bottom: 5px;">
				             <label>
				                 <input id="agree" name="agree" type="checkbox" checked="checked"
				                      onchange="form.sendButton.disabled = !checked"> <a onclick="open_terms()">이용약관</a>에 동의합니다.
				             </label>
				        </p>
				      </td>
				  </tr>
			  </c:if>
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" name="sendButton" class="btn" onclick="memberOk();">${mode=="created"?"회원가입":"정보수정"}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/';">${mode=="created"?"가입취소":"수정취소"}</button>
			      </td>
			    </tr>
			    <tr height="30">
			        <td align="center" style="color: blue;">${message}</td>
			    </tr>
			  </table>
			</form>
        </div>
</div>



<!-- MODAL -->
<div class="modal fade" id="termsModal" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" id="myModal">서비스 이용약관 / 개인정보 보호 방침 / 이메일 무단 수 집거부</h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
               &times;
            </button>
         </div>
         
         <div>
               <div class="col-lg-12">
                    <ul class="nav nav-tabs mt-15">
                      <li class="nav-item"><a class="nav-link active" href="#tab-01" role="tab" data-toggle="tab">서비스이용약관</a></li>
                      <li class="nav-item"><a class="nav-link" href="#tab-02" role="tab" data-toggle="tab">개인정보처리방침</a></li>
                      <li class="nav-item"><a class="nav-link" href="#tab-03" role="tab" data-toggle="tab">이메일 무단 수집 거부</a></li>
                    </ul>
               </div>
            </div>
            
            <div class="modal-body modal-short">
            <div class="tab-content">
               <div class="tab-pane active" id="tab-01">
                  <pre class="fs-12">
[ 회원가입약관 ]

제 1 장 총 칙

제 1 조 (목적)
1. 이 이용약관(이하 '약관')은 (주)careDog(이하 '회사')과 이용 고객(이하 '회원')간에 회사가 제공하는 서비스의
   가입조건 및 이용에 관한 제반 사항과 기타 필요한 사항을 구체적으로 규정함을 목적으로 합니다.

제 2 조 (이용약관의 효력 및 변경)
1. 이 약관은 본 회사에 가입된 고객을 포함하여 서비스를 이용하고자 하는 모든 사용자에 대하여 서비스 메뉴 및
   회사에 게시하여 공시하거나 기타의 방법으로 고객에게 공지함으로써 그 효력이 발생합니다. 약관은 홈페이지에서
   확인할 수 있습니다
2. 회사는 합리적인 사유가 발생할 경우 이 약관을 변경할 수 있으며, 약관을 변경할 경우에는 지체 없이 사전에
   이를 공시합니다.

제 3 조 (약관외 준칙)
1. 서비스 이용에 관하여는 이 약관을 적용하며 이 약관에 명시되지 아니한 사항에 대하여는 전기통신기본법,
   전기통신사업법, 정보통신망 이용촉진 등에 관한 법률 및 기타 관계법령의 규정에 의합니다.

제 4 조 (용어의 설명)
1. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
   (1) '사용자'라 함은 서비스를 이용하는 회원 또는 비회원 사용자를 의미합니다.
   (2) '이용계약'이라 함은 서비스 이용과 관련하여 회사와 사용자 간에 체결하는 계약을 말합니다.
   (3) '사용자 ID'라 함은 회원식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 영문자와 숫자의
       조합을 말합니다.
   (4) '비밀번호'라 함은 해당 회원이, 부여 받은 사용자 ID와 일치하는 사용자임 확인하고 사용자의 권익보호를 위하여
      사용자가 선정한 문자와 숫자의 조합을 말합니다.
   (5) '해지'라 함은 회사 또는 회원이 이용계약을 해약하는 것을 말합니다.
2. 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계법령 및 서비스별 안내에서 정하는
   바에 의합니다.


제 2 장 이용계약

제 5 조 (이용계약의 성립)
1. 이용계약은 이용하고자 하는 고객의 본 이용약관 내용에 대한 동의와 이용신청에 대해 회사가 승인함으로써
   성립합니다.
2. 본 이용약관에 대한 동의는 가입신청 시 (주)careDog의 '동의' 단추를 누름으로써 동의한 것으로 간주합니다.

제 6 조 (서비스 이용 신청)
1. 본 서비스를 이용하고자 하는 사용자는 회사에서 요청하는 정보(성명, 전자메일주소, 연락처 등)를 제공하여
   회원으로 가입한 후 이용이 가능합니다
2. 모든 회원은 반드시 회원 본인의 이름과 전자메일 주소를 제공하여야만 서비스의 이용이 가능하며 비실명의 경우
   서비스 이용에 제한을 받으실 수 있습니다.
3. 회원가입은 반드시 실명으로만 가입이 가능합니다
4. 타인의 명의를 도용하여 이용신청을 한 회원의 ID는 사전예고없이 삭제될 수 있으며, 관계법령에 따라 처벌을
   받을 수 있습니다.
5. 회사는 본 서비스를 이용하는 회원에 대하여 등급별로 구분하여 서비스의 이용에 차등을 둘 수 있습니다.

제 7 조 (개인정보의 보호 및 사용)
1. 회사는 관계법령이 정하는 바에 따라 서비스 사용자의 개인정보를 보호하기 위해 개인정보보호정책을 시행합니다.
   사용자 개인정보의 보호 및 사용에 대해서는 관련법령 및 회사의 개인정보 보호정책이 적용됩니다. 그러나, 회사는
   사용자의 귀책사유로 인해 노출된 정보에 대해서 일체의 책임을 지지 않습니다.

제 8 조 (이용신청의 승인과 제한)
1. 회사는 제 6조의 규정에 의한 이용신청고객에 대하여 업무 수행상 또는 기술상 지장이 없는 경우에 서비스 이용을
   승인합니다.
2. 회사는 아래사항에 해당하는 경우에 대해서 승인하지 아니합니다.
   - 타인 명의의 신청 또는 이름이 실명이 아닌 경우
   - 허위 서류를 첨부하거나 허위 내용을 기재하여 신청하는 경우
   - 신용정보의 이용과보호에 관한 법률에 의한 PC통신, 인터넷 서비스의 신용불량자로 등록되어 있는 경우
   - 사회의 안녕 질서 또는 미풍양속을 저해할 목적으로 신청한 경우
   - 정보통신 윤리위원회에 PC통신, 인터넷 서비스의 불량 이용자로 등록되어 있는 경우
   - 기타 회사가 정한 이용신청요건이 만족되지 않았을 경우
3. 회사는 서비스 이용신청이 다음 각 호에 해당하는 경우에는 그 신청에 대하여 승인 제한사유가 해소될 때까지 승인을
   유보할 수 있습니다.
   - 회사가 설비의 여유가 없는 경우
   - 회사의 기술상 지장이 있는 경우
   - 기타 회사의 귀책사유로 이용승인이 곤란한 경우
4. 회사는 규정에 의하여 이용신청이 승인되지 않거나 승인을 제한하는 경우에는 이를 이용신청 고객에게 즉시 알려야
   합니다.
5. 회사는 이용신청고객이 미성년자인 경우에는 별도로 정하는 바에 따라 승인을 제한할 수 있습니다.


제 3 장 계약 당사자의 권리와 의무

제 9 조(회사의 권리와 의무)
1. 회사는 회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 즉시 처리하여야 합니다. 다만, 즉시
   처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 서면, 전자메일 또는 전화 등으로 통보하여야 합니다.
2. 회사는 회사가 제정한 개인정보보호정책에 따라서 이용고객의 개인정보를 보호할 의무를 가집니다. 단, 법률의 규정에
   따른 적법한 절차에 의한 경우에는 그러하지 않을 수 있습니다.
3. 회사가 제 2 항의 규정에도 불구하고 고지 또는 명시한 범위를 초과하여 이용고객의 개인 정보를 이용하거나
   제 3 자에게 제공하고자 하는 경우에는 반드시 해당 회원에게 개별적으로 공지하여 동의를 받아야 합니다.
4. 회사는 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 손실된 때에는 지체 없이 이를 수리
   또는 복구합니다. 다만, 천재지변, 비상사태 또는 그밖에 부득이한 경우에는 그 서비스를 일시 중단하거나 중지할 수
   있습니다.
5. 회사는 이용계약의 체결, 계약사항의 변경 및 해지 등 회원과의 계약관련 절차 및 내용 등에 있어 회원에게 편의를
   제공해야 합니다.
6. 회사는 업무와 관련하여 회원의 사전동의 하에 회원전체 또는 일부의 개인정보에 관한 통계자료를 작성하여 이를
   사용할 수 있고 서비스를 통하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을
   거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저의 설정을 변경할 수 있으며, 쿠키의 설정
   변경에 의한 서비스 이용이 변경되는 것은 회원의 책임입니다.

제 10 조(회원의 권리와 의무)
1. 회원은 서비스를 이용할 때 다음의 행위를 하지 않아야 합니다.
   - 다른 회원의 ID 및 비밀번호를 부정하게 사용하는 행위
   - 서비스를 이용하여 얻은 정보를 회원의 개인적인 이용 외에 복사, 가공, 번역, 2차적 저작 등을 통하여 복제,
     공연, 방송, 전시, 배포, 출판 등에 사용하거나 제3자에게 제공하는 행위
   - 타인의 명예를 손상시키거나 불이익을 주는 행위
   - 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위
   - 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형, 음성 등을 타인에게 유포하는 행위
   - 범죄와 결부된다고 객관적으로 인정되는 행위
   - 서비스와 관련된 설비의 오동작이나 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터 바이러스 감염자료를 등록 또는
     유포하는 행위
   - 서비스의 안정적 운영을 방해할 수 있는 정보를 전송하거나 수신자의 의사에 반하여 광고성 정보를 전송하는 행위
   - 정보통신윤리위원회, 소비자보호단체 등 공신력 있는 기관으로부터 시정요구를 받는 행위
   - 선거관리위원회의 중지, 경고 또는 시정명령을 받는 선거법 위반 행위
   - 기타 관계법령에 위배되는 행위
2. 회원은 이 약관에 규정하는 사항과 서비스 이용안내 또는 주의사항을 준수하여야 하며 회사가 공지하거나 별도로
   게시한 사항을 준수하여야 합니다.
3. 회원은 회사의 명시적인 사전 동의가 없이 서비스를 이용하여 영업활동을 할 수 없으며, 이에 위반하여 발생한 결과에
   대하여 회사는 책임지지 않습니다.
4. 회원은 이와 같은 영업활동과 관련하여 회사에 대하여 손해배상의무를 집니다.
5. 회원은 서비스의 이용약관, 기타 이용계약상 지위를 타인에게 양도, 증여 할 수 없으며, 이를 담보로 제공할 수
   없습니다.
6. 회원은 회사의 사전 승인 없이는 서비스의 전부 또는 일부 내용 및 기능을 전용할 수 없습니다.
7. 회사는 이용고객이 방문하거나 전자서명 또는 아이디(ID)등을 이용하여 자신의 개인정보에 대한 열람 또는 정정을
   요구하는 경우에는 본인 여부를 확인하고 지체 없이 필요한 조치를 취하여야 합니다.
8. 회사는 이용고객의 대리인이 방문하여 열람 또는 정정을 요구하는 경우에는 대리관계를 나타내는 증표를 제시하도록
   요구할 수 있습니다.
9. 회사는 개인정보와 관련하여 이용고객의 의견을 수렴하고 불만을 처리하기 위한 절차를 마련하여야 합니다.


제 4 장 서비스의 이용

제 11 조 (서비스 이용 시간)
1. 서비스 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을 원칙으로 합니다.
   단, 회사는 시스템 정기점검, 증설 및 교체를 위해 회사가 정한 날이나 시간에 서비스를 일시중단할 수 있으며,
   예정되어 있는 작업으로 인한 서비스 일시중단은 웹을 통해 사전에 공지합니다.
2. 회사는 회사가 통제할 수 없는 사유로 인한 서비스중단의 경우(시스템관리자의 고의, 과실없는 디스크장애,
   시스템다운 등)에 사전통지가 불가능하며 타인(PC통신회사, 기간통신사업자 등)의 고의, 과실로 인한 시스템중단
   등의 경우에는 통지하지 않습니다.

제 12 조 (이용자ID 관리)
1. 아이디(ID)와 비밀번호에 관한 모든 관리책임은 회원에게 있습니다.
2. 자신의 아이디(ID)가 부정하게 사용된 경우 회원은 반드시 회사에 그 사실을 통보해야 합니다.

제 13 조 (게시물의 관리)
1. 회사는 다음 각 호에 해당하는 게시물이나 자료를 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있습니다.
   - 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
   - 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
   - 불법복제 또는 해킹을 조장하는 내용인 경우
   - 영리를 목적으로 하는 광고일 경우
   - 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
   - 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
   - 회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
   - 기타 관계법령에 위배된다고 판단되는 경우

제 14 조 (게시물에 대한 저작권)
1. 회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할
   수 없습니다.
2. 회사는 회원이 게시하거나 등록하는 서비스 내의 내용물, 게시 내용에 대해 제 13조 각 호에 해당된다고 판단되는
   경우 사전통지 없이 삭제하거나 이동 또는 등록 거부할 수 있습니다.

제 15 조 (정보의 제공)
1. 회사는 회원이 서비스 이용 도중 필요가 있다고 인정되는 다양한 정보에 대해서 전자메일이나 전화통신 등의
   방법으로 회원에게 제공할 수 있습니다.

제 16 조 (광고게재 및 광고주와의 거래)
1. 회사가 회원에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다.
   회원은 서비스 이용 시 노출되는 광고게재에 대해 동의합니다.
2. 회사는 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를
   함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다.


제 5 장 계약 해지 및 이용 제한

제 17 조 (계약 변경 및 해지)
1. 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 (주)careDog 번역포털 사이트 내의 "회원탈퇴"메뉴를 이용해
   가입해지를 해야 합니다.

제 18 조 (서비스 이용제한)
1. 회사는 회원이 서비스 이용내용에 있어서 본 약관 제 10조 내용을 위반하거나, 다음 각 호에 해당하는 경우 서비스
   이용을 제한할 수 있습니다.
   - 미풍양속을 저해하는 비속한 ID 및 별명 사용
   - 타 이용자에게 심한 모욕을 주거나, 서비스 이용을 방해한 경우
   - 기타 정상적인 서비스 운영에 방해가 될 경우
   - 정보통신 윤리위원회 등 관련 공공기관의 시정 요구가 있는 경우
   - 불법 홈페이지인 경우
   - 상용소프트웨어나 불법 파일을 올린 경우
   - 정보통신윤리 위원회의 심의 세칙 제 7조에 어긋나는 음란물을 게재한 경우
   - 반국가적 행위의 수행을 목적으로 하는 내용을 포함한 경우
   - 저작권이 있는 글을 무단 복제하거나 mp3를 올린 경우
   - 정보통신 설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우
2. 상기 이용제한 규정에 따라 서비스를 이용하는 회원에게 서비스 이용에 대하여 별도 공지 없이 서비스 이용의
   일시정지, 정지, 이용계약 해지 등을 불량이용자 처리규정에 따라 취할 수 있습니다.


제 6 장 손해배상 및 기타사항

제 19 조 (손해배상의 범위 및 청구)
1. 회사는 서비스로부터 회원이 받은 손해가 천재지변 등 불가항력적이거나 회원의 고의 또는 과실로 인하여 발생한
   때에는 손해배상을 하지 아니합니다.
2. 회사는 전자상거래 호스팅 및 일반 호스팅의 경우 이에 준하는 서비스 이용회원일 경우 불가항력적으로 발생한 경우
   위 1 항의 규정에 따릅니다.
3. 회원이 서비스를 이용함에 있어 행한 불법행위로 인하여 회사가 당해 회원 이외에 제 3 자로부터 손해배상 청구,
   소송을 비롯한 각종의 이의제기를 받는 경우 당해 회원은 회사의 면책을 위하여 노력하여야 하며, 만일 회사가
   면책되지 못한 경우는 당해 회원은 그로 인하여 회사에 발생한 모든 손해를 배상하여야 합니다.

제 20 조 (면책사항)
1. 회사는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에
   대한 책임이 면제됩니다.
2. 회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이
   면제됩니다.
3. 회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.
4. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임을 지지 않습니다.
5. 회사는 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자메일 주소를 부실하게
   기재하여 손해가 발생한 경우 책임을 지지 않습니다.
6. 회사는 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않습니다.
7. 회사는 회원 상호간 또는 회원과 제 3 자 상호간에 서비스를 매개로 하여 물품거래(무형의 물품 포함)등을 한 경우에
   그로부터 발생하는 일체의 손해에 대하여 책임지지 아니합니다.
8. 회사에서 회원에게 무료로 제공하는 서비스의 이용과 관련해서는 어떠한 손해도 책임을 지지 않습니다.

제 21 조 (재판권 및 분쟁조정)
1. 이 약관에 명시되지 않은 사항은 전기통신사업법 등 관계법령과 상관습에 따릅니다.
2. 서비스 이용과 관련하여 회사와 회원 사이에 분쟁이 발생한 경우, 쌍방간에 분쟁의 해결을 위해 성실히 협의한 후가
   아니면 제소할 수 없습니다.
3. 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 회사의 본사 소재지를 관할하는 법원을 관할 법원으로
   합니다.


[부 칙]

이 약관은 2017년 12월 01일부터 시행합니다.

                  </pre>
                </div>
                <div class="tab-pane fade" id="tab-02">
                  <pre class="fs-12">
[ 개인정보취급방침 ]

 '㈜careDog'은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을
  준수하고 있습니다.

회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며,
개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.

회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

ο 본 방침은 2017 년 12월 01일부터 시행됩니다.


■ 수집하는 개인정보 항목
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

ο 수집항목: 이름, 로그인ID, 비밀번호, 비밀번호, 휴대전화번호, 이메일, 은행계좌 정보, 서비스 이용기록, 접속 로그,
   쿠키, 접속 IP 정보, 결제기록

ο 개인정보 수집방법: 홈페이지(회원가입)


■ 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는
   청구지 등 발송, 금융거래 본인 인증 및 금융 서비스, 요금추심

ο 회원 관리 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입
   의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달


■ 개인정보의 보유 및 이용기간
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는
아래의 이유로 명시한 기간 동안 보존합니다.

보존 항목: 이름, 로그인ID, 비밀번호, 전화번호, 주소, 휴대전화번호, 이메일

보존 근거: 회사 내부 방침

보존 기간: 회원 탈퇴 시까지


■ 개인정보의 파기절차 및 방법
회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기절차 및 방법은
다음과 같습니다.

ο 파기절차

회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부
방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다. 별도
DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유 이외의 다른 목적으로 이용되지 않습니다.

ο 파기방법 - 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.


■ 개인정보 제공
회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. - 이용자들이
사전에 동의한 경우 - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가
있는 경우


■ 수집한 개인정보의 위탁
회사는 고객님의 동의 없이 고객님의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁
대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.


■ 이용자 및 법정대리인의 권리와 그 행사방법
이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수
있으며 가입 해지를 요청할 수도 있습니다. 이용자 혹은 만 14세 미만 아동의 개인정보 조회/수정을 위해서는
'개인정보변경'(또는 '회원정보수정' 등)을, 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를
거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면
지체 없이 조치하겠습니다. 귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해
개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를
제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다. careDog은 이용자 혹은 법정 대리인의 요청에 의해 해지
또는 삭제된 개인정보는 "careDog이 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로
열람 또는 이용할 수 없도록 처리하고 있습니다.


■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
쿠키 등 인터넷 서비스 이용 시 자동 생성되는 개인정보를 수집하는 장치를 운영하지 않습니다.


■ 개인정보에 관한 민원서비스
회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리
책임자를 지정하고 있습니다.


고객서비스담당 부서: 고객센터
전화번호: 02-3465-8530
이메일: e4trans@e4net.net
개인정보관리책임자: 박영호
전화번호: 02-3465-8590
이메일: yhpark1@e4net.net
                  </pre>
                </div>
                <div class="tab-pane fade" id="tab-03">
                  <pre class="fs-12">
당사의 대표메일 및 당사의 직원에게 무차별적으로 보내지는 타사의 메일을 차단하기 위해, 본 웹사이트에 게시된 이메일
주소가 전자우편수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 이를 위반 시
정보통신망 법에 의해 형사 처벌됨을 유념하시기 바랍니다.

본 방침은 2016년 7월 1일부터 시행됩니다.

정보통신망 법 제 50조의 2 (전자우편주소의 무단 수집행위 등 금지)
1. 누구든지 전자우편주소의 수집을 거부하는 의사가 명시된 인터넷 홈페이지에서 자동으로 전자우편주소를 수집하는 프로그램
   그 밖의 기술적 장치를 이용하여 전자우편주소를 수집하여서는 아니 된다.

2. 누구든지 제1항의 규정을 위반하여 수집된 전자우편 주소를 판매/유통하여서는 아니 된다.

3. 누구든지 제1항 및 제2항의 규정에 의하여 수집, 판매 및 유통이 금지된 전자우편주소임을 알고 이를 정보전송에 이용하여서는
   아니 된다.
               </pre>
                </div>
              </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-check"></i>확인</button>
            </div>

          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div>
<!-- /MODAL -->