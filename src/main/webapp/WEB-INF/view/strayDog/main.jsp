<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/strayDog/strayDog.css">
<script type="text/javascript">
var city,gu, center, kind, total, paging, noticeSdt, noticeEdt;
var pageNum=1;
var startPage, endPage;

$(document).ready(function(){
	CalAddCss();
	  $.ajax({
		url:'<%=cp%>/strayDog/sido'
		,dataType:'json'
		,success:function(data){
			var list = data.list;
			var content="<option value=''>전체</option>";
			//$("#city").find("option").remove();
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
			$.each(list, function(index,item){
				content+="<option value="+item.kindCd+">"+item.KNm+"</option>";
			});
			$("#serch1").append(content);
		}
	  });
	
	/* datepicker */
	$("#noticeSdt").datepicker({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
	  });

	$("#noticeSdt").click(function() {
		$("#noticeSdt").datepicker("show");
	});
	
	$("#noticeEdt").datepicker({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
	  });

	$("#noticeEdt").click(function() {
		$("#noticeEdt").datepicker("show");
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
	queryParams = 'bgnde=' + encodeURIComponent(noticeSdt); /*유기날짜 (검색 시작일) (YYYYMMDD) */
	queryParams += '&' + encodeURIComponent('endde') + '=' + encodeURIComponent(noticeEdt); /*유기날짜 (검색 종료일) (YYYYMMDD) */
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
			$(".pagenation").find("ul").remove();
			var list=data.list;
			var content="";
			total = data.totalCount;
			paging = data.paging;
			$.each(list, function(index, item){
				content+="<div class='strayDog'>";
				content+="<img class='btnStrayDogInfo' data-popfile='"+item.popfile+"' src="+item.popfile+" width='310' height='261' border='0' align='center'><ul>";
				content+="<li class='full'><strong>접수일</strong> <i data-happenDt='"+item.happenDt+"'> "+item.happenDt+"&nbsp;&nbsp;(공고번호:<span class='red' data-noticeNo='"+item.noticeNo+"'> "+item.noticeNo+" </span>)";
				content+="</i></li><li class='full'><strong>발견장소</strong></li><li class='full' data-happenPlace='"+item.happenPlace+"'>"+item.happenPlace+"</li>";
				content+="<li class='full' data-kindCd='"+item.kindCd+"'><strong>품종</strong> "+item.kindCd+"</li>";
				content+="<li class='half' data-sexCd='"+item.sexCd+"'><strong>성별</strong> "+item.sexCd+"</li>";
				content+="<li class='half' data-age='"+item.age+"'><strong>연령</strong> "+item.age+"</li>";
				content+="<li class='half' data-colorCd='"+item.colorCd+"'><strong>색상</strong> "+item.colorCd+"</li>";
				content+="<li class='half' data-neuterYn='"+item.neuterYn+"'><strong>중성화수술</strong> "+item.neuterYn+"</li>";
				content+="<li class='half' data-weight='"+item.weight+"'><strong>체중</strong> "+item.weight+"</li>";
				content+="<li class='half' data-processState='"+item.processState+"'><strong>상태</strong> "+item.processState+"</li><br>";
				content+="<li class='full'><strong>특징</strong></li>";
				content+="<li class='full' data-specialMark='"+item.specialMark+"'><span>"+item.specialMark+"</span></li></ul></div>";
				content+="<input type='hidden' class='careAddr' value='"+item.careAddr+"'>";
				content+="<input type='hidden' class='careNm' value='"+item.careNm+"'>";
				content+="<input type='hidden' class='careTel' value='"+item.careTel+"'>";
				content+="<input type='hidden' class='desertionNo' value='"+item.desertionNo+"'>";
				content+="<input type='hidden' class='noticeEdt' value='"+item.noticeEdt+"'>";
				content+="<input type='hidden' class='noticeSdt' value='"+item.noticeSdt+"'>";
				content+="<input type='hidden' class='officetel' value='"+item.officetel+"'>";
				content+="<input type='hidden' class='orgNm' value='"+item.orgNm+"'>";
			});
			$(".allStrayDog").append(content);
			$(".pagenation").append(paging);
		}
	});
}


