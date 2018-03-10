<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
body, h1, h2, h3, h4, h5, h6, div, p, span, strong, em, blockquote, pre, address,
ul, ol, li, dl, dt, dd, form, fieldset, input, select, label, textarea, img, a {margin:0; padding:0; border:0/*;word-break:break-all;*/}
ul, ol {list-style:none;}
.TabsConts {display:none;}
.TabsConts.on {display:block;}

/* TAB */
.TabsConts {display:none;}
.TabsConts.on {display:block;}
.comm2sTabs {overflow:hidden;width:100%;margin-top:30px;}
.comm2sTabs > li {float:left;width:50%;height:40px;margin:0 0 0 -1px;background:#fff;box-sizing:border-box;border:1px solid #ddd;}
.comm2sTabs > li:first-child {margin:0;}
.comm2sTabs > li > button {width:100%;height:38px;color:#666;background:#fff;box-sizing:border-box;font-size:14px;line-height:18px;}
.comm2sTabs > li.on {border:2px solid #8f9100;background:#8f9100;}
.comm2sTabs > li.on > button {height:36px;background:#8f9100;color:#fff;}
.comm2sTabs.fiveSet > li {width:205px}
.comm2sTabs.fiveSet > li:first-child {width:204px}
.comm2sTabs.sevenSet > li {width:14.5%;}
.comm2sTabs.sevenSet > li:first-child {width:14%;margin:0;}
.comm2sTabs.sevenSet > li:last-child {width:13.5%;}

.tabConts {display:none}
.tabConts.show {display:block}

/* 공통 플루트 박스 */
.area-over {overflow:hidden;position:relative;width:100%;}
.area-over .left, .area-over .right {width:380px;}
.area-over .left {float:left;}
.area-over .right {float:right;}

/* 고객센터 > 공통 게시판 */
.list-customer {width:1020px;margin:0 auto;}
.list-customer ul {overflow:hidden;width:100%;border-top:2px solid #888}
.list-customer ul li {background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_arrow21x12_off.png") no-repeat 98% 24px;border-bottom:1px solid #e6e6e6}
.list-customer ul li.nodata {padding:200px 15px 80px;background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_nodata104x104.png") no-repeat center 80px;color:#888;font-size:16px;text-align:center;line-height:20px;}
.list-customer ul li .tit, .list-customer ul li .stit {margin-left:20px;padding:20px 0 20px 42px;background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_faq14x15.png") no-repeat 0 23px;color:#222;font-size:14px;line-height:18px;cursor:pointer;}
.list-customer ul li .stit {position:relative;margin:0;padding:20px 0 20px 30px;background:none}
.list-customer ul li .tit strong {display:inline-block;width:140px;margin-right:11px;vertical-align:middle;}
.list-customer ul li .stit strong {display:inline-block;width:70px;height:22px;margin:0 20px 0 0;padding:0 4px;border-radius:15px;box-sizing:border-box;text-align:center;background:#888;color:#fff;font-size:12px;line-height:22px}
.list-customer ul li .stit .data {position:absolute;right:60px;color:#888;font-size:14px;line-height:18px;}
.list-customer ul li .conts {display:none;background:#fafafa;border:0;color:#222;font-size:0;line-height:0;}
.list-customer ul li .conts li {padding:28px 30px 25px;background:none;border-top:1px solid #e6e6e6;border-bottom:0}
.list-customer ul li .conts li strong {display:block;font-size:16px;line-height:22px;}
.list-customer ul li .conts li p,
.list-customer ul li .conts li div {padding:0;color:#222;font-size:14px;line-height:22px;}
.list-customer ul li .conts li > ul+p,
.list-customer ul li .conts li > ul+div {padding:15px 0 0}
.list-customer ul li .conts li .phr {position:relative;margin:25px 0 0;padding:28px 0 0;/*background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/bar_dott7x1.gif") repeat-x 0 0;*/border-top:1px dashed #e6e6e6;color:#888;font-size:14px;line-height:18px;}
.list-customer ul li .conts li .btnGreenW {display:inline-block;position:absolute;top:17px;right:0;width:112px;height:38px;padding:4px 0 0;font-size:14px;text-align:center;letter-spacing:-1px;}
.list-customer ul li .conts li.question {padding:28px 30px 25px 62px}
.list-customer ul li .conts li.question strong {color:#666;}
.list-customer ul li .conts li.answer {}
.list-customer ul li .conts li.answer strong {display:block;position:relative;color:#969937}
.list-customer ul li .conts li.answer strong > .answer_date {position:absolute;top:0;right:0;font-size:14px}
.list-customer ul li .conts li.answer strong+p,
.list-customer ul li .conts li.answer strong+div {padding:15px 0 0}

.list-customer ul li .conts li ul {margin:18px 0 0;padding:0 0 0 8px;border:0;border-left:2px solid #ccc;}
.list-customer ul li .conts li ul li {padding:0;border:0;color:#888;font-size:14px;line-height:22px;}
.list-customer ul li .conts li ul li em {display:inline-block;margin:0 6px 0 0;font-style:normal}
.list-customer ul li .conts li ul li.offline{color:#8f9100;font-weight:bold;}
.list-customer ul li.open .conts {display:block;}
.list-customer ul li.open {background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/ico_arrow21x12_on.png") no-repeat 98% 24px;}
.list-customer ul li.open .tit, .list-customer ul li.open .stit {color:#9ea000;font-weight:700}
.list-customer ul li.open .stit strong {background:#979900;}
.list-customer ul li.open .stit .data {}

.list-customer ul li .tit > span.tx_same {color:#969937;font-weight:700}

/* 고객센터 탭 */
.comm2sTabs.iconTab {height:120px;margin-bottom:60px}
.comm2sTabs.iconTab > li {width:147px;height:120px}
.comm2sTabs.iconTab > li:first-child {margin-left:0;width:144px}
.comm2sTabs.iconTab > li > button.faq_icon1 {width:100%;height:118px;padding-top:60px;color:#222;background:url("<%=cp%>/resource/img/faq/faq_icon1.png") no-repeat 0 0;font-weight:400;background-position:50px 24px}
.comm2sTabs.iconTab > li > button.faq_icon2 {width:100%;height:118px;padding-top:60px;color:#222;background:url("<%=cp%>/resource/img/faq/faq_icon2.png") no-repeat 0 0;font-weight:400;background-position:50px 24px}
.comm2sTabs.iconTab > li > button.faq_icon3 {width:100%;height:118px;padding-top:60px;color:#222;background:url("<%=cp%>/resource/img/faq/faq_icon3.png") no-repeat 0 0;font-weight:400;background-position:50px 24px}
.comm2sTabs.iconTab > li > button.faq_icon4 {width:100%;height:118px;padding-top:60px;color:#222;background:url("<%=cp%>/resource/img/faq/faq_icon4.png") no-repeat 0 0;font-weight:400;background-position:50px 24px}
.comm2sTabs.iconTab > li > button.faq_icon5 {width:100%;height:118px;padding-top:60px;color:#222;background:url("<%=cp%>/resource/img/faq/faq_icon5.png") no-repeat 0 0;font-weight:400;background-position:50px 24px}
.comm2sTabs.iconTab > li > button.faq_icon6 {width:100%;height:118px;padding-top:60px;color:#222;background:url("<%=cp%>/resource/img/faq/faq_icon6.png") no-repeat 0 0;font-weight:400;background-position:50px 24px}
.comm2sTabs.iconTab > li > button.faq_icon7 {width:100%;height:118px;padding-top:60px;color:#222;background:url("<%=cp%>/resource/img/faq/faq_icon7.png") no-repeat 0 0;font-weight:400;background-position:50px 24px}

.comm2sTabs.iconTab > li > button.icon_tab06+.twoTabs,
.comm2sTabs.iconTab > li > button.icon_tab07+.twoTabs {right:0}

.comm2sTabs.iconTab > li.on {border:1px solid #ddd}
.comm2sTabs.iconTab > li.on > button {color:#fff}

/* 고객센터 > 회원&멤버십 탭 */
.area-customer .comm2sTabs {overflow:visible;position:relative;height:40px;box-sizing:initial;}
.area-customer .twoTabs {display:none;overflow:hidden;position:absolute;left:0;bottom:-42px}
.area-customer .comm2sTabs > li.on .twoTabs {display:block;}
.area-customer .twoTabs li {float:left;padding:0 12px 0 11px;background:url("http://www.oliveyoung.co.kr/pc-static-root/image/comm/bar1x13_gray.gif") no-repeat 0 0;}
.area-customer .twoTabs li:first-child {background:none;}
.area-customer .twoTabs li button {background:#fff;color:#888;font-weight:400;font-size:16px}
.area-customer .twoTabs li.on button {color:#333;font-weight:bold}
.TabsConts-textus {display:none;}
.TabsConts-textus.on {display:block;}

/* BOARD LIST */
.board-list-1s {table-layout:fixed;width:1020px;margin:0 auto;border-top:2px solid #888;}
.board-list-1s thead tr th {padding:22px 0 20px;border-bottom:1px solid #888;text-align: center;}
.board-list-1s thead.visible, .board-list-1s thead.visible tr, .board-list-1s thead.visible tr th {z-index:-1;visibility:hidden;position:absolute;top:-99999px;width:0;height:0;font-size:0;text-indent:-99999px;line-height:0;}
.board-list-1s tr td {padding:23px 0 24px;border-bottom:1px solid #e6e6e6;color:#666;font-size:14px;text-align:center;line-height:20px;vertical-align:middle;}
.board-list-1s tr td.subject {position:relative;padding-left:15px;text-align:left;}
.board-list-1s tr td.subject a {display:inline-block;max-width:65%;color:#333;vertical-align:middle}
.board-list-1s tr td.subject strong {display:block;color:#333;font-size:18px;line-height:30px;}
.board-list-1s tr td.subject .tx_store {position:absolute;top:24px;right:10px;color:#888}
.board-list-1s tr.checked td.subject strong {color:#969937;}
.board-list-1s tr td.addr {padding-left:15px;text-align:left;}
.board-list-1s tr td a {display:inline-block;}
.board-list-1s tr td .tel {display:inline-block;padding:0 0 0 20px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_tel13x13.png") no-repeat 0 3px;text-align:left;}
.board-list-1s tr td .jeem-check {display:inline-block;width:25px;height:23px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_check25x23_off.png") no-repeat 0 0;font-size:0;text-indent:-99999px;line-height:0;cursor:pointer;vertical-align:top;}
.board-list-1s tr.checked td .jeem-check {background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_check25x23_on.png") no-repeat 0 0;}

.board-list-1s tr td .ButtonMap {display:inline-block;width:78px;height:36px;padding:10px 0 0;border-radius:5px;border:1px solid #ddd;color:#333;font-size:14px;text-align:center;line-height:18px;}

.board-list-1s tr td .ButtonTime {display:inline-block;width:70px;height:28px;margin:0 0 0;padding:3px 0 0;border-radius:5px;border:1px solid #ccc;color:#666;font-size:12px;text-align:center;line-height:18px;background:transparent;vertical-align:middle;}
.board-list-1s tr td .FG01, .board-list-1s tr td .FG02, .board-list-1s tr td .FG03, .board-list-1s tr td .FG04 {position:relative;top:-1px;margin:0 15px 0 0;}

/* 플래그 */
#Wrapper .FG01, #Wrapper .FG02, #Wrapper .FG03, #Wrapper .FG04 {display:inline-block;width:70px;height:20px;border-radius:10px;color:#fff;font-size:12px;text-align:center;line-height:20px}
#Wrapper .FG01 {background:#969937;}
#Wrapper .FG02 {background:#a68fcd;}
#Wrapper .FG03 {background:#ed95b7;}
#Wrapper .FG04 {background:#f5a031;}

/* PAGEING */
.pageing {padding:30px 0 0;font-size:0;text-align:center;line-height:0;}
.pageing a, .pageing strong {display:inline-block;width:30px;height:30px;margin:0 2px;border:1px solid #e5e5e5;color:#888;font-size:14px;line-height:28px;vertical-align:top;box-sizing:border-box;font-weight:700}
.pageing a {text-decoration:none;}
.pageing .prev, .pageing .next {height:30px;padding:0;font-size:0;text-indent:-99999px;line-height:0;}
.pageing .prev {margin-right:8px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_pageing_prev7x11.png") no-repeat center center;}
.pageing .next {margin-left:8px;background:url("http://www.oliveyoung.co.kr/pc-static-root/css/../image/comm/ico_pageing_next7x11.png") no-repeat center center;}
.pageing strong, .pageing a:hover, .pageing a:active, .pageing a:focus, .pageing strong:hover, .pageing strong:focus, .pageing strong:active {border:1px solid #666;color:#333;font-weight:700}

.pageing span {display:inline-block;width:30px;height:30px;border:1px solid #e5e5e5;text-indent:-9999px}

#TabsOpenArea{width: 1020px;height: 100%;margin: 0 auto;}
</style>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
$('.list-customer .tit').click(function(e){
    e.preventDefault();
    if($(this).parents('li').hasClass('open')){
        $(this).parents('li').removeClass('open');
    }else{
        $(this).parents('li').addClass('open').siblings().removeClass('open');
    }
});
</script>
<div class="body-container">
<div id="TabsOpenArea">
				<div class="area-customer">
					<ul class="comm2sTabs iconTab">
						<li class="on" data-cd="99"><button type="button" class="faq_icon1">TOP10</button>
						</li>
						<li data-cd="40"><button type="button" class="faq_icon2">회원/멤버십</button>
						</li>
						<li data-cd="10"><button type="button" class="faq_icon3">주문/결제</button>
						</li>
						<li data-cd="20"><button type="button" class="faq_icon4">배송</button>
						</li>
						<li data-cd="30"><button type="button" class="faq_icon5">교환/반품/환불</button>
						</li>
						<li data-cd="60"><button type="button" class="faq_icon6">이벤트</button>
						</li>
						<li data-cd="90"><button type="button" class="faq_icon7">기타</button>
						</li>
					</ul>
				</div>
<table class="board-list-1s">
						<caption></caption>
						<colgroup>
							<col style="width:9%;">
							<col style="width:79%;">
							<col style="width:12%;"><!-- 2017-03-10 수정 : colgroup 영역 전체 복사+붙여넣기해주세요(각 항목 간격 수정) -->
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
			<tr>
								<td>72</td>
								<td class="subject"><strong class="FG01">일반 </strong><a href="javascript:counsel.noticeList.goDetail('31417')">오리역점 리뉴얼로 인한 영업 일시 중단 안내</a></td>
								<td>2018.03.09</td>
							</tr>
							<tr>
								<td>71</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31416')">&lt;히알루B5 단독 런칭 기대평 이벤트&gt; 이벤트 당첨자 발표</a></td>
								<td>2018.03.08</td>
							</tr>
							<tr>
								<td>70</td>
								<td class="subject"><strong class="FG04">뷰티테스터 </strong><a href="javascript:counsel.noticeList.goDetail('31415')">2-2차 뷰티테스터 당첨자발표: 나르시소 로드리게즈 플뢰르</a></td>
								<td>2018.03.08</td>
							</tr>
							<tr>
								<td>69</td>
								<td class="subject"><strong class="FG04">뷰티테스터 </strong><a href="javascript:counsel.noticeList.goDetail('31414')">2-2차 뷰티테스터 당첨자발표: 보타니쿠스 페이셜 로즈오일</a></td>
								<td>2018.03.08</td>
							</tr>
							<tr>
								<td>68</td>
								<td class="subject"><strong class="FG04">뷰티테스터 </strong><a href="javascript:counsel.noticeList.goDetail('31413')">2-2차 뷰티테스터 당첨자발표: 울트라브이 이베데논 앰플기획</a></td>
								<td>2018.03.08</td>
							</tr>
							<tr>
								<td>67</td>
								<td class="subject"><strong class="FG04">뷰티테스터 </strong><a href="javascript:counsel.noticeList.goDetail('31412')">2-2차 뷰티테스터 당첨자발표: 라네이처 울날중 12p</a></td>
								<td>2018.03.08</td>
							</tr>
							<tr>
								<td>66</td>
								<td class="subject"><strong class="FG04">뷰티테스터 </strong><a href="javascript:counsel.noticeList.goDetail('31411')">2-2차 뷰티테스터 당첨자발표: 드라마 베이비 물티슈 62매</a></td>
								<td>2018.03.08</td>
							</tr>
							<tr>
								<td>65</td>
								<td class="subject"><strong class="FG01">일반 </strong><a href="javascript:counsel.noticeList.goDetail('31410')">올리브영 안드로이드앱 OS 지원범위 변경 안내</a></td>
								<td>2018.03.07</td>
							</tr>
							<tr>
								<td>64</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31400')">&lt;2월엔X2 더블혜택&gt; 이벤트 당첨자 발표</a></td>
								<td>2018.03.02</td>
							</tr>
							<tr>
								<td>63</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31399')">멤버십 승급 회원 대상 &lt;겟잇뷰티콘&gt; 초대이벤트 당첨자 발표</a></td>
								<td>2018.03.02</td>
							</tr>
							<tr>
								<td>62</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31398')">뮤지컬&lt;존 도우&gt; 당첨자발표</a></td>
								<td>2018.03.02</td>
							</tr>
							<tr>
								<td>61</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31397')">1월 아산 스파비스 이벤트 당첨자 발표</a></td>
								<td>2018.02.27</td>
							</tr>
							<tr>
								<td>60</td>
								<td class="subject"><strong class="FG01">일반 </strong><a href="javascript:counsel.noticeList.goDetail('31396')">CJ ONE 시스템 작업 공지(3/13 오전 2시~6시)</a></td>
								<td>2018.02.26</td>
							</tr>
							<tr>
								<td>59</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31395')">도서&lt;메리포핀스&gt; 당첨자발표</a></td>
								<td>2018.02.26</td>
							</tr>
							<tr>
								<td>58</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31394')">도서&lt;그날의 온도 그날의 빛 그날의 분위기&gt; 당첨자발표</a></td>
								<td>2018.02.26</td>
							</tr>
							<tr>
								<td>57</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31393')">도서&lt;가장 쉬운 독학 예쁜 손글씨&gt; 당첨자발표</a></td>
								<td>2018.02.26</td>
							</tr>
							<tr>
								<td>56</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31392')">도서&lt;도서 시짱, 나의 시짱&gt; 당첨자발표</a></td>
								<td>2018.02.26</td>
							</tr>
							<tr>
								<td>55</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31391')">&lt;알베르토 자코메티 한국특별전&gt; 당첨자발표</a></td>
								<td>2018.02.26</td>
							</tr>
							<tr>
								<td>54</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31390')">연극&lt;와일드패밀리&gt; 당첨자발표</a></td>
								<td>2018.02.26</td>
							</tr>
							<tr>
								<td>53</td>
								<td class="subject"><strong class="FG03">이벤트 </strong><a href="javascript:counsel.noticeList.goDetail('31389')">뮤지컬&lt;홀연했던 사나이&gt; 당첨자발표</a></td>
								<td>2018.02.26</td>
							</tr>
						</tbody>
					</table>
	<div class="pageing">
		<strong title="현재 페이지">1</strong>
	</div>

			</div>
			</div>	