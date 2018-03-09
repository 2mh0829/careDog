<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div id="faqArticle">
	<div class="head_article">
		<h3 id="faqBody" class="tit_article">faq</h3>
		<strong class="screen_out">정렬 방식</strong>
		<ul class="help_align">
			<li class="on" aria-labelledby="link_align_d"><a href="/center/faq/list" class="link_align" id="link_align_d">전체</a></li>
			<li  aria-labelledby="link_align_r"><a href="/center/faq/list?sortType=R" class="link_align" id="link_align_r">조회순</a></li>
			<li  aria-labelledby="link_align_s"><a href="/center/faq/list?sortType=S" class="link_align" id="link_align_s">만족순</a></li>
		</ul>
	</div>
	<div class="cont_faq">
					<div id="19513" class="faq_item">
				<a href="#19513" class="btn_faq"><span class="txt_cat">[결제방법]</span> 캐쉬를 충전할 수 있는 수단은 무엇이 있나요?<span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19513" class="faq_view">
					<strong class="tit_faq">캐쉬를 충전할 수 있는 수단은 무엇이 있나요?</strong>
					<div class="desc_faq"><p><span style="FONT-SIZE: 9pt">캐쉬를 충전할 수 있는 결제수단으로는 휴대폰, 신용카드, 계좌이체, 무통장입금, 문화상품권, 해피머니상품권, </span></p>
<p><span style="FONT-SIZE: 9pt">도서문화상품권, 편의점결제 등이 있습니다.</span></p>
<p><span style="FONT-SIZE: 9pt; LINE-HEIGHT: 1.5"><br></span></p>
<p><span style="FONT-SIZE: 9pt; LINE-HEIGHT: 1.5">구체적인 이용방법은 '내결제 페이지 &gt; 하단의 충전수단 안내를 참고하시기 바라며,</span></p>
<p><span style="FONT-SIZE: 9pt; LINE-HEIGHT: 1.5">캐쉬를 충전하신 후 다양한 유료서비스 등을 이용해 주시기 바랍니다.</span></p><p><span style="FONT-SIZE: 9pt; LINE-HEIGHT: 1.5"><br></span></p><p><span style="FONT-SIZE: 9pt; LINE-HEIGHT: 1.5"><b><u><span style="color: rgb(34, 130, 249);"></span><a href="https://cash.daum.net/Skyline-section/daumCash/cashInfo.daum" target="_blank" class="tx-link"><span style="color: rgb(34, 130, 249);">충전수단 안내 바로가기</span></a><span style="color: rgb(34, 130, 249);"></span></u></b></span></p></div>
					<form id="surveyForm_19513" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4267" />
						<input type="hidden" name="faqId" value="19513" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19513_5" name="score_19513" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19513_4" name="score_19513" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19513_3" name="score_19513" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19513_2" name="score_19513" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19513_1" name="score_19513" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
					<div id="19516" class="faq_item">
				<a href="#19516" class="btn_faq"><span class="txt_cat">[한도금액및수수료]</span> 결제방법별 한도액을 알려주세요.<span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19516" class="faq_view">
					<strong class="tit_faq">결제방법별 한도액을 알려주세요.</strong>
					<div class="desc_faq"><p><span style="FONT-SIZE: 9pt">Daum캐쉬는 보다 안전한 결제이용을 위하여 자체적으로 이용한도를 정해 운영하고 있습니다.</span><br><span style="FONT-SIZE: 9pt">충전하시는 결제수단에 따라 아래와 같이 이용한도가 정해져 있으며, 한도금액 이상 충전시도시 'Daum캐쉬 자체한도초과' 오류가 발생되므로 참고해주세요.</span><br><span style="FONT-SIZE: 9pt">(이동통신사, 신용카드사 등에서 제공하는 결제한도와는 별도로 Daum자체한도입니다.)</span><br></p><span style="FONT-SIZE: 9pt"></span><br>
