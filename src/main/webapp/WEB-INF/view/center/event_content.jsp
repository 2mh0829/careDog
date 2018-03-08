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

#Container {
	overflow: hidden;
	width: 100%;
	min-width: 1020px;
}

#Contents {
	width: 1020px;
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

.cent_evt{
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
</style>
<div id="Container">
	<div id="Contents">
		<table class="cent_board_view">
			<colgroup>
				<col style="width:80%;">
				<col style="width:20%;">
			</colgroup>
			<tbody>
				<tr>
					<td>
						<strong class="cent_evt">${dto.isEvent }</strong>
						<span class="cent_tit">${dto.subject }</span>
					</td>
					<td class="cent_name">${dto.memberId }</td>
					<td class="cent_date">${dto.created }</td>
				</tr>
				<tr>
					<td class="cent_textarea" colspan="2">
						<div class="textareaEdit">
						${dto.content }
						</div>
					</td>
				</tr>
				<c:forEach var="vo" items="${listFile }">
				<tr>
					<td>
						<a href="<%=cp%>/center/event/download?fileNum=${vo.fileNum}">${vo.originalFilename }</a>
						 (<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul class="prev-next">
			<li>
				<c:if test="${not empty nextReadDto }">
					<a href="javascript:contentBoard('${nextReadDto.num }','${pageNo }');">${nextReadDto.subject }</a>
				</c:if>
			</li>
			<li>
				<c:if test="${not empty preReadDto }">
					<a href="javascript:contentBoard('${preReadDto.num }', '${pageNo }');">${preReadDto.subject }</a>
				</c:if>
			</li>
		</ul>
	</div>
	<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
<tr height="45">
    <td width="300" align="left">
        <c:if test="${sessionScope.member.memberId=='admin'}">
            <button type="button" class="btn" onclick="updateForm('${dto.num}', '${pageNo}');">수정</button>
        </c:if>
        <c:if test="${sessionScope.member.userId=='admin'}">
            <button type="button" class="btn" onclick="deleteBoard('${dto.num}', '${pageNo}');">삭제</button>
        </c:if>
    </td>

    <td align="right">
        <button type="button" class="btn" onclick="listPage('${pageNo}')">리스트</button>
    </td>
</tr>
</table>
	
</div>