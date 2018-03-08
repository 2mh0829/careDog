<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
html {
    font-family: sans-serif;
    line-height: 1.15;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}
body {
    font-size: 14px;
    font-family: "Nanum Gothic", sans-serif;
    word-break: keep-all;
    color: #767676;
}
.content {
    float: left;
    width: 954px;
    /* min-height: 800px; */
}

.board__contact {
    float: right;
    display: inline-block;
    width: 80px;
    height: 40px;
    line-height: 40px;
    border: 1px solid #666666;
    text-align: center;
    color: #666;
    font-weight: 700;
}

div {
    display: block;
}

.page-tit {
    margin: 30px 0;
    color: #222;
    line-height: 1;
    margin-left: -2px;
    font-size: 32px;
    position: relative;
}

h1 {
    display: block;
    font-size: 2em;
    -webkit-margin-before: 0.67em;
    -webkit-margin-after: 0.67em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    font-weight: bold;
}

.board__list {
    margin: 0;
    padding: 0;
    list-style: none;
    border-top: 1px solid #ededed;
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

.board__item {
    height: 60px;
    border-bottom: 1px solid #ededed;
    font-size: 0;
    line-height: 60px;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

.board__subject {
    float: left;
    height: 100%;
    display: inline-block;
    margin: 0;
    line-height: 60px;
    font-size: 14px;
}
/* p {
    line-height: 1.5;
    margin: 1em 0;
} */
p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

.board__link {
    float: left;
    display: inline-block;
    overflow: hidden;
    max-width: 582px;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.board__number {
    display: inline-block;
    width: 50px;
    height: 20px;
    margin-right: 10px;
    border: 1px solid #d6d6d6;
    background-color: #f5f5f5;
    font-size: 12px;
    text-align: center;
    line-height: 20px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

a {
    color: inherit;
    text-decoration: none;
}
/* a:-webkit-any-link {
    color: -webkit-link; 
    cursor: pointer;
    text-decoration: underline;
} */
.board__info {
    float: right;
    font-size: 13px;
}

.board__span {
    padding: 0px 10px 0px 30px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    font-size: 13px;
}

.board__list .board__view {
    position: relative;
}

.board__view:before {
    position: absolute;
    left: 10px;
    top: 0;
    bottom: 0;
    width: 16px;
    height: 10px;
    margin: auto 0;
    background-image: url(<%=cp%>/resource/img/dog119/listViewCnt.png);
    content: '';
}

.board__list .board__date {
    position: relative;
}
.board__span + .board__span {
    position: relative;
    border-left: 1px solid #dedede;
}
.board__date:before {
    position: absolute;
    left: 10px;
    top: 0;
    bottom: 0;
    width: 15px;
    height: 15px;
    margin: auto 0;
    background-image: url(<%=cp%>/resource/img/dog119/listWriteTime.png);
    content: '';
}
.board__listPageing {
    text-align: center;
    margin: 32px 0 20px 0;
}

.board__listPageing li {
    display: inline;
}

.board__pageingPrevBtn {
    margin-right: 20px;
}

.board__pageingNextBtn {
    margin-left: 20px;
}

.board__listPageing li a {
    border: 1px solid #cccccc;
    display: inline-block;
    text-align: center;
    width: 37px;
    height: 37px;
    line-height: 37px;
}

img {
    border-style: none;
}

.board__listPageing li a.on, .board__listPageing li a:hover {
    border: 1px solid #1991d7;
    color: #1991d7;
}

.board__search {
    margin: 0 0 0 258px;
}

form {
    display: block;
    margin-top: 0em;
}

.board__select {
    float: left;
    width: 120px;
}

.viewCntIcon {
    font-size: 13px;
    color: #999999;
    padding-left: 20px;
    background: url(<%=cp%>/resource/img/dog119/listReplyCnt.png) 0 4px no-repeat;
    margin: 0 5px;
}

select:not(:-internal-list-box) {
    overflow: visible !important;
}
select {
    border-radius: 0px;
    border-color: rgb(169, 169, 169);
}
select {
    -webkit-appearance: menulist;
    box-sizing: border-box;
    align-items: center;
    white-space: pre;
    -webkit-rtl-ordering: logical;
    color: black;
    background-color: white;
    cursor: default;
    border-width: 1px;
    border-style: solid;
    border-color: initial;
    border-image: initial;
}

select {
    border-radius: 5px;
}

input, textarea, select, button {
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em;
    font: 400 13.3333px Arial;
}

input, textarea, select, button, meter, progress {
    -webkit-writing-mode: horizontal-tb;
}

option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}

.selectboxit-container {
    width: 100%;
    position: relative;
    display: inline-block;
    vertical-align: top;
}

.selectboxit-container .selectboxit {
    width: 100%;
    border: 1px solid #eaeaea;
    /* width: 220px; */
    cursor: pointer;
    margin: 0;
    padding: 0;
    /* border-radius: 6px; */
    overflow: hidden;
    display: block;
    position: relative;
    background: #fff;
}

.selectboxit-container .selectboxit-options {
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    min-width: 100%;
    margin: 0;
    padding: 0;
    list-style: none;
    position: absolute;
    overflow-x: hidden;
    overflow-y: auto;
    cursor: pointer;
    display: none;
    z-index: 9999999999999;
    /* border-radius: 6px; */
    text-align: left;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
}
.selectboxit-list {
    background-color: #ffffff;
    border: 1px solid #ccc;
    border: 1px solid rgba(0, 0, 0, 0.2);
    -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.selectboxit .selectboxit-option-icon-container {
    margin-left: 5px;
}
.selectboxit-container > span, .selectboxit-container > span span {
    font-size: 13px;
    color: #767676;
    height: 40px;
    line-height: 40px;
    display: block;
    box-sizing: border-box;
}
.selectboxit-btn {
    background-color: #f5f5f5;
    background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
    background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
    background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
    background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
    background-repeat: repeat-x;
    border: 1px solid #cccccc;
    border-color: #e6e6e6 #e6e6e6 #bfbfbf;
    border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
    border-bottom-color: #b3b3b3;
}
.selectboxit-option-icon-container {
    float: left;
}
.selectboxit-option-first {
    border-top-right-radius: 6px;
    border-top-left-radius: 6px;
}

.selectboxit-option-last {
    border-bottom-right-radius: 6px;
    border-bottom-left-radius: 6px;
}
.selectboxit-option, .selectboxit-optgroup-header {
    text-indent: 5px;
    margin: 0;
    list-style-type: none;
}
.selectboxit-container .selectboxit-options a {
    font-size: 13px;
    color: #767676;
    height: 28px;
    line-height: 28px;
    display: block;
}
.selectboxit-list .selectboxit-option-anchor {
    color: #333333;
}
.selectboxit-option .selectboxit-option-anchor {
    padding: 0 2px;
}
.selectboxit-container * {
    font: 14px Helvetica, Arial;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: -moz-none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
    outline: none;
    white-space: nowrap;
}

.selectboxit-container .selectboxit-option-icon {
    margin: 0;
    padding: 0;
    vertical-align: middle;
}

.selectboxit-container {
    width: 100%;
    position: relative;
    display: inline-block;
    vertical-align: top;
}

i, cite, em, var, address, dfn {
    font-style: italic;
}

.selectboxit-text {
    text-indent: 5px;
    overflow: hidden;
    text-overflow: ellipsis;
    float: left;
}

.selectboxit-arrow-container {
    width: 30px;
    position: absolute;
    right: 0;
}

.selectboxit .selectboxit-arrow-container .selectboxit-arrow {
    margin: 0 auto;
    position: absolute;
    top: 50%;
    right: 0;
    left: 0;
}

.selectboxit-default-arrow {
    width: 0;
    height: 0;
    border-top: 4px solid #000000;
    border-right: 4px solid transparent;
    border-left: 4px solid transparent;
}

.selectboxit-btn.selectboxit-enabled:hover, .selectboxit-btn.selectboxit-enabled:focus{
	color:#333333;
	text-decoration: none;
	background-position: 0 -15px;
	background-color: #fff;
}
.selectboxit-btn.selectboxit-enabled:hover, .selectboxit-btn.selectboxit-enabled:focus,
.selectboxit-btn.selectboxit-enabled:active{
	color:#333333;
	background-color: #e6e6e6;
}

.selectboxit-container
.selectboxit:focus{
	outline: 0;
}

:focus{
	outline: -webkit-focus-ring-color auto 5px;
}

.board__keyword {
    float: left;
    margin: 0 5px;
}

.board__keyword input[type="text"] {
    width: 300px;
    height: 40px;
    border: 1px solid #eaeaea;
    text-indent: 10px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.board__searchBtn {
    float: left;
}
.board__searchBtn input[type="button"] {
    width: 40px;
    height: 40px;
    border: 1px solid #1991d7;
    border: none;
    text-indent: -9999px;
    background: #1991d7 url(<%=cp%>/resource/img/dog119/searchIcon.png) center center no-repeat;
}
.board__contact {
    float: right;
    display: inline-block;
    width: 80px;
    height: 40px;
    line-height: 40px;
    border: 1px solid #666666;
    text-align: center;
    color: #666;
    font-weight: 700;
}
input[type="button" i], input[type="submit" i], input[type="reset" i], input[type="file" i]::-webkit-file-upload-button, button {
    padding: 1px 6px;
}
input[type="button" i], input[type="submit" i], input[type="reset" i], input[type="file" i]::-webkit-file-upload-button, button {
    align-items: flex-start;
    text-align: center;
    cursor: default;
    color: buttontext;
    background-color: buttonface;
    box-sizing: border-box;
    padding: 2px 6px 3px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;
}
input[type="button" i], input[type="submit" i], input[type="reset" i] {
    -webkit-appearance: push-button;
    user-select: none;
    white-space: pre;
}
input {
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    cursor: text;
    padding: 1px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
input, textarea, select, button {
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em;
    font: 400 13.3333px Arial;
}

button, input[type='checkbox'], input[type='radio'], input[type='button'], input[type='submit'], input[type='image'] {
    cursor: pointer;
}
input:not([type='checkbox']), input:not([type='radio']), textarea, select {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}
input:not([type='checkbox']), input:not([type='radio']), textarea, select {
    border-radius: 0;
}
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}

button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    font: inherit;
    margin: 0;
}

.page-tit:before {
    display: block;
    width: 30px;
    margin-bottom: 12px;
    margin-left: 2px;
    border-top: 3px solid #1991d7;
    content: '';
}

.board__item:after {
    display: block;
    clear: both;
    content: '';
}

.board__subject:after {
    display: block;
    clear: both;
    content: '';
}
</style>

<html>

<script>
function chk() {
	
	if (form1.search.value == "") {
		alert("검색할 항목을 선택하세요");
		form1.search.focus();
		return;
	}
	
	if (form1.keyword.value == "") {
		alert("검색할 단어를 입력하세요");
		form1.keyword.focus();
		return;
	}
	
	document.form1.submit();
}
</script>
<body>
<div class="body-container">

	<div class="content" id="AnimalsContent">
		<h1 class="page-tit">애견 건강 정보</h1>
		<div class="board__all">

			<div class="imageList__content">
				<ul class="board__list">

					<li class="board__item" style="line-height: 55px;">
						<p class="board__subject">

							<a
								href="?num=68&amp;bname=zetyx_board_edu&amp;ct=yes&amp;cpage=1&amp;search=&amp;keyword=&amp;cate1=a&amp;menu1="
								class="board__link"> <span class="board__number">51</span>
								[기자간담회후기] 서울시교육청 동물복지교육 자문활동이 결실을 맺었습니다!
							</a>

						<span class="viewCntIcon">(1)</span>
						</p>
						<div class="board__info">


							<span class="board__span board__view">117</span> <span
								class="board__span board__date"> 2018.02.27 </span>
						</div>
					</li>

					<li class="board__item" style="line-height: 55px;">
						<p class="board__subject">

							<a
								href="?num=30&amp;bname=zetyx_board_edu&amp;ct=yes&amp;cpage=1&amp;search=&amp;keyword=&amp;cate1=a&amp;menu1="
								class="board__link"> <span class="board__number">22</span>
								유아 대상 동물보호 교육 이벤트 참여
							</a>

							<!-- <img class="newTitleIcon" src="/ani-main/images/content/listNewIcon.png"/> -->

						</p>
						<div class="board__info">


							<span class="board__span board__view">376</span> <span
								class="board__span board__date"> 2017.07.31 </span>
						</div>
					</li>

				</ul>

				<ul class="board__listPageing">

					<li class="board__pageingPrevBtn"><a><img
							src="<%=cp%>/resource/img/dog119/listPrevBtn.png">&nbsp;</a></li>

					<li><a class="on">1</a></li>

					<li><a
						href="?cpage=2&amp;bname=zetyx_board_edu&amp;keyword=&amp;search=&amp;cate1=a&amp;menu1=">2</a></li>

					<li class="board__pageingNextBtn"><a> <img
							src="<%=cp%>/resource/img/dog119/listNextBtn.png">&nbsp;
					</a></li>


				</ul>
			</div>

			<div class="board__search">
				<form name="form1" method="post"
					action="?cate1=a&amp;bname=zetyx_board_edu">
					<div class="board__select">
						<select name="search" style="display: none;">
							<option value="subject">제목</option>
							<option value="memo">내용</option>
							<option value="name">이름</option>
						</select> <span id class="selectboxit-container selectboxit-container"
							role="combobox" aria-autocomplete="list" aria-haspopup="true"
							aria-expanded="false" aria-owns aria-labelledby> <span
							id="" class="selectboxit  selectboxit-enabled selectboxit-btn"
							name="search" tabindex="0" unselectable="on"> <span
								class="selectboxit-option-icon-container"> <i id=""
									class="selectboxit-default-icon selectboxit-option-icon selectboxit-container"
									unselectable="on"></i>
							</span> <span id="" class="selectboxit-text" unselectable="on"
								data-val="subject" aria-live="polite" style="max-width: 428px;">제목</span>
								<span id="" class="selectboxit-arrow-container"
								unselectable="on"> <i id=""
									class="selectboxit-arrow selectboxit-default-arrow"
									unselectable="on"></i>
							</span>
						</span>
							<ul class="selectboxit-options selectboxit-list" tabindex="-1"
								role="listbox" aria-hidden="true"
								style="max-height: 86px; top: auto; display: none;">
								<li data-id="0" data-val="subject" data-disabled="false"
									class="selectboxit-option  selectboxit-option-first selectboxit-focus"
									role="option" data-active><a
									class="selectboxit-option-anchor"> <span
										class="selectboxit-option-icon-container"> <i
											class="selectboxit-option-icon  selectboxit-container"></i>
									</span> 제목
								</a></li>
								<li data-id="1" data-val="memo" data-disabled="false"
									class="selectboxit-option selectboxit-selected" role="option">
									<a class="selectboxit-option-anchor"> <span
										class="selectboxit-option-icon-container"> <i
											class="selectboxit-option-icon  selectboxit-container"></i>
									</span> 내용
								</a>
								</li>
								<li data-id="2" data-val="name" data-disabled="false"
									class="selectboxit-option  selectboxit-option-last"
									role="option"><a class="selectboxit-option-anchor"> <span
										class="selectboxit-option-icon-container"> <i
											class="selectboxit-option-icon  selectboxit-container"></i>
									</span> 이름
								</a></li>
							</ul>
						</span>
					</div>
					<div class="board__keyword">
						<input type="text" name="keyword">
					</div>
					<div class="board__searchBtn">
						<input type="button" onclick="javascript:chk();">
					</div>
					&nbsp;
					<div class="board__contact"><a href="<%=cp%>/dog119/dhcreate">등록하기</a></div>
				</form>
			</div>

		</div>
	</div>
</div>
</body>
</html>