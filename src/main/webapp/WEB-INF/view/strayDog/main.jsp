<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.strayDog {
	width: 310px;
	height: 550px;
	float: left;
	margin: 40px 2px 60px 2px;
	background: #fff;
	border: 1px solid #ccc;
	font-family: 'NanumGothicWeb', 'NanumGothicWebBold', 'Dotum', '돋움',
		Helvetica, AppleGothic, Sans-serif;
	color: #444;
	overflow: hidden;
	box-sizing: border-box;
}

.allStrayDog {
	width: 1000px;
	height: auto;
	margin: 0 auto 50px auto;
}

.strayDog+.strayDog {
	margin-left: 2%
}

/* .body-container {
		width: 1100px;
    	height: auto;
   	 	margin: 0 auto 50px auto;
	} */
li.full {
	clear: both;
}

li.half {
	width: 50%;
	float: left;
}

li {
	list-style: none;
	margin: 0;
	padding: 0;
	display: list-item;
	text-align: -webkit-match-parent;
	line-height: 30px;
	color: #666;
	letter-spacing: -0.5px;
	font-size: 14px;
}

div {
	display: block;
}

.pagenation {
	width: 1100px;
	height: auto;
	margin: 0 auto 50px auto;
	text-align: center;
	clear: both;
	font-family: 'NanumGothicWeb', 'NanumGothicWebBold', 'Dotum', '돋움',
		Helvetica, AppleGothic, Sans-serif;
	color: #444;
}

.pagenation a {
	display: inline-block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	color: #444;
	margin-right: 10px;
	text-align: center;
	background: #f3f3f3;
	border: 1px solid #ccc;
}

.pagenation .select {
	background: #2e5fa4;
	display: inline-block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	color: #fff;
	font-family: 'NanumGothicWebBold' !important;
	font-weight: normal;
	margin-right: 10px;
	text-align: center;
	border: 1px solid #2e5fa4;
}

.search_area {
	width: width:1098px;
	height: auto;
	margin: 0 auto 50px auto;
	text-align: center;
	padding: 15px 0 0 0;
	background: #fff;
	border: 1px solid #ccc;
	line-height: 35px;
}

.search_area select.wd100 {
	width: 100px;
	padding-left: 5px;
}

.search_area select.wd165 {
	width: 165px;
	padding-left: 5px;
	margin-right: 8px;
}

.search_area select.wd120 {
	width: 120px;
	padding-left: 5px;
	margin-right: 8px;
}

.search_area select {
	height: 35px;
	font-size: 16px;
	color: #444;
	display: inline-block;
	vertical-align: middle;
	line-height: 35px;
	margin-bottom: 15px;
	background: #fff;
}

select {
	border: 1px solid #dfdfdf;
	height: 26px;
	vertical-align: middle;
	color: #666;
	background: #f3f3f3;
}

.search_area label {
	font-size: 16px;
	color: #444;
	margin-right: 8px;
	line-height: 35px;
	vertical-align: top;
}

textarea, select, button, table {
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}

.search_area input[type="text"] {
	width: 155px;
	height: 35px;
	line-height: 35px;
	padding: 0 5px;
	display: inline-block;
	margin-right: 8px;
	background: #fff;
	vertical-align: middle;
	margin-bottom: 15px;
}

.search_area button {
	width: 80px;
	height: 35px;
	color: #fff;
	font-size: 16px;
	background: #2e5fa4;
	margin-bottom: 15px;
}
</style>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	var commonurl='http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/';
	var serviceKey = '?' + encodeURIComponent('ServiceKey') + '='+'9pUaOiX4C%2BiH1Rt21Bq0dLJbh2Edo6TOS4JFKHcsNK69ezsQ2p1uHBJUWTcAF4Pzybzv5RkKh7gDMY6TL2YvlQ%3D%3D';
	var city,gu, center, kind, total
	var pageNum=1;
	var startPage, endPage;
