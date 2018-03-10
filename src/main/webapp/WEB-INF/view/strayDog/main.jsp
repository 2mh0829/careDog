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
	pageNum = num;
	findDog('');
	$(".pagenation").find("a").remove();
	//startPage, endPage;
	//startPage=
	var prevNum = pageNum-1;
	var nextNum = pageNum+1;

	var content = "";
	content+=(pageNum==1?"":"<a href='javascript:page("+prevNum+")' class='img'><img src='<%=cp%>/resource/img/strayDog/btn_prev.png' alt='이전 목록 보기'></a>");
	content+="<c:forEach var='i' begin='1' end='10'>";
	content+="<a href='javascript:page(${i})' onclick='onchange()'>${i}</a>";
	content+="</c:forEach>";
	content+="<a href='javascript:page("+nextNum+")' class='img'>"
	content+="<img src='<%=cp%>/resource/img/strayDog/btn_nxt.png' alt='다음 목록 보기'></a>";
	/* <span class="select">1</span>  */
	
	$(".pagenation").append(content);
}

function onchange(){
	$(".pagenation a").on("click",function(e){
		e.preventDefault();
		console.log(this);
		$('a span').attr('class','select');
	});
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
	<div id="pagingNav" class="pagenation"></div>
</div>

<!-- detailDog Modal -->
<div class="modal fade" id="strayDogDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		<img src="+item.popfile+" width='310' height='261' border='0' align='center'>
							<!--습득신고내용부분-->	
		<ul>
		<caption>공고번호-경남-통영-2018-00086 의 상세정보</caption>
                                    「동물보호법」 제17조, 같은 법 시행령 제7조 및 같은 법 시행규칙 제20조에 따라 구조된 동물의 보호상황을 아래와<br> 같이 공고합니다.
              <li class="half">공고번호</li>
			<li class="half">경남-통영-2018-00086</li>
			<li class="half">품 종</li>
			<li class="half">[개] 믹스견</li>
			<li class="half">색 상</li>
			<li class="half">흰색/크림색/검회색</li>
			<li class="half">성 별</li>
			<li class="half">수컷</li>
			<li class="half">중성화 여부</li>
			<li class="half">아니오</li>
			<li class="half">나이/체중</li>
			<li class="half">2017(년생)&nbsp;/&nbsp;3.1(Kg)</li>
			<li class="half">접수일시</li>
			<li class="half">20180310</li>
			<li class="half">발생장소</li>
			<li class="half">산양 스포츠파크 근처</li>
			<li class="half">특 징</li>
			<li class="half">형제자견(00084,00085)과 함께 입소,정수리부위 검회색 털</li>
			<li class="half">공고기한</li>
			<li class="half">20180310 ~ 20180320</li>
							  <!-- 
							  <tr>
								<th scope="row">등록번호</th>
								<td>&nbsp;</td>
								<th scope="row">RFID_CD</th>
								<td class="widthIn">&nbsp;</td>
							  </tr>
							   -->
								<!--<th scope="col">특 징</th>-->
			<li class="half"> ** 유기동물 문의는 보호센터에 연락하시기 바랍니다.&nbsp;</li>
			<li class="half">보호센터이름</li>
			<li class="half"><strong>사랑애완동물병원</strong></li>
			<li class="half">전화번호</li>
			<li class="half">055-648-7582</strong></li>
			<li class="half">보호장소</li>
			<li class="half"><strong>경상남도 통영시 광도면 죽림3로 33 (광도면) 사랑애완동물병원</strong></li>
			<li class="half">관할기관</li>
			<li class="half">경상남도 통영시</li>
			<li class="half">담당자</li>
			<li class="half">조준태</li>
			<li class="half">연락처</li>
			<li class="half">055-650-6241</li>
			<li class="half">특이사항</li>
			<li class="half"></li>
	<br>
		<strong>상기 동물을 분실하신 소유주께서는 보호센터로 문의하시어 동물을 찾아가시기 바라며,  동물보호 법 제17조<br><br>
		의 규정에 따른 공고가 있는 날부터 10일이 경과하여도 소유자 등을 알 수 없는 경우에는 유실물법  제12조<br><br>
		및 민법 제253조의 규정에 불구하고 해당 시,군,구 자치구가 그 동물의 소유권을 취득하게 됩니다.<br><br>								 
			<strong>2018년 03월 10일</strong> <br><br>
			<strong> 통영시장(직인생략) </strong>
	</strong>
      </ul>
	</div> 
	<div align="center" style="float:left;padding-left:15px;padding-top:35px">※ 해당 글은 동물보호관리시스템을 참조한 것입니다. </div>
    </div>
</div>