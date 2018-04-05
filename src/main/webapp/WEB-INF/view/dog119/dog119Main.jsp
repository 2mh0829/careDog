<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.wrap_sub {width:100%; height:auto; min-width:1100px; background:#fcfcfc; min-height:800px;}
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

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=true&libraries=places&key=AIzaSyBPA_xStX4VRi97SvEHjPOjZjlIC6aRWcs"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var url = "<%=cp%>/dog119/list";
		//initialize();
		$.ajax({
			url:url,
			dataType:'json',
			success:function(data){
				var list = data.list;
				console.log(data);
				var content = '';
				$.each(list, function(index,item){
					content+="<div class='list'><a href='#myMapModal' data-toggle='modal'>";
					content+="<img src='<%=cp%>/uploads/dog119/"+item.filename+"' class='btnDog119Info' width='348' height='261' border='0' align='center'></a>";
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
		
		/* $("body").on("click",".btnDog119Info", function(){
			initialize();
			$("#dog119Info").modal("show");
		}); */
	});
//*********************************************************************
/* 	var center = new google.maps.LatLng(59.76522, 18.35002);
	var map;
	
	function initialize() {

	    var mapOptions = {
	        zoom: 7,
	        mapTypeId: google.maps.MapTypeId.ROADMAP,
	        center: center
	    };

	    map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

	    var marker = new google.maps.Marker({
	        map: map,
	        position: center
	    });
	}

	$('body').on('click', '.btnDog119Info', function () {
		initialize();
	    $('#dog119Info').modal({
	        backdrop: 'static',
	        keyboard: false
	    }).on('shown.bs.modal', function (e) {
	        google.maps.event.trigger(map, 'resize');
	        map.setCenter(center);
	    });
	});
 */
	
</script>

<div class="body-container">
	<div class="wrap_sub">
		<div class="rescue">
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
		</div><!--rescue-->
	</div><!-- wrap_sub -->
	
	<div class="dog119_btn">
		<button type="button" onclick="javascript:location.href='<%=cp%>/dog119/created'">등록하기</button>
	</div>
	
	<nav>
	   <div id="paging" class="paging" align="center"></div>
	</nav>
</div> <!-- body-container -->

<!-- modal -->
<div class="modal fade" id="myMapModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                 <h4 class="modal-title">Modal title</h4>

            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <div id="map-canvas" class=""></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
<!-- detailDog Modal -->
<!-- <div class="modal fade" id="dog119Info" tabindex="-1" role="dialog" aria-labelledby="dog119InfoLabel" aria-hidden="true">
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
				<div id="map_canvas" class="map_postbox"></div>
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

		</div> modal-content
</div>
</div> -->
<script>
var map;        
var myCenter=new google.maps.LatLng(53, -1.33);
var marker=new google.maps.Marker({
	position:myCenter
});

function initialize() {
	var mapProp = {
		center:myCenter,
		zoom: 14,
		draggable: false,
		scrollwheel: false,
		mapTypeId:google.maps.MapTypeId.ROADMAP
	};
	
	map=new google.maps.Map(document.getElementById("map-canvas"),mapProp);
	marker.setMap(map);
	
	google.maps.event.addListener(marker, 'click', function() {
	
		infowindow.setContent(contentString);
		infowindow.open(map, marker);
		
	}); 
};
google.maps.event.addDomListener(window, 'load', initialize);

google.maps.event.addDomListener(window, "resize", resizingMap());

$('#myMapModal').on('show.bs.modal', function() {
	initialize();
	//Must wait until the render of the modal appear, thats why we use the resizeMap and NOT resizingMap!! ;-)
	resizeMap();
})

function resizeMap() {
	if(typeof map =="undefined") return;
	setTimeout( function(){resizingMap();} , 400);
}

function resizingMap() {
	if(typeof map =="undefined") return;
	var center = map.getCenter();
	google.maps.event.trigger(map, "resize");
	map.setCenter(center); 
}
</script>