<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
	.strayDog{
		width: 32%;
	    height: 743px;
	    float: left;
	    background: #fff;
	    border: 1px solid #ccc;
	    font-family: 'NanumGothicWeb','NanumGothicWebBold','Dotum','돋움',Helvetica,AppleGothic,Sans-serif;
	    color: #444;
	    overflow: hidden;
	    box-sizing: border-box;
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
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var url1='http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic';
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'2tZYhOcrXJBIeeVzX9bylvmtsaHiaSrBkh13F9DlyGL0KfQZKGuRtuM3xcc%2Bz55Nblf0iaPOfUwRqeKu2IZ7rQ%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('bgnde') + '=' + encodeURIComponent('20140601'); /*유기날짜 (검색 시작일) (YYYYMMDD) */
	queryParams += '&' + encodeURIComponent('endde') + '=' + encodeURIComponent('20140630'); /*유기날짜 (검색 종료일) (YYYYMMDD) */
	queryParams += '&' + encodeURIComponent('upkind') + '=' + encodeURIComponent('417000'); /*축종코드 - 개 : 417000 - 고양이 : 422400 - 기타 : 429900 */
	queryParams += '&' + encodeURIComponent('kind') + '=' + encodeURIComponent(''); /*품종코드 (품종 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('upr_cd') + '=' + encodeURIComponent(''); /*시도코드 (시도 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('org_cd') + '=' + encodeURIComponent(''); /*시군구코드 (시군구 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('care_reg_no') + '=' + encodeURIComponent(''); /*보호소번호 (보호소 조회 OPEN API 참조) */
	queryParams += '&' + encodeURIComponent('state') + '=' + encodeURIComponent('null'); /*상태 - 전체 : null(빈값) - 공고중 : notice - 보호중 : protect */
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지 번호*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /*페이지당 보여줄 개수*/
	$.ajax({
		url:url1+queryParams
		,dataType:'xml'
		,success:function(response){
			console.log(response);
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
				var noticeSdt = $(this).find("noticeSdt").text(); /* 공고종료일 */
				var officetel = $(this).find("officetel").text(); /* 담당자연락처 */
				var orgNm = $(this).find("orgNm").text(); /* 관할기관 */
				var popfile = $(this).find("popfile").text(); /* 이미지 */
				var processState = $(this).find("processState").text(); /* 상태 */
				var sexCd = $(this).find("sexCd").text(); /* 성별 */
				var specialMark = $(this).find("specialMark").text();
				var weight = $(this).find("weight").text();
				
				var view_text=age+careAddr+careNm+colorCd+desertionNo+
				filename+happenDt;
				
				
			});
		}
	});
	
	$.ajax({
		url: 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido?ServiceKey=2tZYhOcrXJBIeeVzX9bylvmtsaHiaSrBkh13F9DlyGL0KfQZKGuRtuM3xcc%2Bz55Nblf0iaPOfUwRqeKu2IZ7rQ%3D%3D'
		,dataType:'xml'
		,success:function(response){
			console.log(response.body.items);
		}
	});
})

</script>

