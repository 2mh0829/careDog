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

<style>
/* 고객센터 > 1:1문의 > 목록 */
.search-period {overflow:hidden;position:relative;width:1020px;margin:20px auto;padding:20px;background:#ececec;box-sizing:border-box;border-radius:5px;border:0;}
.search-period .select-month {overflow:hidden; padding: 0;}
.search-period .select-month li {float:left;width:70px;height:28px;margin:0 0 0 -1px;font-size:0;line-height:0;}
.search-period .select-month li:first-child {margin:0;}
.search-period .select-month button {width:100%;height:28px;border:1px solid #d0d0d0;background:#fff;color:#222;font-size:12px;font-weight:400}
.search-period .select-month li:first-child button {border-top-left-radius:5px;border-bottom-left-radius:5px;}
.search-period .select-month li:last-child button {border-top-right-radius:5px;border-bottom-right-radius:5px;}
.search-period .select-month li.on button {border:1px solid #848484;background:#848484;color:#fff;}
.search-period .select-range {padding:10px 0 0;line-height:38px}
.search-period .select-range select {height:28px;padding-right:0;color:#222;font-size:12px;line-height:16px;vertical-align:middle;border-radius: 5px;}
.search-period .select-range label {display:inline-block;margin:0 11px 0 1px;color:#222;font-size:12px;line-height:16px;}
.search-period .select-range .des {margin:0 15px 0 10px;}
.search-period button.btnLookup,
.search-period input[type="submit"] {display:inline-block;position:absolute;top:0;right:0;width:85px;height:100%;background:#969937;border-radius:0;border-top-right-radius:5px;border-bottom-right-radius:5px;color:#fff;font-size:16px;line-height:22px;border:0;'}
.search-period.mgT30 {margin-top:20px !important}
.search-period{margin-top: 30px;}

.container {
    clear: both;
    min-height: 600px;
    padding-top: 100px;
    text-align: left;
    padding-right: 0px;
    padding-left: 0px;

legend {position:absolute; overflow:hidden; visibility:hidden; height:0; z-index:-1;}

select {
 width:100%;
 height:38px;
 padding:0 0 0 8px;
 border:1px solid #d0d0d0;
 border-radius:5px;
 font-size:14px;
 line-height:18px;
 font-family:'AppleGothic', 'Roboto', 'montserrat', 'noto', sans-serif;
 color:#333;
 /*vertical-align:middle;*/
 /*outline:none;*/
}
/* BORDER */
ul li.nodata {width:100% !important;padding:200px 15px 80px !important;background:url("<%=cp%>/resource/img/faq/ico_nodata104x104.png") no-repeat center 80px !important;color:#888 !important;font-size:16px !important;text-align:center !important;line-height:20px !important;}
</style>

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


<div id="body-Container">
<div id="onefone_Container">
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
<script type="text/javascript">
$.fn.addOption = function(v,t,s){
    var option = '<option value="'+v+'" ';
    if(s) option += 'selected="selected"';
    option += '>'+t+'</option>';
    
    $(this).append(option);
};

$.fn.clearOption = function(){
    $(this).children().remove();
};

var SearchPeriod = (function($){
    var defaultMonth = -1;
    var today = {
            year  : new Date().format("yyyy")
           ,month : new Date().format("MM")
           ,day   : new Date().format("dd")
    };
    
    var select = {
            start : {
                year : $('#cal-start-year')
               ,month: $('#cal-start-month')
               ,day  : $('#cal-start-day')
            }
           ,end   : {
                year : $('#cal-end-year')
               ,month: $('#cal-end-month')
               ,day  : $('#cal-end-day')
           }
    };
    
    var DateCalculator = function(term){
        var date  = new Date(selectedDate.end.year+'/'+selectedDate.end.month+'/'+selectedDate.end.day)
           ,month = term || 0;
        
        date.setMonth(date.getMonth() + month);
        
        this.getYear = function() {
            var yyyy = new Date(date.getFullYear(), date.getMonth(), date.getDate()).getFullYear();
            return yyyy.toString();
        };
        
        this.getMonth = function() {
            var mm = new Date(date.getFullYear(), date.getMonth(), date.getDate()).getMonth() + 1;
            return (mm.lpad(2,'0')).toString();
        };
        
        this.getDay = function() {
            var dd = new Date(date.getFullYear(), date.getMonth(), date.getDate()).getDate();
            return (dd.lpad(2,'0')).toString(); 
        };
    };
    
    var selectedDate = {
            start : {year : '', month: '', day  : ''}
           ,end   : {year : '', month: '', day  : ''}
    };
    
    var setDateInit = function(){
        if(START_DATE && END_DATE){
            var startDate = START_DATE.split('-');
            
            selectedDate.start.year  = startDate[0];
            selectedDate.start.month = startDate[1];
            selectedDate.start.day   = startDate[2];
            
            var endDate = END_DATE.split('-');
            
            selectedDate.end.year  = endDate[0];
            selectedDate.end.month = endDate[1];
            selectedDate.end.day   = endDate[2];
        }else{
            selectedDate.end = {
                    year  : today.year
                   ,month : today.month
                   ,day   : today.day
            };
            
            var date = new DateCalculator(defaultMonth);
            
            selectedDate.start = {
                    year  : date.getYear()
                   ,month : date.getMonth()
                   ,day   : date.getDay()
            };
        }
    };
    
    var init = function(){
        bindingEvent();
        
        setDateInit();
        
        makeSelectBox();
    };
    
    var bindingEvent = function(){
        $('#cal-start-day, #cal-end-day').change(function(){
            tabOff();
            
            setSelectedDate();
        });
        
        $('#cal-start-year, #cal-start-month, #cal-end-year, #cal-end-month').change(function(){
            var section = $(this).attr('id').replace(/(cal|year|month|day|-)/gi, '');
            
            tabOff();
            
            setDay(section, true);
            
            setSelectedDate();
        });
    };
    
    var setSearchMonth = function(obj){
        
        if(!$(obj).data('month')) return;
        
        tabOff();
        
        $('.select-month').find('li').filter(function(){
            return Number($(this).children('button').data('month')) == Number($(obj).data('month'))
        }).addClass('on');
    };
    
    var getSearchMonth = function(){
        return $('.select-month').find('li').filter(function(){
            return $(this).hasClass('on')
        }).children('button').data('month');
    };
    
    var getPeriodParam = function(obj){
        
        setSearchMonth(obj);
        
        setSelectedDate(obj);
        
        if(!validator()) return;
        
        var startDate = selectedDate.start.year.toString() + '-' 
                      + selectedDate.start.month.toString() + '-' 
                      + selectedDate.start.day.toString();
        
        var endDate   = selectedDate.end.year.toString() + '-' 
                      + selectedDate.end.month.toString() + '-' 
                      + selectedDate.end.day.toString();
           
        return {
            searchMonth : getSearchMonth()
           ,startDate   : startDate 
           ,endDate     : endDate
        }
    };
    
    var setSelectedDate = function(obj){
        if(arguments.length > 0 && typeof $(obj).data('month') != 'undefined' && Number($(obj).data('month')) != 0){
            var date = new DateCalculator(Number($(obj).data('month')));
            
            selectedDate.start = {
                    year  : date.getYear()
                   ,month : date.getMonth()
                   ,day   : date.getDay()
            };
        }else{
            selectedDate.start = {
                    year  : select.start.year.val()
                   ,month : select.start.month.val()
                   ,day   : select.start.day.val()
            };
        }   
        
        selectedDate.end = {
                year  : select.end.year.val()
               ,month : select.end.month.val()
               ,day   : select.end.day.val()
        }
    };
    
    var getDaysInMonth = function(year, month) {
        return 32 - new Date(year, month-1, 32).getDate();
    };
    
    var setDay = function(section, isInit){
        var days = getDaysInMonth(select[section].year.val(), select[section].month.val());
        
        select[section].day.clearOption();
        
        for(var i=0; i<days; i++){
            var day = i + 1;
            var isSelect = false;
            
            if(isInit){
                if(i == 0) isSelect = true;
            }else{
                if(day == Number(selectedDate[section].day)) isSelect = true;
            }
            
            select[section].day.addOption(day.lpad(2,'0'),day,isSelect);
        };
    };
    
    var makeSelectBox = function(){
        
        for(var property in selectedDate){
            drawSelectBox(property);
        }
    };
    
    var drawSelectBox = function(section){
        
        select[section].year.children().filter(function(){
            return $(this).val() == selectedDate[section].year 
        }).attr('selected','selected');
        
        select[section].month.children().filter(function(){
            return $(this).val() == selectedDate[section].month 
        }).attr('selected','selected');
        
        setDay(section, false);
    };
    
    var validator = function(){
        var startDate = Number(selectedDate.start.year.toString() + selectedDate.start.month.toString() + selectedDate.start.day.toString())
           ,endDate   = Number(select.end.year.val().toString() + select.end.month.val().toString() + select.end.day.val().toString())
           ,date      = new DateCalculator(-12)
           ,maxDate   = Number(date.getYear().toString() + date.getMonth().toString() + date.getDay().toString());  
            
        if((endDate - startDate) > (endDate - maxDate)){
            alert('error1');
            return false;
        };
            
        if(startDate > endDate){
            alert('error2');
            return false;
        };
        
        if(startDate > Number(today.year.toString() + today.month.toString() + today.day.toString())){
            alert('error3');
            
            $('#cal-start-year').val(today.year);
            $('#cal-start-month').val(today.month);
            $('#cal-start-day').val(today.day);
            
            tabOff();
            
            setSelectedDate();
            
            return false;
        }

        if(endDate > Number(today.year.toString() + today.month.toString() + today.day.toString())){
            alert('error3');
            
            $('#cal-end-year').val(today.year);
            $('#cal-end-month').val(today.month);
            $('#cal-end-day').val(today.day);
            
            tabOff();
            
            setSelectedDate();
            
            return false;
        }

        return true;
    };
    
    var tabOff = function(){
        $('.select-month').find('li').filter(function(){
            return $(this).hasClass('on')
        }).removeClass('on');
    };
    
	return {
	    init    : init
	   ,getDate : getPeriodParam
	};
})(jQuery);
</script>
<script>
START_DATE   = '';
END_DATE     = '';

$(document).ready(function(){
    SearchPeriod.init();
});
</script>
		<div>
		<ul>
			<li id="367660" class="">
				<p class="stit complete">
					<strong>답변완료</strong>올리브영 멤버십이랑 cj멤버십이랑 다른게 뭔가요?
					<span class="data">2018.03.20</span>
				</p>
			</li>
		</ul>
		</div>	
	</div>
</div>
