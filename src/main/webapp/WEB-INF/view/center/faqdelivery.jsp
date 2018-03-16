<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
body, h1, h2, h3, h4, h5, h6, div, p, span, strong, em, blockquote, pre, address,
ul, ol, li, dl, dt, dd, form, fieldset, input, select, label, textarea, img, a {margin:0; padding:0; border:0/*;word-break:break-all;*/}
ul, ol {list-style:none;}
.TabsConts {display:none;}
.TabsConts.on {display:block;}

/* 공통 플루트 박스 */
.area-over {overflow:hidden;position:relative;width:100%;}
.area-over .left, .area-over .right {width:380px;}
.area-over .left {float:left;}
.area-over .right {float:right;}

/* 고객센터 > 공통 게시판 */
.list-customer {width:1020px;margin:0 auto;}
.list-customer ul {overflow:hidden;width:100%;border-top:2px solid #888}
.list-customer ul li {background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_arrow21x12_off.png") no-repeat 98% 24px;border-bottom:1px solid #e6e6e6}
.list-customer ul li.nodata {padding:200px 15px 80px;background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_nodata104x104.png") no-repeat center 80px;color:#888;font-size:16px;text-align:center;line-height:20px;}
.list-customer ul li .tit, .list-customer ul li .stit {margin-left:20px;padding:20px 0 20px 42px;background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_faq14x15.png") no-repeat 0 23px;color:#222;font-size:14px;line-height:18px;cursor:pointer;}
.list-customer ul li .stit {position:relative;margin:0;padding:20px 0 20px 30px;background:none}
.list-customer ul li .tit strong {display:inline-block;width:140px;margin-right:11px;vertical-align:middle;}
.list-customer ul li .stit strong {display:inline-block;width:70px;height:22px;margin:0 20px 0 0;padding:0 4px;border-radius:15px;box-sizing:border-box;text-align:center;background:#888;color:#fff;font-size:12px;line-height:22px}
.list-customer ul li .stit .data {position:absolute;right:60px;color:#888;font-size:14px;line-height:18px;}
.list-customer ul li .conts {display:none;background:#fafafa;border:0;color:#222;font-size:0;line-height:0;}
.list-customer ul li .conts li {padding:28px 30px 25px;background:none;border-top:1px solid #e6e6e6;border-bottom:0}
.list-customer ul li .conts li strong {display:block;font-size:16px;line-height:22px;}
.list-customer ul li .conts li p,
.list-customer ul li .conts li div {padding:0;color:#222;font-size:14px;line-height:22px;}
.list-customer ul li .conts li > ul+p,
.list-customer ul li .conts li > ul+div {padding:15px 0 0}
.list-customer ul li .conts li .phr {position:relative;margin:25px 0 0;padding:28px 0 0;/*background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/bar_dott7x1.gif") repeat-x 0 0;*/border-top:1px dashed #e6e6e6;color:#888;font-size:14px;line-height:18px;}
.list-customer ul li .conts li .btnGreenW {display:inline-block;position:absolute;top:17px;right:0;width:112px;height:38px;padding:4px 0 0;font-size:14px;text-align:center;letter-spacing:-1px;}
.list-customer ul li .conts li.question {padding:28px 30px 25px 62px}
.list-customer ul li .conts li.question strong {color:#666;}
.list-customer ul li .conts li.answer {}
.list-customer ul li .conts li.answer strong {display:block;position:relative;color:#969937}
.list-customer ul li .conts li.answer strong > .answer_date {position:absolute;top:0;right:0;font-size:14px}
.list-customer ul li .conts li.answer strong+p,
.list-customer ul li .conts li.answer strong+div {padding:15px 0 0}

.list-customer ul li .conts li ul {margin:18px 0 0;padding:0 0 0 8px;border:0;border-left:2px solid #ccc;}
.list-customer ul li .conts li ul li {padding:0;border:0;color:#888;font-size:14px;line-height:22px;}
.list-customer ul li .conts li ul li em {display:inline-block;margin:0 6px 0 0;font-style:normal}
.list-customer ul li .conts li ul li.offline{color:#8f9100;font-weight:bold;}
.list-customer ul li.open .conts {display:block;}
.list-customer ul li.open {background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_arrow21x12_on.png") no-repeat 98% 24px;}
.list-customer ul li.open .tit, .list-customer ul li.open .stit {color:#9ea000;font-weight:700}
.list-customer ul li.open .stit strong {background:#979900;}
.list-customer ul li.open .stit .data {}

.list-customer ul li .tit > span.tx_same {color:#969937;font-weight:700}

/* BOARD LIST */
.board-list-1s {table-layout:fixed;width:1020px;margin:0 auto;border-top:2px solid #888;}
.board-list-1s thead tr th {padding:22px 0 20px;border-bottom:1px solid #888;text-align: center;}
.board-list-1s thead.visible, .board-list-1s thead.visible tr, .board-list-1s thead.visible tr th {z-index:-1;visibility:hidden;position:absolute;top:-99999px;width:0;height:0;font-size:0;text-indent:-99999px;line-height:0;}
.board-list-1s tr td {padding:23px 0 24px;border-bottom:1px solid #e6e6e6;color:#666;font-size:14px;text-align:center;line-height:20px;vertical-align:middle;}
.board-list-1s tr td.subject {position:relative;padding-left:15px;text-align:left;}
.board-list-1s tr td.subject a {display:inline-block;max-width:65%;color:#333;vertical-align:middle}
.board-list-1s tr td.subject strong {display:block;color:#333;font-size:18px;line-height:30px;}
.board-list-1s tr td.subject .tx_store {position:absolute;top:24px;right:10px;color:#888}
.board-list-1s tr.checked td.subject strong {color:#969937;}
.board-list-1s tr td.addr {padding-left:15px;text-align:left;}
.board-list-1s tr td a {display:inline-block;}
.board-list-1s tr td .tel {display:inline-block;padding:0 0 0 20px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_tel13x13.png") no-repeat 0 3px;text-align:left;}
.board-list-1s tr td .jeem-check {display:inline-block;width:25px;height:23px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_check25x23_off.png") no-repeat 0 0;font-size:0;text-indent:-99999px;line-height:0;cursor:pointer;vertical-align:top;}
.board-list-1s tr.checked td .jeem-check {background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_check25x23_on.png") no-repeat 0 0;}

.board-list-1s tr td .ButtonMap {display:inline-block;width:78px;height:36px;padding:10px 0 0;border-radius:5px;border:1px solid #ddd;color:#333;font-size:14px;text-align:center;line-height:18px;}

.board-list-1s tr td .ButtonTime {display:inline-block;width:70px;height:28px;margin:0 0 0;padding:3px 0 0;border-radius:5px;border:1px solid #ccc;color:#666;font-size:12px;text-align:center;line-height:18px;background:transparent;vertical-align:middle;}
.board-list-1s tr td .FG01, .board-list-1s tr td .FG02, .board-list-1s tr td .FG03, .board-list-1s tr td .FG04 {position:relative;top:-1px;margin:0 15px 0 0;}


</style>
<table class="board-list-1s" id="board-list-1s">
						<caption></caption>
						<colgroup>
							<col style="width:9%;">
							<col style="width:20%">
							<col style="width:61%;">
							<col style="width:12%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">분류</th>
								<th scope="col">제목</th>
								<th scope="col">ID</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.num }</td>
								<c:if test="${dto.faqsort==4 }">
								<td>배송</td>
								</c:if>
								<td class="subject"><a href="javascript:faqBoard('${dto.num }','${pageNo }','${dto.faqsort }')">${dto.subject }</a></td>
								<td>${dto.memberId }</td>
							</tr>
						</c:forEach>	
						</tbody>
					</table>
	<div class="pageing">
		<c:if test="${dataCount == 0 }">
		<strong title="현재 페이지">페이지가 없습니다.</strong>
		</c:if>
		<c:if test="${dataCount != 0 }">
		<strong title="현재 페이지">${paging }</strong>
		</c:if>
	</div>
	