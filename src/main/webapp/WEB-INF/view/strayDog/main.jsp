<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
	.strayDog{
		width: 348px;
	    height: 743px;
	    float: left;
	    margin: 40px 14px 60px 14px;
	    background: #fff;
	    border: 1px solid #ccc;
	}
	
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
    	font-size: 14px
	}
	
	* {
		font-family: 'NanumGothicWeb','NanumGothicWebBold','Dotum','돋움',Helvetica,AppleGothic,Sans-serif;
    	color: #444;
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
</style>

<div class="body-container">
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