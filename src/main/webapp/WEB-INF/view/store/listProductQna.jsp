<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div>

	<!-- <form name="qnaForm" id="qnaForm" action=""> -->
		<table class="table table-condensed qna-list" id="qnaTable"
			style="width: 800px;">
			<tbody>
				<c:forEach var="dto" items="${listProductQna}">
					<tr class="question-tr" data-toggle="collapse" data-target="#answer${dto.qnaId }" 
					data-parent="#qnaTable" style="border-bottom: 1px solid #cdcdcd;">
						<td>
							<div class="divTd" style="width: 100px;">
								<!-- 답변완료 여부 버튼 - 이미지로? -->
								<button type="button" class="btn btn-default qnaOkBtn"
									disabled="disabled">
									<c:choose>
										<c:when test="${dto.isAnswered == 1 }">답변완료</c:when>
										<c:otherwise>답변대기</c:otherwise>
									</c:choose>
								</button>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 500px; height: 30px;">
								<p class="qnaTxt">${dto.question }</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px; height: 30px;">
								<p class="qnaTxt">${dto.memberId }</p>
							</div>
						</td>
						<td>
							<div class="divTd" style="width: 100px; height: 30px;">
								<p class="qnaTxt">${dto.qCreated }</p>
							</div>
						</td>
					</tr>
					<tr id="answer${dto.qnaId }" class="collapse">
						<td colspan="4" class="hiddenRow">
							<div class="fold-content">
								<div class="answer_mark">
									<p>A</p>
								</div>
								<div class="answer_container">
									${dto.answer }
								</div>
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

</div>