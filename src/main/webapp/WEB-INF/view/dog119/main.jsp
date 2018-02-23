<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div>
	<table width="150" border="0" cellpadding="0" cellspacing="0" >
		<tbody>
			<tr>
				<td>
					<table width="150" align="left" background="" border="0" cellspacing="0" cellpadding="0" height="220">
						<tbody>
							<tr>
								<td height="15" align="center" valign="top"><img src="<%=cp%>/resource/img/test2.jpg" width="150" height="15"></td>
							</tr>
							<tr>
								<td width="150" height="120" align="center" valign="top">
									<table width="136" style="outline: rgb(202, 202, 202) solid 1px; margin-top: 8px;" bgcolor="white" border="0" 
											cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td width="132" height="100" align="center" valign="middle" style="padding: 2px;" bgcolor="white"><p>
														<a href="javascript:na_open_window('win', 'petfind_view_skin_1.html?no=19470', 200, 100, 695, 900, 0, 0, 0, 1, 1)">
														<img src="<%=cp%>/resource/img/test1.jpg" width="132" height="100" border="0"></a>
												</p></td>
											</tr>
										</tbody>
									 </table>
								 </td>
							</tr>
							<tr>
								<td height="46" align="center" style="padding-top: 1px;">
								 <p style="line-height: 13pt;">
								 	<b>오서방 찾아요</b><br> 
								 	<span>
								 	 <a href="javascript:na_open_window('win', 'petfind_view_skin_1.html?no=19470', 200, 100, 695, 900, 0, 0, 0, 1, 1)">지역: 경남<br> 종류 : 고양이
										</a><br> 
									<a href="petfind_view_skin_1.html?no=19470" target="_blank"> <b><font color="#CC0000">사례금 : 300,000원</font></b>
										</a></span>
								 </p>
								</td>
							</tr>
							<tr>
								<td width="150" height="13" align="center" style="padding-top: 1px;">
								  <p style="line-height: 13pt;">
									<img src="<%=cp%>/resource/img/test3.jpg" width="150" height="13">
								  </p>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</div>