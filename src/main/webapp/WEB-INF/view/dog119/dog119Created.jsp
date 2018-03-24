<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.body-container .content { float:left; margin:0px; padding:0 0 32px 0; width:920px }
.body-container .section { float:left; margin:0px; padding:0 0 32px 0; width:626px }
.body-container .aside { float:left; margin:0px; padding:0 0 30px 0; width:294px }
.body-container .section h3 { float:left; width:576px; margin:0px; padding:0 0 7px 0; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:18px; font-weight:bold; color:#0e0f17; border-bottom:1px solid #c0c0c2 }
.body-container .section h3 a { font-size:14px; color:#147ebb; font-weight:bold; text-decoration:none }
.body-container .section h3 a:hover { color:#147ebb; text-decoration:underline }
.body-container .section h3 .ico_cirle { display:inline-block; width:5px; height:12px; margin-left:1px; background-image:url(http://www.angel.or.kr/images/bg_angle.gif); background-repeat:no-repeat; vertical-align:middle }
*:first-child+html #bodycontent .section h3 .ico_cirle { display:inline-block; width:5px; height:12px; padding-right:4px; background-image:url(http://www.angel.or.kr/images/bg_angle.gif); background-repeat:no-repeat; vertical-align:middle }
.body-container .content h3 { float:left; width:920px; margin:0px; padding:0 0 7px 0; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:18px; font-weight:bold; color:#0e0f17; border-bottom:1px solid #c0c0c2 }
.body-container .content h3 a { color:#147ebb; text-decoration:none }
.body-container .content h3 a:hover { color:#147ebb; text-decoration:underline }
.body-container .content h3 .ico_cirle { display:inline-block; width:5px; height:12px; margin-left:1px; background-image:url(http://www.angel.or.kr/images/bg_angle.gif); background-repeat:no-repeat; vertical-align:middle }
*:first-child+html #bodycontent .content h3 .ico_cirle { display:inline-block; width:5px; height:12px; padding-right:4px; background-image:url(http://www.angel.or.kr/images/bg_angle.gif); background-repeat:no-repeat; vertical-align:middle }
.body-container .content h3 p { float:right; padding-top:7px; font-size:12px; font-weight:normal; color:#666 }
#aside_thumb h3 { float:left; width:294px; margin:0px; padding:0 0 7px 0; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:18px; font-weight:bold; color:#0e0f17; border-bottom:1px solid #c0c0c2 }
#aside_thumb h3 .ico_cirle { display:inline-block; width:5px; height:12px; margin-left:1px; background-image:url(http://www.angel.or.kr/images/bg_angle.gif); background-repeat:no-repeat; vertical-align:middle }
.aside h3 { float:left; width:294px; margin:0px; padding:0 0 7px 0; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:18px; font-weight:bold; color:#0e0f17; border-bottom:none }
.aside h3 a { color:#147ebb; font-weight:bold; text-decoration:none }
.aside p a { color:#147ebb; text-decoration:none }
#aside_thumb ul { float:left; margin:5px 0 0 0; padding:0 0 20px 0; width:294px; display:block }
#aside_thumb ul li { float:left; margin:18px 0 0 0; padding:21px 0 0 0; width:294px; display:block; border-top:1px solid #dfdfe0 }
#aside_thumb ul li:first-child { float:left; margin:22px 0 0 0; padding:0px; width:294px; display:block; border-top:none }
#aside_thumb ul li div.thumbimg { float:left; padding:0 21px 0 0; width:68px; height:68px; text-align:right; overflow:hidden }
#aside_thumb ul li div.thumbimg img { width:66px; height:66px; border:1px solid #343434; vertical-align:top }
#aside_thumb ul li p { line-height:21px; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb' }
#aside_thumb ul li p a { color:#147ebb; text-decoration:none }
#aside_thumb ul li p a:hover { color:#147ebb; text-decoration:underline }
#aside_thumb ul li p img { padding:0 21px 0 0; float:left }
#aside_thumb ul li em { font-family:tahoma; font-size:10px; font-weight:bold }
#aside_thumb ul li p strong { font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-weight:bold }
#aside_thumb ul li p .on { font-weight:bold; color:#ff6600 }
#aside_list {}
#aside_list h3 { float:left; width:294px; margin:0px; padding:0 0 7px 0; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:18px; font-weight:bold; color:#0e0f17; border-bottom:1px solid #c0c0c2 }
#aside_list ul { float:left; width:274px; margin:0 10px; padding:0 }
#aside_list ul li { line-height:34px; background:url(http://www.angel.or.kr/images/dot_width_3px.gif) 0 bottom repeat-x; }
#aside_list ul li a { display:inline-block; color:#3c3c3c; padding-left:19px; background:url(http://www.angel.or.kr/images/ico_2arrow.gif) 0 14px no-repeat }
#aside_list ul li a { font-size:13px; color:##147ebb; text-decoration:none }
#aside_list ul li a:hover { color:#147ebb }
#aside_list ul li:last-child { background:none }
.body-container h4.notice { float:left; margin:20px 0 0 0; padding:0px; width:576px; line-height:21px; font-size:14px; color:#147ebb }
#innerbox { float:left; margin:20px 0 15px 0; padding-bottom:15px; width:576px; line-height:21px; border-bottom:1px solid #dfdfe0 }
#innerbox em { font-weight:bold; color:#147ebb }
#innerbox a { text-decoration:none; color:#147ebb }
#innerbox .digit { font-size:11px; font-family:tahoma }
#innerbox img { display:inline; padding-top:2px\9 }
#innerbox ol { clear:both; margin:0 0 0 -10px }
*:first-child+html #innerbox ol { clear:both; margin:0 }
#innerbox li { list-style-type:decimal; line-height:1.8em }
/***********공통**********/
.height200 { width:100%; padding:100px 0 }
.height30 { width:100%; padding:15px 0 }
.height20 { width:100%; padding:10px 0 }
.height10 { clear:both; width:100%; padding:5px 0 }
.height5 { clear:both; width:100%; padding-top:5px }
.line180 { line-height:180% !important }
.pattern1 { background:url(http://www.angel.or.kr/images/pattern1.jpg) }
.pattern2 { background:url(http://www.angel.or.kr/images/pattern2.jpg) }
/***********공통,버튼**********/
#attachfile { clear:both; display:none; margin-left:0 }
*:first-child+html #attachfile { clear:both; display:none; margin-left:0; width:300px }
.file_box { clear:both; float:left; width:290px; margin-bottom:15px }
.file_box .file_input_textbox { float:left }
.file_box .file_input_textbox_report { float:left; width:90px; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color:#666; padding:5px; margin-top:4px; border:1px solid #b5b8c8; background:#fff }
.file_box .file_input_div { float:left; position:relative; width:40px; height:30px; overflow:hidden }
.file_box .file_input_div .file_input_button { width:40px; height:30px; position:absolute; top:0px; color:#147ebb; background-color:#fff; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; border:none }
.file_box .file_input_div .file_input_hidden { font-size:45px; position:absolute; right:0px; top:0px; opacity:0; filter:alpha(opacity=0); -ms-filter:"alpha(opacity=0)"; -khtml-opacity:0; -moz-opacity:0; cursor:pointer }
.file_box .file_cancel { float:left; width:40px; height:30px; color:#666; background-color:#fff; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; border:none; cursor:pointer }
.file_box .file_input_div .file_input_button:hover, .file_box .file_cancel:hover { color:#147ebb }
.file_box span { float:left; padding:7px 3px 0 0 }
.file_box .checkbox { float:left }
.file_box .file_check { float:left; margin-left:10px }
.file_box .file_check img { padding-right:5px }
.file_box .file_check input { margin:0; display:inline }
/***********공통,html **********/
.col_two { float:left; width:920px; margin:0px; padding:0 }
.col_two_left { float:left; width:450px; margin:0px; padding:0 0 50px 0 }
.col_two_rignt { float:left; width:460px; margin:0px; padding:30px 0 50px 0 }
.col_two_rignt .photo { display:block; position:relative; width:300px; height:300px; overflow:hidden }
.col_two_rignt img {
  width:300px; height:300px;
  *width:292px; *height:292px;
  background: #343434;
  padding: 4px;
  box-shadow: none;
  border: none;
  -webkit-transition: all 0.4s ease-out;
  -moz-transition: all 0.4s ease-out;
  -o-transition: all 0.4s ease-out;
  transition: all 0.4s ease-out;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.col_two_rignt img:hover { background: #e5302a; }
.col_two_rignt h4 { font-size:18px; line-height:1.8em !important; color:#000; font-weight:normal; padding-top:8px !important; margin:0 }
.col_two_rignt a { color:#147ebb; text-decoration:none }
.icoCirle { display:inline-block; width:5px; height:12px; margin-left:1px; background-image:url(http://www.angel.or.kr/images/bg_angle.gif); background-repeat:no-repeat; vertical-align:middle }
*:first-child+html .icoCirle { display:inline-block; width:5px; height:12px; padding-right:4px; background-image:url(http://www.angel.or.kr/images/bg_angle.gif); background-repeat:no-repeat; vertical-align:middle }
.buttonbox { clear:both; margin:0 }

.tbl_common { border:1px solid #e8e8e8 }
.tbl_common td { padding:7px 7px 3px 7px; border:1px solid #e8e8e8; line-height:20px }
.tbl_common td.background { background-color:#f9f9f9 }
.tbl_common td.tit { padding:7px 15px 3px 15px !important }
.tbl_common td img { display:inline; vertical-align:middle }
.tbl_common a { color:#147ebb; text-decoration:none }
.tbl_common em { font-weight:bold }

.tbl { border-top:3px solid #37315d; border-bottom:2px solid #e2e2e2; border-spacing:0; border-collapse:collapse; line-height:20px; }
.tbl thead tr:first-child th { border-top:0 }
.tbl th,
.tbl td { padding:10px 12px; font-weight:400; text-align:center; border-top:1px solid #e2e2e2; border-left:1px solid #e2e2e2 }
.tbl thead tr:first-child th:first-child ,
.tbl td.ty3 { border-left:0 }
.tbl th { background:#f4f4f4 }
.tbl th.ty1 { background:#f4efe4 }
.tbl td.ty1 { background:#fcf5e9}
.tbl td.ty2 { color:#005c9a }
.tbl td.ty3 { color:#666 }
.tbl td.ty4 { color:#e72744 }
.tbl a { color:#147ebb; text-decoration:none }
.tbl em { font-weight:bold }

p.common_title { padding:0; margin:0; font-size:14px; font-weight:bold }
#bodycontent p.paragraph1 { padding:14px 0 margin:0; line-height:200%; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-weight:bold; font-size:14px }
#bodycontent p.paragraph2 { padding:14px 0 margin:0; line-height:200%; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:14px }
#bodycontent p.paragraph3 { padding:14px 0 margin:0; line-height:200%; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb' }
#bodycontent p.innercontent { float:left; margin:20px 0 0 0; padding:0px; width:576px; line-height:21px }
#bodycontent p.innercontent em { font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-weight:bold; color:#147ebb }
#bodycontent p.innercontent a { color:#147ebb; text-decoration:none }
#bodycontent p.innerbtn { float:left; margin:20px 0 0 0; padding:0px; width:576px }
#bodycontent p.innercontent img { display:inline; padding-top:2px; padding-top:2px\9 }
/***********신고,등록**********/
.preListwrap { width:616px; margin-top:25px }
.preListwrap .subList { width:171px; min-height:100px;_height:100px; display:inline-block; zoom:1; *display:inline; vertical-align:top; margin-bottom:28px; padding-left:14px; border-left:1px solid #f1f1f1 }
.preListwrap .subList.first { border-left:none }
.preListwrap .subList h4 { width:171px; margin:-2px 0 8px 0; font-size:14px; font-weight:bold; border:none }
.preListwrap .subList ul { margin:0; padding:0 }
.preListwrap .subList ul li { margin-bottom:5px; padding-left:10px; line-height:1.5 }
.preListwrap .subList ul li.text { margin-top:10px; padding-left:10px; line-height:1.6; color:#666 }
.preListwrap .subList ul li.notice { margin-top:10px; padding-left:10px; line-height:1.6; font-size:11px; color:#666 }
.preListwrap .subList ul li.thumb { background:none; margin:0; padding:0px }
.preListwrap .subList ul li a { color:#666; text-decoration:none }
.preListwrap .subList ul li a:hover { text-decoration:underline }
.postform_alim { float:left; margin-top:15px; padding:0; line-height:150% }
.postform_alim a { color:#147ebb; text-decoration:none }
.postform { clear:both; width:910x; margin:0; padding:0 }
.postform .post_l { float:left; width:290px; margin:0; padding:0; overflow:hidden }
.postform .post_c { float:left; width:290px; margin:0; padding:0; overflow:hidden }
.postform .post_r { float:left; width:290px; margin:0; padding:0; overflow:hidden }
.postform .post_title { float:left; width:290px; margin:30px 0; padding:7px 0; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:14px; font-weight:bold; color:#0e0f17; border-bottom:1px solid #c0c0c2 }
.postform .post_title_go { float:left; width:73px; margin:30px 0; padding:7px 0; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:14px; font-weight:bold; color:#0e0f17; border-bottom:1px solid #c0c0c2 }
.postform .post_title a { font-weight:bold; color:#147ebb; text-decoration:none }
.postform .post_title a:hover { text-decoration:underline }
.map_postbox { width:290px; height:290px; margin:4px 0 0 0; margin:4px 0\9 }
.postform .post_pwd { float:left; width:320px; margin:0; padding:0 }
.postform .post_pwd_title { float:left; width:320px; margin:30px 0; padding:7px 0; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:14px; font-weight:bold; color:#0e0f17; border-bottom:1px solid #c0c0c2 }
.postform .btnbox { float:left }
.postform .btnbox a { float:left; margin-top:6px; font-weight:bold; color:#ff6600; text-decoration:none }
.postform .pwdbox { clear:both; padding-top:30px }
.postform .pwdbox a { color:#147ebb; text-decoration:none }
.postform .ico_pwd { display:inline-block; width:13px; height:13px; background-image:url(http://www.angel.or.kr/images/question.gif); background-repeat:no-repeat; vertical-align:middle }
.postform .popbox { float:left; width:290px; height:200px; margin:30px; padding:0; border:1px solid #e4e4e4 }
.postform .ending_notice { float:left; margin:15px 0 0 10px; padding:0; line-height:150% }
body,p,legend,fieldset,form,table,th,td { margin:0; padding:0 }
.stress { color:#ff6600 }
.highlight { color:#e02a23 }
.red { color:#ff0000 }
.brown { color:#cc9900 }
.darkbrown { color:#9D8364 }
.black { color:#000 }
.note { color:#147ebb }
.font14 { font-size:14px }
.letter_spacing { letter-spacing:0 }
.font14bold { font-size:14px; font-weight:bold }
.clear { clear:both }
#formID { margin:0; padding:0; }
.postform em { font-size:15px; color:#147ebb; }
.postform label { float: none; display:block; width: auto; margin:15px 0; padding:0; }
.postform label img { padding: 4px 0; }
.postform label a { color:#147ebb; text-decoration:none; }
.postform label a:hover { text-decoration:underline; }
.postform label .text-map { display:inline; width:90px; padding: 5px; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color: #000; border: 1px solid #b5b8c8; background: #f3f4f6 repeat-x; }
.postform input,.postform select,.postform textarea { display: block;  /* this breaks relative positioning */ }
.postform .text-input { width: 278px; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color: #000; padding: 5px; margin-top: 4px; border: 1px solid #b5b8c8; background: #fff repeat-x; }
.postform .text-input-password { width: 262px; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color: #000; padding: 5px; margin-top: 4px; border: 1px solid #b5b8c8; background: #fff repeat-x; }
.postform .text-input-short { width: 100px; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color: #000; padding: 5px; margin-top: 4px; border: 1px solid #b5b8c8; background: #fff repeat-x; }
.postform textarea { width: 278px; height: 100px; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color: #000; padding: 5px; margin-top: 4px; border: 1px solid #B5B8C8; background: #fff repeat-x; }
.postform select { padding: 4px; margin-top: 5px; border: 1px solid #b5b8c8; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color: #000; font-size:13px; }
.postform .select-short { padding: 5px; margin-top: 4px; border: 1px solid #b5b8c8; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color: #000; font-size:13px; }
.postform .text-textarea-accept { width: 278px; height: 110px; overflow-x:hidden; overflow-y:auto; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; font-size:13px; color: #666; padding: 5px; margin-top: 4px; border: 1px solid #b5b8c8; }
.postform file { font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color: #000; padding:0; margin-top: 4px; line-height:0%; }
.postform span.checkbox, .postform .checkbox, .postform .radio, .postform .text-input-short, .postform .select-short { display: inline; }
.postform .fc-error { width: 350px; color: #000; padding: 5px; border: 1px solid #B5B8C8; margin-bottom: 15px; background: #ffeaea; }
.postform .readonly { background: #f7f7f7 repeat-x !important; }
.postform .border_none { width: 278px; font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb'; color: #ff6600; padding: 0; margin:0; border:none; background: #fff repeat-x; }
a { outline:none }
ul,ol { list-style:none }
.bg-none { background:none !important }
em,address { font-style:normal }
.mybtn.blue { background:#0b5d8e; color:#fff }
.mybtn.blue:hover { background:#7eb111; color:#fff }
.mybtn.gray { background:#878888; color:#ffffff }
.mybtn.gray:hover { background:#7eb111; color:#fff }
.mybtn.b { padding:7px 4px !important; padding:7px 4px 5px 4px\9 !important; background:none; color:#666 }
.mybtn.b:hover { background:#0b5d8e; color:#fff }
.mybtn {
  position:relative;
  text-decoration:none;
  display:inline-block !important;
  text-shadow:none;
  text-decoration:none !important;
  border-radius:0;
  box-shadow:none;
  cursor:pointer;
  border:none;
  font-size:13px;
  font-family:'NanumGothic', '나눔고딕', 'NanumGothicWeb';
  margin:0;
  padding:7px 12px; padding:7px 12px 5px 12px\9; *padding:5px 9px;
  -webkit-border-radius:3px;
  -moz-border-radius:3px;
  border-radius:3px;
  -webkit-transition:all 0.35s ease;
  -moz-transition:all 0.35s ease;
  -o-transition:all 0.35s ease;
  transition:all 0.35s ease;
}
</style>


<script src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyBPA_xStX4VRi97SvEHjPOjZjlIC6aRWcs" charset="utf-8" type="text/javascript"></script>

<script>
$(document).ready(function(){
	
	initialize();
	$.ajax({
		url:"<%=cp%>/dog119/sido",
		dataType:'json',
		success: function(data){
			console.log(data);
			var list = data.list;
			var content='<option value="">시(도)선택</option>';
			$.each(list, function(index, item){
				content+='<option value='+item.admCode+'>'+item.admCodeNm+'</option>';
			});
			$("#city").append(content);
		}
	});
})

function change(value){
	var queryParams= encodeURIComponent('admCode')+'='+ encodeURIComponent(value); 
	$.ajax({
		url:"<%=cp%>/dog119/gugun",
		data:queryParams,
		dataType:'json',
		success: function(data){
			console.log(data);
			$("#country").find('option').remove();
			var list = data.list;
			var content='';
			content+='<option value="">구(군)선택</option>';
			$.each(list, function(index, item){
				content+='<option value='+item.admCodeNm+'>'+item.lowestAdmCodeNm+'</option>';
			});
			$("#country").append(content);
		}
	});
}

//===============================================================##지도
var map;
var globalMarker;
var globalGeocoder;

function initialize() {
  var myLatlng = new google.maps.LatLng(37.531805,126.914165);
  var myOptions = {
    zoom: 15,
    center: myLatlng,
    navigationControl: true,    // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
    navigationControlOptions: { 
        position: google.maps.ControlPosition.TOP_RIGHT,
        style: google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
    },
    
    streetViewControl: true,

    scaleControl: true,    // 지도 축적 보여줄 것인지.
    //scaleControlOptions: { position: google.maps.ControlPosition.TOP_RIGHT },
    
    mapTypeControl: true, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
    mapTypeId: google.maps.MapTypeId.ROADMAP 
  }
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

  map.addListener('click', function(e) {  //마커 찍기
	    placeMarkerAndPanTo(e.latLng, map);
  
	});

}

//마커찍기
function placeMarkerAndPanTo(latLng, map) {
	
  var marker = new google.maps.Marker({
    position: latLng,
    map: map
  });
  map.panTo(latLng);
}

//마크좌표 가져오기
function getMarkPos(){
	console.log(globalMarker);
    var pos=globalMarker.getPosition();

    //alert(pos.lat()+"/"+pos.lng());
    //return {x:pos.lat(), y:pos.lng()};

    document.getElementById("posx").value = pos.lat();
    document.getElementById("posy").value = pos.lng();
}

 function codeAddress() {
    var address = document.getElementById("address").value;
    if(address=='검색할 주소를 입력하십시오.' || address==''){
        alert('검색할 주소를 입력하십시오.');
        document.getElementById("address").value='';
        document.getElementById("address").focus();
        return;
    }

    globalGeocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            globalMap.setCenter(results[0].geometry.location);

            //var marker = new google.maps.Marker({
            globalMarker = new google.maps.Marker({
                map: globalMap, 
                position: results[0].geometry.location,
                draggable: true
            });
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
} 
    
//지도 위의 마크 모두 삭제 - Refresh 말고 방법 없을까?
function clearMark(){
    var loc = map.getCenter(); // 현재의 지도의 위치를 가져온다.

    map = null;
    globalMarker = null;
    globalGeocoder = null;

    initialize();
}

</script>
<div class="body-container">
	<div class="content">

		<h3>
			강아지 실종신고
		</h3>
		<p class="postform_alim">
			<strong>( 개, 실종신고 )</strong> 개가 아닌 경우는 등록할 수 없습니다.<br>
			1~6 단계에 따라 입력하시고, 에러발생시 
			<a href="contact.php?gubun=suggest" onclick="window.open(this.href);return false;" class="tooltip1" title="운영자에게">운영자에게</a> 알려주시면 조치해드리겠습니다. <br>
			<span class="stress">전화번호와 이메일주소는 로그인 사용자에 한해 볼 수 있으며, 이에 동의한 것으로 간주합니다.</span>
		</p>
		<div class="postform">
			<form id="formID" name="formID" method="post" ENCTYPE="multipart/form-data" action="post" accept-charset="UTF-8">
				<div class="post_l">
					<p class="post_title">
						1. 등록자정보(<em>*</em>표 필수)
					</p>
					<label> 
						<span><em>*</em>닉네임 : </span> 
						<input type="text" value="${sessionScope.member.memberId}" class="text-input readonly" onClick="javascript:alim_readonly()" readonly />
					</label> 
					<label> 
						<span><em>*</em>이메일주소 : </span> 
						<input type="text" value="${sessionScope.member.email}" class="text-input readonly" onClick="javascript:alim_readonly()" readonly />
					</label> 
					<label> 
						<span><em>*</em>(주)전화번호(예:010-1234-1234) :</span> 
						<input type="text" value="${sessionScope.member.tel}" name="phone1" id="phone1" maxlength="13" class="validate[required,custom[phone]] text-input" />
					</label> 
					<label> 
						<span>(부)전화번호 : </span> 
						<input type="text" value="" name="phone2" id="phone2" maxlength="13" class="validate[custom[phone]] text-input" />
					</label>
				</div>
				<div class="post_c">
					<p class="post_title">
						2. 실종동물정보(<em>*</em>표 필수)
					</p>
					<label> 
						<span>동물이름(한글) : </span> 
						<input type="text" value="" name="petname" id="petname" maxlength="10" class="validate[custom[hangul]] text-input" />
					</label> 
					<label> 
						<span><em>*</em>동물종류(
							<a href="javascript:na_open_window('notice_dog', './info/notice_dog.php', 100, 0, 630, 500, 0, 0, 0, 1, 0)">동물선택 주의사항</a>) : </span> 
							<select name="kind" id="kind" class="validate[required]" onChange="mix(this.options[this.selectedIndex].value);">
							<option value="">세로로 가나다순</option>
							<option value="">-------------------------------</option>
							<option value="1">골든 리트리버</option>
							<option value="3">그레이트 덴</option>
							<option value="">-------------------------------</option>
							<option value="133">그레이하운드/스페니쉬 그레이하운드</option>
							<option value="342">그레이하운드/아라비언 그레이하운드</option>
							<option value="339">그레이하운드/이탈리언 그레이하운드</option>
							<option value="2">그레이하운드/잉글리시 그레이하운드</option>
							<option value="343">그레이하운드/폴리시 그레이하운드</option>
							<option value="340">그레이하운드/헝가리언 그레이하운드</option>
							<option value="">-------------------------------</option>
							<option value="353">기타견종</option>
							<option value="6">닥스훈트</option>
							<option value="7">달마시언</option>
							<option value="8">도베르만</option>
							<option value="114">도사</option>
							<option value="350">동경견</option>
							<option value="9">라사 압소</option>
							<option value="">-------------------------------</option>
							<option value="11">라이카/러시아-유럽 라이카</option>
							<option value="221">라이카/웨스트 시베리안 라이카</option>
							<option value="220">라이카/이스트 시베리안 라이카</option>
							<option value="">-------------------------------</option>
							<option value="10">래브라도 리트리버</option>
							<option value="12">로트바일러</option>
							<option value="15">말티즈</option>
							<option value="17">미니어쳐 핀셔</option>
							<option value="354">믹스견</option>
							<option value="18">바셋 하운드</option>
							<option value="20">버니즈 마운틴 독</option>
							<option value="118">베들링턴 테리어</option>
							<option value="">-------------------------------</option>
							<option value="187">벨지언 세퍼드 독/그루넨달</option>
							<option value="352">벨지언 세퍼드 독/레커누아</option>
							<option value="14">벨지언 세퍼드 독/말리누아</option>
							<option value="119">벨지언 세퍼드 독/테르뷔랑</option>
							<option value="">-------------------------------</option>
							<option value="76">보더 콜리</option>
							<option value="23">보르조이</option>
							<option value="21">보스턴 테리어</option>
							<option value="22">복서</option>
							<option value="25">불 테리어</option>
							<option value="24">불독</option>
							<option value="27">브리터니 스패니얼</option>
							<option value="28">비글</option>
							<option value="29">비숑 프리제</option>
							<option value="31">사모예드</option>
							<option value="32">삽살개</option>
							<option value="33">샤 페이</option>
							<option value="34">세인트 버나드 독</option>
							<option value="36">셔틀랜드 쉽독</option>
							<option value="">-------------------------------</option>
							<option value="37">슈나우저/미니어처 슈나우저</option>
							<option value="72">슈나우저/스텐다드 슈나우저</option>
							<option value="73">슈나우저/자이언트 슈나우저</option>
							<option value="">-------------------------------</option>
							<option value="131">스코티쉬 테리어</option>
							<option value="41">시 츄</option>
							<option value="39">시바</option>
							<option value="40">시베리안 허스키</option>
							<option value="44">아메리칸 코커 스패니얼</option>
							<option value="43">아메리칸 핏 불 테리어</option>
							<option value="127">아이리시 소프트 코티드 휘튼 테리어</option>
							<option value="46">아키타</option>
							<option value="47">아프간 하운드</option>
							<option value="48">알래스칸 맬러뮤트</option>
							<option value="129">오스트레일리언 실키 테리어</option>
							<option value="51">올드 잉글리시 쉽독</option>
							<option value="53">요크셔 테리어</option>
							<option value="71">웨스트 하이랜드 화이트 테리어</option>
							<option value="">-------------------------------</option>
							<option value="54">웰시 코기 카디건</option>
							<option value="143">웰시 코기 펨브로크</option>
							<option value="">-------------------------------</option>
							<option value="357">이탈리언 코로소 독</option>
							<option value="145">잉글리쉬 포인터</option>
							<option value="55">잉글리시 세터</option>
							<option value="56">잉글리시 코커 스패니얼</option>
							<option value="216">잭 러셀 테리어</option>
							<option value="35">저먼 세퍼드 독</option>
							<option value="">-------------------------------</option>
							<option value="92">저먼 쇼트헤어드 포인팅 독</option>
							<option value="93">저먼 와이어헤어드 포인터</option>
							<option value="">-------------------------------</option>
							<option value="38">제퍼니즈 스피츠</option>
							<option value="60">제퍼니즈 친</option>
							<option value="57">진돗개</option>
							<option value="58">차우 차우</option>
							<option value="59">치와와</option>
							<option value="150">캐리 블루 테리어</option>
							<option value="61">캐벌리어 킹 찰스 스패니얼</option>
							<option value="334">코튼 드 툴리어</option>
							<option value="">-------------------------------</option>
							<option value="62">콜리 러프</option>
							<option value="154">콜리 스무스</option>
							<option value="">-------------------------------</option>
							<option value="158">티베튼 스패니얼</option>
							<option value="">-------------------------------</option>
							<option value="30">파피용</option>
							<option value="64">퍼그</option>
							<option value="65">페키니즈</option>
							<option value="362">페터데일 테리어</option>
							<option value="66">포메라니언</option>
							<option value="">-------------------------------</option>
							<option value="212">폭스 테리어/스무스 폭스 테리어</option>
							<option value="68">폭스 테리어/와이어 폭스 테리어</option>
							<option value="">-------------------------------</option>
							<option value="75">푸들/미니어처 푸들</option>
							<option value="361">푸들/미디엄 푸들</option>
							<option value="74">푸들/스텐다드 푸들</option>
							<option value="50">푸들/토이 푸들</option>
							<option value="">-------------------------------</option>
							<option value="160">풀리</option>
							<option value="69">풍산개</option>
							<option value="70">프랜치 불독</option>
							<option value="4">피레니언 마운틴 독</option>
							<option value="91">휘펫</option>
					</select>
					</label>
					
					<label id="show1" style="display: none;"> 
						<span>믹스/기타견종 설명 : </span> 
						<input type="text" value="" name="kind_more" id="kind_more" maxlength="20" class="text-input" /> 믹스견- 시츄혼혈, 시츄와 말티즈 혼혈, 발바리...<br> 기타견종- 기타견종을 적어주세요.<br> 모르는경우 - 공란으로 두세요.
					</label> 
					<label> 
						<span><em>*</em>암수구분 : </span> 
						<select name="sex" id="sex" class="validate[required] select">
							<option value="">선택</option>
							<option value="F">암컷</option>
							<option value="M">수컷</option>
							<option value="N">잘모름</option>
					</select>
					</label> 
					<label> 
						<span><em>*</em>나이 : </span> 
						<select name="age" id="age" class="validate[required] select">
							<option value="">선택</option>
							<option value="0">1년미만</option>
							<option value="1">1 년생</option>
							<option value="2">2 년생</option>
							<option value="3">3 년생</option>
							<option value="4">4 년생</option>
							<option value="5">5 년생</option>
							<option value="6">6 년생</option>
							<option value="7">7 년생</option>
							<option value="8">8 년생</option>
							<option value="9">9 년생</option>
							<option value="10">10 년생</option>
							<option value="11">11 년생</option>
							<option value="12">12 년생</option>
							<option value="13">13 년생</option>
							<option value="14">14 년생</option>
							<option value="15">15 년생</option>
							<option value="16">16 년생</option>
							<option value="17">17 년생</option>
							<option value="18">18 년생</option>
							<option value="19">19 년생</option>
							<option value="20">20 년생</option>
							<option value="21">21 년생</option>
							<option value="22">22 년생</option>
							<option value="23">23 년생</option>
							<option value="24">24 년생</option>
							<option value="25">25 년생</option>
							<option value="26">26 년생</option>
							<option value="27">27 년생</option>
							<option value="28">28 년생</option>
							<option value="29">29 년생</option>
							<option value="30">30 년생</option>
							<option value="1000">잘모름</option>
					</select>
					</label> 
					<label> 
						<span><em>*</em>실종날짜(예: 2012-8-15) :</span> 
						<input type="text" value="" name="whenis" id="whenis" maxlength="10" class="validate[required,custom[date],past[now]] text-input" />
					</label> 
					<label> 
						<span><em>*</em>실종지역(시도) : </span> 
						<select name="city" id="city" class="validate[required]" onchange="change(this.value);">
						</select>
					</label> 
					<label> 
						<span><em>*</em>실종지역(구군) : </span> 
						<select name="country" id="country" class="validate[required]" OnClick="setAddr(this.value)">
							<option value="">구(군)선택</option>
					</select>
					</label> 
					<label> 
						<span><em>*</em>구체적인 실종장소,(예)인사동 한국미술관 부근 :</span>
						<input type="text" value="" name="whereis" id="whereis" maxlength="50" class="validate[required] text-input" />
					</label> 
					<label> 
						<span><em>*</em>동물특징 :</span> 
						<textarea name="mark" id="mark" class="validate[required] text-textarea"></textarea>
					</label>
				</div>
				<div class="post_r">
					<p class="post_title">
						3. 추가정보(<em>*</em>표 필수)
					</p>
					<label> 
					<span>실종지점 지도(
					<a href="#" class="tooltip1" title="* 아래의 지도는 선택사항이며, 필요한 분들은 실종지점 표시로 사용하세요.&#13;&#13;* 지도를 확대/축소/이동 하면서 지도위에 한번 클릭하면 해당 좌표가 자동으로 입력되며, 다시 클릭하면 새로운 지점이 선택됩니다.&#13;&#13;* 실종지점을 잘 모르는경우 대략적인 위치라도 선택하는것이 좋습니다.&#13;&#13;* 지도 아래의 취소를 누르면 해당 좌표가 적용되지 않습니다."
					onclick="return false;">지도사용법</a>) : </span>
					
<!-- 지도 호출 -->
						<div id="map_canvas" class="map_postbox">
						</div>
						X: <input type="text" class="text-map" id="posx" name="posx" readonly value="">
						,Y: <input type="text" class="text-map" id="posy" name="posy" readonly value="">
						<a href="javascript:mapReset()" title="취소">취소</a>
					</label> 
					<label> 
						<span>사연(신고경위) : </span> 
						<textarea name="story" id="story" class="validate[] text-textarea"></textarea>
					</label> 
					<label> 
						<span>사례금: </span> 
						<input type="text" value="" name="reward" id="reward" maxlength="4" class="validate[custom[integer],max[9999]] text-input-short" />
						만원<br>
					</label> 
					<label>
						<a href="#" onClick="return false;" id="attach">사진첨부하기</a>
						(클릭하면 하단에 나타남, <a href="#" class="tooltip1"
						title="1. 첫번째(두세번째는 무관) 사진에, 전단파일이나 복잡하게 합성한 사진을 첨부하는 경우 편집됩니다(편집된 파일은 수정안됨)&lt;br&gt;&lt;br&gt;2. 사진첨부가 되지않을 경우, 사진없이 등록하시고 사진은 운영자에게 보내주시면 올려드립니다.&lt;br&gt;&lt;br&gt;3. 첨부가능한 파일형식 : 이미지파일(jpg, gif, png), 10M"
						onClick="return false;">
						<span class="stress">주의사항</span></a>) :
					</label>
					<div id="attachfile">
						<div class="file_box">
							<input type="text" id="fileName1" class="file_input_textbox_report" readonly="readonly" />
							<div class="file_input_div">
								<input type="button" value="파일1" class="file_input_button" /> 
								<input type="file" name="userfile1" class="file_input_hidden" onchange="javascript: document.getElementById('fileName1').value = this.value" />
							</div>
							<input type="button" value="취소" class="file_cancel" onclick="javascript:document.getElementById('fileName1').value = ''" />
						</div>
						<div class="file_box">
							<input type="text" id="fileName2" class="file_input_textbox_report" readonly="readonly" />
							<div class="file_input_div">
								<input type="button" value="파일2" class="file_input_button" /> 
								<input type="file" name="userfile2" class="file_input_hidden" onchange="javascript: document.getElementById('fileName2').value = this.value" />
							</div>
							<input type="button" value="취소" class="file_cancel" onclick="javascript:document.getElementById('fileName2').value = ''" />
						</div>
						<div class="file_box">
							<input type="text" id="fileName3" class="file_input_textbox_report" readonly="readonly" />
							<div class="file_input_div">
								<input type="button" value="파일3" class="file_input_button" /> 
								<input type="file" name="userfile3" class="file_input_hidden" onchange="javascript: document.getElementById('fileName3').value = this.value" />
							</div>
							<input type="button" value="취소" class="file_cancel" onclick="javascript:document.getElementById('fileName3').value = ''" />
						</div>
					</div>
					<label> 
						<span>유튜브 동영상 올리기(<a href="./images/video_guide.jpg" onclick="window.open(this.href);return false;">올리는 방법</a>) : </span> 
						<input type="text" name="video" id="video" maxlength="100" class="validate[custom[url]] text-input" />
					</label>
				</div>
				<!-- line break -->
				<div style="clear: both;"></div>
				<div class="post_l">
					<p class="post_title">4. 긴급알림신청</p>
					
					<label> 
						<span> 
							<a href="service/index.php?code=how#go_ads1" onclick="window.open(this.href);return false;"><em>
							<strong>긴급알림이란?(신청하실 분은 필독)</strong></em></a>
						</span>
					</label> 
					<label> 
						<span>긴급알림은 선택사항입니다.<br>꼭 하실 분만 신청해주시기바랍니다.</span> 
						<select name="apply_ads" id="apply_ads" class="validate[required]" onChange="alert('운영자의 사정으로, 지금은 신청할 수 없습니다!');">
							<option value="N">긴급알림 신청안함</option>
							<option value="N">긴급알림 신청합니다</option>
					</select>
					</label> 
					<label id="id_name" style="display: none;"> 
						<span><em>*</em>신청하실 분은 입금자 이름을 적어주세요 :</span> 
						<input type="text" name="apply_name" value="" maxlength="16" class="validate[required] text-input">
					</label>

					<div id="id_sns" style="display: none;">
						<span><em>*</em>신고내용을 페이스북/트위터/네이버카페/다음카페/네이버블로그/다음블로그에도 올려주세요(개인정보는 올리지않습니다) :<br></span> 
						<span>올려주세요:</span>
						<input class="validate[required] radio" type="radio" name="apply_sns" id="radio1" value="Y"> 
						<span>올리지않음:</span>
						<input class="validate[required] radio" type="radio" name="apply_sns" id="radio2" value="N"><br>
						<br>
					</div>

				</div>
				<div class="post_c">
					<p class="post_title">5. 참고사항</p>
					<label> 
						<span> 1. 정보가 잘못 입력된 경우, 수정될 수 있습니다.<br>
							2. 재등록 허용기간은 5일 입니다.<br> 3. 다른 이메일로 중복등록하는(된) 경우 삭제됨<br>
							4. 실종동물을 찾은경우 신고종료처리해주십시요.<br> 5. 에러발생시 
							<a href="contact.php?gubun=suggest" onclick="window.open(this.href);return false;" class="tooltip1" title="운영자에게">운영자에게</a>
							 알려주세요.
					</span>
					</label>
				</div>
				<div class="post_r">
					<p class="post_title">6. 등록완료</p>
					<label> 
						<span> '등록하기'는 한번만 클릭하세요. </span>
					</label> 
					<input type="submit" value="등록하기" class="mybtn blue"> 
					<input type="reset" value="다시작성" class="mybtn gray"> 
					<input type="button" onClick="javascript:history.back();return false;" value="취소" class="mybtn gray">
				</div>
				<input type="hidden" name="gubun" value="L"> 
				<input type="hidden" name="code" value="dog"> 
				<input type="hidden" name="phone_open" value="N">
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">

function mapReset() {
	clearMark();
	document.formID.posx.value = "";
	document.formID.posy.value = "";
}


function mix(m) {
	if (m == 354 || m == 353) { //믹스견 기타견종
		document.getElementById('show1').style.display = '';
		document.formID.kind_more.focus();
	} else {
		document.getElementById('show1').style.display = 'none';
		document.formID.kind_more.value = "";
	}
}

function apply(sel) {
	if (sel == 'Y') {
		document.getElementById('id_name').style.display = '';
		document.getElementById('id_sns').style.display = '';
	} else {
		document.getElementById('id_name').style.display = 'none';
		document.getElementById('id_sns').style.display = 'none';
		document.formID.apply_name.value = "";
	}
}

function setAddr(value){
	addr = value;
	searchPlaces();
}

</script>
