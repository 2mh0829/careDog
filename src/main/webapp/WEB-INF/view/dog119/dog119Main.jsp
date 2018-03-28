<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.wrap_sub {width:100%; height:auto; min-width:1100px; overflow-x:hidden; background:#fcfcfc; min-height:800px;}
.rescue {width:1100px; height:auto; margin:0 auto 50px auto;}
.rescue .list {width:348px; height:543px; float:left; margin:40px 8px 60px 8px; background:#fff; border:1px solid #ccc;}
.rescue .list img {vertical-align:top;width:348px; height:261px; /*margin-bottom:25px;*/}
.rescue .list ul {height:403px; padding:0 10px; margin-top:25px;}
.rescue .list ul li {line-height:30px; color:#666;letter-spacing:-0.5px;font-size:14px;}
.rescue .list ul li span.red {color:red;}
.rescue .list ul li.full {clear:both;}
.rescue .list ul li strong {font-family: 'NanumGothicWebBold'!important; font-weight:normal; color:#222; padding-right:5px; font-size:16px;}
.rescue .list ul li i {font-size:16px; color:#2e5fa4; font-style:normal;}
.rescue .list ul li span {line-height:22px; color:#666;}
.rescue .list ul li.half {width:50%; float:left;}
.rescue .list button {background:#2e5fa4; width:100%; height:55px; vertical-align:bottom; text-align:center; font-size:18px; color:#fff; line-height:55px;}

.no-result {width:1100px; height:auto; margin:40px auto 50px auto; text-align:center; background:#fff;font-size:16px; color:#2e5fa4; border:1px solid #ccc; padding:20px 0;}

/*페이징*/
.pagenation {width:1100px; height:auto; margin:0 auto 50px auto; text-align:center; clear:both;}
.pagenation a {display:inline-block; width:40px; height:40px; line-height:40px; font-size:16px; color:#444; margin-right:10px; text-align:center; background:#f3f3f3; border:1px solid #ccc;}
.pagenation a.img {border:0; background:none; padding-top:12px; height:28px;}
.pagenation .select {background:#2e5fa4;display:inline-block; width:40px; height:40px; line-height:40px; font-size:16px; color:#fff; font-family: 'NanumGothicWebBold'!important; font-weight:normal; margin-right:10px; text-align:center; border:1px solid #2e5fa4;}
body, p, h1, h2, h3, h4, h5, h6, table, th, td, form, fieldset, legend, input, textarea, button,pre {margin:0; padding:0; -webkit-text-size-adjust:none;
-webkit-margin-before: 0px;
-webkit-margin-after: 0px;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;}
input {vertical-align:middle;border:none;background:none;}
a{text-decoration:none;cursor:pointer;/*outline:none;*/}  
a:hover,a:active{text-decoration:none;}
img, fieldset, button {border:0;}
img{vertical-align:middle;}
ul,ol,menu{list-style:none;margin:0;padding:0;}  
ul, ol, li, dl, dt, dd {list-style:none;margin:0;padding:0;}
strong {font-family: 'NanumGothicWebBold' !important; } /* 강조 */
em { font-style: normal; } /* 강조 */
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var url = "<%=cp%>/dog119/list";
		
		$.ajax({
			url:url,
			dataType:'json',
			success:function(data){
				var list = data.list;
				console.log(data);
				var content = '';
				$.each(list, function(index,item){
					<%-- content+='<div class="dog119"><div class="dog119_img">';
					content+='<a href="#">';
					content+='<img src="<%=cp%>/uploads/dog119/'+item.filename+'" width="132" height="100" border="0"></a>';
					content+='</div> <div class="dog119_title">';
					content+='<p style="line-height: 13pt;">';
					content+='<b>오서방 찾아요</b><br><span>'; 
					content+='<a href="javascript:na_open_window("win", "petfind_view_skin_1.html?no=19470", 200, 100, 695, 900, 0, 0, 0, 1, 1)">지역: '+item.country+'<br> 종류 : '+item.kind+'</a><br>'; 
					content+='<a href="petfind_view_skin_1.html?no=19470" target="_blank"> <b><font color="#CC0000">사례금 : '+item.reward+'</font></b></a>';
					content+='</span></p></div></div>'; --%>
					content+="<div class='list'>";
					content+="<a title='확대 이미지 보기' href='<%=cp%>/uploads/dog119/"+item.filename+"' class='lytebox' data-lyte-options='slide:false' data-title='(사)careDog'>";
					content+="<a href='#' img='' class='tx-animal-image' src='<%=cp%>/uploads/dog119/"+item.filename+"'>";
					content+="<img src='<%=cp%>/uploads/dog119/"+item.filename+"' width='348' height='261' border='0' align='center'></a></a>";
					content+="<ul><li class='full'><strong>구조일</strong> <i>"+item.whenis+"</i></li>";
					content+="<li class='full'><strong>실종장소</strong></li>";
					content+="<li class='full'>"+item.country+"</li>";
					content+="<li class='half'><strong>축종</strong>"+item.kind+"</li>";
					content+="<li class='half'><strong>성별</strong> "+item.sex+"</li>";
					content+="<li class='half'><strong>연령</strong> "+item.age+"</li>";
					content+="<li class='half'><strong>건강상태</strong> 양호</li>";
					content+="<li class='full'><strong>특징</strong></li>";
					content+="<li class='full'><span>"+item.mark+"</span></li></ul></div>";
				});
				$(".rescue").append(content);
				$(".paging").append(data.paging);
			}
		});
	});
	
</script>

<div class="body-container">
	<div class="wrap_sub">
	<div class="rescue">
			<!--E:list-->

			<div class="tmp_class27906" style="display: none;">
				<table width="100%" border="0" cellspacing="0">
					<caption>■ 구조정보</caption>
					<colgroup>
						<col width="80">
						<col width="150">
						<col width="80">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>신고자</th>
							<td>박덕기</td>
							<th>연락처</th>
							<td>02 - 409 - 0059</td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3">송파구 방이동 89-3 송파소방서 방이 119 안전센터</td>
						</tr>
						<tr>
							<th>인계장소</th>
							<td colspan="3">송파구 방이동 89-3 송파소방서 방이 119 안전센터</td>
						</tr>
					</tbody>
				</table>

				<div>
					<a onclick="View_re('27906');return false;" class="pointer"><img
						src="/images/icon_up.gif"><br>CLOSE</a>
				</div>
			</div>

<!--게시판 리스트 끝-->
<!--게시판 검색-->
	<!-- <div class="search_area">
		<form name="search_form" method="post" action="?act=list&amp;bid=animal">
			<select name="keyfield1" onchange="change_serch(this.value);" id="select" class="wd100"><option value="0" selected="">축종</option><option value="1">개</option><option value="2">고양이</option><option value="3">기타</option></select>&nbsp;<select name="keyfield2" id="serch1" class="wd165"></select>			<select id="city" name="city" onchange="changeCity(this.value);" class="wd120">
								<option value="0" selected="">지역전체</option>
								<option value="1">서울특별시</option>
								<option value="2">경기도</option>
								<option value="3">인천광역시</option>
						</select>
			<select name="country" id="selcont" class="wd120">
						</select>
			<br>
			<label for="sch1">공고번호</label> 
			<input type="text" name="sch1" id="sch1" value="" style="ime-mode:active;">
			<label for="sch2">연번</label>
			<input type="text" id="sch2" name="sch2" value="" style="ime-mode:active;">
			<label for="sch3">특징</label>
			<input type="text" id="sch3" name="sch3" value="" style="ime-mode:active;">
			<button>검색</button>
		</form>
	</div> --><!--E:search_area-->

<!--게시판 검색 끝--> 
</div><!--E:rescue-->
</div>
	<div class="dog119_btn">
		<button type="button" onclick="javascript:location.href='<%=cp%>/dog119/created'">등록하기</button>
	</div>
	
	<nav>
   <div id="paging" class="paging"></div>
</nav>
</div>