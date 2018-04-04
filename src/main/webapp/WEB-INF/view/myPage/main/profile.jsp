<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.myPage-profile {
	width: 100%;
	float:left;
	margin-top:15px;
	margin-bottom:15px;
	min-height:100px;
	padding: 15px;
	border-radius:5px;
background-color:white;
}
</style>

	<div class="myPage-profile" style="padding-bottom: 0px;">
			<table
			style="width: 100%; margin: 0px auto 10px; border-spacing: 0px;">
			<tr height="40">
				<td width="100" style="text-align: left;"><label
					style="font-weight: 700;">이름</label></td>
				<td>${myPageInfo.isUserName=="1"?myPageInfo.userName:"비공개" }</td>
			</tr>
			<tr>
				<td colspan="2" height="1" bgcolor="#cccccc"></td>
			</tr>

			<tr height="40">
				<td width="100" style="text-align: left; padding-top: 5px;"
					valign="top"><label style="font-weight: 700;">소개</label></td>
				<td colspan="2" valign="top"
					style="white-space: pre; padding: 5px 0 5px 0;">${myPageInfo.introduce}</td>
			</tr>
			<tr>
				<td colspan="2" height="1" bgcolor="#cccccc"></td>
			</tr>
			<tr height="40">
				<td width="100" style="text-align: left;"><label
					style="font-weight: 700;">성별</label></td>
				<td>${myPageInfo.isGender=="1"?myPageInfo.gender:"비공개" }</td>
			</tr>
			<tr>
				<td colspan="2" height="1" bgcolor="#cccccc"></td>
			</tr>

			<tr height="40">
				<td width="100" style="text-align: left;"><label
					style="font-weight: 700;">지역</label></td>
				<td>${myPageInfo.isCity=="1"?myPageInfo.city:"비공개" }</td>
			</tr>
			<tr>
				<td colspan="2" height="1" bgcolor="#cccccc"></td>
			</tr>

			<tr height="40">
				<td width="100" style="text-align: left;"><label
					style="font-weight: 700;">취미</label></td>
				<td>${myPageInfo.isHobby=="1"?myPageInfo.hobby:"비공개" }</td>
			</tr>
			<tr>
				<td colspan="2" height="1" bgcolor="#cccccc"></td>
			</tr>
		</table>
	</div>