$(document).ready(function(){
	findDog('');
	
	  $.ajax({
		url:commonurl+'sido'+serviceKey
		,dataType:'xml'
		,success:function(response){
			$("#city").find("option").remove();
			content="<option value=''>전체</option>";
			$(response).find('item').each(function(){
				var orgCd = $(this).find('orgCd').text(); /* 지역코드 */
				var orgdownNm = $(this).find('orgdownNm').text(); /* 시이름 */
				
				var content;
				content+="<option value="+orgCd+">"+orgdownNm+"</option>";
				
				$("#city").append(content);
			});
		}
	});
	  
	$.ajax({
		url: commonurl+'kind'+serviceKey+'&'+ encodeURIComponent('up_kind_cd') + '=' + encodeURIComponent('417000')
		,dataType:'xml'
		,success:function(response){
			console.log(response)
			content="<option value=''>종 선택</option>";
			$(response).find('item').each(function(){
				var kindCd = $(this).find('kindCd').text(); /* 품종코드 */
				var kNm = $(this).find('KNm').text(); /* 품종명 */
				var content;
				content+="<option value="+kindCd+">"+kNm+"</option>";
				
				$("#serch1").append(content);
			});
		}
	  });
	
})

function changeCity(value){
	city=value;
	findDog('');
	var queryParams='&'+ encodeURIComponent('upr_cd')+'='+ encodeURIComponent(value); 
	$.ajax({
		url:commonurl+'sigungu'+serviceKey+queryParams
		,dataType:'xml'
		,success:function(response){
			$("#selcont").find("option").remove();
			var content="<option value='' selected>전체</option>";
			$(response).find('item').each(function(){
				var orgCd = $(this).find('orgCd').text();
				var orgdownNm = $(this).find('orgdownNm').text();
				
				var content;
				content+="<option value="+orgCd+">"+orgdownNm+"</option>";
				
				$("#selcont").append(content);
			});
		}
	});
}

function changeCenter(value){
	gu=value;
	var queryParams='&'+ encodeURIComponent('upr_cd')+'='+ encodeURIComponent(city);
	queryParams+='&'+encodeURIComponent('org_cd')+'='+encodeURIComponent(value);
	$.ajax({
		url:commonurl+'shelter'+serviceKey+queryParams
		,dataType:'xml'
		,success:function(response){
			findDog('');
			$("#selcare").find("option").remove();
			var content="<option value=''>전체</option>";
			$(response).find('item').each(function(){
				var careNm = $(this).find('careNm').text();
				var careRegNo = $(this).find('careRegNo').text();
				
				var content;
				content+="<option value="+careRegNo+">"+careNm+"</option>";
				
				$("#selcare").append(content);
			});
		}
	});
}

function findDog(value){
	var allurl='<%=cp%>/strayDog/callList';
	var queryParams = '';
	queryParams += '&' + encodeURIComponent('bgnde') + '=' + encodeURIComponent('20180205'); /*유기날짜 (검색 시작일) (YYYYMMDD) */
	queryParams += '&' + encodeURIComponent('endde') + '=' + encodeURIComponent('20180305'); /*유기날짜 (검색 종료일) (YYYYMMDD) */
	queryParams += '&' + encodeURIComponent('upkind') + '=' + encodeURIComponent('417000'); /*축종코드 - 개 : 417000 - 고양이 : 422400 - 기타 : 429900 */
	queryParams += '&' + encodeURIComponent('kind') + '=' + encodeURIComponent(kind==null?value:kind); /*품종코드 (품종 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent(city==null?value:city); /*시도코드 (시도 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('org_cd') + '=' + encodeURIComponent(gu==null?value:gu); /*시군구코드 (시군구 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('care_reg_no') + '=' + encodeURIComponent(center==null?value:center); /*보호소번호 (보호소 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('null'); /*상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect */
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지 번호*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('9'); /*페이지당 보여줄 개수*/
	$.ajax({
		url:allurl
		,type:'get'
		,dataType:'json'
		,success:function(data){
			console.log(data)
			//$(".allStrayDog").find(".strayDog").remove();
			var list=data.list;
			var content="";
			console.log(list)
			$.each(list, function(index, item){
				console.log(item.age);
				content+="<div class='strayDog'><a title='확대 이미지 보기' href="+item.popfile+" class='lytebox' data-lyte-options='slide:false' data-title='CareDog'>";
				content+="<a href='#' img='' class='tx-animal-image' src='"+item.popfile+"'>";
				content+="<img src="+item.popfile+" width='348' height='261' border='0' align='center'></a></a><ul>";
				content+="<li class='full'><strong>접수일</strong> <i> "+item.happenDt+"&nbsp;&nbsp;(공고번호: "+item.noticeNo+" <span class='red'></span>)";
				content+="</i></li><li class='full'><strong>발견장소</strong></li><li class='full'>"+item.happenPlace+"</li>";
				content+="<li class='half'><strong>품종</strong> "+item.kindCd+"</li>";
				content+="<li class='half'><strong>성별</strong> "+item.sexCd+"</li>";
				content+="<li class='half'><strong>연령</strong> "+item.age+"</li>";
				content+="<li class='half'><strong>색상</strong> "+item.colorCd+"</li>";
				content+="<li class='half'><strong>중성화수술</strong> "+item.neuterYn+"</li>";
				content+="<li class='half'><strong>체중</strong> "+item.weight+"</li>";
				content+="<li class='half'><strong>건강상태</strong> "+item.processState+"</li>";
				content+="<li class='half'><strong>특징</strong></li>";
				content+="<li class='full'><span>"+item.specialMark+"</span></li></ul></div>";
			});
			$(".allStrayDog").append(content);
		}
	});
	
}