<div class="txc-textbox" style="BORDER-TOP: rgb(203,203,203) 1px solid; BORDER-RIGHT: rgb(203,203,203) 1px solid; BORDER-BOTTOM: rgb(203,203,203) 1px solid; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 10px; BORDER-LEFT: rgb(203,203,203) 1px solid; PADDING-RIGHT: 10px; BACKGROUND-COLOR: rgb(255,255,255)">
<p>① 신용카드 - 월 50만원</p><p>② 휴대폰 - 월 30만원 (이통사 소액결제 한도에 따라 다를 수 있음)&nbsp;</p><p>③ 무통장입금 - 1회 5천원~10만원</p><p>④ 편의점 결제 - 1회 3천원~5만원</p><p>⑤ 문화상품권 - 월 10만원&nbsp;<span style="font-size: 9pt;">(1회 최대 5만원)</span></p><p>⑥ 도서문화상품권 - 월 10만원 (1회 최대 5만원)</p><p>⑦ 해피머니상품권 - 월 10만원&nbsp;<span style="font-size: 9pt;">(1회 최대 5만원)</span></p><p><span style="FONT-SIZE: 9pt"><br></span></p>
<p><span style="FONT-SIZE: 9pt">※ 이용한도 체크기간은 매월 1일~말일입니다.</span><br></p></div>
<p>&nbsp;</p></div>
					<form id="surveyForm_19516" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4270" />
						<input type="hidden" name="faqId" value="19516" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19516_5" name="score_19516" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19516_4" name="score_19516" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19516_3" name="score_19516" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19516_2" name="score_19516" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19516_1" name="score_19516" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
					<div id="19521" class="faq_item">
				<a href="#19521" class="btn_faq"><span class="txt_cat">[결제방법]</span> Daum캐쉬란 무엇인가요?<span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19521" class="faq_view">
					<strong class="tit_faq">Daum캐쉬란 무엇인가요?</strong>
					<div class="desc_faq"><p>Daum캐쉬는 카카오에서 제공하는 유료서비스를 현금처럼 사용하실 수 있는 인터넷 결제 수단입니다.<br><br>Daum캐쉬 충전은 누구나 이용할 수 있는 다양한 방법으로 간편하게 결제할 수 있도록 지원하고 있습니다.<br><br>휴대폰, 신용카드,계좌이체, 무통장입금 등 여러가지 방법으로 Daum캐쉬를 충전하여 이용하실 수 있으므로 많은<br>이용 부탁드립니다.<br></p></div>
					<form id="surveyForm_19521" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4267" />
						<input type="hidden" name="faqId" value="19521" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19521_5" name="score_19521" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19521_4" name="score_19521" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19521_3" name="score_19521" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19521_2" name="score_19521" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19521_1" name="score_19521" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
					<div id="19522" class="faq_item">
				<a href="#19522" class="btn_faq"><span class="txt_cat">[결제방법]</span> 신용카드, 휴대폰 등으로 결제한 경우 청구서에 어떻게 표기가 되나요?<span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19522" class="faq_view">
					<strong class="tit_faq">신용카드, 휴대폰 등으로 결제한 경우 청구서에 어떻게 표기가 되나요?</strong>
					<div class="desc_faq"><p><span style="FONT-SIZE: 9pt">사용하신 결제수단에 따라 아래와 같이 청구서에 표기되어 청구되므로 참고해 주시기 바랍니다.</span></p>
