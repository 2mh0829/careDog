<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

	<c:forEach var="dto" items="${list}">
	<ul class="inner">
		<li class="sitter-list">
			<div class="sitter-room-photo">
			 	<div class="slides"> 
				 	<c:forEach var="photo" items="${listPhoto}"> 
				 		<c:if test="${dto.sittingId == photo.sittingId}">
							<img src="<%=cp%>/uploads/service/${photo.imageFilename}">
						</c:if>
					</c:forEach> 
						<a href="#" class="slides-btn-left slidesjs-previous slidesjs-navigation">
							<i class="glyphicon glyphicon-chevron-left"></i>
						</a>
						<a href="#" class="slides-btn-right slidesjs-next slidesjs-navigation">
							<i class="glyphicon glyphicon-chevron-right"></i>
						</a>
				</div> 
			</div>
			<div class="sitter-room-content" id="sitter-room-contentId">
				<dl>
					<dt>
						<a href="<%=cp%>/service/sitting_detail">${dto.title}</a>
						<label class="name">
							<img class="sitter-face" 
							src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_80%2Cw_300/MTE5NTU2MzE2MTk1NTU0ODI3/daniel-day-lewis-9268727-2-402.jpg">
							${dto.memberId}
						</label>
						<label class="dogs">
							<img src="<%=cp%>/resource/img/service/redHeart.JPG" id="rating">
							<strong>
								4.7
							</strong>
							점				
						</label>
					</dt>
					<dd class="sitter-tag">
						<c:forEach var="tagg" items="${listTag}">
						<c:if test="${dto.sittingId == tagg.sittingId}">
						<span class="label">${tagg.tagName}</span>
						</c:if>
						</c:forEach>
					</dd>
					<dd class="price">
						<!-- <label class="daycare">
							Day Care / 
							<strong>22,000원</strong>
						</label> -->
						<label id="stay">
						<c:if test="${dto.reserDiv==1}">24시간 / </c:if>
						<c:if test="${dto.reserDiv==2}">데이케어 / </c:if>
							<strong>${dto.reserCost}원</strong>
						</label>
					</dd>
				</dl>
				<div class="evaluation">
					<label class="pull-right">
						<i class="glyphicon glyphicon-list-alt"></i>
						고객 후기 ##개
					</label>
					<label class="pull-right">
						<i class="glyphicon glyphicon-user"></i>
						정기 고객 ##명
					</label>
				</div>
			</div>
		</li>
	</ul>
	</c:forEach>

