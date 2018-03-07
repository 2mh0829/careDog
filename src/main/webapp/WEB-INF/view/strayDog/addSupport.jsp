<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.content { float: left; width: 954px; /*min-height:800px;*/}
.page-tit { margin: 30px 0; color: #222; line-height: 1; margin-left: -2px; font-size: 32px; position:relative; }/* 20171027 수정 */
.page-tit:before { display: block; width: 30px; margin-bottom: 12px; margin-left: 2px; border-top: 3px solid #1991d7; content: ''; }

/* 후원금증액 */
.donation__bg { width: 100%; height: 517px; background: url("<%=cp%>/resource/img/strayDog/donation_banner.jpg") center center no-repeat; -webkit-background-size: 100% 100%; background-size: 100% 100%; }
.donation__banner { display: table-cell; width: 1%; height: 517px; padding-left: 30px; padding-right: 357px; vertical-align: middle; color: #d1d2d2; }
.donation__banner-tit { margin: 0; font-size: 24px; color: #fff; }
.donation__banner-sub { margin: 20px 0 0; font-size: 16px; }
.donation__banner-txt { margin: 20px 0 0; }
.donation__box { margin-top: 40px; text-align: center; }
.donation__box-tit { position: relative; display: inline-block; margin: 0; padding: 0px 35px; font-size: 24px; color: #1991d7; }
.donation__box-tit:before { position: absolute; top: 0; left: 0; display: block; width: 16px; height: 16px; background: url("<%=cp%>/resource/img/strayDog/donation_icon.png") no-repeat; content: ''; }
.donation__box-tit:after { position: absolute; top: 0; right: 0; display: block; width: 16px; height: 16px; background: url("<%=cp%>/resource/img/strayDog/donation_icon.png") no-repeat; background-position: -16px 0px; content: ''; }
.donation__box-txt { margin: 15px 0 0; }
.donation__table { margin-top: 40px; }
.donation__txt { position: relative; margin: 0; padding-left: 7px; font-size: 13px; }
.donation__txt:before { position: absolute; top: 9px; left: 2px; display: block; width: 2px; height: 0; border-top: 2px solid #666666; content: ''; }
.donation__list { margin: 40px 0 0 -30px; padding: 0; list-style: none; }
.donation__list:after { display: block; clear: both; content: ''; }
.donation__item { float: left; display: inline-block; width: 50%; margin-top: 20px; padding-left: 30px; -webkit-box-sizing: border-box; box-sizing: border-box; }
.donation__item-img { width: 100%; }
.donation__item-tit { margin: 20px 0 0; color: #222; font-size: 18px; }
.donation__item-txt { margin: 15px 0 0; }
p { line-height: 1.5; margin: 1em 0; }

.table1 { width: 100%; border-spacing: 0; border-collapse: collapse; text-align: left; }
.table1__tr { border-top: 1px solid #dedede; }
.table1__th { padding: 22px 30px; background-color: #fafafa; border-bottom: 1px solid #dedede; font-size: 14px; color: #222; text-align:left;}
.table1__td { padding: 22px 30px; border-bottom: 1px solid #dedede; }

.input1 { -webkit-box-sizing: border-box; box-sizing: border-box; height: 30px; padding: 5px; border: 1px solid #dddddd; vertical-align: middle; font-size: 14px; line-height: 1; }
.input1 + .input1 { margin-left: 5px; }

.input__form { margin: -7px 0px; font-size: 0; }
.input__form.type-another { position: relative; }
.input__txt { font-size: 14px; vertical-align: middle; }
.input__calender { overflow: hidden; position: relative; left: -1px; display: inline-block; text-indent: -9999px; width: 30px; height: 30px; background-image: url("../images/content/calender_icon.jpg"); vertical-align: middle; }

.input1 + .input__txt { margin-left: 10px; }

.inline-block { display: inline-block !important; }

.wd40 { width: 40px !important; }

.wd60 { width: 60px !important; }

.wd80 { width: 80px !important; }

.wd100 { width: 100px !important; }

.wd120 { width: 120px !important; }

.wd160 { width: 160px !important; }

.wd240 { width: 240px !important; }

.wd250 { width: 250px !important; }

.wd320 { width: 320px !important; }

.wd460 { width: 460px !important; }

.wd600 { width: 600px !important; }

.wd704 { width: 704px !important; }

.wd100p { width: 100% !important; }

.hg100 { height: 100px !important; }

.hg140 { height: 140px !important; }

.hg180 { height: 180px !important; }

.hg550 { height: 550px !important; }

.hg560 { height: 560px !important; }

.hg720 { height: 720px !important; }

/*margin*/
.mt0 { margin-top: 0px !important; }

.mt10 { margin-top: 10px !important; }

.mt15 { margin-top: 15px !important; }

.mt20 { margin-top: 20px !important; }

.mt30 { margin-top: 30px !important; }

.mt40 { margin-top: 40px !important; }

.mt50 { margin-top: 50px !important; }

.mt60 { margin-top: 60px !important; }

.sub__txt { margin-left: 10px; font-size: 13px; vertical-align: middle; }
.sub__txt.type-another { position: absolute; top: 0; bottom: 0; left: 130px; margin: auto 0; height: 20px; line-height: 20px; }
.center__group { text-align: center; font-size: 0; }
.btn + .btn { margin-left: 10px; }

.btn { display: inline-block; width: 120px; height: 40px; text-align: center; line-height: 38px; font-size: 14px; -webkit-box-sizing: border-box; box-sizing: border-box; }

.btn1 { background-color: #1991d7; color: #fff; border: 1px solid #1991d7; }

.btn2 { border: 1px solid #666666; color: #666666; }

.btn3 { background-color: #f24443; color: #fff; border: 1px solid #f24443; }

.btn4 { border: 1px solid #cccccc; color: #767676; background-color: #fff; }

.bt { border-top: 1px solid #dedede !important; }

.fl_r { float: right; }
.color1 {
    color: #1991d7 !important;
}

</style>

<div class="body-container">

<div class="content" id="AnimalsContent">
				<h1 class="page-tit">후원금 증액</h1>
				
				<div class="donation">
					<div class="donation__bg">
						<div class="donation__banner">
							<h2 class="donation__banner-tit">사회가 외면했던 동물들, 다시 찾는 희망</h2>
							<h3 class="donation__banner-sub">회원님의 힘을 한번 더 나눠주세요!</h3>
							<!-- 20171025 내용 수정 //-->
							<p class="donation__banner-txt">
								기르던 반려동물을 길에 버리는 것을 수치스럽게 생각지 못하는 사람이 많던 때가 있었습니다.<br>
								하지만 지금은 나이가 많은 반려동물과 함께 사는 것을 자랑하는 사람들이 늘고 있습니다.<br>
								지난 15여  18여 년을 이어온 회원님들의 후원과 동물 친구들의 노력으로 변화하고 있는 것입니다.<br><br>

								동물자유연대는, 동물에 대한 사회적 관심을 견인해나가며 우리사회에 농장동물복지 필요성의 공감대를 만들었고, 2013년에는 아시아 최초로 쇼장의 돌고래 제돌이와 춘삼이, 삼팔이를 시작으로 2017년 까지 7마리의 남방큰돌고래를 바다로 돌려보내는 데에 성공적인 캠페인을 할 수 있었습니다.<br><br>

								그리고 동물복지형 동물보육원을 건립함으로써 우리 자력의 힘으로 선진적인 동물보육원을 건립하고 운영할 수 있다는 실증을 보여줬습니다. 하지만 이것은 끝이 아니라 제2, 제3의 동물보육원을 건립하고 운영하기 위한 첫 걸음이었습니다.<br><br>

								아직 해야 할 일이 많습니다. 가야 할 길이 멉니다. 동물자유연대는 더욱 더 탄탄한 뒷받침을 필요로 하고 있습니다. 회원님, 지금의 이 동력을 ‘동물의 힘’으로 더 크게 확장시켜 나갈 수 있도록, 변함없고 안정적인 지원으로 함께 해주세요!
							</p>
							<!--// 20171025 내용 수정 -->
						</div><!-- //donation__banner -->
					</div><!-- //donation__bg -->
					<div class="donation__box">
						<h2 class="donation__box-tit">조금 더 여유를 내어주실 수 있다면, 지금 회원님의 후원금을 증액해 주세요.</h2>
						<p class="donation__box-txt">따뜻한 손길이 필요한 동물, 동물 복지 개선을 위한 토대 마련 등에 동물자유연대가 더 뛰겠습니다.</p>
					</div>

					<form name="join2" method="post" action="addok.asp?tcate=2">
					<div class="donation__table">
						<p class="donation__txt">동물자유연대 회원은 로그인을 먼저 해주세요. 더 편하게 증액 신청을 하실 수 있습니다.</p>
						<table class="table1 mt10">
							<thead>
								</thead><colgroup>
									<col width="216px">
									<col width="auto">
								</colgroup>
							
							<tbody>
								<tr class="table1__tr">
									<th class="table1__th">이름</th>
									<td class="table1__td">
										<div class="input__form">
											<input type="text" class="input1 wd240" name="name" value="" maxlength="7">
										</div>
									</td>
								</tr>
								<tr class="table1__tr">
									<th class="table1__th">이메일</th>
									<td class="table1__td">
										<div class="input__form">
											<input type="text" class="input1 wd240" name="email" value="">
											<span class="sub__txt">* 정기후원 신청시 입력한 이메일</span>
										</div>
									</td>
								</tr>
								<tr class="table1__tr">
									<th class="table1__th">연락처</th>
									<td class="table1__td">
										<div class="input__form">
											<input type="text" class="input1 wd240" name="tel" value="" maxlength="20">
										</div>
									</td>
								</tr>
								<tr class="table1__tr">
									<th class="table1__th">후원회비</th>
									<td class="table1__td">
										<div class="input__form">
											<input type="text" class="input1 wd240" name="price" id="price" maxlength="20">
											<span class="sub__txt">(기존회비 + 증액회비)</span>
										</div>
									</td>
								</tr>
								<tr class="table1__tr">
									<th class="table1__th">응원글 남기기</th>
									<td class="table1__td">
										<div class="input__form">
											<input type="text" class="input1 wd100p" name="content" id="content" maxlength="300">
										</div>
									</td>
								</tr>
								<tr class="table1__tr">
									<th class="table1__th">비밀번호</th>
									<td class="table1__td">
										<div class="input__form"><input type="hidden" value="" name="keynum">
											<input type="password" class="input1 wd120" name="pw" id="pw" onkeypress="Cal_Key_num++;">
											<span class="sub__txt">* 비밀번호는 스팸 방지를 위해 입력하며 저장 되지는 않습니다.</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="center__group mt40">
							<a href="javascript:go_submit2();" class="btn btn1">후원금증액신청</a>
							<a href="/ani-main/08member/member.asp" class="btn btn2">회원가입</a>
						</div>
					</div>
					</form>
					<ul class="donation__list">
						<li class="donation__item">
							<img src="<%=cp%>/resource/img/strayDog/donation_img1.jpg" alt="" class="donation__item-img">
							<h2 class="donation__item-tit">50명이 1만원 회비 증액 <span class="color1">(50만원)</span></h2>
							<p class="donation__item-txt">
								학대나 사고로 인해 상처 입고 고통받는 동물들을 치료해주고 새로운 가족을
								만나게 해줄 수 있습니다.
							</p>
						</li>
						<li class="donation__item">
							<img src="<%=cp%>/resource/img/strayDog/donation_img2.jpg" alt="" class="donation__item-img">
							<h2 class="donation__item-tit">40명이 1만원 회비 증액 <span class="color1">(40만원)</span></h2>
							<p class="donation__item-txt">
								몸을 움직일 수 없는 케이지에서 사는 암퇘지와 암탉의 복지 개선의 토대가 될
								조사 활동의 현장에 나갈 수 있습니다.
							</p>
						</li>
						<li class="donation__item">
							<img src="<%=cp%>/resource/img/strayDog/donation_img3.jpg" alt="" class="donation__item-img">
							<h2 class="donation__item-tit">30명이 1만원 회비 증액 <span class="color1">(30만원)</span></h2>
							<p class="donation__item-txt">
								더이상 돌고래들이 바다에서 잡혀와 좁은 수조 안에서 고통 받으며 살지 않도록
								하는 정책마련 활동에 쓰입니다.
							</p>
						</li>
						<li class="donation__item">
							<img src="<%=cp%>/resource/img/strayDog/donation_img4.jpg" alt="" class="donation__item-img">
							<h2 class="donation__item-tit">25명이 1만원 회비 증액 <span class="color1">(25만원)</span></h2>
							<p class="donation__item-txt">
								열악한 환경에서 출산을 반복할 수밖에 없는 어미 고양이 한 마리의 중성화
								수술을 도와줄 수 있습니다.
							</p>
						</li>
					</ul>

<!-- 후원금 증액 신청시 입력한 메시지는 로그인 상태에서만 보이게 수정
	2014. 9. 10 이기순 ==> AS-IS 유지 -->	


				</div>

			</div>
   
</div>