<p><span style="FONT-SIZE: 9pt"><br></span></p>
<div class="txc-textbox" style="BORDER-TOP: rgb(203,203,203) 1px solid; BORDER-RIGHT: rgb(203,203,203) 1px solid; BORDER-BOTTOM: rgb(203,203,203) 1px solid; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 10px; BORDER-LEFT: rgb(203,203,203) 1px solid; PADDING-RIGHT: 10px; BACKGROUND-COLOR: rgb(255,255,255)">
<p><span style="FONT-SIZE: 9pt">- 신용카드 : 카카오 / KCP</span><br><span style="FONT-SIZE: 9pt">- 계좌이체 : 카카오 </span><br><span style="FONT-SIZE: 9pt">- 휴대폰 : 소액결제 모빌리언스(엠캐쉬)&nbsp;</span><br></p></div>
<p><br></p></div>
					<form id="surveyForm_19522" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4267" />
						<input type="hidden" name="faqId" value="19522" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19522_5" name="score_19522" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19522_4" name="score_19522" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19522_3" name="score_19522" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19522_2" name="score_19522" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19522_1" name="score_19522" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
					<div id="19523" class="faq_item">
				<a href="#19523" class="btn_faq"><span class="txt_cat">[결제방법]</span> 신용카드&nbsp;할부결제가&nbsp;가능한가요?&nbsp;<span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19523" class="faq_view">
					<strong class="tit_faq">신용카드&nbsp;할부결제가&nbsp;가능한가요?&nbsp;</strong>
					<div class="desc_faq"><p>신용카드로 결제시 충전금액이 5만원 이상인 경우 할부결제가 가능합니다. <br>다만, 할부수수료는 일부 무이자할부 이벤트 카드를 제외하고는 고객님께서 부담하셔야 하므로 이점 양해부탁드립니다. </p>
<br><p>(현재 카드사정책으로 인하여 무이자할부 이벤트는 중단중 입니다)<br></p></div>
					<form id="surveyForm_19523" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4267" />
						<input type="hidden" name="faqId" value="19523" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19523_5" name="score_19523" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19523_4" name="score_19523" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19523_3" name="score_19523" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19523_2" name="score_19523" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19523_1" name="score_19523" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
					<div id="19533" class="faq_item">
				<a href="#19533" class="btn_faq"><span class="txt_cat">[결제방법]</span> 무통장입금을 신청했는데 계좌번호를 다시 확인하고 싶어요. <span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19533" class="faq_view">
					<strong class="tit_faq">무통장입금을 신청했는데 계좌번호를 다시 확인하고 싶어요. </strong>
					<div class="desc_faq"><P><SPAN style="FONT-SIZE: 14pt"><STRONG>가상계좌번호 확인방법</STRONG></SPAN></P>
<P>&nbsp;</P>
<DIV class=txc-textbox style="BORDER-TOP: #cbcbcb 1px solid; BORDER-RIGHT: #cbcbcb 1px solid; BORDER-BOTTOM: #cbcbcb 1px solid; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 10px; BORDER-LEFT: #cbcbcb 1px solid; PADDING-RIGHT: 10px; BACKGROUND-COLOR: #ffffff"><SPAN style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif">① Daum 로그인후 <STRONG><U><SPAN style="COLOR: #2282f9"></SPAN></U></STRONG><A class=tx-link href="https://cash.daum.net/Skyline-section/settlement/manage.daum" target=_blank><STRONG><U><SPAN style="COLOR: #2282f9">결제정보관리</SPAN></U></STRONG></A> 페이지로 이동합니다.</SPAN> 
<P>
<P><SPAN style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif"></SPAN>
<P><SPAN style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif">② 가상계좌입금정보 관리에서 계좌번호 확인할 수 있습니다.</P></SPAN>
<P></P>
<P></P>
<DIV><SPAN style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif">③ 단, 최근 7일이내에 신청하신 내역으로 아직 입금하지 않으신 계좌정보만 확인됩니다.</SPAN><SPAN style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif"> </SPAN></DIV></DIV></div>
					<form id="surveyForm_19533" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4267" />
						<input type="hidden" name="faqId" value="19533" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19533_5" name="score_19533" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19533_4" name="score_19533" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19533_3" name="score_19533" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19533_2" name="score_19533" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19533_1" name="score_19533" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
					<div id="19534" class="faq_item">
				<a href="#19534" class="btn_faq"><span class="txt_cat">[결제방법]</span> Daum캐쉬의 결제 시스템은 안전한가요?<span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19534" class="faq_view">
					<strong class="tit_faq">Daum캐쉬의 결제 시스템은 안전한가요?</strong>
					<div class="desc_faq"><p><span style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif">저희 카카오의 결제시스템은 Verisign에 의해 인증된 256 SSL 방식에 의해 보호되므로 외부로부터의 불법침입을 완전히 차단합니다. 그러므로 안심하시고 결제하셔도 됩니다.&nbsp;</span></p>