function printDog(data){
	var content;
	console.log(data.popfile1)
	
}

function changeDog(value){
	center=value;
	findDog('');
}
function changeKind(value){
	kind=value;
	findDog('');
}

<%-- function page(num){
	pageNum=num;
	//findDog('');
	var a;
	var content="<c:forEach var='i' begin='1' end='10'>";
	content+="<a href='javascript:page(${i})' onclick='changePage();'>${i}</a>";
	content+="<a href='javascript:page(${i+1})' onclick='changePage();' class='img'>"
	content+="</c:forEach>";
	content+="<img src='<%=cp%>/resource/img/btn_nxt.png' alt='다음 목록 보기'></a>";
	/* <span class="select">1</span>  */
	
	$(".pagenation").append(content);
	
} --%>
 
</script>

<div class="body-container">
	<div class="search_area">
		<form name="search_form" method="post"
			action="?act=list&amp;bid=animal">
			<select id="city" name="city" onchange="changeCity(this.value);"
				class="wd120">
				<option value="''">지역전체</option>
			</select> <select name="country" id="selcont"
				onchange="changeCenter(this.value);" class="wd120">
				<option value="''">전체</option>
			</select> <select name="center" id="selcare" class="wd165"
				style="width: 170px;" onchange="changeDog(this.value)">
				<option value="''">전체</option>
			</select><br> <select name="keyfield2" id="serch1" class="wd165"
				style="width: 200px;" onchange="changeKind(this.value)">
				<option value="''">종 선택</option>
			</select>
			<!-- 
			<label for="sch1">공고번호</label> 
			<input type="text" name="sch1" id="sch1" value="" style="ime-mode: active;"> 
			<label for="sch2">연번</label> 
			<input type="text" id="sch2" name="sch2" value="" style="ime-mode: active;"> 
			<label for="sch3">특징</label>
			<input type="text" id="sch3" name="sch3" value="" style="ime-mode: active;"> -->
			<button>검색</button>
		</form>
	</div>
	<div class="allStrayDog">
	</div>
	<div id="pagingNav" class="pagenation">
		<span class="select">1</span> <a
			href="?act=list&amp;bid=animal&amp;page=2&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">2</a>
		<a
			href="?act=list&amp;bid=animal&amp;page=3&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">3</a>
		<a
			href="?act=list&amp;bid=animal&amp;page=4&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">4</a>
		<a
			href="?act=list&amp;bid=animal&amp;page=5&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">5</a>
		<a
			href="?act=list&amp;bid=animal&amp;page=6&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">6</a>
		<a
			href="?act=list&amp;bid=animal&amp;page=7&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">7</a>
		<a
			href="?act=list&amp;bid=animal&amp;page=8&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">8</a>
		<a
			href="?act=list&amp;bid=animal&amp;page=9&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">9</a>
		<a
			href="?act=list&amp;bid=animal&amp;page=10&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">10</a>
		<a
			href="?act=list&amp;bid=animal&amp;page=11&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal"
			class="img"> <img src="<%=cp%>/resource/img/btn_nxt.png"
			alt="다음 목록 보기"></a>
	</div>
</div>