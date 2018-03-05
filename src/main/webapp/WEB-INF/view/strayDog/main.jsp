<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
	.strayDog{
		width: 310px;
	    height: 550px;
	    float: left;
	    margin: 40px 2px 60px 2px;
	    background: #fff;
	    border: 1px solid #ccc;
	    font-family: 'NanumGothicWeb','NanumGothicWebBold','Dotum','돋움',Helvetica,AppleGothic,Sans-serif;
	    color: #444;
	    overflow: hidden;
	    box-sizing: border-box;
	}
	
	.allStrayDog {
	    width: 1000px;
	    height: auto;
	    margin: 0 auto 50px auto;
	}
	.strayDog + .strayDog {margin-left: 2%}
	
	/* .body-container {
		width: 1100px;
    	height: auto;
   	 	margin: 0 auto 50px auto;
	} */
	
	li.full {
		clear: both;
	}
	
	li.half{
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
	    font-family: 'NanumGothicWeb','NanumGothicWebBold','Dotum','돋움',Helvetica,AppleGothic,Sans-serif;
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
	    font-family: 'NanumGothicWebBold'!important;
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

<script type="text/javascript">
	var commonurl='http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/';
	var serviceKey = '?' + encodeURIComponent('ServiceKey') + '='+'2tZYhOcrXJBIeeVzX9bylvmtsaHiaSrBkh13F9DlyGL0KfQZKGuRtuM3xcc%2Bz55Nblf0iaPOfUwRqeKu2IZ7rQ%3D%3D';
	var city,gu, center, kind, total
	var pageNum=1;
	var startPage, endPage;
$(document).ready(function(){
	findDog('');
	page(1);
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
				var kNm = $(this).find('kNm').text(); /* 품종명 */
				console.log(kNm);
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
	var allurl=commonurl+'abandonmentPublic';
	var queryParams = serviceKey; /*Service Key*/
	queryParams += '&' + encodeURIComponent('bgnde') + '=' + encodeURIComponent('20180205'); /*유기날짜 (검색 시작일) (YYYYMMDD) */
	queryParams += '&' + encodeURIComponent('endde') + '=' + encodeURIComponent('20180305'); /*유기날짜 (검색 종료일) (YYYYMMDD) */
	queryParams += '&' + encodeURIComponent('upkind') + '=' + encodeURIComponent('417000'); /*축종코드 - 개 : 417000 - 고양이 : 422400 - 기타 : 429900 */
	queryParams += '&' + encodeURIComponent('kind') + '=' + encodeURIComponent(kind==null?value:kind); /*품종코드 (품종 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent(city==null?value:city); /*시도코드 (시도 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('org_cd') + '=' + encodeURIComponent(gu==null?value:gu); /*시군구코드 (시군구 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('care_reg_no') + '=' + encodeURIComponent(center==null?value:center); /*보호소번호 (보호소 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('null'); /*상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect */
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent(pageNum==1?'1':pageNum); /*페이지 번호*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('9'); /*페이지당 보여줄 개수*/
	$.ajax({
		url:allurl+queryParams
		,dataType:'xml'
		,success:function(response){
			$(".allStrayDog").find(".strayDog").remove();
			$(response).find('item').each(function(){
				var age = $(this).find("age").text();
				var careAddr = $(this).find("careAddr").text(); /* 보호장소 */
				var careNm = $(this).find("careNm").text(); /* 담당자 */
				var careTel = $(this).find("careTel").text(); /* 보호소 번호 */
				var chargeNm = $(this).find("chargeNm").text(); /* 보호소 이름 */
				var colorCd = $(this).find("colorCd").text();
				var desertionNo = $(this).find("desertionNo").text(); /* 유기번호 */
				var filename = $(this).find("filename").text(); /* 썸네일 */
				var happenDt = $(this).find("happenDt").text(); /* 접수일 */
				var happenPlace = $(this).find("happenPlace").text(); /* 발견장소 */
				var kindCd = $(this).find("kindCd").text(); /* 품종 */
				var neuterYn = $(this).find("neuterYn").text(); /* 중성화여부 */
				var noticeEdt = $(this).find("noticeEdt").text(); /* 공고종료일 */
				var noticeNo = $(this).find("noticeNo").text(); /* 공고번호 */
				var noticeSdt = $(this).find("noticeSdt").text(); /* 공고시작일 */
				var officetel = $(this).find("officetel").text(); /* 담당자연락처 */
				var orgNm = $(this).find("orgNm").text(); /* 관할기관 */
				var popfile = $(this).find("popfile").text(); /* 이미지 */
				var processState = $(this).find("processState").text(); /* 상태 */
				var sexCd = $(this).find("sexCd").text(); /* 성별 */
				var specialMark = $(this).find("specialMark").text(); /* 특징 */
				var weight = $(this).find("weight").text();
				total=$(this).find("totalCount").text();
				startPage=((pageNum-1)/10*10)+1;
				endPage=((pageNum-1)/10*10)+10
				
				if(endPage>(total/9)){
					endPage=total/9+1;
				}
				
				content="<div class='strayDog'><a title='확대 이미지 보기' href="+popfile+" class='lytebox' data-lyte-options='slide:false' data-title='CareDog'>";
				content+="<a href='#' img='' class='tx-animal-image' src="+filename+">";
				content+="<img src="+filename+" width='348' height='261' border='0' align='center'></a></a><ul>";
				content+="<li class='full'><strong>접수일</strong> <i> "+happenDt+"&nbsp;&nbsp;(공고번호: "+noticeNo+" <span class='red'></span>)";
				content+="</i></li><li class='full'><strong>발견장소</strong></li><li class='full'>"+happenPlace+"</li>";
				content+="<li class='half'><strong>품종</strong> "+kindCd+"</li>";
				content+="<li class='half'><strong>성별</strong> "+sexCd+"</li>";
				content+="<li class='half'><strong>연령</strong> "+age+"</li>";
				content+="<li class='half'><strong>색상</strong> "+colorCd+"</li>";
				content+="<li class='half'><strong>중성화수술</strong> "+neuterYn+"</li>";
				content+="<li class='half'><strong>체중</strong> "+weight+"</li>";
				content+="<li class='half'><strong>건강상태</strong> "+processState+"</li>";
				content+="<li class='half'><strong>특징</strong></li>";
				content+="<li class='full'><span>"+specialMark+"</span></li></ul></div>";
				
				$(".allStrayDog").append(content);
			});
		}
	});
	
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
	
	var content="<c:forEach var='i' begin="+startPage+" end="+endPage+">";
	content+="<a href='javascript:page(i)' onclick='changePage();'>i</a>";
	content+="<a href='javascript:page(i+1)' onclick='changePage();' class='img'>"
	content+="</c:forEach>";
	content+="<img src='<%=cp%>/resource/img/btn_nxt.png' alt='다음 목록 보기'></a>";
	/* <span class="select">1</span>  */
	
	$(".pagenation").append(content);
	
}
 
</script>

<div class="body-container">
	<div class="search_area">
		<form name="search_form" method="post" action="?act=list&amp;bid=animal">
			<select id="city" name="city" onchange="changeCity(this.value);" class="wd120">
				<option value="''">지역전체</option>
			</select> 
			<select name="country" id="selcont" onchange="changeCenter(this.value);" class="wd120">
				<option value="''">전체</option>
			</select> 
			<select name="center" id="selcare" class="wd165" style="width: 170px;" onchange="changeDog(this.value)">
				<option value="''">전체</option>
			</select><br> 
			<select name="keyfield2" id="serch1" class="wd165" style="width: 200px;" onchange="changeKind(this.value)">
				<option value="''">종 선택</option>
			</select><!-- 
			<label for="sch1">공고번호</label> 
			<input type="text" name="sch1" id="sch1" value="" style="ime-mode: active;"> 
			<label for="sch2">연번</label> 
			<input type="text" id="sch2" name="sch2" value="" style="ime-mode: active;"> 
			<label for="sch3">특징</label>
			<input type="text" id="sch3" name="sch3" value="" style="ime-mode: active;"> -->
			<button>검색</button>
		</form>
	</div>
	<div class="allStrayDog"></div>

	<div id="pagingNav" class="pagenation">
	
	</div>
</div>