<div><span style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif"><br></span></div>
<div class="txc-textbox" style="BORDER-TOP: rgb(203,203,203) 1px solid; BORDER-RIGHT: rgb(203,203,203) 1px solid; BORDER-BOTTOM: rgb(203,203,203) 1px solid; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 10px; BORDER-LEFT: rgb(203,203,203) 1px solid; PADDING-RIGHT: 10px; BACKGROUND-COLOR: rgb(255,255,255)">
<div><span style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif">SSL(Secure Socket Layer) 웹서버인증이란?&nbsp;</span></div>
<div><span style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif"><br></span></div>
<div><span style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif">서버와 브라우저간의 데이터 전송구간을 256bit 암호화로 전송시키는 보안 시스템 입니다. SSL웹서버인증서가 설치되어 있는 웹사이트에서는 로그인시 아이디 및 패스워드 등의 개인정보를 암호화시켜 전송합으로써, 개인정보가 인터넷 연결 중간에 해커와 같은 누군가에 의해 가로채어진다고 하더라도 안전하게 보호해줍니다.</span> </div></div>
<p><br></p></div>
					<form id="surveyForm_19534" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4267" />
						<input type="hidden" name="faqId" value="19534" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19534_5" name="score_19534" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19534_4" name="score_19534" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19534_3" name="score_19534" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19534_2" name="score_19534" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19534_1" name="score_19534" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
					<div id="19539" class="faq_item">
				<a href="#19539" class="btn_faq"><span class="txt_cat">[미성년결제]</span> 부모님동의를&nbsp;받았는데도&nbsp;부모동의&nbsp;요청창이&nbsp;반복됩니다.<span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19539" class="faq_view">
					<strong class="tit_faq">부모님동의를&nbsp;받았는데도&nbsp;부모동의&nbsp;요청창이&nbsp;반복됩니다.</strong>
					<div class="desc_faq">부모님의 동의를 받으셨는데도 동의창이 다시 보여진다면 아래의 내용대로 진행해 주시기 바랍니다.&nbsp; 
<DIV><BR></DIV>
<DIV class=txc-textbox style="BORDER-TOP: rgb(203,203,203) 1px solid; BORDER-RIGHT: rgb(203,203,203) 1px solid; BORDER-BOTTOM: rgb(203,203,203) 1px solid; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 10px; BORDER-LEFT: rgb(203,203,203) 1px solid; PADDING-RIGHT: 10px; BACKGROUND-COLOR: rgb(255,255,255)">
<DIV>① 컴퓨터를 재부팅하신 후 인터넷 브라우저의 '도구 &gt; 인터넷옵션 &gt; 임시인터넷파일 &gt; 설정'으로 들어갑니다.</DIV>
<DIV>② '저장된 파일의 새 버전 확인'을 '페이지를 열 때마다'로 설정해주시기 바랍니다.</DIV>
<DIV>③ '도구 &gt; 인터넷옵션 &gt; 임시인터넷파일 &gt; 파일삭제'를 클릭하여 저장된 임시 인터넷 파일을 모두 삭제합니다.</DIV></DIV>
<DIV>&nbsp;</DIV></div>
					<form id="surveyForm_19539" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4268" />
						<input type="hidden" name="faqId" value="19539" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19539_5" name="score_19539" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19539_4" name="score_19539" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19539_3" name="score_19539" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19539_2" name="score_19539" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19539_1" name="score_19539" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
					<div id="19546" class="faq_item">
				<a href="#19546" class="btn_faq"><span class="txt_cat">[불법결제]</span> 아이디도용&nbsp;등으로&nbsp;인해&nbsp;Daum캐쉬가&nbsp;사용된&nbsp;경우&nbsp;보상이&nbsp;가능한가요?&nbsp;<span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19546" class="faq_view">
					<strong class="tit_faq">아이디도용&nbsp;등으로&nbsp;인해&nbsp;Daum캐쉬가&nbsp;사용된&nbsp;경우&nbsp;보상이&nbsp;가능한가요?&nbsp;</strong>
					<div class="desc_faq"><P><SPAN style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif"><SPAN style="COLOR: rgb(0,0,0)">아이디와 비밀번호의 관리는 고객님의 책임하에 있으며, 회원의 개인정보 관리 소홀로 인한 과실은&nbsp;</SPAN><B><SPAN style="COLOR: rgb(0,0,0)">보상이 불가능</SPAN></B><SPAN style="COLOR: rgb(0,0,0)">합니다. </SPAN></SPAN></P>