$(function(){
	$("body").on("click",'.btnStrayDogInfo', function () {
		
		var popfile=$(this).attr('data-popfile');
		var happenDt = $(this).siblings("ul").children("li").eq(0).children("i").attr("data-happenDt");
		var noticeNo = $(this).siblings("ul").children("li").eq(0).children("i").children("span").attr("data-noticeNo");
		var happenPlace = $(this).siblings("ul").children("li").eq(2).attr("data-happenPlace");
		var kindCd = $(this).siblings("ul").children("li").eq(3).attr("data-kindCd");
		var sexCd = $(this).siblings("ul").children("li").eq(4).attr("data-sexCd");
		var age = $(this).siblings("ul").children("li").eq(5).attr("data-age");
		var colorCd = $(this).siblings("ul").children("li").eq(6).attr("data-colorCd");
		var neuterYn = $(this).siblings("ul").children("li").eq(7).attr("data-neuterYn");
		var weight = $(this).siblings("ul").children("li").eq(8).attr("data-weight");
		var processState = $(this).siblings("ul").children("li").eq(9).attr("data-processState");
		var specialMark = $(this).siblings("ul").children("li").eq(11).attr("data-specialMark");
		var careAddr = $(".careAddr").val();
		var careNm = $(".careNm").val();
		var careTel = $(".careTel").val();
		var desertionNo = $(".desertionNo").val();
		var noticeEdt = $(".noticeEdt").val();
		var noticeSdt = $(".noticeSdt").val();
		var officetel = $(".officetel").val();
		var orgNm = $(".orgNm").val();
		
		$("#popfile").attr("src",popfile);
		$("#happenDt").text(happenDt);
		$("#noticeNo").text(noticeNo);
		$("#happenPlace").text(happenPlace);
		$("#kindCd").text(kindCd);
		$("#sexCd").text(sexCd);
		$("#age").text(age);
		$("#colorCd").text(colorCd);
		$("#neuterYn").text(neuterYn);
		$("#weight").text(weight);
		$("#processState").text(processState);
		$("#specialMark").text(specialMark);
		$("#careAddr").text(careAddr);
		$("#careNm").text(careNm);
		$("#careTel").text(careTel);
		$("#desertionNo").text(desertionNo);
		$("#officetel").text(officetel);
		$("#orgNm").text(orgNm);
		$("#noticeSdt_noticeEdt").text(noticeSdt+"~"+noticeEdt);
		
		$("#strayDogDetail").modal("show");
	});
});

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

//종료 날짜 세팅
function CalAddCss(){
	var tDay = new Date();
	var tMonth = tDay.getMonth()+1;
	var tDate = tDay.getDate();
	if ( tMonth < 10) tMonth = "0"+tMonth;
	if ( tDate < 10) tDate = "0"+tDate;
	document.getElementById("noticeEdt").value = tDay.getFullYear()+"-"+tMonth+"-"+tDate;
	noticeEdt = tDay.getFullYear()+tMonth+tDate;
	startDate(tDay);
}

//시작날짜 세팅
function startDate(tDay){
	var sDate=new Date(tDay.getFullYear(),tDay.getMonth()-1,tDay.getDate());
	var tMonth = sDate.getMonth()+1;
	var tDate = sDate.getDate();
	if ( tMonth < 10) tMonth = "0"+tMonth;
	if ( tDate < 10) tDate = "0"+tDate;
	document.getElementById("noticeSdt").value = sDate.getFullYear()+"-"+tMonth+"-"+tDate;
	noticeSdt = sDate.getFullYear()+tMonth+tDate;
	findDog('');
}

function setNoticeSdt(date){
	noticeSdt = date;
	if(noticeEdt==null || noticeEdt==''){
		alert('종료날짜를 선택하세요.')
	}else{
		findDog('');
	}
}

function setNoticeEdt(date){
	noticeEdt = date;
	if(noticeSdt==null || noticeSdt==''){
		alert('시작날짜를 선택하세요.')
	}else{
		findDog('');
	}
}