<div class="body-container">
	<div class="search_area">
		<form name="search_form" method="post" action="?act=list&amp;bid=animal">
			<select id="city" name="city" onchange="changeCity(this.value);" class="wd120">
				<option value="0" selected="">지역전체</option>
			</select> 
			<select name="country" id="selcont" class="wd120">
				<option value="0">전체</option>
			</select> <br> 
			<select name="keyfield2" id="serch1" class="wd165">
				<option value="0">종 선택</option>
			</select>
			<label for="sch1">공고번호</label> 
			<input type="text" name="sch1" id="sch1" value="" style="ime-mode: active;"> 
			<label for="sch2">연번</label> 
			<input type="text" id="sch2" name="sch2" value="" style="ime-mode: active;"> 
			<label for="sch3">특징</label>
			<input type="text" id="sch3" name="sch3" value="" style="ime-mode: active;">
			<button>검색</button>
		</form>
	</div>
	<div class="strayDog">
			<a title="확대 이미지 보기" href="<%=cp%>/resource/img/dog1.jpg" class="lytebox" data-lyte-options="slide:false" data-title="(사)한국동물구조관리협회">
			<a href="#" img="" class="tx-animal-image" src="<%=cp%>/resource/img/dog1.jpg">
				<img src="<%=cp%>/resource/img/dog1.jpg" width="348" height="261" border="0" align="center">
			</a></a>
		<ul>
			<li class="full"><strong>구조일</strong> <i>
					2018-02-26&nbsp;&nbsp;(SN: 180226-022 <span class="red"></span>)
			</i></li>
			<li class="full"><strong>구조장소</strong></li>
			<li class="full">경기도 양주시 삼숭동 산 104-4 광숭초교...</li>
			<li class="half"><strong>축종</strong> 개 / Mix</li>
			<li class="half"><strong>성별</strong> 암컷</li>
			<li class="half"><strong>연령</strong> 03개월(추정)</li>
			<li class="half"><strong>모색</strong> 흰</li>
			<li class="half"><strong>중성화수술</strong> 확인불가</li>
			<li class="half"><strong>성격</strong> 친화적</li>
			<li class="half"><strong>체중</strong> 2.6 Kg</li>
			<li class="half"><strong>건강상태</strong> 양호</li>
			<li class="full"><strong>특징</strong></li>
			<li class="full"><span>
					하늘색&nbsp;바탕/호피무늬&nbsp;목걸이&nbsp;착용.&nbsp;피부질환.&nbsp;양&nbsp;귀&nbsp;반&nbsp;접힘.&nbsp;코&nbsp;검정색.&nbsp;사람&nbsp;따름.&nbsp;얌전함.&nbsp;단미&nbsp;안됨.&nbsp;털&nbsp;상태&nbsp;때탐.&nbsp;
			</span></li>
		</ul>
	</div>
	
	<div class="strayDog">
			<a title="확대 이미지 보기" href="<%=cp%>/resource/img/dog1.jpg" class="lytebox" data-lyte-options="slide:false" data-title="(사)한국동물구조관리협회">
			<a href="#" img="" class="tx-animal-image" src="<%=cp%>/resource/img/dog1.jpg">
				<img src="<%=cp%>/resource/img/dog1.jpg" width="348" height="261" border="0" align="center">
			</a></a>
		<ul>
			<li class="full"><strong>구조일</strong> <i>
					2018-02-26&nbsp;&nbsp;(SN: 180226-022 <span class="red"></span>)
			</i></li>
			<li class="full"><strong>구조장소</strong></li>
			<li class="full">경기도 양주시 삼숭동 산 104-4 광숭초교...</li>
			<li class="half"><strong>축종</strong> 개 / Mix</li>
			<li class="half"><strong>성별</strong> 암컷</li>
			<li class="half"><strong>연령</strong> 03개월(추정)</li>
			<li class="half"><strong>모색</strong> 흰</li>
			<li class="half"><strong>중성화수술</strong> 확인불가</li>
			<li class="half"><strong>성격</strong> 친화적</li>
			<li class="half"><strong>체중</strong> 2.6 Kg</li>
			<li class="half"><strong>건강상태</strong> 양호</li>
			<li class="full"><strong>특징</strong></li>
			<li class="full"><span>
					하늘색&nbsp;바탕/호피무늬&nbsp;목걸이&nbsp;착용.&nbsp;피부질환.&nbsp;양&nbsp;귀&nbsp;반&nbsp;접힘.&nbsp;코&nbsp;검정색.&nbsp;사람&nbsp;따름.&nbsp;얌전함.&nbsp;단미&nbsp;안됨.&nbsp;털&nbsp;상태&nbsp;때탐.&nbsp;
			</span></li>
		</ul>
	</div>
	
	
	<div class="strayDog">
			<a title="확대 이미지 보기" href="<%=cp%>/resource/img/dog1.jpg" class="lytebox" data-lyte-options="slide:false" data-title="(사)한국동물구조관리협회">
			<a href="#" img="" class="tx-animal-image" src="<%=cp%>/resource/img/dog1.jpg">
				<img src="<%=cp%>/resource/img/dog1.jpg" width="348" height="261" border="0" align="center">
			</a></a>
		<ul>
			<li class="full"><strong>구조일</strong> <i>
					2018-02-26&nbsp;&nbsp;(SN: 180226-022 <span class="red"></span>)
			</i></li>
			<li class="full"><strong>구조장소</strong></li>
			<li class="full">경기도 양주시 삼숭동 산 104-4 광숭초교...</li>
			<li class="half"><strong>축종</strong> 개 / Mix</li>
			<li class="half"><strong>성별</strong> 암컷</li>
			<li class="half"><strong>연령</strong> 03개월(추정)</li>
			<li class="half"><strong>모색</strong> 흰</li>
			<li class="half"><strong>중성화수술</strong> 확인불가</li>
			<li class="half"><strong>성격</strong> 친화적</li>
			<li class="half"><strong>체중</strong> 2.6 Kg</li>
			<li class="half"><strong>건강상태</strong> 양호</li>
			<li class="full"><strong>특징</strong></li>
			<li class="full"><span>
					하늘색&nbsp;바탕/호피무늬&nbsp;목걸이&nbsp;착용.&nbsp;피부질환.&nbsp;양&nbsp;귀&nbsp;반&nbsp;접힘.&nbsp;코&nbsp;검정색.&nbsp;사람&nbsp;따름.&nbsp;얌전함.&nbsp;단미&nbsp;안됨.&nbsp;털&nbsp;상태&nbsp;때탐.&nbsp;
			</span></li>
		</ul>
	</div>
	
	<div class="strayDog">
			<a title="확대 이미지 보기" href="<%=cp%>/resource/img/dog1.jpg" class="lytebox" data-lyte-options="slide:false" data-title="(사)한국동물구조관리협회">
			<a href="#" img="" class="tx-animal-image" src="<%=cp%>/resource/img/dog1.jpg">
				<img src="<%=cp%>/resource/img/dog1.jpg" width="348" height="261" border="0" align="center">
			</a></a>
		<ul>
			<li class="full"><strong>구조일</strong> <i>
					2018-02-26&nbsp;&nbsp;(SN: 180226-022 <span class="red"></span>)
			</i></li>
			<li class="full"><strong>구조장소</strong></li>
			<li class="full">경기도 양주시 삼숭동 산 104-4 광숭초교...</li>
			<li class="half"><strong>축종</strong> 개 / Mix</li>
			<li class="half"><strong>성별</strong> 암컷</li>
			<li class="half"><strong>연령</strong> 03개월(추정)</li>
			<li class="half"><strong>모색</strong> 흰</li>
			<li class="half"><strong>중성화수술</strong> 확인불가</li>
			<li class="half"><strong>성격</strong> 친화적</li>
			<li class="half"><strong>체중</strong> 2.6 Kg</li>
			<li class="half"><strong>건강상태</strong> 양호</li>
			<li class="full"><strong>특징</strong></li>
			<li class="full"><span>
					하늘색&nbsp;바탕/호피무늬&nbsp;목걸이&nbsp;착용.&nbsp;피부질환.&nbsp;양&nbsp;귀&nbsp;반&nbsp;접힘.&nbsp;코&nbsp;검정색.&nbsp;사람&nbsp;따름.&nbsp;얌전함.&nbsp;단미&nbsp;안됨.&nbsp;털&nbsp;상태&nbsp;때탐.&nbsp;
			</span></li>
		</ul>
	</div>
	
	<div class="strayDog">
			<a title="확대 이미지 보기" href="<%=cp%>/resource/img/dog1.jpg" class="lytebox" data-lyte-options="slide:false" data-title="(사)한국동물구조관리협회">
			<a href="#" img="" class="tx-animal-image" src="<%=cp%>/resource/img/dog1.jpg">
				<img src="<%=cp%>/resource/img/dog1.jpg" width="348" height="261" border="0" align="center">
			</a></a>
		<ul>
			<li class="full"><strong>구조일</strong> <i>
					2018-02-26&nbsp;&nbsp;(SN: 180226-022 <span class="red"></span>)
			</i></li>
			<li class="full"><strong>구조장소</strong></li>
			<li class="full">경기도 양주시 삼숭동 산 104-4 광숭초교...</li>
			<li class="half"><strong>축종</strong> 개 / Mix</li>
			<li class="half"><strong>성별</strong> 암컷</li>
			<li class="half"><strong>연령</strong> 03개월(추정)</li>
			<li class="half"><strong>모색</strong> 흰</li>
			<li class="half"><strong>중성화수술</strong> 확인불가</li>
			<li class="half"><strong>성격</strong> 친화적</li>
			<li class="half"><strong>체중</strong> 2.6 Kg</li>
			<li class="half"><strong>건강상태</strong> 양호</li>
			<li class="full"><strong>특징</strong></li>
			<li class="full"><span>
					하늘색&nbsp;바탕/호피무늬&nbsp;목걸이&nbsp;착용.&nbsp;피부질환.&nbsp;양&nbsp;귀&nbsp;반&nbsp;접힘.&nbsp;코&nbsp;검정색.&nbsp;사람&nbsp;따름.&nbsp;얌전함.&nbsp;단미&nbsp;안됨.&nbsp;털&nbsp;상태&nbsp;때탐.&nbsp;
			</span></li>
		</ul>
	</div>
	
	<div id="pagingNav" class="pagenation">
		<span class="select">1</span> 
		<a href="?act=list&amp;bid=animal&amp;page=2&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">2</a>
		<a href="?act=list&amp;bid=animal&amp;page=3&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">3</a>
		<a href="?act=list&amp;bid=animal&amp;page=4&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">4</a>
		<a href="?act=list&amp;bid=animal&amp;page=5&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">5</a>
		<a href="?act=list&amp;bid=animal&amp;page=6&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">6</a>
		<a href="?act=list&amp;bid=animal&amp;page=7&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">7</a>
		<a href="?act=list&amp;bid=animal&amp;page=8&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">8</a>
		<a href="?act=list&amp;bid=animal&amp;page=9&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">9</a>
		<a href="?act=list&amp;bid=animal&amp;page=10&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal">10</a>
		<a href="?act=list&amp;bid=animal&amp;page=11&amp;keyfield1=&amp;keyfield2=&amp;city=&amp;country=&amp;sch1=&amp;sch2=&amp;sch3=&amp;bid=animal" class="img">
		<img src="<%=cp%>/resource/img/btn_nxt.png" alt="다음 목록 보기"></a>
	</div>
</div>