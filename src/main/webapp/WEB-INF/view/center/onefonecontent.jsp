<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
thead tr{
border-top: 2px solid #888
}
*{
margin:0;
padding:0;
}
.contentQnA{
	table-layout: fixed;
    width: 1020px;
    margin: 0 auto;
    border-top: 2px solid #888;
}
.contentQnA thead tr th{
	padding: 22px 0 20px;
    border-bottom: 1px solid #888;
    text-align: center;
}
.contentQnA tr td{
    padding: 23px 18px 24px;
    border-bottom: 1px solid #e6e6e6;
    color: #666;
    font-size: 14px;
    text-align: center;
    line-height: 20px;
    vertical-align: middle;
}.QnAreply{
	table-layout: fixed;
    width: 1020px;
    margin: 0 auto;
    border-top: 2px solid #888;
}
.QnAreply thead tr th{
	padding: 22px 0 20px;
    border-bottom: 1px solid #888;
    text-align: center;
}
.QnAreply tr td{
    padding: 23px 18px 24px;
    border-bottom: 1px solid #e6e6e6;
    color: #666;
    font-size: 14px;
    text-align: center;
    line-height: 20px;
    vertical-align: middle;
}
textarea#replyContent{
	border: 1px solid #ccc;
    padding: 10px 8px;
    border-radius: 5px;
    resize: none;
    font-family: 'AppleGothic', 'Roboto', 'montserrat', 'noto', sans-serif;
    font-size: 14px;
    line-height: 20px;
    box-shadow: none;
    box-sizing: border-box;
    -webkit-appearance: none;
    width:98%;
    height:200px;
}
button.btnSendReply{
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
</style>
<script type="text/javascript">
$(function(){
	$(".btnSendReply").click(function(){
		var acontent = encodeURIComponent($("#replyContent").val().trim());
		if(! acontent){
			$("#replyContent").focus();
			return;
		}
		
		var url="<%=cp%>/center/insertreply";
		var query="num=${dto.num}&acontent="+acontent;
		$.ajax({
			type:"post",
			url:url,
			data:query,
			dataType:"json",
			success:function(data){
				var state = data.state;
				if(state=="true"){
					$("#replyContent").val("");
					listPage(1);
				} else if (state=="false"){
					alert("댓글을 추가 하지 못했습니다.");
				}
			}
		,beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true);
		}
		,error:function(jqXHR){
			alert(jqXHR.status);
			if(jqXHR.status==401){
				console.log(jqXHR);
			} else if(jqXHR.status==403){
				location.href="<%=cp%>/member/noAuthorized";
			} else {
				console.log(jqXHR.responseText);
			}
		}
		});
	});
});

$(function(){
	listPage(1);
})

function listPage(){
var url = "<%=cp%>/center/listreply";
var query = "num=${dto.num}";

$.ajax({
	type:"get",
	url:url,
	data:query,
	success:function(data){
		$("#listReply").html(data);
	}
	,beforeSend:function(jqXHR){
		jqXHR.setRequestHeader("AJAX",true);
	}
	,error:function(jqXHR){
		console.log(jqXHR.status);
		if(jqXHR.status==401){
			console.log(jqXHR);
		} else if(jqXHR.status==403){
			location.href="<%=cp%>/member/noAuthorized";
		} else {
			console.log(jqXHR.responseText);
		}
	}
});
}
</script>
<div class="body-container">
<table class="contentQnA">
	<colgroup>
		<col style="width:9%">
		<col style="width:21%">
		<col style="width:48%">
		<col style="width:11%">
		<col style="width:11%">
	</colgroup>
	<thead>
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
			</c:choose>
			</td>
			<td>${dto.subject }</td>
			<td>${dto.memberId }</td>
			<td>${dto.qdate }</td>
		</tr>
	</thead>
	<tbody>
		<tr style="border-top: none;height: 200px;">
			<td><strong>문의내용</strong></td>
			<td colspan="4">${dto.content }</td>
		</tr>
	</tbody>
</table>
<div id="listReply"></div>
<c:if test="${sessionScope.member.memberId=='admin' }">
<div>
	<table class="QnAreply">
		<tr>
			<td colspan="1"><strong>댓글작성</strong></td>
			<td colspan="4">
			<textarea id="replyContent"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="5"><button type='button' class='btnSendReply'>댓글 등록</button></td>
		</tr>
	</table>
</div>
</c:if>
</div>