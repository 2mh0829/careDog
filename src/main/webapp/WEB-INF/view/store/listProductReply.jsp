<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<!-- <div class="body-container"> -->

	<!-- <form name="commentForm" id="commentForm" action=""> -->
	
		<table class="table table-condensed comment-list" style="width: 800px">
			<tbody>
				<c:forEach var="dto" items="${listProductReply}">
					<tr style="border-bottom: 1px solid #cdcdcd;">
						<td>
							<div class="divTd" style="width: 100px;">
								<p class="tdTxt" style="font-size: 15px;">${dto.grade }점</p>
								<!-- <img alt="" src=""> -->
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 500px;">
								<p class="tdTxt" style="font-size: 15px;">${dto.replyContent }</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p class="tdTxt" style="font-size: 15px;">${dto.memberId }</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px;">
								<p class="tdTxt" style="font-size: 15px;">${dto.created }</p>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
			<tfoot>
				<tr height='40' align="center">
            		<td colspan='2' >
              		${paging}
            		</td>
           		</tr>
			</tfoot>
			
		</table>
		
	<!-- </form> -->

<!-- </div> -->
