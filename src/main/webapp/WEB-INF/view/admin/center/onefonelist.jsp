<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
*{
margin:0;
padding:0;
}
.listQnA{
	table-layout: fixed;
    width: 1020px;
    margin: 0 auto;
    border-top: 2px solid #888;
}
.listQnA thead tr th{
	padding: 22px 0 20px;
    border-bottom: 1px solid #888;
    text-align: center;
}
.listQnA tr td{
    padding: 23px 0 24px;
    border-bottom: 1px solid #e6e6e6;
    color: #666;
    font-size: 14px;
    text-align: center;
    line-height: 20px;
    vertical-align: middle;
}
button.onefonebtn{
	border:1px solid #cccccc;
	display: inline-block;
    width: 150px;
    height: 50px;
    margin: 0 2px;
    font-size: 20px;
    color: #fff;
    cursor:cursor;
    border-radius:4px;
    background-color: #969937;
    font-weight: 700;
    font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
   
}
td.subject a {
color:black;
}

/* 고객센터 > 1:1문의 > 목록 */
.search-period {overflow:hidden;position:relative;width:1020px;margin:20px auto;padding:20px;background:#ececec;box-sizing:border-box;border-radius:5px;border:0;}
.search-period .select-month {overflow:hidden; padding: 0;}
.search-period .select-month li {float:left;width:70px;height:28px;margin:0 0 0 -1px;font-size:0;line-height:0;}
.search-period .select-month li:first-child {margin:0;}
.search-period .select-month button {width:100%;height:28px;border:1px solid #d0d0d0;background:#fff;color:#222;font-size:12px;font-weight:400}
.search-period .select-month li:first-child button {border-top-left-radius:5px;border-bottom-left-radius:5px;}
.search-period .select-month li:last-child button {border-top-right-radius:5px;border-bottom-right-radius:5px;}
.search-period .select-month li.on button {border:1px solid #848484;background:#848484;color:#fff;}
.search-period .select-range {padding:10px 0 0;line-height:38px}
.search-period .select-range select {height:28px;padding-right:0;color:#222;font-size:12px;line-height:16px;vertical-align:middle;border-radius: 5px;}
.search-period .select-range label {display:inline-block;margin:0 11px 0 1px;color:#222;font-size:12px;line-height:16px;}
.search-period .select-range .des {margin:0 15px 0 10px;}
.search-period button.btnLookup,
.search-period input[type="submit"] {display:inline-block;position:absolute;top:0;right:0;width:85px;height:100%;background:#969937;border-radius:0;border-top-right-radius:5px;border-bottom-right-radius:5px;color:#fff;font-size:16px;line-height:22px;border:0;'}
.search-period.mgT30 {margin-top:20px !important}
.search-period{margin-top: 30px;}

.container {
    clear: both;
    min-height: 600px;
    padding-top: 100px;
    text-align: left;
    padding-right: 0px;
    padding-left: 0px;

legend {position:absolute; overflow:hidden; visibility:hidden; height:0; z-index:-1;}

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
/* BORDER */
ul li.nodata {width:100% !important;padding:200px 15px 80px !important;background:url("<%=cp%>/resource/img/faq/ico_nodata104x104.png") no-repeat center 80px !important;color:#888 !important;font-size:16px !important;text-align:center !important;line-height:20px !important;}
</style>

<div class="body-container">
<table class="listQnA">
	<colgroup>
		<col style="width:9%">
		<col style="width:25%">
		<col style="55%">
		<col style="11%">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">분류</th>
			<th scope="col">제목</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.num }</td>
			<td>
			<c:choose>
				<c:when test="${dto.sort==101 }">회원가입/탈퇴</c:when>
				<c:when test="${dto.sort==102 }">로그인</c:when>
				<c:when test="${dto.sort==103 }">회원정보 변경</c:when>
				<c:when test="${dto.sort==104 }">CareDog 멤버십</c:when>
				<c:when test="${dto.sort==201 }">주문/취소</c:when>
				<c:when test="${dto.sort==202 }">상품</c:when>
				<c:when test="${dto.sort==203 }">신용카드</c:when>
				<c:when test="${dto.sort==204 }">무통장입금</c:when>
				<c:when test="${dto.sort==205 }">쿠폰</c:when>
				<c:when test="${dto.sort==206 }">배송기간/배송비</c:when>
				<c:when test="${dto.sort==207 }">상품수령</c:when>
				<c:when test="${dto.sort==208 }">반품</c:when>
				<c:when test="${dto.sort==209 }">환불</c:when>
				<c:when test="${dto.sort==801 }">이벤트 참여방법</c:when>
				<c:when test="${dto.sort==802 }">이벤트 당첨확인</c:when>
				<c:when test="${dto.sort==803 }">이벤트 사은품 관련</c:when>
				<c:when test="${dto.sort==901 }">기타문의</c:when>
			</c:choose>
			</td>
			<td class="subject"><a href="<%=cp%>/center/onefonecontent?num=${dto.num}">${dto.subject }</a></td>
			<td>${dto.qdate }</td>
			<td style="display: none;">${dto.memberId }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>

