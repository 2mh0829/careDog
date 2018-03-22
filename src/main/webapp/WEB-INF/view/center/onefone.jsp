<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
/* Reset */
html, body {-webkit-font-smoothing:antialiased;-webkit-font-smoothing:antialiased;}
body, h1, h2, h3, h4, h5, h6, div, p, span, strong, em, blockquote, pre, address,
ul, ol, li, dl, dt, dd, form, fieldset, input, select, label, textarea, img, a {margin:0; padding:0; border:0/*;word-break:break-all;*/}
* {margin:0;padding:0;box-sizing:border-box;}
body {word-spacing:-1px;color:#666;font-size:14px;line-height:20px;font-family:'montserrat', 'noto', 'Roboto', sans-serif;letter-spacing:-0.04em}/* montserrat & Montserrat */
ul, ol {list-style:none;}
table {border-spacing:0;border:0;}
img, input, select, textarea, button {border:0; vertical-align:top; color:#666;}
legend {position:absolute; overflow:hidden; visibility:hidden; height:0; z-index:-1;}
hr {display:none;}
a {color:#666; text-decoration:none;}
a:focus {border:2px solid #a5c7fe;}
@media screen and (-webkit-min-device-pixel-ratio:0)
{
 a:focus {border:0;}
}
textarea {resize:none;}
caption {width:0;height:0;text-indent:-9999px;}
/* Base */
label, input.button, input.submit , input.image, button {cursor:pointer;}
/* layout */
#Wrapper,
#Header,
#Container,
#Footer {width:100%;min-width:1020px}
#Container {overflow:hidden}
#Contents {width:1020px;height:100%;margin:0 auto;}
input[type="submit"],
button {outline:1 !important;font-family:'montserrat', 'noto', 'Roboto', sans-serif;font-weight:700}
/* BOARD WRITE */
.board-write-1s {table-layout:fixed;width:1020px;margin:0 auto;border-top:2px solid #888;}
.board-write-1s tbody tr th, .board-write-1s tbody tr td {border-bottom:1px solid #e6e6e6;color:#333;font-size:14px;text-align:left;line-height:18px;}
.board-write-1s tbody tr th {padding:30px 0 30px 20px;vertical-align:top;}
.board-write-1s tbody tr td select,
.board-write-1s tbody tr td input[type="text"],
.board-write-1s tbody tr td input[type="password"] {height:38px;}
.board-write-1s tbody tr td input[type="radio"],
.board-write-1s tbody tr td input[type="checkbox"] {vertical-align:middle;}
.board-write-1s tbody tr td .over {overflow:hidden;}
.board-write-1s tbody tr td select+select,
.board-write-1s tbody tr td input[type="text"]+select {margin-left:2px}
.board-write-1s tbody tr td .input-delete {display:inline-block;}
.board-write-1s tbody tr td .ButtonSubmit {float:right;width:114px;height:38px;line-height:38px;background:#969937;color:#fff;letter-spacing:-1px;}
.board-write-1s tbody tr.textarea td {padding:20px 0;}
.board-write-1s tbody tr.textarea td button.file {width:85px;height:38px;margin:10px 0 0;border-radius:5px;border:1px solid #ccc;background:#f6f6f6;color:#666;font-size:14px;line-height:18px;}
.board-write-1s tbody tr.textarea td span.file {display:inline-block;padding:20px 0 0 10px;color:#333;font-size:14px;line-height:18px;}
.board-write-1s tbody tr.textarea td span.file .ButtonDelete {margin:0 0 0 8px;}
.board-write-1s tbody tr.textarea td .txt {display:inline-block;padding:22px 0 0 10px;color:#666;font-size:12px;line-height:18px;vertical-align:-2px;}
.board-write-1s tbody tr.textarea td .file_area {margin-top:10px}
.board-write-1s tbody tr.textarea td .file_area .file_box {display:inline-block;position:relative;overflow:hidden;vertical-align:middle}
.board-write-1s tbody tr.textarea td .file_area .file_box label {display:inline-block;width:85px;height:38px;line-height:38px;font-weight:700;text-align:center;border-radius:5px;border:1px solid #ccc;background:#f6f6f6;color:#666;font-size:14px}
.board-write-1s tbody tr.textarea td .file_area .file_box input[type="file"] {position:absolute;top:0;left:-100px;width:10px}
.board-write-1s tbody tr.textarea td .file_area span.file {margin-left:10px;padding:0;color:#333;font-size:14px;line-height:38px;}
.board-write-1s tbody tr.textarea td .file_area span.file .ButtonDelete {margin:0 0 0 8px;vertical-align:middle}
.board-write-1s tbody tr.textarea td .file_area .txt {margin-left:10px;padding:0;color:#666;font-size:12px;line-height:38px;vertical-align:-1px;}
.board-write-1s tbody tr.notice td {padding:20px 0;}
.board-write-1s tbody tr.notice td label {display:inline-block;width:75px;vertical-align:middle;}
.board-write-1s tbody tr.notice td ul li {padding:20px 0 0;line-height:38px}
.board-write-1s tbody tr.notice td ul li:first-child {padding:0;}
.board-write-1s tbody tr td .list-customer ul {border-top:0;}
.board-write-1s tbody tr td .list-customer ul li:last-child {border-bottom:0;}
.board-write-1s .list-customer {width:auto;}
.board-write-1s .store_off{display:inline-block;margin:0 0 9px 20px;vertical-align:bottom;}
.board-write-1s .store_off label{color:#888;font-weight:bold;}
/*여백*/
.mgT40 {margin-top:40px !important;}
textarea {
 border:1px solid #ccc;
 padding:10px 8px;
 border-radius:5px;
 resize:none;
 font-family:'AppleGothic', 'Roboto', 'montserrat', 'noto', sans-serif;
 font-size:14px;
 line-height:20px;
 box-shadow:none;
 box-sizing:border-box;
 -webkit-appearance:none;
 /*outline:none;*/
}
select {
 width:100%;
 height:38px;
 padding:0 0 0 8px;
 border:1px solid #d0d0d0;
 border-radius:5px;
 font-size:14px;
 line-height:18px;
 font-family:'AppleGothic', 'Roboto', 'montserrat', 'noto', sans-serif;
 color:#333;
 /*vertical-align:middle;*/
 /*outline:none;*/
}

input[type="text"],
input[type="password"],
input[type="tel"] {
 height:38px;
 margin:0;
 padding:0;
 border:1px solid #d0d0d0;
 color:#888;
 background:none;
 border-radius:5px;
 border-radius:5px;
 -ms-border-radius:5px;
 -webkit-border-radius:5px;
 -o-border-radius:5px;
 -moz-border-radius:5px;
 /*outline:none;*/
 box-shadow:none;
 -webkit-appearance:none;
 -webkit-appearance:none;
 -moz-appearance:none;
 letter-spacing:0.5px;
 vertical-align:top;
}
input[type="text"]::-ms-clear,
input[type="password"]::-ms-clear,
input[type="tel"]::-ms-clear {
 display:none
}
input[type="text"]:focus,
input[type="password"]:focus,
input[type="tel"]:focus,
textarea:focus,
select:focus{
 color:#333;
 border:1px solid #969937;
}
input[type="submit"],
button {border:0;padding:0;box-shadow:none;cursor:pointer;} 
.agree_box {height:167px;margin-bottom:0;padding:20px;border:1px solid #dedede;overflow-y:auto;background:#f9f6ec;font-size:14px;color:#666;box-sizing:border-box;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;}
/*button*/
.btnGreen, a.btnGreen {    
	height: 50px;
    background-color: #969937;
    padding: 11px 0 9px;
    font-size: 18px;
    line-height: 30px;
    color: #fff;
    border-radius: 5px;
    font-weight: 700;
    display: inline-block;
    width: 150px;
    margin: 0 2px;
    box-sizing: border-box;
    text-align: center;}
.btnGray, a.btnGray {    
	height: 50px;
    background-color: #888;
    padding: 11px 0 9px;
    font-size: 18px;
    line-height: 30px;
    color: #fff;
    border-radius: 5px;
    font-weight: 700;
    display: inline-block;
    width: 150px;
    margin: 0 2px;
    box-sizing: border-box;
    text-align: center;}
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script>
var data =[{
	id:'hanmail',
	text:'hanmail.net'
},{
	id:'naver',
	text:'naver.com'
},{
	id:'nate',
	text:'nate.com'
},{
	id:'hotmail',
	text:'hotmail.com'
},{
	id:'yahoo',
	text:'yahoo.co.kr'
},{
	id:'paran',
	text:'paran.com'
},{
	id:'empal',
	text:'empal.com'
},{
	id:'gmail',
	text:'gmail.com'
},{
	id:'dreamwiz',
	text:'dreamwiz.com'
},{
	id:'korea',
	text:'korea.com'
},{
	id:'lycos',
	text:'lycos.co.kr'
},{
	id:'hanafos',
	text:'hanafos.com'
}]
$(document).ready(function(){
	$('#emailSelect').select2();
});
</script>

<div class="body-container">
<table class="board-write-1s mgT40">
			<caption>1:1 문의 등록</caption>
			<colgroup>
				<col style="width:25%;">
				<col style="width:75%;">
			</colgroup>
			<tbody>
				<form id="cnslRegForm" action="" method="POST" enctype="multipart/form-data"></form>
				<tr class="agree_box">
					<th scope="col">개인정보수집동의</th>
						<td>
							<strong>개인정보의 수집목적 및 항목</strong>
								<ul>
									<li>① 수집 목적 : 원활한 고객 상담, 불편사항 및 문의사항 관련 의사소통 경로 확보</li>
									<li>② 수집 항목</li>
         							<strong>*필수입력사항</strong>
         							<li>- 이용자 식별을 위한 항목 : 성명, 연락처, 이메일, 아이디(로그인 시 수집)</li>
								</ul>
								<ul>
									<strong>개인정보의 보유 및 이용기간</strong>
                                <p>
					                                    입력하신 개인정보는 문의 접수 후 처리 완료 시점으로 부터 3개월 간 보유 합니다.<br>
					                                    다만, 소비자보호에 관한 법률 등 관계 법률에 의해 보유할 필요가 있는 경우에는 다음과 같이 보유합니다.
                                </p>
                                <p>보유기간 : 소비자의 불만 또는 분쟁처리에 관한 기록 3년</p>
                                
                                <p class="pt20">※ 1:1문의 서비스 제공을 위한 최소한의 개인정보이며 거부할 수 있습니다. 다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다.</p>
								</ul>
								<ul>
									<li><input type="radio" name="check_info" value="agree">동의</li>
									<li><input type="radio" name="check_info" value="disagree" checked="checked">비동의</li>
								</ul>
						</td>
				</tr>
				<tr class="notice">
						<th scope="col">회원정보</th>
						<td>
							<ul>
								<li>
									<label for="NoticeID">Name</label>
									<input type="text" title="이름 입력하세요" class="name" name="name" placeholder="이름을 입력하세요" style="width:152px">
								</li>
								<li>
									<label for="NoticeEmail">E-mail</label>
									<input type="text" title="아이디를 입력하세요" class="email" name="emailAddr1" placeholder="아이디를 입력하세요" style="width:152px;ime-mode:disabled;" > <!-- disabled="disabled" -->
									<span class="des">@</span>
									<input type="text" class="email" name="emailAddr2" title="직접 입력 하세요" placeholder="직접 입력 하세요" style="width:140px;ime-mode:disabled;" > <!-- disabled="disabled" -->
									<input type="hidden" name="emailAddr" value="keh94k@naver.com">
									<select class="emailSelect"></select>
								</li>
								<li>
									<label for="NoticeSms">SMS</label>
									<select title="통신사를 선택하세요" id="rgnNoSelect" class="sms" name="cellSctNo" style="width:122px;" selected="selected">
										<option selected="selected">010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
										<option>0130</option>
										<option>0303</option>
										<option>0502</option>
										<option>0504</option>
										<option>0505</option>
										<option>0506</option>
									</select>
									<input type="hidden" id="cellSctNo" value="010">
									<span class="des">-</span>
									<input type="tel" class="sms" name="cellTxnoNo" value="" title="휴대폰 가운데 4자리를 입력하세요" maxlength="4" placeholder="0000" style="width:122px;">
									<span class="des">-</span>
									<input type="tel" class="sms" name="cellEndNo" value="" title="휴대폰 마지막 4자리를 입력하세요" maxlength="4" placeholder="0000" style="width:122px;">
								</li>
								
							</ul>
						</td>
					</tr>
					<tr>
						<th scope="col"><label for="TypeInquiry">문의유형</label></th>
						<td>
							<select id="cnslLrgCate" title="문의유형 항목을 선택하세요" style="width:192px;">
								<option value="" selected="selected">선택해주세요</option>
								<option value="40">회원/멤버십</option>
								<option value="10">주문/결제</option>
								<option value="20">배송</option>
								<option value="30">교환/반품/환불</option>
								<option value="60">이벤트</option>
								<option value="90">기타</option>
							</select>
							<select id="cnslMidCate" title="문의유형 항목을 선택하세요" style="width:192px;" disabled="disabled">
								<option value="" selected="selected">선택해주세요</option>
							</select>
						</td>
					</tr>
					<tr class="textarea">
						<th scope="col"><label for="InputTextarea">내용</label></th>
						<td>
							<textarea id="InputTextarea" name="inqCont" cols="5" rows="1" placeholder="문의내용을 입력해주세요.(2000자 이내)" style="width:98%;height:280px;"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<ul>
								<li style="margin-left:336px; padding-top: 30px;">
								<a href="javascript:;" id="cnslSubmit" class="btnGreen">등록</a>
								<a href="javascript:;" id="cnslCancel" class="btnGray">취소</a>
								</li>
							</ul>
						</td>
					</tr>
				
			</tbody>
		</table>
	
</div>