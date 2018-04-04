<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/jquery.selectBoxIt.css" />
<script src="http://gregfranko.com/jquery.selectBoxIt.js/js/jquery.selectBoxIt.min.js"></script>

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
.viewCntIcon { font-size: 13px; color: #999999; padding-left: 20px; background: url("<%=cp%>/resource/img/dog119/listReplyCnt.png") 0 4px no-repeat; margin: 0 5px; }

img + .viewCntIcon { margin-left: 10px; margin-right: 0; }

.viewCntIcon.type-f14 { font-size: 14px; background: url("<%=cp%>/resource/img/dog119/listReplyCnt.png") 0 2px no-repeat; }

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

</style>

<script>
$(document).ready(function(){
	var selectBox = $("select").selectBoxIt({autoWidth:false});
})

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
							<a href="${dhArticle}&boardNum=${dto.boardNum}&listNum=${dto.listNum}" class="board__link">
								<span class="board__number">${dto.boardNum}</span>
								${dto.title}
							</a>
<c:if test="${dto.dhReplyCount!=0}">
						<span class="viewCntIcon">(${dto.dhReplyCount})</span>
</c:if>
						</p>
						<div class="board__info">


							<span class="board__span board__view">${dto.hitCount}</span> 
							<span class="board__span board__date"> ${dto.created} </span>
						</div>
					</li>
</c:forEach>

				</ul>

<!-- ul 에서 div로 바꿈 -->
				<div class="board__listPageing">${paging}</div>
			</div>
<!-- 검색 -->
			<div class="board__search">
				<form name="form1" method="post" action="">
					<div class="board__select" >
						<select name="search" style="display: none;">
							<option value="subject">제목</option>
							<option value="memo">내용</option>
							<option value="name">이름</option>
						</select> 
					</div> <!-- board__select -->
					<div class="board__keyword">
						<input type="text" name="keyword">
					</div>
					<div class="board__searchBtn">
						<input type="button" onclick="javascript:chk();">
					</div>
					&nbsp;
				</form>
			</div>

		</div>
	</div>
</div>
</body>
