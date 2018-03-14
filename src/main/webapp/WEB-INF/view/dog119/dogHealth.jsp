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
.board__all { border-top: 1px solid #ededed; margin-top: 50px; }
.board__subject { float: left; height: 100%; display: inline-block; margin: 0; line-height: 60px; font-size: 14px; }
.board__subject:after { display: block; clear: both; content: ''; }
.board__link { float: left; display: inline-block; overflow: hidden; max-width: 582px; text-overflow: ellipsis; white-space: nowrap; }/* 20171030 수정 */
.board__link:hover { text-decoration: underline; }
.board__list { margin: 0; padding: 0; list-style: none; border-top: 1px solid #ededed; }
.board__item { height: 60px; border-bottom: 1px solid #ededed; font-size: 0; line-height: 60px; }
.board__item:after { display: block; clear: both; content: ''; }
.board__info { float: right; font-size:13px;}/*20170918 수정*/
.board__span { padding: 0px 10px 0px 30px; -webkit-box-sizing: border-box; box-sizing: border-box; font-size: 13px; }
.board__span + .board__span { position: relative; border-left: 1px solid #dedede; }
.board__list .board__date {position:relative;}/*20170918 추가*/
.board__list .board__view {position:relative;}/*20171117 추가*/
.board__item.data_no {font-size:16px; font-weight:700; text-align:center; padding:50px 0; color:#333;}/*20170918 추가*/
.board__date:before { position: absolute; left: 10px; top: 0; bottom: 0; width: 15px; height: 15px; margin: auto 0; background-image: url("<%=cp%>/resource/img/dog119/listWriteTime.png"); content: ''; }
.board__view:before { position: absolute; left: 10px; top: 0; bottom: 0; width: 16px; height: 10px; margin: auto 0; background-image: url("<%=cp%>/resource/img/dog119/listViewCnt.png"); content: ''; }
.board__contact { float: right; display: inline-block; width: 80px; height: 40px; line-height: 40px; border: 1px solid #666666; text-align: center; color: #666; font-weight: 700; }
body { font-size: 14px; font-family: "Nanum Gothic", sans-serif; word-break: keep-all; color: #555; }
fieldset { border: none; margin: 0; padding: 0; }
legend { position: absolute; top: -999em; left: -999em; }
b, strong { font-weight: bold; }
a { color: inherit; text-decoration: none; }
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
a {
  background-color: transparent; /* 1 */
  -webkit-text-decoration-skip: objects; /* 2 */
}
a:active,
a:hover {
  outline-width: 0;
}
h1 {
  font-size: 2em;
  margin: 0.67em 0;
}
.board__icon { margin-right: 10px; vertical-align: middle; }
.board__number { display: inline-block; width: 50px; height: 20px; margin-right: 10px; border: 1px solid #d6d6d6; background-color: #f5f5f5; font-size: 12px; text-align: center; line-height: 20px; -webkit-box-sizing: border-box; box-sizing: border-box; }
.board__listPageing { text-align: center; margin: 32px 0 20px 0; }
.board__listPageing li { display: inline; }
.board__listPageing li a { border: 1px solid #cccccc; display: inline-block; text-align: center; width: 37px; height: 37px; line-height: 37px; }
.board__pageingPrevBtn { margin-right: 20px; }
.board__pageingNextBtn { margin-left: 20px; }
.board__listPageing li a.on, .board__listPageing li a:hover { border: 1px solid #1991d7; color: #1991d7; }
.board__search { margin: 0 0 0 258px; }
.board__search:after { display: block; content: ""; clear: both; }
.board__select { float: left; width: 120px; }
.board__keyword { float: left; margin: 0 5px; }
.board__keyword input[type="text"] { width: 300px; height: 40px; border: 1px solid #eaeaea; text-indent: 10px; -webkit-box-sizing: border-box; box-sizing: border-box; }
.board__searchBtn { float: left; }
.board__searchBtn input[type="submit"] { width: 40px; height: 40px; border: 1px solid #1991d7; border: none; text-indent: -9999px; background: #1991d7 url("<%=cp%>/resource/img/dog119/searchIcon.png") center center no-repeat; }
.board__searchBtn input[type="button"] { width: 40px; height: 40px; border: 1px solid #1991d7; border: none; text-indent: -9999px; background: #1991d7 url("<%=cp%>/resource/img/dog119/searchIcon.png") center center no-repeat; }
.menu__select { width: 120px; }
button,
select { /* 1 */
  text-transform: none;
}
button,
input,
optgroup,
select,
textarea {
  font: inherit; /* 1 */
  margin: 0; /* 2 */
}
.selectboxit-container {
	width:100%;
  position: relative;
  display: inline-block;
  vertical-align: top;
}
.selectboxit-container * {
  font: 14px Helvetica, Arial;
  /* Prevents text selection */
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
.selectboxit-container .selectboxit {
	width:100%;
	border:1px solid #eaeaea;
  cursor: pointer;
  margin: 0;
  padding: 0;
  overflow: hidden;
  display: block;
  position: relative;
	background:#fff;
}
.selectboxit-container > span, .selectboxit-container > span span {
	font-size:13px; color:#767676;
  height: 40px; 
  line-height: 40px;
  display: block;
  box-sizing:border-box;
}
span.selectboxit.select30, span.selectboxit.select30 span{
	height: 30px !important;
	line-height: 30px !important;
}
.selectboxit-container .selectboxit-options a {
	font-size:13px; color:#767676;
  height: 28px; /* Height of the drop down */
  line-height: 28px; /* Vertically positions the drop down text */
  display: block;
}
.selectboxit-container .selectboxit:focus {
  outline: 0;
}
.selectboxit.selectboxit-disabled, .selectboxit-options .selectboxit-disabled {
  opacity: 0.65;
  filter: alpha(opacity=65);
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  cursor: default;
}
.selectboxit-text {
  text-indent: 5px;
  overflow: hidden;
  text-overflow: ellipsis;
  float: left;
}
.selectboxit .selectboxit-option-icon-container {
  margin-left: 5px;
}
.selectboxit-container .selectboxit-options {
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  min-width: 100%;  /* Minimum Width of the dropdown list box options */
  *width: 100%;
  margin: 0;
  padding: 0;
  list-style: none;
  position: absolute;
  overflow-x: hidden;
  overflow-y: auto;
  cursor: pointer;
  display: none;
  z-index: 9999999999999;
  text-align: left;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
}
 .selectboxit-option .selectboxit-option-anchor{
  padding: 0 2px;
}
.selectboxit-option .selectboxit-option-anchor:hover {
  text-decoration: none;
}
.selectboxit-option, .selectboxit-optgroup-header {
  text-indent: 5px; /* Horizontal Positioning of the select box option text */
  margin: 0;
  list-style-type: none;
}
.selectboxit-option-first {
  border-top-right-radius: 6px;
  border-top-left-radius: 6px;
}
.selectboxit-optgroup-header + .selectboxit-option-first {
  border-top-right-radius: 0px;
  border-top-left-radius: 0px;
}
.selectboxit-option-last {
  border-bottom-right-radius: 6px;
  border-bottom-left-radius: 6px;
}
.selectboxit-optgroup-header {
  font-weight: bold;
}
.selectboxit-optgroup-header:hover {
  cursor: default;
}
.selectboxit-arrow-container {
  /* Positions the down arrow */
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
.selectboxit .selectboxit-arrow-container .selectboxit-arrow.ui-icon {
  top: 30%;
}
.selectboxit-option-icon-container {
  float: left;
}
.selectboxit-container .selectboxit-option-icon {
  margin: 0;
  padding: 0;
  vertical-align: middle;
}
.selectboxit-option-icon-url {
  width: 18px;
  background-size: 18px 18px;
  background-repeat: no-repeat;
  height: 100%;
  background-position: center;
  float: left;
}
.selectboxit-rendering {
  display: inline-block !important;
  *display: inline !important;
  zoom: 1 !important;
  visibility: visible !important;
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}
.jqueryui .ui-icon {
  background-color: inherit;
}
.jqueryui .ui-icon-triangle-1-s {
  background-position: -64px -16px;
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
.selectboxit-btn.selectboxit-enabled:hover,
.selectboxit-btn.selectboxit-enabled:focus,
.selectboxit-btn.selectboxit-enabled:active {
  color: #333333;
  background-color: #e6e6e6;
}
.selectboxit-btn.selectboxit-enabled:hover,
.selectboxit-btn.selectboxit-enabled:focus {
  color: #333333;
  text-decoration: none;
  background-position: 0 -15px;
  background-color:#fff;
}
.selectboxit-default-arrow {
  width: 0;
  height: 0;
  border-top: 4px solid #000000;
  border-right: 4px solid transparent;
  border-left: 4px solid transparent;
}
.selectboxit-list {
  background-color: #ffffff;
  border: 1px solid #ccc;
  border: 1px solid rgba(0, 0, 0, 0.2);
  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}
.selectboxit-list .selectboxit-option-anchor {color: #333333;}
.selectboxit-list > .selectboxit-focus > .selectboxit-option-anchor {
  color: #ffffff;
  background-color: #0081c2;
  background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0077b3));
  background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
  background-image: -o-linear-gradient(top, #0088cc, #0077b3);
  background-image: linear-gradient(to bottom, #0088cc, #0077b3);
  background-repeat: repeat-x;
}
.selectboxit-list > .selectboxit-disabled > .selectboxit-option-anchor { color: #999999; }
button, input { overflow: visible; }

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

<c:forEach var="dto" items="${callList}">
					<li class="board__item" style="line-height: 55px;">
						<p class="board__subject">
							<a href="${dhArticle}&boardNum=${dto.boardNum}" class="board__link">
								<span class="board__number">${dto.boardNum}</span>
								${dto.title}
							</a>
						<span class="viewCntIcon">(1)</span>
						</p>
						<div class="board__info">


							<span class="board__span board__view">${dto.hitCount}</span> 
							<span class="board__span board__date"> ${dto.created} </span>
						</div>
					</li>
</c:forEach>

				</ul>

				<ul class="board__listPageing">
				${paging}
				</ul>
			</div>
<!-- 검색 -->
			<div class="board__search">
				<form name="form1" method="post" action="">
					<div class="board__select">
						<select name="search" style="display: none;">
							<option value="subject">제목</option>
							<option value="memo">내용</option>
							<option value="name">이름</option>
						</select> 
						
						<span class="selectboxit-container selectboxit-container" role="combobox" aria-autocomplete="list" aria-haspopup="true"
							aria-expanded="false" aria-owns aria-labelledby> 
							<span id="" class="selectboxit  selectboxit-enabled selectboxit-btn" name="search" tabindex="0" unselectable="on"> 
								<span class="selectboxit-option-icon-container"> 
									<i id="" class="selectboxit-default-icon selectboxit-option-icon selectboxit-container" unselectable="on"></i>
								</span> 
								<span id="" class="selectboxit-text" unselectable="on" data-val="subject" aria-live="polite" style="max-width: 428px;">제목</span>
									<span id="" class="selectboxit-arrow-container" unselectable="on"> 
									<i id="" class="selectboxit-arrow selectboxit-default-arrow" unselectable="on"></i>
								</span>
							</span>
							
							<ul class="selectboxit-options selectboxit-list" tabindex="-1" role="listbox" aria-hidden="true" style="max-height: 86px; top: auto; display: none;">
								<li data-id="0" data-val="subject" data-disabled="false" class="selectboxit-option  selectboxit-option-first selectboxit-focus"
									role="option" data-active>
									<a class="selectboxit-option-anchor"> 
										<span class="selectboxit-option-icon-container"> 
											<i class="selectboxit-option-icon  selectboxit-container"></i>
										</span> 제목
									</a>
								</li>
								<li data-id="1" data-val="memo" data-disabled="false" class="selectboxit-option selectboxit-selected" role="option">
									<a class="selectboxit-option-anchor"> 
									<span class="selectboxit-option-icon-container"> 
										<i class="selectboxit-option-icon  selectboxit-container"></i>
									</span> 내용
									</a>
								</li>
								<li data-id="2" data-val="name" data-disabled="false" class="selectboxit-option  selectboxit-option-last"
									role="option">
									<a class="selectboxit-option-anchor"> 
										<span class="selectboxit-option-icon-container"> 
											<i class="selectboxit-option-icon  selectboxit-container"></i>
										</span> 이름
									</a>
								</li>
							</ul>
						</span>
					</div> <!-- board__select -->
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