<P><SPAN style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif"><SPAN style="COLOR: rgb(0,0,0)"></SPAN></SPAN>&nbsp;</P>
<P><SPAN style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif"><SPAN style="COLOR: rgb(0,0,0)">다른 사람에 의해 Daum 캐쉬가 사용되었다면 더 이상의 피해가 없도록&nbsp;비밀번호 변경 및 </SPAN></SPAN></P>
<P><SPAN style="FONT-SIZE: 9pt; FONT-FAMILY: Dotum, 돋움, sans-serif"><SPAN style="COLOR: rgb(0,0,0)">비밀번호 변경 열쇠 질문과 답을 변경하여 주시기 바랍니다.</SPAN></SPAN></P></div>
					<form id="surveyForm_19546" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4269" />
						<input type="hidden" name="faqId" value="19546" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19546_5" name="score_19546" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19546_4" name="score_19546" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19546_3" name="score_19546" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19546_2" name="score_19546" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19546_1" name="score_19546" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
					<div id="19547" class="faq_item">
				<a href="#19547" class="btn_faq"><span class="txt_cat">[불법결제]</span> 개인정보도용,&nbsp;결제사기로&nbsp;피해를&nbsp;입은&nbsp;경우&nbsp;결제자의&nbsp;개인정보를&nbsp;확인할&nbsp;수&nbsp;있나요?&nbsp;<span class="bg_cs" alt="펼치기"></span></a>
				<div id="hDesc_19547" class="faq_view">
					<strong class="tit_faq">개인정보도용,&nbsp;결제사기로&nbsp;피해를&nbsp;입은&nbsp;경우&nbsp;결제자의&nbsp;개인정보를&nbsp;확인할&nbsp;수&nbsp;있나요?&nbsp;</strong>
					<div class="desc_faq"><P>개인정보도용 및 결제사기로 피해를 입은 피해자께서 요청하시더라도 </P>
