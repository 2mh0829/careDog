<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%  /* aa */
   String cp = request.getContextPath();
%>
<style>
.order-list {
	margin-top:15px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 8px 6px;
}
.orderManage-top {
	margin-top:15px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 8px 6px;
}
.orderManage-body {
	margin-top:15px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 8px 6px;
}
</style>
 <div class="bodyFrame3">
<div class=orderManage-top>
<div>결제완료<br>0</div>
<div>배송완료<br>2</div>
<div>취소/반품/교환<br>0</div>
<div>10월 11월 12월 1월 2월 3월</div><div>2017.09.14(callender)~2018.03.14(callender)</div><div>전체상태</div> <div>조회하기</div>
</div>

<div class="orderManage-body">
	<div class="order-list">
		<div class="order-detail">
			<div class="order-detail-thumb-wrap">
				<div class="orderList-detail-thumb"></div>
			</div>
			<div class="order-detail-text-wrap">
				<div class="orderList-detail-text">
					<p>
						로지텍 블루투스 레이저마우스
					</p>
					<p>
						<a href="#">컴퓨존</a>
					</p>
					<p class="orderInfoEditBtn">
						<a href="#">02-716-5353</a>
					</p>

				</div>
			</div>

		</div>
	</div>
</div>
 </div>
