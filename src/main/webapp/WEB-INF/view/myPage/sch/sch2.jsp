<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.myPage-calendar{
width:100%;
background-color:white;
padding:10px;
}
.myPage-calendar-header{
width:100%;
text-align:center
}
th{
text-align:center}
td{
padding-left:2px;
}
</style>
<script>
$(document).ready(function(){
	printCalendar();
})
function printCalendar(y, m) {    
    
    //① 현재 날짜와 현재 달에 1일의 날짜 객체를 생성합니다.
    var date=new Date(); //날짜 객체 생성
    var nowY=date.getFullYear(); //현재 연도
    var nowM=date.getMonth(); //현재 월
    var nowD=date.getDate(); //현재 일
    
    y = (y != undefined)?y:nowY;
    m = (m != undefined)?m-1:nowM;
        
    /* 현재 월의 1일에 요일을 구합니다. 
     그럼 그달 달력에 첫 번째 줄 빈칸의 개수를 구할 수 있습니다.*/
    var theDate=new Date(y, m, 1); 
    var theDay=theDate.getDay();

    //② 현재 월에 마지막 일을 구해야 합니다.

    //1월부터 12월까지 마지막 일을 배열로 저장함.
    var last=[31,28,31,30,31,30,31,31,30,31,30,31];
    /*현재 연도가 윤년(4년 주기이고 100년 주기는 제외합니다. 
    또는 400년 주기)일경우 2월에 마지막 날짜는 29가 되어야 합니다.*/
    if(y%4 == 0 && y % 100 !=0 || y%400 == 0) lastDate=last[1]=29;

    var lastDate=last[m]; //현재 월에 마지막이 몇일인지 구합니다.

    /*③ 현재 월의 달력에 필요한 행의 개수를 구합니다.
    var row(행의 개수)= Math.ceil( (theDay(빈 칸)+lastDate(월의 전체 일수)) / 7)*/

    var row=Math.ceil((theDay+lastDate)/7); //필요한 행수
    
    //④ 달력 년도/월 표기 및  달력 테이블 생성
    $(".myPage-calendar-header").html("<h2>"+y+"."+(m+1)+"</h2>");
    //문자결합 연산자를 사용해 요일이 나오는 행을 생성    

    var calendar="<table style='width:100%;'>";
    calendar+="<tr>";
    calendar+="<th>일</th>";
    calendar+="<th>월</th>";
    calendar+="<th>화</th>";
    calendar+="<th>수</th>";
    calendar+="<th>목</th>";
    calendar+="<th>금</th>";
    calendar+="<th>토</th>";
    calendar+="</tr>";

    var dNum=1;
    //이중 for문을 이용해 달력 테이블을 생성
    for(var i=1; i<=row; i++){//행 생성 (tr 태그 생성)
    calendar+="<tr style='height:50px'>";

    for(var k=1; k<=7; k++){//열 생성 (td 태그 생성)        
        /*행이 첫 줄이고 현재 월의 1일의 요일 이전은 모두 빈열로
        표기하고 날짜가 마지막 일보다 크면 빈열로 표기됩니다.*/
        if(i==1 && k<=theDay || dNum>lastDate){
          calendar+="<td> &nbsp; </td>";
         }else{
          calendar+="<td>"+dNum+"</td>";
           dNum++;
         }
    }
    calendar+="<tr>";
    }    

    //⑤ 문자로 결합된 달력 테이블을 문서에 출력
    $(".myPage-calendar-body").html(calendar);
}


//printCalendar(2012,2);

//]]>
</script>
<div class="myPage-calendar">
<div class="myPage-calendar-header">

</div>
<div class="myPage-calendar-body">

</div>
</div>


