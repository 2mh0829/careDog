<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>

.pagenation {width:1100px; height:auto; margin:0 auto 50px auto; text-align:center; clear:both;}
.pagenation a {display:inline-block; width:40px; height:40px; line-height:40px; font-size:16px; color:#444; margin-right:10px; text-align:center; background:#f3f3f3; border:1px solid #ccc;}
.pagenation a.img {border:0; background:none; padding-top:12px; height:28px;}
.pagenation .select {background:#2e5fa4;display:inline-block; width:40px; height:40px; line-height:40px; font-size:16px; color:#fff; font-family: 'NanumGothicWebBold'!important; font-weight:normal; margin-right:10px; text-align:center; border:1px solid #2e5fa4;}

.strayDog {width:1000px; height:auto; margin:0 auto 50px auto;}
.strayDog+.strayDog {
	margin-left: 2%
}


.allStrayDog .strayDog {width:310px; height:600px; float:left; margin:40px 8px 60px 8px; background:#fff; border:1px solid #ccc;}
.allStrayDog .strayDog img {vertical-align:top;width:310px; height:261px; /*margin-bottom:25px;*/}
.allStrayDog .strayDog ul {height:403px; padding:0 10px; margin-top:25px;}
.allStrayDog .strayDog ul li {line-height:30px; color:#666;letter-spacing:-0.5px;font-size:14px;}
.allStrayDog .strayDog ul li span.red {color:red;}
.allStrayDog .strayDog ul li.full {clear:both;}
.allStrayDog .strayDog ul li strong {font-family: 'NanumGothicWebBold'!important; font-weight:normal; color:#222; padding-right:5px; font-size:16px;}
.allStrayDog .strayDog ul li i {font-size:16px; color:#2e5fa4; font-style:normal;}
.allStrayDog .strayDog ul li span {line-height:22px; color:#666;}
.allStrayDog .strayDog ul li.half {width:50%; float:left;}

::selection {background:#26579c; color:#fff;}

.no-result {width:1100px; height:auto; margin:40px auto 50px auto; text-align:center; background:#fff;font-size:16px; color:#2e5fa4; border:1px solid #ccc; padding:20px 0;}

.search_area {width:width:1098px; height:auto; margin:0 auto 50px auto; text-align:center;padding:15px 0 0 0; background:#fff; border:1px solid #ccc; line-height:35px;}
.search_area select {height:35px; font-size:16px; color:#444; display:inline-block; vertical-align:middle; line-height:35px; margin-bottom:15px; background:#fff;}
.search_area select.wd100 {width:100px; padding-left:5px;}
.search_area select.wd165 {width:165px; padding-left:5px; margin-right:8px;}
.search_area select.wd120 {width:120px; padding-left:5px; margin-right:8px;}
.search_area label {font-size:16px; color:#444; margin-right:8px; line-height:35px; vertical-align:top;}
.search_area input[type="text"] {width:155px; height:35px; line-height:35px; padding:0 5px; display:inline-block; margin-right:8px;background:#fff;  vertical-align:middle;margin-bottom:15px;}
.search_area button {width:80px; height:35px; color:#fff; font-size:16px; background:#2e5fa4;margin-bottom:15px;}
.search_area input[type="checkbox"] {width:16px; height:16px; margin-right:8px; vertical-align:top; margin-top:10px;}
.search_area img {vertical-align:top; margin-top:5px; margin-right:8px;}
.search_area span {height:35px; line-height:35px; font-size:16px; color:#444; width:10px; display:inline-block; vertical-align:top;}

a{text-decoration:none;cursor:pointer;outline:none;}  
a:hover,a:active{text-decoration:none;}
a:focus , button:focus {outline:1px dotted #ccc;} */
textarea, select, button, table {font-family:inherit; font-size:inherit; line-height:inherit;}
legend{display:none; overflow:hidden; visibility:hidden; height:0; font-size:0; line-height:0;} /* For Screen Reader */
img, fieldset, button {border:0;}
img{vertical-align:middle;}
fieldset, button, input {vertical-align:middle;}
ul, ol, li, dl, dt, dd {list-style:none;margin:0;padding:0;}
em, i, address {font-style:normal; font-weight:normal;}
textarea, button {line-height:1.2; /* 입력폼에서 춤추지 않는 최소 줄간 1.2 */ vertical-align: bottom;}
input {vertical-align:middle;border:none;background:none;}
label {cursor:pointer; vertical-align:middle;}
strong {font-family: 'NanumGothicWebBold' !important; } /* 강조 */

.cs_abandoned_animal .info_wrap dl {
    max-width: 425px;
    line-height: 18px
}

.cs_abandoned_animal .info_wrap dl dt {
    float: left;
    margin-right: 10px;
    padding-top: 5px;
    color: #8f8f8f !important;
}

.cs_abandoned_animal .info_wrap dl dd {
    position: relative;
    padding-top: 5px;
    color: #242424
}

.cs_abandoned_animal .info_wrap dl dd.info_hair {
    float: left
}

.cs_abandoned_animal .info_wrap dl .ico_arrow {
    display: inline-block;
    vertical-align: top;
    margin: 3px 5px 0 4px;
    width: 5px;
    height: 9px;
    background: url(../img/sp_abandoned_animal_v2.png) no-repeat -17px -28px;
}

.cs_abandoned_animal .info_wrap dl .ico_bar {
    display: inline-block;
    vertical-align: top;
    margin: 3px 9px 0 8px;
    width: 1px;
    height: 11px;
    background-color: #eaeaea;
}

.cs_abandoned_animal .info_wrap dl dd a {
    text-decoration: none
}

.cs_abandoned_animal .info_wrap dl dd a.link_map {
    margin-left: 2px
}

.cs_abandoned_animal .info_wrap dl dd a:hover {
    text-decoration: underline
}

.cs_abandoned_animal .info_wrap dl dd .info_tell {
    color: #8f8f8f
}

.cs_abandoned_animal .info_wrap dl dd .ico_notice{
    display: inline-block;
    *display: inline;
	overflow: hidden;
    vertical-align: top;
    margin: -1px 0 0 4px;
	*zoom: 1;
    width: 16px;
    height: 16px;
    background: url(../img/sp_abandoned_animal_v2.png) no-repeat -42px -25px;
}

.ly_abandoned_animal .ico_info{
    display: inline-block;
    *display: inline;
	overflow: hidden;
    vertical-align: top;
    margin: -3px 0 0 0;
	*zoom: 1;
    width: 16px;
    height: 16px;
    background: url(../img/sp_abandoned_animal_v2.png) no-repeat -42px -25px;
}
.cs_abandoned_animal .info_wrap dl dd.info_notice{
    width: 425px;
    z-index: 100;
}
.cs_abandoned_animal .info_wrap dl dd .ly_notice{
    position: absolute;
    top: 32px;
    right: -27px;
    width: 289px;
    border: 1px solid #cbdeee;
    background-color: #fff;
    color: #666;
    font-size: 12px;
    text-align: left;
    line-height: 20px;
    box-shadow: 0 3px 6px rgba(0,0,0,0.1);
    z-index: 100;
}
.cs_abandoned_animal .info_wrap dl dd .ly_notice strong{
    display: block;
    padding:21px 0 0 23px;
    color: #424242;
}


.cs_abandoned_animal .info_wrap dl dd .ly_notice[aria-hidden="true"] {
    display: none;
}

.cs_abandoned_animal .info_wrap dl dd .ly_notice p{
    padding: 3px 23px 18px 23px;
    line-height: 20px;
    color: #666;
    font-size: 12px;
}

.cs_abandoned_animal .info_wrap dl dd .ly_notice .btn_close{
    display: block;
    overflow: hidden;
    position: absolute;
    top: 12px;
    right: 12px;
    width: 13px;
    height: 13px;
    border: 0;
    background: url(../img/sp_abandoned_animal_v2.png) no-repeat -38px -10px;
    font-size: 0;
    line-height: 0;
    cursor: pointer;
}

/* 안내문구 및 제공 */

.cs_abandoned_animal .lst_wrap+.animal_notice {
    margin-top: 15px
}

.cs_abandoned_animal .animal_notice {
    overflow: hidden;
    position: relative
}

.cs_abandoned_animal .animal_notice p {
    overflow: hidden;
    position: relative;
    padding-left: 10px;
    line-height: 18px;
    font-size: 11px;
    font-family: '돋움', dotum, AppleSDGothicNeo, Helvetica, sans-serif;
    color: #8f8f8f
}

.cs_abandoned_animal .animal_notice p .ico_notice {
    position: absolute;
    top:5px;
    left: 0;
    display: block;
    width: 2px;
    height: 47px;
    margin: -2px 7px 0 0;
    vertical-align: middle;
    background-color: #e8e8e8
}

.cs_abandoned_animal .animal_notice p .ico_bar {
    display: inline-block;
    vertical-align: top;
    *display: inline;
    *zoom:1;
    margin: 3px 3px 0 7px;
    width: 1px;
    height: 10px;
    background-color: #eaeaea;
}

.cs_abandoned_animal .animal_notice a {
    text-decoration: none;
}

.cs_abandoned_animal .animal_notice a:hover {
    text-decoration: underline;
}

</style>
<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
var city,gu, center, kind, total, paging;
var pageNum=1;
var startPage, endPage;
$(document).ready(function(){
	findDog('');
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
	gu='';
	center='';
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
	center='';
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
			var content="";
			total = data.totalCount;
			paging = data.paging;
			console.log(list)
			$.each(list, function(index, item){
				content+="<div class='strayDog'><button type='button' data-toggle='modal' data-target='#strayDogDetail'>";
				content+="<img src="+item.popfile+" width='310' height='261' border='0' align='center'></button><ul>";
				content+="<li class='full'><strong>접수일</strong> <i> "+item.happenDt+"&nbsp;&nbsp;(공고번호:<span class='red'> "+item.noticeNo+" </span>)";
				content+="</i></li><li class='full'><strong>발견장소</strong></li><li class='full'>"+item.happenPlace+"</li>";
				content+="<li class='full'><strong>품종</strong> "+item.kindCd+"</li>";
				content+="<li class='half'><strong>성별</strong> "+item.sexCd+"</li>";
				content+="<li class='half'><strong>연령</strong> "+item.age+"</li>";
				content+="<li class='half'><strong>색상</strong> "+item.colorCd+"</li>";
				content+="<li class='half'><strong>중성화수술</strong> "+item.neuterYn+"</li>";
				content+="<li class='half'><strong>체중</strong> "+item.weight+"</li>";
				content+="<li class='half'><strong>상태</strong> "+item.processState+"</li><br>";
				content+="<li class='full'><strong>특징</strong></li>";
				content+="<li class='full'><span>"+item.specialMark+"</span></li></ul></div>";
			});
			$(".allStrayDog").append(content);
			$(".pagenation").append(paging);
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

function listPage(num){
	pageNum=num;
	$(".pagenation").find("a").remove();
	findDog('');
}


</script>

<div class="body-container">
 <!-- 검색영역 -->
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
	
<!-- 리스트 출력 -->
	<div class="allStrayDog">
	</div>
	
<!-- 페이징 -->
	<div id="pagingNav" class="pagenation"></div>
</div>

<!-- detailDog Modal -->
<div class="modal fade" id="strayDogDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		<div class="solo_wrap">
			<h4 class="detail_title">
				<a nocr="" onclick="return goOtherCR(this, 'a=nco_xca*1.number&amp;r=1&amp;i=881795fd_000000765F8F&amp;u=' + urlencode(this.href));"
					href="<%=cp%>/resource/img/dog2.jpg" target="_blank" class="tit">경기-안산-2018-00204</a> 
				<span class="ico_notice"><span class="blind">공고중</span></span>
			</h4>
			<div class="info_wrap">
				<div class="animal_img">
					<a nocr=""
						onclick="return goOtherCR(this, 'a=nco_xca*1.image&amp;r=1&amp;i=881795fd_000000765F8F&amp;u=' + urlencode(this.href));"
						class="thumb" href="<%=cp%>/resource/img/dog2.jpg" target="_blank"> 
						<img src="<%=cp%>/resource/img/dog2.jpg" width="120" height="120" alt="유기동물">
					</a>
				</div>
				<div class="animal_info">
					<dl>
						<dt>품종</dt>
						<dd>
							개<span class="ico_arrow"></span>
								<a onclick="return goOtherCR(this,&quot;a=nco_xca*1&amp;r=1&amp;i=&quot;+urlencode(&quot;881795fd_000000765F8F&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));"
									href="?where=nexearch&amp;sm=tab_etc&amp;query=%EB%AF%B8%EB%8B%88%EC%96%B4%EC%B3%90%ED%95%80%EC%85%94%20%EC%9C%A0%EA%B8%B0%EB%8F%99%EB%AC%BC">미니어쳐핀셔</a>,
							수컷
						</dd>
						<dt>털색</dt>
						<dd class="info_hair">흑갈</dd>
						<dt>
							<span class="ico_bar"></span>체중
						</dt>
						<dd>4(Kg)</dd>
						<dt>나이</dt>
						<dd>2014(년생)</dd>
						<dt>발견</dt>
						<dd>선부2동1034-8번지인근</dd>
						<dt>특징</dt>
						<dd>비만, 꼬리단미</dd>
						<dt>접수</dt>
						<dd>
							<a nocr="" onclick="return goOtherCR(this, 'a=nco_xca*1.date&amp;r=1&amp;i=881795fd_000000765F8F&amp;u=' + urlencode(this.href));"
								href="?where=nexearch&amp;sm=tab_etc&amp;query=3%EC%9B%9410%EC%9D%BC%20%EC%9C%A0%EA%B8%B0%EB%8F%99%EB%AC%BC">2018.03.10.</a>
						</dd>
						<dt>공고</dt>
						<dd class="info_notice _toggle_area">
							2018.03.10.~2018.03.22.
							<a nocr="" onclick="goOtherTCR(this, 'a=nco_xca*1.dateinfo&amp;r=1&amp;i=881795fd_000000765F8F');return false;"
								href="#" class="ico_notice _toggle_trigger" role="button">
								<span class="blind">공고확인</span>
							</a>
							<div class="ly_notice _toggle_content" style="display: none">
								<strong>공고기간</strong>
								<p>동물보호법에 따라 공고가 있는 날부터 10일이 지나도 소유자를 알 수 없는 경우는 지방자치단체가
									동물의 소유권을 취득하게 되며, 일반인에게 분양할 수 있습니다.</p>
								<button class="btn_close _toggle_trigger">레이어 닫기</button>
							</div>
						</dd>
						<dt>관할</dt>
						<dd>
							<a nocr="" onclick="return goOtherCR(this, 'a=nco_xca*1.region&amp;r=1&amp;i=881795fd_000000765F8F&amp;u=' + urlencode(this.href));"
								href="?where=nexearch&amp;sm=tab_etc&amp;query=%EA%B2%BD%EA%B8%B0%EB%8F%84%EC%95%88%EC%82%B0%EC%8B%9C%20%EC%9C%A0%EA%B8%B0%EB%8F%99%EB%AC%BC">경기도
							안산시</a>
						</dd>
						<dt>보호센터</dt>
						<dd>
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_xca*1.protect&amp;r=1&amp;i=881795fd_000000765F8F&amp;u=' + urlencode(this.href));"
								href="?where=nexearch&amp;sm=tab_etc&amp;query=(%EC%82%AC)%ED%95%9C%EB%8F%99%EB%B3%B4%20%EC%9C%A0%EA%B8%B0%EB%8F%99%EB%AC%BC">(사)한동보</a>
						</dd>
						<dt>보호장소</dt>
						<dd>경기도 안산시 상록구 청곡길 50 (부곡동) 안산시 상록구 부곡동 231-5</dd>
						<dt>전화</dt>
						<dd>
							031-296-0124<span class="info_tell">(9시~18시 가능)</span>
						</dd>
					</dl>
				</div>
			</div>
			<div class="animal_notice">
				<strong class="blind">업데이트</strong>
				<p>
				<span class="ico_notice"></span>본 정보는 지방자치단체와 유기동물 보호시설에서 등록한 보호중
					동물입니다. 유기동물의 절반 가량만 주인을 찾거나 입양이 됩니다. 유기동물에 관심을 가져주세요. <br>최종
					업데이트 2018.03.10.<span class="ico_bar"></span> 출처 
				<a nocr="" onclick="return goOtherCR(this, 'a=nco_xca*1.source&amp;r=1&amp;i=881795fd_000000765F8F&amp;u=' + urlencode(this.href));"
					href="http://www.animal.go.kr/portal_rnl/abandonment/protection_list.jsp"
					target="_blank">동물보호관리시스템
				</a>, 통계 
				<a nocr="" onclick="return goOtherCR(this, 'a=nco_xca*1.statistic&amp;r=1&amp;i=881795fd_000000765F8F&amp;u=' + urlencode(this.href));"
					href="http://pawinhand.kr/#locationSearch" target="_blank">포인핸드</a>
				</p>
			</div>
		</div>

		</div> <!-- modal-content -->
   </div>
</div>