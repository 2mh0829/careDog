<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" media="screen" href="<%=cp%>/resource/css/dog119/created.css" />
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
	
	var ageOption = '<option value="0">1년미만</option>';
	for(var i=1; i<31;i++){
		ageOption+='<option value='+i+'>'+i+' 년생</option>';
	}
	ageOption+='<option value="1000">잘모름</option>';
	$("#age").append(ageOption);
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

//============================================================== 지도
var map;
function initialize() {
  var myLatlng = new google.maps.LatLng(37.531805, 126.914165);
  
	var myOptions = {
			zoom : 15,
			center : myLatlng,
			navigationControl : true, // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
			navigationControlOptions : {
				position : google.maps.ControlPosition.TOP_RIGHT,
				style : google.maps.NavigationControlStyle.DEFAULT
			// ANDROID, DEFAULT, SMALL, ZOOM_PAN
			},

			streetViewControl : true,

			scaleControl : true, // 지도 축적 보여줄 것인지.
			scaleControlOptions: { position: google.maps.ControlPosition.TOP_RIGHT },

			mapTypeControl : true, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		map = new google.maps.Map(document.getElementById("map_canvas"),
				myOptions);

		google.maps.event.addListener(map, 'click', function(event) {
			clearMark();
			placeMarker(event.latLng);
			
		});
	}

//마커
	function placeMarker(location) {
		var marker = new google.maps.Marker({
			position : location,
			map : map
		});
		getMarkPos(marker);
		map.setCenter(location);
	}
	
	//마크좌표 가져오기
	function getMarkPos(marker) {
		var pos = marker.getPosition();

		document.getElementById("posx").value = pos.lat();
		document.getElementById("posy").value = pos.lng();
	}

	//지도 위의 마크 모두 삭제 
	function clearMark() {
		var loc = map.getCenter(); // 현재의 지도의 위치를 가져온다.

		map = null;
		globalMarker = null;
		globalGeocoder = null;

		initialize();
	} 

	// 보내기 버튼
$(document).ready(function(){
	$("#missingBtn").on("click",function(){
		var f = new FormData(document.formID);
		var url = "<%=cp%>/dog119/missing";
		
		$.ajax({
			type:'post',
			url:url,
			processData:false,
			contentType:false,
			data:f,
			dataType:'json',
			success:function(data){
				alert('성공');
				location.href="<%=cp%>/dog119";
			},
			error:function(e){
				console.log(e.responseText);
				alert('에러');
			}
		});
	});
})
</script>
<div class="body-container">
	<div class="content">

		<h3>
			강아지 실종신고
		</h3>
		<p class="postform_alim">
			<strong>( 개, 실종신고 )</strong> 개가 아닌 경우는 등록할 수 없습니다.<br>
			1~6 단계에 따라 입력하시고, 에러발생시 
			<a href="#" onclick="window.open(this.href);return false;" class="tooltip1" title="운영자에게">운영자에게</a> 알려주시면 조치해드리겠습니다. <br>
			<span class="stress">전화번호와 이메일주소는 로그인 사용자에 한해 볼 수 있으며, 이에 동의한 것으로 간주합니다.</span>
		</p>
		<div class="postform">
			<form id="formID" name="formID" method="post" ENCTYPE="multipart/form-data">
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
								<input type="file" name="upload" class="file_input_hidden" onchange="javascript: document.getElementById('fileName1').value = this.value" />
							</div>
							<input type="button" value="취소" class="file_cancel" onclick="javascript:document.getElementById('fileName1').value = ''" />
						</div>
						<div class="file_box">
							<input type="text" id="fileName2" class="file_input_textbox_report" readonly="readonly" />
							<div class="file_input_div">
								<input type="button" value="파일2" class="file_input_button" /> 
								<input type="file" name="upload" class="file_input_hidden" onchange="javascript: document.getElementById('fileName2').value = this.value" />
							</div>
							<input type="button" value="취소" class="file_cancel" onclick="javascript:document.getElementById('fileName2').value = ''" />
						</div>
						<div class="file_box">
							<input type="text" id="fileName3" class="file_input_textbox_report" readonly="readonly" />
							<div class="file_input_div">
								<input type="button" value="파일3" class="file_input_button" /> 
								<input type="file" name="upload" class="file_input_hidden" onchange="javascript: document.getElementById('fileName3').value = this.value" />
							</div>
							<input type="button" value="취소" class="file_cancel" onclick="javascript:document.getElementById('fileName3').value = ''" />
						</div>
					</div>
				</div>
				<!-- line break -->
				<div style="clear: both;"></div>
				
				<div class="post_c">
					<p class="post_title">4. 참고사항</p>
					<label> 
						<span> 1. 정보가 잘못 입력된 경우, 수정될 수 있습니다.<br>
							2. 재등록 허용기간은 5일 입니다.<br> 3. 다른 이메일로 중복등록하는(된) 경우 삭제됨<br>
							4. 실종동물을 찾은경우 신고종료처리해주십시요.<br> 5. 에러발생시 
							<a href="#" onclick="window.open(this.href);return false;" class="tooltip1" title="운영자에게">운영자에게</a>
							 알려주세요.
					</span>
					</label>
				</div>
				<div class="post_r">
					<p class="post_title">5. 등록완료</p>
					<label> 
						<span> '등록하기'는 한번만 클릭하세요. </span>
					</label> 
					<input type="button" value="등록하기" id="missingBtn" class="mybtn blue"> 
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

$("#attach").on("click",function(){
	$("#attachfile").fadeIn(1000);
});

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
	//searchPlaces();
}

</script>