<P>개인정보보호 관련법령에 따라 직접 개인정보를 확인하여 드릴 수는 없습니다.</P>
<P>&nbsp;</P>
<P>번거로우시더라도 사이버수사대 혹은 가까운 경찰서로 수사의뢰하여 주시기 바랍니다.</P>
<P>경찰측에서 공문이 접수될 경우 경찰측으로는 상세정보를 모두 제공해드립니다.</P></div>
					<form id="surveyForm_19547" class="surveyArea" action="/survey.html" method="get" onsubmit="return false;">
						<input type="hidden" name="sendScore" value="N" />
						<input type="hidden" name="siteId" value="22" />
						<input type="hidden" name="catId" value="4269" />
						<input type="hidden" name="faqId" value="19547" />
						<input type="hidden" name="pageNo" value="1" />
						<fieldset>
							<div class="faq_rate">
								<strong class="tit_rate">위 도움말에 만족하셨나요?<span class="bg_cs"></span></strong>
								<button type="button" id="score_19547_5" name="score_19547" value="5" class="btn_rate"><span class="bg_cs rate5"></span>매우만족</button>
								<button type="button" id="score_19547_4" name="score_19547" value="4" class="btn_rate"><span class="bg_cs rate4"></span>만족</button>
								<button type="button" id="score_19547_3" name="score_19547" value="3" class="btn_rate"><span class="bg_cs rate3"></span>보통</button>
								<button type="button" id="score_19547_2" name="score_19547" value="2" class="btn_rate"><span class="bg_cs rate2"></span>불만</button>
								<button type="button" id="score_19547_1" name="score_19547" value="1" class="btn_rate"><span class="bg_cs rate1"></span>매우불만</button>
							</div>
							<button type="button" class="btn_save"><span class="bg_cs"></span>MY 저장</button>
						</fieldset>
					</form>
					<a href="#none" class="bg_cs btn_close">접기</a>
				</div>
			</div>
			</div>
			<!-- Paging -->
	<div class="paging_comm">
		<span class="bg_cs btn_prev"> 이전 게시물 없음 </span>					                <span class="screen_out">현재페이지</span><em class="link_page">1</em>
								                <a href="?page=2" class="link_page">2</a>
								                <a href="?page=3" class="link_page">3</a>
								                <a href="?page=4" class="link_page">4</a>
								                <a href="?page=5" class="link_page">5</a>
							<a href="?page=5" class="bg_cs btn_next"> 다음 </a>	</div>
	<!--// Paging -->
	
							<div class="faq_notice">
			<p class="desc_notice"><span class="bg_cs"></span>원하시는 답변을 찾지 못하셨다면, 고객센터에 문의하여주세요</p>
			<a href="https://cs.daum.net/question/22.html" id="questionBtn" class="btn_cs2 link_notice">문의하기</a>
		</div>
	
</div><!--//mArticle -->



<!--[if lt IE 9]>
<script src="//s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.1.min.js"></script>
<![endif]-->

<!--[if gte IE 9]><!-->
<script src="//s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-2.1.1.min.js"></script>
<!--<![endif]-->

<script src="/js/common.js"></script>

<!--[if IE 6]>
<script type="text/javascript">
$(document).ready(function(e){
    $('.cont_inquiry:first-child, .cont_file:first-child, .custom_radio .cont_custom:first-child').addClass('fst');
    $('.inquiry_select').each(function(index){
        $(this).css('z-index',($('.inquiry_select').length-index)+1)
    })
})
</script>
<![endif]-->
<!--[if lte IE 7]>
<script type="text/javascript">
$(document).ready(function(e){
    $('.tf_inquiry').on({
        focusin:function(e){
            $(this).addClass('focus')
        },
        focusout:function(e){
            $(this).removeClass('focus')
        }
    });
    $('.inquiry_select').each(function(index){
        $(this).css('z-index',($('.inquiry_select').length-index)+1)
    })
})
</script>
<![endif]-->

