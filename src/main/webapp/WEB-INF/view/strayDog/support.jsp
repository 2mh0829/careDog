<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.content { float: left; width: 954px; /*min-height:800px;*/}
.content.page-main { float: none; width: auto; }
.page-tit { margin: 30px 0; color: #222; line-height: 1; margin-left: -2px; font-size: 32px; position:relative; }/* 20171027 수정 */
.page-tit:before { display: block; width: 30px; margin-bottom: 12px; margin-left: 2px; border-top: 3px solid #1991d7; content: ''; }
.gobusan {position:absolute; right:0; vertical-align:middle; font-weight:normal;} /* 20171027 추가*/
h1 {
  font-size: 2em;
  margin: 0.67em 0;
}
.sponsor__area { margin: 20px 0 0; }
.sponsor__tit { margin: 0; font-size: 36px; color: #222; }
.sponsor__point { color: #1991d7; }
.sponsor__txt { margin: 20px 0 0; font-weight: 700; color: #222; font-size: 24px; }
.sponsor__subject { font-weight: 700; color: #222; font-size: 14px; }
.sponsor__subject + .sponsor__content { margin-top: 8px; }
.sponsor__content { margin: 0; padding: 0; color: #666; font-size: 14px; }
.sponsor__content + .sponsor__subject { margin-top: 15px; }
.sponsor__postscript { margin: 25px 0 0; color: #1991d7; font-size: 13px; }
.sponsor__body { margin-top: 50px; }
.sponsor__list { padding: 0; margin: 0; list-style: none; border-top: 1px solid #d6d6d6; border-left: 1px solid #d6d6d6; }
.sponsor__list:after { display: block; clear: both; content: ''; }
.sponsor__item { float: left; position: relative; display: inline-block; width: 50%; padding: 30px; border-bottom: 1px solid #d6d6d6; border-right: 1px solid #d6d6d6; -webkit-box-sizing: border-box; box-sizing: border-box; }
.sponsor__item-wrap { height: 100%; background: url("<%=cp%>/resource/img/strayDog/sponsor_icon1.png") no-repeat right bottom; }
.sponsor__item-wrap.nth-2 { background-image: url("<%=cp%>/resource/img/strayDog/sponsor_icon2.png"); }
.sponsor__item-wrap.nth-3 { background-image: url("<%=cp%>/resource/img/strayDog/sponsor_icon3.png"); }
.sponsor__item-wrap.nth-4 { background-image: url("<%=cp%>/resource/img/strayDog/sponsor_icon4.png"); }
.sponsor__item-tit { margin: 0; font-size: 18px; color: #1991d7; }
.sponsor__item-txt { margin: 12px 0 0; font-size: 14px; color: #767676; line-height: 1.3; }
.sponsor__item-link { position: absolute; bottom: 30px; display: inline-block; width: 140px; height: 40px; margin: 20px 0 0; line-height: 40px; background-color: #1991d7; color: #fff; text-align: center; }
.sponsor__item-link.type-another { width: 110px; height: 40px; }
.sponsor__item-link.type-another + .type-another { left: 150px; }
.sponsor__sub-tit { margin: 60px 0 0; font-size: 24px; color: #222; }
.sponsor__account-box { width: 100%; height: 75px; margin-top: 20px; border: 1px solid #d6d6d6; -webkit-box-sizing: border-box; box-sizing: border-box; text-align: center; }
.sponsor__account-txt { position: relative; display: inline-block; margin: 0; padding-left: 70px; line-height: 75px; color: #222; font-weight: 700; }
.sponsor__account-txt:before { position: absolute; top: 0; bottom: 0; left: 0; width: 60px; height: 37px; margin: auto 0; background: url("<%=cp%>/resource/img/strayDog/sponsor_icon5.png") no-repeat; content: ''; }
.sponsor__account-list { margin: 20px 0 0; padding: 0; list-style: none; }
.sponsor__account-item { text-indent: -14px; padding-left: 14px; line-height: 1; }
.sponsor__account-item + .sponsor__account-item { margin-top: 10px; }
body { font-size: 14px; font-family: "Nanum Gothic", sans-serif; word-break: keep-all; color: #555; }

fieldset { border: none; margin: 0; padding: 0; }

legend { position: absolute; top: -999em; left: -999em; }

b, strong { font-weight: bold; }

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
.page-tit { margin: 30px 0; color: #222; line-height: 1; margin-left: -2px; font-size: 32px; position:relative; }/* 20171027 수정 */
.page-tit:before { display: block; width: 30px; margin-bottom: 12px; margin-left: 2px; border-top: 3px solid #1991d7; content: ''; }
</style>
<div class="body-container">
   <h1 class="page-tit">후원신청</h1>
   <div class="sponsor__body">
		<ul class="sponsor__list">
			<li class="sponsor__item h180">
				<div class="sponsor__item-wrap nth-1">
					<h3 class="sponsor__item-tit">정기후원</h3>
					<p class="sponsor__item-txt">
						CareDog이 안정적으로 활동할 수 있도록 매달<br>
						보내주시는 정기 후원입니다.
					</p>
					
					<a class="sponsor__item-link" href="<%=cp %>/strayDog/fixSupport">정기후원 신청</a>
					
				</div>
			</li>
			<li class="sponsor__item h180">
				<div class="sponsor__item-wrap nth-2">
					<h3 class="sponsor__item-tit">일시후원</h3>
					<p class="sponsor__item-txt">
						신용카드,핸드폰,계좌이체를 통하여 후원금을 납부하시는 <br>
						방법입니다.
					</p>
					<a class="sponsor__item-link" href="<%=cp %>/strayDog/tempSupport">일시후원 신청</a>
				</div>
			</li>
			<li class="sponsor__item h200">
				<div class="sponsor__item-wrap nth-3">
					<h3 class="sponsor__item-tit">후원금 증액</h3>
					<p class="sponsor__item-txt">
						조금 더 여유를 내어주실 수 있다면,<br>
						지금 회원님의 후원금을 증액해 주세요.
					</p>
					<a class="sponsor__item-link" href="<%=cp %>/strayDog/addSupport">후원금 증액</a>
				</div>
			</li>
			<li class="sponsor__item h200">
				<div class="sponsor__item-wrap nth-4">
					<h3 class="sponsor__item-tit">Donation with Paypal(for international user)</h3>
					<p class="sponsor__item-txt">
						페이팔 서비스를 이용해 해외 어디에서든<br>
						후원하실 수 있습니다.<br>
						You can make a donation with Paypal from overseas.
					</p>
					<a class="sponsor__item-link type-another" href="javascript:chkForm();">SINGLE</a>
					<a class="sponsor__item-link type-another" href="paypal.asp" target="_blank">MONTHLY</a>
				</div>
			</li>
		</ul>
		<h3 class="sponsor__sub-tit">후원계좌</h3>
		<div class="sponsor__account-box">
			<p class="sponsor__account-txt">
				ㅇㅇ은행  999999 - 01 - 999999 <span class="sponsor__name">(예금주 : 쌍용G클래스)</span>
			</p>
		</div>
		<ul class="sponsor__account-list">
			<li class="sponsor__account-item">ㆍ개인은 연급여의 30% 이내에 해당하는 기부금액은 전액 소득공제를 받으실 수 있습니다.</li>
			<li class="sponsor__account-item">ㆍ법인(기업)의 기부금은 법인세금 제 24조 규정에 의해 손금을 인정 받을 수 있습니다.</li>
			<li class="sponsor__account-item">ㆍ후원금 사용 내역은 매달 초 살림공개 게시판에 공지됩니다.</li>
		</ul>
	</div>
</div>