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
var city,gu, center, kind, total
var pageNum=1;
var startPage, endPage;
$(document).ready(function(){
	findDog('');
	page(1);
	  $.ajax({
		url:'<%=cp%>/strayDog/sido'
		,dataType:'json'
		,success:function(data){
			var list = data.list;
			var content="<option value=''>전체</option>";
			//$("#city").find("option").remove();
			console.log(data)
			$.each(list, function(index,item){
				content+="<option value="+item.orgCd+">"+item.orgdownNm+"</option>";
			});
			$("#city").append(content);
		}
	});
	  
	$.ajax({
		url: '<%=cp%>/strayDog/kind'
		,dataType:'json'
		,success:function(data){
			var list = data.list;
			var content="<option value=''>종 선택</option>";
			console.log(list)
			$.each(list, function(index,item){
				content+="<option value="+item.kindCd+">"+item.KNm+"</option>";
			});
			$("#serch1").append(content);
		}
	  });
	
})

function changeCity(value){
	city=value;
	findDog('');
	var queryParams= encodeURIComponent('upr_cd')+'='+ encodeURIComponent(value); 
	$.ajax({
		url:'<%=cp%>/strayDog/gu'
		,data:queryParams
		,dataType:'json'
		,success:function(data){
			var list = data.list;
			var content="<option value=''>전체</option>";
			$("#selcont").find("option").remove();
			console.log(data)
			$.each(list, function(index,item){
				content+="<option value="+item.orgCd+">"+item.orgdownNm+"</option>";
			});
			$("#selcont").append(content);
		}
	});
}

function changeCenter(value){
	gu=value;
	findDog('');
	var queryParams= encodeURIComponent('upr_cd')+'='+ encodeURIComponent(city);
	queryParams+='&'+encodeURIComponent('org_cd')+'='+encodeURIComponent(value);
	$.ajax({
		url:'<%=cp%>/strayDog/center'
		,data:queryParams
		,dataType:'json'
		,success:function(data){
			var list = data.list;
			var content="<option value=''>전체</option>";
			$("#selcare").find("option").remove();
			console.log(data)
			$.each(list, function(index,item){
				content+="<option value="+item.careRegNo+">"+item.careNm+"</option>";
			});
			$("#selcare").append(content);
		}
	});
}

function findDog(value){
	var allurl='<%=cp%>/strayDog/callList';
	var queryParams = '';
	queryParams += '&' + encodeURIComponent('bgnde') + '=' + encodeURIComponent('20180205'); /*유기날짜 (검색 시작일) (YYYYMMDD) */
	queryParams += '&' + encodeURIComponent('endde') + '=' + encodeURIComponent('20180305'); /*유기날짜 (검색 종료일) (YYYYMMDD) */
	queryParams += '&' + encodeURIComponent('kind') + '=' + encodeURIComponent(kind==null?value:kind); /*품종코드 (품종 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent(city==null?value:city); /*시도코드 (시도 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('org_cd') + '=' + encodeURIComponent(gu==null?value:gu); /*시군구코드 (시군구 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('care_reg_no') + '=' + encodeURIComponent(center==null?value:center); /*보호소번호 (보호소 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('null'); /*상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect */
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent(pageNum==1?'1':pageNum); /*페이지 번호*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('9'); /*페이지당 보여줄 개수*/
	$.ajax({
		url:allurl
		,type:'post'
		,data:queryParams
		,dataType:'json'
		,success:function(data){
			$(".allStrayDog").find(".strayDog").remove();
			var list=data.list;
			//console.log(list.totalCount)
			var content="";
			console.log(list)
			$.each(list, function(index, item){
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

function page(num){
	pageNum=num;
	findDog('');
	var a;
	$(".pagenation").find("a").remove();
	var content="<c:forEach var='i' begin='1' end='10'>";
	content+="<a href='javascript:page(${i})' onclick='changePage();'>${i}</a>";
	content+="</c:forEach>";
	content+="<a href='javascript:page("+num+1+")' onclick='changePage();' class='img'>"
	content+="<img src='<%=cp%>/resource/img/btn_nxt.png' alt='다음 목록 보기'></a>";
	/* <span class="select">1</span>  */
	
	$(".pagenation").append(content);
}

function changePage(){
	
}
 
</script>

<div class="body-container">
	<div class="search_area">
		<form name="search_form" method="post" action="?act=list&amp;bid=animal">
			시도	<select id="city" name="city" onchange="changeCity(this.value);" class="wd120">
			</select>
			시군구  <select name="country" id="selcont" onchange="changeCenter(this.value);" class="wd120">
				<option value="''">전체</option>
			</select> 
			보호소  <select name="center" id="selcare" class="wd165" style="width: 170px;" onchange="changeDog(this.value)">
				<option value="''">전체</option>
			</select>
			<select name="keyfield2" id="serch1" class="wd165" style="width: 200px;" onchange="changeKind(this.value)">
			</select>
		</form>
	</div>
	<div class="allStrayDog">
	</div>
	<div id="pagingNav" class="pagenation">
	</div>
</div>