<script type="text/javascript">
    /* 공통 변수 (Java to Javascript) */
    window.CS.Variable = (function() {
        return {
            isLogin : false,
            httpPrefix : 'http://cs.daum.net',
            sslPrefix : 'https://cs.daum.net'
        };
    })();


    /* UserAgent */
    window.CS.UserAgent = (function() {
        return {"app":{"isApp":false,"name":"","version":""},"browser":{"major":"64","minor":"0","name":"chrome","patch":"3282","version":"64.0.3282.186"},"os":{"android":false,"bada":false,"blackberry":false,"ios":false,"linux":false,"mac":false,"name":"windows","polaris":false,"webos":false,"windows":true},"platform":"pc","ua":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36"};
    })();
</script>



<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
jQuery(function(){

    /* FAQ 선택 */
	jQuery('.btn_faq').on('click', function(e) {
        var _jQ_this = jQuery(this);
        _jQ_this.closest('.faq_item').addClass('on');
        jQuery('.faq_item').each(function(index){
            if (index != _jQ_this.closest('.faq_item').index()) {
	            jQuery(this).removeClass('on');
            }
        });

        // 부드러운 이동
        jQuery('html, body').animate({
            scrollTop : _jQ_this.closest('.faq_item').offset().top
        }, 300);

		        CS.Ajax.increaseFaqReadCount(jQuery(this).attr('href').replace('#', ''));
	});

	/* FAQ 선택 후 닫기 */
    jQuery('.faq_view .btn_close').on('click', function(e) {
        e.preventDefault();
        jQuery(this).closest('.faq_item').removeClass('on');
    });

	/* 스크롤 이동 & 노출 제어
	 * 1. faqId 파라미터가 존재할 경우 -> 해당 faqId를 기준으로 이동 & 노출
	 * 2. faqId 파라미터가 존재하지 않을 경우 + 앵커가 존재할 경우 -> 앵커를 기준으로 이동 & 노출
	 * 3. faqId 파라미터가 존재하지 않을 경우 + 앵커가 존재할 경우 + 해당하는 앵커대상이 없을 경우 -> 앵커 초기화
	 * 4. faqId 파라미터가 존재하지 않을 경우 + 앵커가 존재하지 않을 경우 -> 이동 & 노출 없음
	 */
    var showFaqId = 0;
    if (showFaqId > 0) {
		jQuery('#' + showFaqId).find('.btn_faq').trigger('click');
    } else {
        var _href = window.location.href;
        if (_href.indexOf('#') > -1) {
            var anchorFaqId = _href.substring(_href.indexOf('#') + 1);
            if (jQuery('#' + anchorFaqId).length > 0) {
                jQuery('#' + anchorFaqId).find('.btn_faq').trigger('click');
            } else {
                window.location.href = '#';
            }
        }
	}

    /* 만족도 조사 버튼 */
    jQuery('button.btn_rate').on('click', function(e) {
		var _jQ_this = jQuery(this);
		var _jQ_this_form = _jQ_this.closest('form.surveyArea');
		if (_jQ_this_form.find('input[name="sendScore"]').val() == 'Y') {
			alert('이미 평가 하셨습니다.');
			_jQ_this.closest('.faq_rate').find('.btn_rate.on').focus();
		} else {
            if (confirm( '\''+ $(this).text() +'\'으로 평가하시겠습니까?')) {
				CS.Ajax.insertFaqRating({
					faqId : _jQ_this_form.find('input[name="faqId"]').val(),
					score : _jQ_this.attr('value')
				});
				_jQ_this_form.find('input[name="sendScore"]').val('Y');
				_jQ_this.addClass('on');
            }
		}
    });

    /* MY 저장 버튼 */
    jQuery('button.btn_save').on('click', function(e) {
        var _faqId = jQuery(this).closest('form.surveyArea').find('input[name="faqId"]').val();
		            CS.Layer.showConfirm({
                title :'로그인',
                contents : [
                    '로그인이 필요합니다.',
                    '로그인 하시겠습니까?'
                ],
                fnCallback1 : function() {
                    jQuery.cookie('afterInsertMyFaq', _faqId, { path : '/faq/22' });                     window.location.href = 'https://logins.daum.net/accounts/loginform.do?daumauth=1&url=' + encodeURIComponent(window.location.href);
                }
            });
		    });

	
	/* 문의하기 버튼 관련 */
	jQuery('#questionBtn').on('click', function(e) {
		e.preventDefault();
		if (CS.Fn.isMSIEMinorVer()) { // IE 7 이하 대응
			unsupportedBrowserAlert();
			return;
		}

					var targetUrl = encodeURIComponent(jQuery(this).attr('href'));
							var opt = {
					title : ['로그인 하시겠습니까?'],
					contents : [
						'로그인 상태로 진행하면 접수 내역과 내용을 My에서 확인할 수 있습니다.',
						'(로그인하지 않아도 접수는 가능합니다)'
					],
					fnCallback1 : function() {
						window.location.href = 'https://logins.daum.net/accounts/loginform.do?daumauth=1&url=' + targetUrl;
					},
					fnCallback2 : function() {
						window.location.href = decodeURIComponent(targetUrl);
					}
				};
				CS.Layer.showConfirm(opt);
						});

});
</script>
