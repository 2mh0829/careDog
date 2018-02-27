<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.board-container{
margin: 0;
padding: 0;
}
.body-container .gongji_head{
position: relative;
margin: -53px 0 34px 0;
}
.body-container #gongji_main{
width: 100%;
height: 100%;
}
#gongji_board{
border-top: 1.5px solid lightgray;
border-bottom:1.5px solid lightgray;

}
li{
list-style: none;
}
ul{
margin-bottom: 27px;
}
</style>

<div class="body-container">
	<div class="gongji_head">
		<h3 id="gongji_tit">테스트입니다.</h3>
	</div>
	<div id="gongji_main">
		<div id="gongji_body">
			<div id="gongji_board">
				<div class="gongji_b_tit" style="padding: 3px 0 0 7px;">
					<div id="gongji_b_tit_num" class="number" style="float: left; width: 10%; margin-bottom: 22px;">번호</div>
					<div id="gongji_b_tit_sub" class="subject" style="float: left; width: 67%; margin-bottom: 22px;">제목</div>
					<div id="gongji_b_tit_date" class="date" style="float: left; width: 13%; margin-bottom: 22px;">날짜</div>
					<div id="gongji_b_tit_hit" class="hit" style="float: left; width: 10%; margin-bottom: 22px;">조회</div>
				</div>
				<ul id="gongji_content">
					<li>
						<em class="num" style="float: left; width: 10%; padding_bottom:13px;">123</em>
						<div class="subject" style="float: left; width: 67%; padding_bottom:13px;">
							<span id="gongji_subject">제목입니다</span>
						</div> 
						<em class="date" style="float: left; width: 13%; padding_bottom:13px;">2018.01.01</em> 
						<em class="hit" style="float: left; width: 10%; padding_bottom:13px;">1234</em>
					</li>
				</ul>
			</div>
			<form name="gongjiForm" action="#" method="post" style="margin-top:112px;">
				<div class="gongji_search">
					<select name="searchKey" class="gongji_select_value">
						<option>선택</option>
						<option value="gongji_number">번호</option>
						<option value="gongji_subject">제목</option>
					</select> <input type="text" class="gongji_searchValue">
					<button type="button" class="gongji_btn">search</button>
				</div>
			</form>
			<div class="gongji_paging" style="margin-top:12px;">paging</div>
		</div>
	</div>
</div>