<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!-- <style>
	.pagenation{
		align-items: center;
	}
</style> -->

<div class="body-container">
 <div class="wrap_sub">
		<div class="rescue">


			<div class="list">
				<form name=animal27175 action='' method=post ENCTYPE="multipart/form-data">
					<input type=hidden name=bid value="animal"> 
					<input type=hidden name=fid value="27175"> 
					<input type=hidden name=thread value="AAAA"> 
					<input type=hidden name=act value=""> 
					<input type=hidden name=key value="keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal">
					<input type=hidden name=page value="1"> 
					<input type=hidden name=url value=""> 
					<a href='#' img class='tx-animal-image' src=''><img src='<%=cp%>/resource/img/test1.jpg' width=348 height=261 border=0 align=center/></a>
					<ul>
						<li class="full"><strong>구조일</strong> <i>
								2018-02-21&nbsp;&nbsp;(SN: 180221-017 <span class="red">종로-2018-00017</span>)
						</i></li>
						<li class="full"><strong>구조장소</strong></li>
						<li class="full">서울특별시 종로구 지봉로 4길 20 토성빌딩</li>
						<li class="half"><strong>축종</strong> 기타 / 토끼</li>
						<li class="half"><strong>성별</strong> 암컷</li>
						<li class="half"><strong>연령</strong> 01개월(추정)</li>
						<li class="half"><strong>모색</strong> 검/흰/갈</li>
						<li class="half"><strong>중성화수술</strong> 확인불가</li>
						<li class="half"><strong>성격</strong> 친화적</li>
						<li class="half"><strong>체중</strong> 0.3 Kg</li>
						<li class="half"><strong>건강상태</strong> 양호</li>
						<li class="full"><strong>특징</strong></li>
						<li class="full"><span>
								코분홍.&nbsp;겁있음.&nbsp;털상태&nbsp;양호 </span></li>
					</ul>
					<button type='button' onclick="">입양신청</button>
			</div>
			<!--E:list-->

			<div class="tmp_class27175" style="display: none;">
				<table width="100%" border="0" cellspacing="0">
					<caption>■ 구조정보</caption>
					<col width="80" />
					<col width="150" />
					<col width="80" />
					<col width="*" />
					<tr>
						<th>신고자</th>
						<td>이정임</td>
						<th>연락처</th>
						<td>010 - 8633 - 1202</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">지봉로 4길 20 토성빌딩</td>
					</tr>
					<tr>
						<th>인계장소</th>
						<td colspan="3">지봉로 4길 20 토성빌딩</td>
					</tr>
				</table>

				<div>
					<a onclick="View_re('27175');return false;" class="pointer">
					<img src="<%=cp%>/resource/img/test1.jpg"><br/>CLOSE</a>
				</div>
			</div>

			</form>




			<div id="pagingNav" class="pagenation" align="center">
				<span class='select'>1</span> <a
					href='?act=list&bid=animal&page=2&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'>2</a>
				<a
					href='?act=list&bid=animal&page=3&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'>3</a>
				<a
					href='?act=list&bid=animal&page=4&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'>4</a>
				<a
					href='?act=list&bid=animal&page=5&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'>5</a>
				<a
					href='?act=list&bid=animal&page=6&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'>6</a>
				<a
					href='?act=list&bid=animal&page=7&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'>7</a>
				<a
					href='?act=list&bid=animal&page=8&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'>8</a>
				<a
					href='?act=list&bid=animal&page=9&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'>9</a>
				<a
					href='?act=list&bid=animal&page=10&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'>10</a>
				<a
					href='?act=list&bid=animal&page=11&keyfield1=&keyfield2=&city=&country=&sch1=&sch2=&sch3=&bid=animal'
					class='img'><img src='../images_new/board/btn_nxt.png'
					alt='다음 목록 보기' /></a>
			</div>
			<!--E:pagenation-->
	<%--
			<!--게시판 리스트 끝-->
			<!--게시판 검색-->
			<div class="search_area">
				<form name=search_form method='post' action='?act=list&bid=animal'>
					<select name='keyfield1' onchange="change_serch(this.value);"
						id='select' class='wd100' />
					<option value="0" selected>축종</option>
					<option value="1">개</option>
					<option value="2">고양이</option>
					<option value="3">기타</option>
					</select>&nbsp;<select name='keyfield2' id=serch1 class='wd165' /></select> <select
						id='city' name='city' onchange="changeCity(this.value);"
						class="wd120" />
					<option value="0" selected>지역전체</option>
					<option value="1">서울특별시</option>
					<option value="2">경기도</option>
					<option value="3">인천광역시</option>
					</select> <select name='country' id='selcont' class="wd120" /> </select> <br /> <label
						for="sch1">공고번호</label> <input type="text" name="sch1" id="sch1"
						value="" style="ime-mode: active;" /> <label for="sch2">연번</label>
					<input type="text" id="sch2" name="sch2" value=""
						style="ime-mode: active;" /> <label for="sch3">특징</label> <input
						type="text" id="sch3" name="sch3" value=""
						style="ime-mode: active;" />
					<button>검색</button>
				</form>
			</div>
			<!--E:search_area-->
 --%>
			<!--게시판 검색 끝-->
		</div>
		<!--E:rescue-->
	</div>
	<!--E:sub_wrap-->


</div>