<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
/* BOARD VIEW */
/* 공지사항 상세 */
.board-view-1s {table-layout:fixed;width:100%;border-top:2px solid #888;border-bottom:2px solid #888;}
.board-view-1s>tbody>tr>th {z-index:-1;visibility:hidden;position:absolute;top:-99999px;width:0;height:0;font-size:0;text-indent:-99999px;line-height:0;}
.board-view-1s>tbody>tr>td {padding:30px 20px;color:#333;font-size:16px;line-height:26px;}
.board-view-1s>tbody>tr>td.textus {background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/bar_dott7x1.gif") repeat-x 0 0;word-break:break-all}
.board-view-1s>tbody>tr>td.textus img {max-width:980px}
.board-view-1s>tbody>tr>td.textus strong {font-weight:bold;}
.board-view-1s>tbody>tr>td.textus em {font-style:italic !important;}
.board-view-1s>tbody>tr>td.textus hr {display:block;}
.board-view-1s>tbody>tr>td.data {color:#888;font-size:14px;text-align:right;line-height:18px;}
.board-view-1s>tbody>tr>td .tit {display:inline-block;color:#333;font-size:22px;line-height:28px;}
.board-view-1s>tbody>tr:first-child td strong {margin:1px 7px 0 0;vertical-align:4px;}
.board-view-1s>tbody>tr>td.textus table {padding:0;}

/* BOARD PREV-NEXT */
.prev-next {width:100%;}
.prev-next li {overflow:hidden;padding:20px 0 20px 20px;border-bottom:1px solid #e6e6e6;font-size:0;line-height:0;}
.prev-next li button {margin:0 40px 0 0;padding:0 0 0 27px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_arrow15x9_btm.png") no-repeat 0 3px;color:#666;font-size:14px;line-height:18px;}
.prev-next li:first-child button {margin:0 40px 0 0;padding:0 0 0 27px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_arrow15x9_top.png") no-repeat 0 3px;color:#666;font-size:14px;line-height:18px;}
.prev-next li strong {margin:0 10px 0 0;vertical-align:top;}
.prev-next li a {color:#333;font-size:14px;line-height:18px;}


/* BOARD WRITE */
.board-write-1s {table-layout:fixed;width:1020px;margin:0 auto;border-top:2px solid #888;}
.board-write-1s tbody tr th, .board-write-1s tbody tr td {border-bottom:1px solid #e6e6e6;color:#333;font-size:14px;text-align:left;line-height:18px;}
.board-write-1s tbody tr th {padding:30px 0 30px 20px;vertical-align:top;}
.board-write-1s tbody tr td select,
.board-write-1s tbody tr td input[type="text"],
.board-write-1s tbody tr td input[type="password"] {height:38px;}
.board-write-1s tbody tr td input[type="radio"],
.board-write-1s tbody tr td input[type="checkbox"] {vertical-align:middle;}
.board-write-1s tbody tr td .over {overflow:hidden;}
.board-write-1s tbody tr td select+select,
.board-write-1s tbody tr td input[type="text"]+select {margin-left:2px}
.board-write-1s tbody tr td .input-delete {display:inline-block;}
.board-write-1s tbody tr td .ButtonSubmit {float:right;width:114px;height:38px;line-height:38px;background:#969937;color:#fff;letter-spacing:-1px;}
.board-write-1s tbody tr.textarea td {padding:20px 0;}
.board-write-1s tbody tr.textarea td button.file {width:85px;height:38px;margin:10px 0 0;border-radius:5px;border:1px solid #ccc;background:#f6f6f6;color:#666;font-size:14px;line-height:18px;}
.board-write-1s tbody tr.textarea td span.file {display:inline-block;padding:20px 0 0 10px;color:#333;font-size:14px;line-height:18px;}
.board-write-1s tbody tr.textarea td span.file .ButtonDelete {margin:0 0 0 8px;}
.board-write-1s tbody tr.textarea td .txt {display:inline-block;padding:22px 0 0 10px;color:#666;font-size:12px;line-height:18px;vertical-align:-2px;}

.board-write-1s tbody tr.textarea td .file_area {margin-top:10px}
.board-write-1s tbody tr.textarea td .file_area .file_box {display:inline-block;position:relative;overflow:hidden;vertical-align:middle}
.board-write-1s tbody tr.textarea td .file_area .file_box label {display:inline-block;width:85px;height:38px;line-height:38px;font-weight:700;text-align:center;border-radius:5px;border:1px solid #ccc;background:#f6f6f6;color:#666;font-size:14px}
.board-write-1s tbody tr.textarea td .file_area .file_box input[type="file"] {position:absolute;top:0;left:-100px;width:10px}
.board-write-1s tbody tr.textarea td .file_area span.file {margin-left:10px;padding:0;color:#333;font-size:14px;line-height:38px;}
.board-write-1s tbody tr.textarea td .file_area span.file .ButtonDelete {margin:0 0 0 8px;vertical-align:middle}
.board-write-1s tbody tr.textarea td .file_area .txt {margin-left:10px;padding:0;color:#666;font-size:12px;line-height:38px;vertical-align:-1px;}

.board-write-1s tbody tr.notice td {padding:20px 0;}
.board-write-1s tbody tr.notice td label {display:inline-block;width:75px;vertical-align:middle;}
.board-write-1s tbody tr.notice td ul li {padding:20px 0 0;line-height:38px}
.board-write-1s tbody tr.notice td ul li:first-child {padding:0;}
.board-write-1s tbody tr td .list-customer ul {border-top:0;}
.board-write-1s tbody tr td .list-customer ul li:last-child {border-bottom:0;}
.board-write-1s .list-customer {width:auto;}
.board-write-1s .store_off{display:inline-block;margin:0 0 9px 20px;vertical-align:bottom;}
.board-write-1s .store_off label{color:#888;font-weight:bold;}
.board-write-2s {table-layout:fixed;width:100%;max-width:1020px;margin:0 auto;border-top:2px solid #d6d6d6;}
.board-write-2s tbody tr th, .board-write-2s tbody tr td {border-bottom:1px solid #e6e6e6;}
.board-write-2s tbody tr th {padding:16px 0 16px 20px;background:#f6f6f6;color:#333;text-align:left;vertical-align:top;font-size:14px}
.board-write-2s tbody tr th label {}
.board-write-2s tbody tr td {padding:0 0 0 20px;color:#666;font-size:14px;}
.board-write-2s.view tbody tr td {color:#333;}
.board-write-2s.view tbody tr td .data {color:#888;}
.board-write-2s.view tbody tr td {padding:0 0 0 20px;}
.board-write-2s tbody.star tr td {padding-left:36px !important;}
.board-write-2s tbody tr td.star {padding-left:36px !important;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_star6x5.png") no-repeat 20px 25px;}
.board-write-2s tbody tr td select,
.board-write-2s tbody tr td textarea,
.board-write-2s tbody tr td input[type="text"],
.board-write-2s tbody tr td input[type="password"] {height:28px;font-size:12px;vertical-align:middle;}
.board-write-2s tbody tr td input[type="radio"],
.board-write-2s tbody tr td input[type="checkbox"] {width:13px;height:13px;margin-top:2px;-webkit-appearance:checkbox;-moz-appearance:checkbox;-webkit-appearance:checkbox;border:1px solid #b8b8b8 !important;vertical-align:middle;}
.board-write-2s tbody tr td label {vertical-align:middle;}
.board-write-2s tbody tr td .desc {display:inline-block;padding:0 4px;color:#333;font-size:20px;vertical-align:middle;}
.board-write-2s tbody tr td .btnPost {width:90px;height:28px;background:#fff;border-radius:5px;border:1px solid #969937;color:#969937;font-size:12px;line-height:16px;}
.board-write-2s tbody tr td .interval {padding:6px 0;}
.board-write-2s tbody tr td .accou-txt {display:inline-block;margin:0 0 0 17px;font-size:12px;vertical-align:middle;}
.board-write-2s tbody tr td .input-check {margin:0 3px 0 17px;}
.board-write-2s tbody tr td .label, .board-write-2s tbody tr:first-child td label {font-size:12px;color:#666;}
.board-write-2s tbody tr td .road {width:500px;margin:6px 0;padding:8px 10px 6px;border-radius:5px;border:1px solid #d0d0d0;background:#f8f8f8;font-size:12px;}
.board-write-2s tbody tr:first-child td input[type="checkbox"] {margin:0 6px 0 17px;}
.board-write-2s tbody tr.addr td {padding:14px 0 14px 20px;}
.board-write-2s tbody tr.addr td > input[type="text"]:first-child {text-align:center;}
.board-write-2s tbody tr.addr td textarea {letter-spacing:-1px;}
.board-write-2s tbody tr.addr td input[type="text"]+button {margin-left:3px}
.board-write-2s tbody tr td .road {width:500px;margin:6px 0;padding:8px 10px 6px;border-radius:5px;border:1px solid #d0d0d0;background:#f8f8f8;font-size:12px;}
.board-write-2s tbody tr td .road .data {color:#888;}
.board-write-2s tbody tr td .won {display:inline-block;color:#fe0000;font-size:18px;line-height:22px;}
.board-write-2s tbody tr td .won em {display:inline-block;font-style:normal;font-size:14px;vertical-align:2px;}
.board-write-2s tbody tr td .etc {display:inline-block;margin:0 0 0 7px;color:#ed2626;font-size:12px;line-height:18px;vertical-align:middle;}

.board-write-3s {table-layout:fixed;width:100%;margin:0 auto;}
.board-write-3s tbody tr th, .board-write-3s tbody tr td {border-bottom:1px solid #f0f0f0;color:#333;font-size:13px;text-align:left;line-height:18px;}
.board-write-3s tbody tr th {padding:18px 0 14px 10px;vertical-align:top;}
.board-write-3s tbody tr td {overflow:hidden;padding:14px 0 14px 10px;}
.board-write-3s tbody tr td label {vertical-align:middle;}
.board-write-3s tbody tr td select,
.board-write-3s tbody tr td input[type="text"],
.board-write-3s tbody tr td input[type="password"] {height:28px;font-size:12px;}
.board-write-3s tbody tr td input[type="radio"],
.board-write-3s tbody tr td input[type="checkbox"] {vertical-align:middle;}
.board-write-3s tbody tr td .btnPost, .board-write-3s tbody tr td a.btnPost {width:90px;height:28px;background:#fff;border-radius:5px;border:1px solid #969937;color:#969937;font-size:12px;line-height:16px;}
.board-write-3s tbody tr td a.btnPost {display:inline-block;text-align:center;padding-top:5px;}
.board-write-3s tbody tr td .desc {display:inline-block;padding:0 1px;color:#333;font-size:20px;vertical-align:middle;}
.board-write-3s tbody tr td .road {width:301px;margin:6px 0;padding:8px 10px 6px;border-radius:5px;border:1px solid #d0d0d0;background:#f8f8f8;font-size:12px;}
.board-write-3s tbody tr td .road .data {color:#888;}
.board-write-3s tbody tr.textarea td {padding:20px 0;}
.board-write-3s tbody.star tr td {padding-left:36px !important;}
.board-write-3s tbody tr td.star {padding-left:36px !important;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_star6x5.png") no-repeat 20px 25px;}
.board-write-3s tbody tr td input[type="text"]+button {margin-left:3px}

/* PAGEING */
.pageing {padding:30px 0 0;font-size:0;text-align:center;line-height:0;}
.pageing a, .pageing strong {display:inline-block;width:30px;height:30px;margin:0 2px;border:1px solid #e5e5e5;color:#888;font-size:14px;line-height:28px;vertical-align:top;box-sizing:border-box;font-weight:700}
.pageing a {text-decoration:none;}
.pageing .prev, .pageing .next {height:30px;padding:0;font-size:0;text-indent:-99999px;line-height:0;}
.pageing .prev {margin-right:8px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_pageing_prev7x11.png") no-repeat center center;}
.pageing .next {margin-left:8px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_pageing_next7x11.png") no-repeat center center;}
.pageing strong, .pageing a:hover, .pageing a:active, .pageing a:focus, .pageing strong:hover, .pageing strong:focus, .pageing strong:active {border:1px solid #666;color:#333;font-weight:700}

.pageing span {display:inline-block;width:30px;height:30px;border:1px solid #e5e5e5;text-indent:-9999px}

/* BOARD LIST RESULT */
.result-board {overflow:hidden;width:1020px;margin:0 auto;padding:40px 0 10px;line-height:24px}
.pop-conts .result-board{width:auto;}
.result-board .num {display:inline-block;color:#000;font-size:16px;line-height:20px;word-spacing:3px}
.result-board .num em {margin-left:3px;color:#969937;font-style:normal;font-weight:700}
.result-board .num span {display:inline-block;color:#969937;font-weight:700}
.result-board .all-list {float:right;padding:0 12px 0 0;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_arrow6x12.png") no-repeat 100% 3px;color:#666;font-size:14px;line-height:20px;}
.result-board .search {float:right;position:relative;width:255px;height:38px;border-radius:20px;border:1px solid #ddd;}
.result-board .search input[type="text"] {width:190px;height:36px;border:0;margin-left:10px;}
.result-board .search button {position:absolute;top:7px;right:20px;width:24px;height:24px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_search25x27.png") no-repeat center 50%;background-size:20px 20px;font-size:0;text-indent:-99999px;line-height:0;}

.result-common {position:relative;width:100%;padding:40px 0 22px;white-space:nowrap;}
.result-common > * {display:inline-block;font-size:14px;line-height:20px;vertical-align:top;}
.result-common .num strong {display:inline-block;margin-right:7px;padding-right:10px;color:#000;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/bar_2x14.gif") no-repeat 100% 2px;}
.result-common .num em {color:#969937;font-style:normal;font-weight:700}
.result-common .num .txt {color:#666;white-space:nowrap;}
.result-common .all-delete {position:absolute;bottom:14px;right:0;min-width:70px;width:auto;height:28px;padding:0 5px;border-radius:5px;border:1px solid #aaa;color:#666;background:#fff;font-size:12px} /*{position:absolute;bottom:14px;right:0;width:80px;height:38px;border-radius:5px;border:1px solid #aaa;background:#fff;color:#666;font-size:14px;line-height:18px;white-space:nowrap;}*/

.board-view-1s>tbody>tr:first-child td strong {display:inline-block;color:#333;font-size:18px;line-height:30px;width:70px;height:20px;border-radius:10px;color:#fff;font-size:12px;text-align:center;line-height:20px;background:#ed95b7;}
</style>

<div class="body-container" style="width: 1020px;">
<table class="board-view-1s mgT40">
				<colgroup>
					<col style="width:75%;">
					<col style="width:12.5%;">
					<col style="width:12.5%">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<c:if test="${dto.isGongji==1 }">
							<strong class="FG01">공지사항</strong>
							</c:if>
							<span class="tit">${dto.subject }</span>
						</td>
						<td class="name">${dto.memberId }</td>
						<td class="data">${dto.created }</td>


					</tr>
					<tr>
						<td class="textus" colspan="3">
						<div class="contEditor">
						<p><span style="font-size:14px"><span style="color:#000000">${dto.content }</span></span></p>

</div></td>
					</tr>
					<c:forEach var="vo" items="${listFile }">
					<tr>
						<td>
							<a href="<%=cp%>/center/gongji/download?fileNum=${vo.fileNum}">${vo.originalFilename }</a>
						 (<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<ul class="prev-next">
			<li>
				<c:if test="${not empty nextReadDto }">
					<a href="javascript:contentBoard('${nextReadDto.num }','${pageNo }');">${nextReadDto.subject }</a>
				</c:if>
			</li>
			<li>
				<c:if test="${not empty preReadDto }">
					<a href="javascript:contentBoard('${preReadDto.num }', '${pageNo }');">${preReadDto.subject }</a>
				</c:if>
			</li>
		</ul>
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
<tr height="45">
    <td width="300" align="left">
        <c:if test="${sessionScope.member.memberId=='admin'}">
            <button type="button" class="btn" onclick="updateForm('${dto.num}', '${pageNo}');">수정</button>
        </c:if>
        <c:if test="${sessionScope.member.memberId=='admin'}">
            <button type="button" class="btn" onclick="deleteBoard('${dto.num}', '${pageNo}');">삭제</button>
        </c:if>
    </td>

    <td align="right">
        <button type="button" class="btn" onclick="listPage('${pageNo}')">리스트</button>
    </td>
</tr>
</table>
</div>