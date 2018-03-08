<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.sponsor__body {
    margin-top: 50px;
}
div {
    display: block;
}
ul, menu, dir {
    display: block;
    list-style-type: disc;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}
.sponsor__list {
    padding: 0;
    margin: 0;
    list-style: none;
    border-top: 1px solid #d6d6d6;
    border-left: 1px solid #d6d6d6;
}
.sponsor__list:after {
    display: block;
    clear: both;
    content: '';
}
.sponsor__item {
    float: left;
    position: relative;
    display: inline-block;
    width: 50%;
    padding: 30px;
    border-bottom: 1px solid #d6d6d6;
    border-right: 1px solid #d6d6d6;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.h180 {
    height: 180px !important;
}
.h200 {
    height: 200px !important;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.sponsor__item-wrap {
    height: 100%;
    background: url(<%=cp%>/resource/img/strayDog/sponsor_icon1.png) no-repeat right bottom;
}
.sponsor__item-wrap.nth-2 {
    background-image: url(<%=cp%>/resource/img/strayDog/sponsor_icon2.png);
}
.sponsor__item-wrap.nth-3 {
    background-image: url(<%=cp%>/resource/img/strayDog/sponsor_icon3.png);
}
.sponsor__item-wrap.nth-4 {
    background-image: url(<%=cp%>/resource/img/strayDog/sponsor_icon4.png);
}

.sponsor__item-tit {
    margin: 0;
    font-size: 18px;
    color: #1991d7;
}
.sponsor__sub-tit {
    margin: 60px 0 0;
    font-size: 24px;
    color: #222;
}
.sponsor__account-box {
    width: 100%;
    height: 75px;
    margin-top: 20px;
    border: 1px solid #d6d6d6;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    text-align: center;
}
.sponsor__account-txt {
    position: relative;
    display: inline-block;
    margin: 0;
    padding-left: 70px;
    line-height: 75px;
    color: #222;
    font-weight: 700;
}
.sponsor__account-txt:before {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    width: 60px;
    height: 37px;
    margin: auto 0;
    background: url(../images/content/sponsor_icon5.png) no-repeat;
    content: '';
}
.sponsor__account-list {
    margin: 20px 0 0;
    padding: 0;
    list-style: none;
}
.sponsor__account-item {
    text-indent: -14px;
    padding-left: 14px;
    line-height: 1;
}
h3 {
    display: block;
    font-size: 1.17em;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    font-weight: bold;
}

.sponsor__item-txt {
    margin: 12px 0 0;
    font-size: 14px;
    color: #767676;
    line-height: 1.3;
}
p {
    line-height: 1.5;
    margin: 1em 0;
}
p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}
.sponsor__item-link {
    position: absolute;
    bottom: 30px;
    display: inline-block;
    width: 140px;
    height: 40px;
    margin: 20px 0 0;
    line-height: 40px;
    background-color: #1991d7;
    color: #fff;
    text-align: center;
}
a {
    color: inherit;
    text-decoration: none;
}
a {
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
</style>
<div class="body-container">
   <h5>후원입니다.</h5>
   <div class="sponsor__body">
		<ul class="sponsor__list">
			<li class="sponsor__item h180">
				<div class="sponsor__item-wrap nth-1">
					<h3 class="sponsor__item-tit">정기후원</h3>
					<p class="sponsor__item-txt">
						CareDog이 안정적으로 활동할 수 있도록 매달<br>
						보내주시는 정기 후원입니다.
					</p>
					
					<a class="sponsor__item-link" href="https://www.animals.or.kr:40000/ani-main/08member/login.asp?sslurl2=yes&amp;bname=&amp;url=/ani-main/05cartoon/cartoon01.asp">정기후원 신청</a>
					
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