// 날짜체크
function setNoticeEdt(date){
	var input1 = document.getElementById('noticeSdt').value;
	var input2 = document.getElementById('noticeEdt').value;

	var day = 1000*60*60*24;
	var month = day*30;
	var year = month*12;

	var date1 = new Date(input1.substr(0,4),input1.substr(5,2)-1,input1.substr(8,2));
	var date2 = new Date(input2.substr(0,4),input2.substr(5,2),input2.substr(8,2));
	var date1_chk = input1.substr(8,2);
	var date2_chk = input2.substr(8,2);
	var month1_chk = input1.substr(0,7);
	var month2_chk = input2.substr(0,7);

	var newDate = new Date();
	var yy = newDate.getFullYear();
	var mm = newDate.getMonth()+1;
	if (mm < 10)
	{
		mm = "0" + mm;
	}
	var dd = newDate.getDate();
	if (dd < 10)
	{
		dd = "0" + dd;
	}

	var toDay = yy + "-" + mm + "-" + dd;

	//alert(toDay);
	//alert(date2_chk);
	if (month1_chk == month2_chk && date1_chk >= date2_chk) {
		alert("오류! 검색 종료일이 시작일보다 다음날짜이어야 합니다.");
		$("#noticeSdt").focus();
		document.getElementById('noticeSdt').value = "";
		document.getElementById('noticeEdt').value = "";
		return false;
	}

	if (month1_chk >= month2_chk) {
		alert("검색 시작 날짜는 종료 날짜보다 이전이어야 합니다.");
		$("#noticeSdt").focus();
		document.getElementById('noticeSdt').value = "";
		document.getElementById('noticeEdt').value = "";
		return false;
	}
}
</script>

<div class="body-container">
 <!-- 검색영역 -->
	<div class="search_area">
		<form name="search_form" method="post">
			<input type="text" id="noticeSdt" placeholder="검색 시작날짜" onchange="setNoticeSdt(this.value)">&nbsp;~&nbsp;
			<input type="text" id="noticeEdt" placeholder="검색 종료날짜" onchange="setNoticeEdt(this.value)">
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
<div class="modal fade" id="strayDogDetail" tabindex="-1" role="dialog" aria-labelledby="strayDogDetailLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		<div class="solo_wrap">
			<h4 class="detail_title" align="center">
				<span class="red" id="noticeNo"></span>
			</h4>
			<div class="info_wrap">
				<div class="animal_img" align="center">
						<img src="" id="popfile" width="500" height="300" alt="유기동물">
				</div>
				<div class="animal_info">
					<dl>
						<dt>품종</dt>
						<dd>
							개<span class="ico_arrow"></span>
								<a href="#" id="kindCd"></a>,
							수컷
						</dd>
						<dt>털색</dt>
						<dd id="colorCd"></dd>
						<dt>
							체중
						</dt>
						<dd id="weight"></dd>
						<dt>나이</dt>
						<dd id="age"></dd>
						<dt>발견</dt>
						<dd id="happenPlace"></dd>
						<dt>특징</dt>
						<dd id="specialMark"></dd>
						<dt>접수일</dt>
						<dd id="happenDt"></dd>
						<dt>공고</dt>
						<dd id="noticeSdt_noticeEdt" class="red">
							
							<div class="ly_notice _toggle_content" style="display: none">
								<strong>공고기간</strong>
								<p>동물보호법에 따라 공고가 있는 날부터 10일이 지나도 소유자를 알 수 없는 경우는 지방자치단체가
									동물의 소유권을 취득하게 되며, 일반인에게 분양할 수 있습니다.</p>
								<button class="btn_close _toggle_trigger">레이어 닫기</button>
							</div>
						</dd>
						<dt>관할</dt>
						<dd id="orgNm"></dd>
						<dt>보호소 이름</dt>
						<dd id="careNm"></dd>
						<dt>보호장소</dt>
						<dd id="careAddr"></dd>
						<dt>전화</dt>
						<dd id="careTel"></dd>
					</dl>
				</div>
			</div>
			<div class="animal_notice">
				<strong class="blind">업데이트</strong>
				<p>
				<span class="ico_notice"></span>본 정보는 지방자치단체와 유기동물 보호시설에서 등록한 보호중
					동물입니다. 유기동물의 절반 가량만 주인을 찾거나 입양이 됩니다. 유기동물에 관심을 가져주세요. <br>최종
					업데이트 2018.03.10.<span class="ico_bar"></span> 출처 (주)careDog
				
				</p>
			</div>
		</div>

		</div> <!-- modal-content -->
   </div>
</div>
