<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
* {
	box-sizing: border-box;
}

div {
	margin: 0;
	padding: 0;
	border: 0;
}

ul{
list-style: none;
}

table{
border-spacing: 0;
border: 0;
}

strong{
font-weight: 700;
}

tr{
display: table-row;
vertical-align: inherit;
border-color: inherit;
}

button:{
font-family: 'montserrat', 'noto', 'Roboto', sans-serif;
font-weight: 700;
}
h3:{
font-size: 28px;
margin-top: 25px;
margin-bottom: 15px;
}
#Container {
	overflow: hidden;
	width: 100%;
	min-width: 700px;
}

#Contents {
	width: 700px;
	height: 100%;
	margin: 0 auto;
}

.gongji_Tabs {
	overflow: hidden;
	height: 55px;
	margin: 30px 0 0;
	padding-bottom: 5px;
}

.gongji_Tabs
li:first_child{
width: 50%;
}

.gongji_Tabs > li{
position: relative;
float: left;
width: 497px;
text-align: center;
border: 0;
}

.gongji_Tabs > li > a{
display: block;
height: 50px;
padding: 0;
line-height: 50px;
font-size: 18px;
font-weight: 400;
}

.cent_board_view{
table-layout: fixed;
width: 100%;
border-top: 2px solid #888;
border-bottom: 2px solid #888;
margin-top: 40px;
}

.cent_board_view>tbody>tr>td{
padding: 30px 20px;
color: #333;
font-size: 16px;
line-height: 26px;
border-bottom: 1px dashed #999;

}

.cont_gongji{
background: #ababab;
display: inline-block;
width: 89px;
height: 21px;
border-radius: 10px;
color: #fff;
font-size: 12px;
text-align: center;
line-height: 20px;
}

.cent_board_view>tbody>tr>td .cent_tit {
display: inline-block;
color: #333;
font-size: 22px;
line-height: 28px;
}

.cent_board_view>tbody>tr>td strong{
	margin: 1px 7px 0 0;
	vertical-align: 4px;
}

.cent_board_view>tbody>tr>td> .cent_date{
color: #888;
font-size: 14px;
text-align: right;
line-height: 18px;
}

.textareaEdit{
color: #333;
line-height: normal;
}

.prev-next{
width: 100%;
}

.prev-next li {
overflow: hidden;
padding: 20px 0 20px 20px;
border-bottom: 1px solid #e6e6e6;
font-size: 0;
line-height: 0;
}

.prev-next li button{
	margin: 0 40px 0 0;
	padding: 0 0 0 27px;
	color: #666;
	font-size: 14px;
	line-height: 18px;
}
input#subject{
width:335px;
}
</style>
<div id="Container">
	<div id="Contents">
		<div class="cont_title">
			<ul>
				<li id="cont_gongji">공지사항</li>
				<li id="cont_sub" style="border-right: 10px;"><input type="text" id="subject" width="336px;"></li>
				<li id="cont_member">${sessionScope.member.memberId }</li>
				<li id="cont_time">${sessionScope.dto.created }</li>
			</ul>
		</div>
		<div>
			<textarea cols="20" rows="20" style="width:680px;height:400px;"></textarea>
		</div>
		<div>
			<ul>
				<li><input type="file" name="upload"></li>
			</ul>
		</div>
		<div>
			<c:if test="${mode=='update' }">
				<c:forEach var="vo" items="${listFile }">
					<ul>
						<li><strong>첨부된&nbsp;&nbsp;파일</strong></li>
						<li>${vo.originalFilename } | <a href="javascript:deleteFile('${vo.fileNum }');">삭제</a></li>
					</ul>
				</c:forEach>
			</c:if>		
		</div>
		<div class="btn_area">
			<ul>
				<li><button type="button" class="btn" onclick="sendOk('${mode}', '${pageNo}');">${mode=='update'?'수정완료':'등록하기'}</button></li>
				<li><button type="reset" class="btn">다시입력</button></li>
				<li><button type="button" class="btn" onclick="sendCancel('${pageNo}');">${mode=='update'?'수정취소':'등록취소'}</button></li>
				<li> <c:if test="${mode=='update'}">
         	 			<input type="hidden" name="num" value="${dto.num}">
        	 			<input type="hidden" name="pageNo" value="${pageNo}">
        			</c:if>
        		</li>
			</ul>
		</div>
	</div>
</div>