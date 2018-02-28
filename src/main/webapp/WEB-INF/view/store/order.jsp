<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

tr {
	height: 50px;
	
}

th {
	background-color: #fafafa;
}

.txt {
	/* margin-top: 10px;
	margin-bottom: 10px; */	
	margin: 10px;
}

.inputTxt {
	/* margin-top: 10px;
	margin-bottom: 10px; */
	margin: 10px;
}

.select {
	/* margin-top: 10px;
	margin-bottom: 10px; */
	margin: 10px;
}

</style>


<div class="body-container">

	<form name="orderForm" id="orderForm" action="">
	
		<h2 class="sub-title customer-info">주문자 정보</h2>
		
		<!-- 주문자정보 테이블 -->
		<table class="table table-condensed customer-info">
			<tbody>
				<tr>
					<th scope="row"><p class="txt">주문자명</p></th>
					<td>
						<input type="text" id="customerName" value="권찬미" class="inputTxt"
						style="width: 200px;">
					</td>
				</tr>
				<tr>
					<th scope="row"><p class="txt">휴대폰</p></th>
					<td>
						<select id="customerPhoneSel" name="customerPhone" class="select"
						style="width: 90px;">
							<option selected="selected">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						&nbsp;-&nbsp;
						<input type="text" id="customerPhoneTxt1" name="customerPhoneTxt1"
						value="1111" class="inputTxt" style="width: 90px;">
						&nbsp;-&nbsp;
						<input type="text" id="customerPhoneTxt2" name="customerPhoneTxt2"
						value="1111" class="inputTxt" style="width: 90px;">
					</td>
				</tr>
				<tr>
					<th scope="row"><p class="txt">이메일</p></th>
					<td>
						<input type="text" id="customerEmailTxt1" name="customerEmailTxt1"
						value="chanmi123" class="inputTxt" style="width: 120px;">
						&nbsp;@&nbsp;
						<input type="text" id="customerEmailTxt2" name="customerEmailTxt2"
						value="naver.com" class="inputTxt" style="width: 120px;">
						<select id="customerEmailSel" name="customerEmailSel" class="select"
						style="width: 120px;">
							<option selected="selected">직접입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="hotmail.com">hotmail.com</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
	
	</form>
	
</div>