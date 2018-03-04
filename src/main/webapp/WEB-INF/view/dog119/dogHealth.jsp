<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
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

.page-tit:before {
    display: block;
    width: 30px;
    margin-bottom: 12px;
    margin-left: 2px;
    border-top: 3px solid #1991d7;
    content: '';
}

.board__list {
    margin: 0;
    padding: 0;
    list-style: none;
    border-top: 1px solid #ededed;
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

.board__item:after {
    display: block;
    clear: both;
    content: '';
}

p {
    line-height: 1.5;
    margin: 1em 0;
}

.board__link {
    float: left;
    display: inline-block;
    overflow: hidden;
    max-width: 582px;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.board__info {
    float: right;
    font-size: 13px;
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

.board__span {
    padding: 0px 10px 0px 30px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    font-size: 13px;
}

.board__list .board__view {
    position: relative;
}

.board__list .board__date {
    position: relative;
}
.board__span + .board__span {
    position: relative;
    border-left: 1px solid #dedede;
}
.board__span {
    padding: 0px 10px 0px 30px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    font-size: 13px;
}

.board__listPageing {
    text-align: center;
    margin: 32px 0 20px 0;
    margin-top: 32px;
    margin-right: 0px;
    margin-bottom: 20px;
    margin-left: 0px;
}

.board__listPageing li {
    display: inline;
}
.board__pageingPrevBtn {
    margin-right: 20px;
}

.board__listPageing {
    text-align: center;
    margin: 32px 0 20px 0;
}

.board__listPageing li a.on, .board__listPageing li a:hover {
    border: 1px solid #1991d7;
    color: #1991d7;
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

html {
    font-family: sans-serif;
    line-height: 1.15;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}

div {
    display: block;
}

a {
    color: inherit;
    text-decoration: none;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

.board__subject {
    float: left;
    height: 100%;
    display: inline-block;
    margin: 0;
    line-height: 60px;
    font-size: 14px;
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

.board__search {
    margin: 0 0 0 258px;
}

.board__select {
    float: left;
    width: 120px;
}

input:not([type='checkbox']), input:not([type='radio']), textarea, select {
    border-radius: 0;
}
button, select {
    text-transform: none;
}
button, input, optgroup, select, textarea {
    font: inherit;
    margin: 0;
}

select:not(:-internal-list-box) {
    overflow: visible !important;
}
select {
    border-radius: 0px;
    border-color: rgb(169, 169, 169);
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

.selectboxit-container > span, .selectboxit-container > span span {
    font-size: 13px;
    color: #767676;
    height: 40px;
    line-height: 40px;
    display: block;
    box-sizing: border-box;
}
.selectboxit-arrow-container {
    width: 30px;
    position: absolute;
    right: 0;
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

.selectboxit-container .selectboxit-options a {
    font-size: 13px;
    color: #767676;
    height: 28px;
    line-height: 28px;
    display: block;
}

.board__keyword {
    float: left;
    margin: 0 5px;
    margin-top: 0px;
    margin-right: 5px;
    margin-bottom: 0px;
    margin-left: 5px;
}

.board__keyword input[type="text"] {
    width: 300px;
    height: 40px;
    border: 1px solid #eaeaea;
    border-top-color: rgb(234, 234, 234);
    border-top-style: solid;
    border-top-width: 1px;
    border-right-color: rgb(234, 234, 234);
    border-right-style: solid;
    border-right-width: 1px;
    border-bottom-color: rgb(234, 234, 234);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-left-color: rgb(234, 234, 234);
    border-left-style: solid;
    border-left-width: 1px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    text-indent: 10px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

button, input {
    overflow: visible;
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

ul, menu, dir {
    display: block;
    list-style-type: disc;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}

body {
    font-size: 14px;
    font-family: "Nanum Gothic", sans-serif;
    word-break: keep-all;
    color: #767676;
}

</style>

<div class="body-container">

	<div class="content" id="AnimalsContent">
				<h1 class="page-tit">애견 건강 정보</h1>

				<!-- 게시글 목록추 -->
				
				<div class="board__all">
				


					<div class="imageList__content">
							
						

<!-- 리스트 -->						
								 
						<ul class="board__list">
							
							<li class="board__item" style="line-height: 55px;">
								<p class="board__subject">
							
									<a href="?num=68&amp;bname=zetyx_board_edu&amp;ct=yes&amp;cpage=1&amp;search=&amp;keyword=&amp;cate1=a&amp;menu1=" class="board__link">
								
											<span class="board__number">51</span>
										  [기자간담회후기] 서울시교육청 동물복지교육 자문활동이 결실을 맺었습니다!
									</a>
									
									<!-- <img class="newTitleIcon" src="/ani-main/images/content/listNewIcon.png"/> -->
									
								</p><div class="board__info">

																		
									<span class="board__span board__view">117</span>
									<span class="board__span board__date">
									2018.02.27
									</span>
								</div>
							</li>
				
							<li class="board__item" style="line-height: 55px;">
								<p class="board__subject">
							
									<a href="?num=30&amp;bname=zetyx_board_edu&amp;ct=yes&amp;cpage=1&amp;search=&amp;keyword=&amp;cate1=a&amp;menu1=" class="board__link">
								
											<span class="board__number">22</span>
										  유아 대상 동물보호 교육 이벤트 참여 
									</a>
									
									<!-- <img class="newTitleIcon" src="/ani-main/images/content/listNewIcon.png"/> -->
									
								</p><div class="board__info">

																		
									<span class="board__span board__view">376</span>
									<span class="board__span board__date">
									2017.07.31
									</span>
								</div>
							</li>
					
						</ul>

						<ul class="board__listPageing">
					
						<li class="board__pageingPrevBtn"><a><img src="<%=cp%>/resource/img/dog119/listPrevBtn.png">&nbsp;</a></li>
						
								<li><a class="on">1</a></li>
						
								<li><a href="?cpage=2&amp;bname=zetyx_board_edu&amp;keyword=&amp;search=&amp;cate1=a&amp;menu1=">2</a></li>
						
						<li class="board__pageingNextBtn"><a href="?cpage=2&amp;bname=zetyx_board_edu&amp;keyword=&amp;search=&amp;cate1=a&amp;menu1=">
							&nbsp;
						<img src="<%=cp%>/resource/img/dog119/listNextBtn.png"></a></li>
							
						
						</ul>
					</div>
	
	<div class="board__search">
		<form name="form1" method="post" action="?cate1=a&amp;bname=zetyx_board_edu">
			<div class="board__select">
				<select name="search" style="display: none;">
					<option value="subject">제목</option>
					<option value="memo">내용</option>
					<option value="name">이름</option>
				</select><span id="" class="selectboxit-container selectboxit-container" role="combobox" aria-autocomplete="list" aria-haspopup="true" aria-expanded="false" aria-owns="" aria-labelledby=""><span id="" class="selectboxit  selectboxit-enabled selectboxit-btn" name="search" tabindex="0" unselectable="on"><span class="selectboxit-option-icon-container"><i id="" class="selectboxit-default-icon selectboxit-option-icon selectboxit-container" unselectable="on"></i></span><span id="" class="selectboxit-text" unselectable="on" data-val="subject" aria-live="polite" style="max-width: 1810px;">제목</span><span id="" class="selectboxit-arrow-container" unselectable="on"><i id="" class="selectboxit-arrow selectboxit-default-arrow" unselectable="on"></i></span></span><ul class="selectboxit-options selectboxit-list" tabindex="-1" role="listbox" aria-hidden="true"><li data-id="0" data-val="subject" data-disabled="false" class="selectboxit-option  selectboxit-option-first selectboxit-selected" role="option"><a class="selectboxit-option-anchor"><span class="selectboxit-option-icon-container"><i class="selectboxit-option-icon  selectboxit-container"></i></span>제목</a></li><li data-id="1" data-val="memo" data-disabled="false" class="selectboxit-option" role="option"><a class="selectboxit-option-anchor"><span class="selectboxit-option-icon-container"><i class="selectboxit-option-icon  selectboxit-container"></i></span>내용</a></li><li data-id="2" data-val="name" data-disabled="false" class="selectboxit-option  selectboxit-option-last" role="option"><a class="selectboxit-option-anchor"><span class="selectboxit-option-icon-container"><i class="selectboxit-option-icon  selectboxit-container"></i></span>이름</a></li></ul></span>
			</div>
			<div class="board__keyword"><input type="text" name="keyword"></div>
			<div class="board__searchBtn"><input type="button" onclick="javascript:chk();"></div>
&nbsp;
			
		</form>
	</div>

				</div>
				<!-- 게시글 목록추가 끝-->



			</div>
</div>