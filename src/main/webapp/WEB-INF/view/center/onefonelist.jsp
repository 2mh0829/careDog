<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<form name="ssologinfrm" action="https://www.oliveyoung.co.kr/store/login/ssoLogin.do" method="post">
<input type="hidden" id="cjssoq" name="cjssoq">
</form>


<script>
	var ssoCheck = "null";
	var cjssoq = "null";
	//alert('ssocheck:'+ssoCheck);
	//세션 정보가 없을경우 
	if( !_isLogin || ssoCheck !='N'){
		//SSO 쿠키가 있고 정상적으로 토큰을 밥급받았을 경우
		if((typeof _cjssoEncData) != "undefined" && _cjssoEncData !=""){
			//ajax를 사용해서 _cjssoEncData 를 처리하여 사용하셔도 무방합니다.
			//alert("111 SSO쿠키를 조사해보니 있어서 확인하러 갑니다11."+_cjssoEncData);
			if(_cjssoEncData != cjssoq){
				document.getElementById("cjssoq").value = _cjssoEncData ; 
				document.ssologinfrm.submit();
			}
		}else{
			//alert("222세션도 없고 쿠키도 없어서 해당 페이지로 갑니다.")
		}
	}
</script>


<div id="Container">
		<!-- #Contents -->
		<div id="Contents">
			<div class="sub_title_area customer">
				<h1>고객센터 <span>무엇을 도와드릴까요?</span></h1>
				<button type="button" class="btn_inquiry" id="regForm1on1" onclick="javascript:location.href='https://www.oliveyoung.co.kr/store/counsel/getQnaForm.do';">1<em>:</em>1 문의하기</button>
			</div>
			
			<ul class="comm1sTabs threeSet customer">
				<li id="tabFaq"><a href="http://www.oliveyoung.co.kr/store/counsel/getFaqList.do">FAQ</a></li>
				<li id="tab1on1" class="on"><a href="javascript:common.link.moveQnaList();">1:1문의</a></li>
				<li id="tabNotice"><a href="http://www.oliveyoung.co.kr/store/counsel/getNoticeList.do">공지사항</a></li>
			</ul>

			<!-- 기간조회 -->
			
	<fieldset class="search-period">
		<legend></legend>
		<ul class="select-month">
			<li class="on"><button type="button" data-month="-1">1개월</button></li>
			<li><button type="button" data-month="-3">3개월</button></li>
			<li><button type="button" data-month="-6">6개월</button></li>
			<li><button type="button" data-month="-12">12개월</button></li>
		</ul>
		<div class="select-range">
			<select id="cal-start-year" title="년도를 선택하세요" style="width:76px;">

				<option value="2014">2014</option>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018" selected="selected">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
			</select>
			<label for="cal-start-year">년</label>
			<select id="cal-start-month" title="달월을 선택하세요" style="width:60px;">
				<option value="01">1</option>
				<option value="02" selected="selected">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<label for="cal-start-month">월</label>
			<select id="cal-start-day" title="날일을 선택하세요" style="width:60px;">
			<option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19" selected="selected">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option></select>
			<label for="cal-start-day">일</label>
			<span class="des">~</span>
			<select id="cal-end-year" title="년도를 선택하세요" style="width:76px;">
				
				<option value="2014">2014</option>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018" selected="selected">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
			</select>
			<label for="cal-end-year">년</label>
			<select id="cal-end-month" title="달월을 선택하세요" style="width:60px;">
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03" selected="selected">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<label for="cal-end-month">월</label>
			<select id="cal-end-day" title="날일을 선택하세요" style="width:60px;">
			<option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19" selected="selected">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
			<label for="cal-end-day">일</label>
		</div>
		<button type="button" class="btnLookup" id="do-search-period">조회</button>
	</fieldset>
<script type="text/javascript" src="https://www.oliveyoung.co.kr/pc-static-root/js/common/searchPeriod.js?dumm=201803131610"></script>
<script>
START_DATE   = '';
END_DATE     = '';

$(document).ready(function(){
    SearchPeriod.init();
});
</script>	
			<!-- //기간조회 -->
			
			<div class="list-customer onenone">
				<ul>

	
					<li class="nodata">등록하신 1:1 문의가 없습니다.</li>
	
				</ul>
			</div>

			<!-- pageing star -->
			
			

	<div class="pageing">
	
	
	
	</div>

			<!-- //pageing end -->

			<div class="area1sButton pdT30">
				<a href="javascript:common.link.moveQnaForm();" class="btnGreen">1:1문의하기</a>
			</div>

		</div>
		<!-- //#Contents -->
	</div>