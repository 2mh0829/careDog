<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.td_stle_edit {
	BORDER-BOTTOM: #e0e0e0 1px solid;
	PADDING-BOTTOM: 1px; 
	PADDING-LEFT: 24px; 
	WIDTH: 135px;  
	PADDING-RIGHT: 0px; 
	HEIGHT: 21px; 
	PADDING-TOP: 3px;
	font-weight:bold;
	BACKGROUND: #e5edf3;
	color:#01354b;
	font-size:9pt;	
}

.td_star_edit {
	BORDER-BOTTOM: #e0e0e0 1px solid;
	PADDING-BOTTOM: 1px; 
	PADDING-LEFT: 12px; 
	WIDTH: 135px; 
	PADDING-RIGHT: 0px; 
	BACKGROUND: #e5edf3; 
	HEIGHT: 21px; 
	PADDING-TOP: 7px;
	font-weight:bold;
	color:#01354b;	
	font-size:9pt;	
}
.td_star_edit2 {
	PADDING-BOTTOM: 1px; 
	WIDTH: 110px; 
	PADDING-RIGHT: 0px; 
	HEIGHT: 21px; 
	PADDING-TOP: 5px;
	font-weight:bold;
	BACKGROUND: #e5edf3;	
	font-size:9pt;	
	
}
.td_con_edit 
{
	 
	BORDER-BOTTOM: #e0e0e0 1px solid; 
	PADDING-BOTTOM: 2px; 
	PADDING-LEFT: 10px; 
	PADDING-RIGHT: 0px; 
	PADDING-TOP: 2px;	
}
.td_stle_check {
	BORDER-BOTTOM: #e0e0e0 1px solid;
	PADDING-BOTTOM: 1px; 
	PADDING-LEFT: 26px; 
	WIDTH: 130px; 
	PADDING-RIGHT: 0px; 
	HEIGHT: 21px; 
	PADDING-TOP: 3px;
	font-weight:bold;
	background:#e5edf3;
	color:#01354b;
}

.td_stle_result {
	BORDER-BOTTOM: #e0e0e0 1px solid;
	PADDING-BOTTOM: 1px; 
	PADDING-LEFT: 21px; 
	WIDTH: 132px; 
	PADDING-RIGHT: 0px; 
	BACKGROUND: #fef6ea; 
	HEIGHT: 21px; 
	PADDING-TOP: 7px;
	font-weight:bold;
	color:#01354b;	
	font-size:9pt;	
}

.td_star_yeartax {
	PADDING-BOTTOM: 1px; 
	PADDING-LEFT: 12px; 
	WIDTH: 132px; 
	PADDING-RIGHT: 0px; 
	BACKGROUND: #e5edf3; 
	HEIGHT: 21px; 
	PADDING-TOP: 7px;
	font-weight:bold;
	color:#01354b;	
	font-size:12px;	
}

.td_star_yeartaxtop {
    BORDER-TOP: #e0e0e0 1px solid; 
	PADDING-BOTTOM: 1px; 
	PADDING-LEFT: 12px; 
	WIDTH: 132px; 
	PADDING-RIGHT: 0px; 
	BACKGROUND: #e5edf3; 
	HEIGHT: 21px; 
	PADDING-TOP: 7px;
	font-weight:bold;
	color:#01354b;	
	font-size:12px;	
}

.td_con_yeartax 
{
	PADDING-BOTTOM: 2px; 
	PADDING-LEFT: 10px; 
	PADDING-RIGHT: 0px; 
	PADDING-TOP: 2px;	
}

.td_con_yeartaxTop 
{
    BORDER-TOP: #e0e0e0 1px solid;
	PADDING-BOTTOM: 2px; 
	PADDING-LEFT: 10px; 
	PADDING-RIGHT: 0px; 
	PADDING-TOP: 2px;	
}
.td_left {
	background:url(../../images/td_left.jpg) repeat-y;
	background-color:#FFFFFF;
	background-position:left;
}

.td_right {
	background:url(../../images/td_right.jpg) repeat-y;
	background-position:right;
	background-color:#FFFFFF;
}

.table_01 {
	BORDER-BOTTOM: #ba8d8d 1px solid; 
	WIDTH: 640px; 
	MARGIN-BOTTOM: 30px; 
	COLOR: #7d7d7d; 
	FONT-SIZE: 9pt; 
	BORDER-TOP: #ba8d8d 1px solid;
}
.table_02 {
	BORDER-BOTTOM: #ba8d8d 1px solid; 
	WIDTH: 640px; 
	MARGIN-BOTTOM: 10px; 
	COLOR: #7d7d7d; 
	FONT-SIZE: 9pt; 
	BORDER-TOP: #ba8d8d 1px solid;
}

.table_03 {	
	WIDTH: 640px; 
	COLOR: #7d7d7d; 
	FONT-SIZE: 9pt; 
}	

.table_topline{
	BORDER-TOP: #ba8d8d 1px solid;
	WIDTH: 640px; 
	COLOR: #7d7d7d; 
	FONT-SIZE: 9pt;
}

.table_bottomline{
	WIDTH: 640px; 
	COLOR: #7d7d7d; 
	FONT-SIZE: 9pt; 
	BORDER-BOTTOM: #ba8d8d 1px solid; 
	MARGIN-BOTTOM: 30px;	
}

.td_line {
	height:1px;
	background-color:#ba8d8d
}

.td_star {
	BORDER-BOTTOM: #e0e0e0 1px solid;
	PADDING-BOTTOM: 1px; 
	PADDING-LEFT: 12px; 
	WIDTH: 100px; 
	PADDING-RIGHT: 0px; 
	BACKGROUND: #f5f5f1; 
	HEIGHT: 21px; 
	PADDING-TOP: 7px;
	font-weight:bold;
}

.td_star2 {
	PADDING-BOTTOM: 1px; 
	WIDTH: 100px; 
	PADDING-RIGHT: 0px; 
	HEIGHT: 21px; 
	PADDING-TOP: 7px;
	font-weight:bold;
}

.td_stle {
	BORDER-BOTTOM: #e0e0e0 1px solid;
	PADDING-BOTTOM: 1px; 
	PADDING-LEFT: 26px; 
	WIDTH: 100px; 
	PADDING-RIGHT: 0px; 
	BACKGROUND: #f5f5f1; 
	HEIGHT: 21px; 
	PADDING-TOP: 7px;
	font-weight:bold;
}

.td_con {
	BORDER-BOTTOM: #e0e0e0 1px solid; 
	PADDING-BOTTOM: 2px; 
	PADDING-LEFT: 10px; 
	PADDING-RIGHT: 0px; 
	PADDING-TOP: 2px;
}


/* �׸��� �̵�
.td_stle_check {
	BORDER-BOTTOM: #e0e0e0 1px solid;
	PADDING-BOTTOM: 1px; 
	PADDING-LEFT: 26px; 
	WIDTH: 100px; 
	PADDING-RIGHT: 0px; 
	HEIGHT: 21px; 
	PADDING-TOP: 3px;
	font-weight:bold;
	color:#9c5e5e;
}
*/
.td_star2_check {
	PADDING-BOTTOM: 1px; 
	WIDTH: 100px; 
	PADDING-RIGHT: 0px; 
	HEIGHT: 21px; 
	PADDING-TOP: 5px;
	font-weight:bold;
	color:#9c5e5e;	
}
.td_con_check 
{
	BORDER-BOTTOM: #e0e0e0 1px solid; 
	PADDING-BOTTOM: 2px; 
	PADDING-LEFT: 10px; 
	PADDING-RIGHT: 0px; 
	PADDING-TOP: 2px;
}

.input_01 {
	width:120px;
	border:1px solid #cccccc;
	height:15px;
	font-size:9pt;
	 
}

.input_02 {
	width:120px;
	border:1px solid #cccccc;
	height:15px;
	font-size:9pt;	
	
}

.input_03 {
	width:100px;
	border:1px solid #cccccc;
	height:15px;
	font-size:9pt;	
	
}


.input_style {
	border:1px solid #cccccc;
	height:15px;
	font-size:9pt;
}

.select_style {
	background-color:#fff;
	border:solid 1px #cccccc;
	font-size:9pt;
	color: #7d7d7d;
}

.txt_gray 
{
	color:#9d9d9d;
	font-size:11px;
	letter-spacing:-1;
}

.txt_gray02 
{
	color:#7d7d7d;
	font-size:11px;
	letter-spacing:-1;
}

.txt_gray03
{
	color: #808080;
	font-size: 12px;
}

.email_box1{
    width:105px;

}
.ul_info{
	color:Maroon; 
	margin:2px 0 5px 0;
	padding-left:15px;
}


</style>

<div class="body-container">
	<td bgcolor="#FFFFFF">
		<table cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td style="width: 80%" valign="bottom">
					<h2>정기후원</h2>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td style="width: 20%; text-align: right;">
					<img id="ctl00_ContentPlaceHolder1_imgHost" src="../Images/guemgyul.png" style="width: 30px; border-width: 0px;">
				</td>
			</tr>
			<tr>
				<td class="td_line" colspan="2"></td>
			</tr>
		</table>
		
		<div id="ctl00_ContentPlaceHolder1_divSupport" style="width: 100%; border-width: 0px;">
			<div id="ctl00_ContentPlaceHolder1_panSupportType" style="border-width: 0px; border-style: None;"></div>
			
			<table cellspacing="0" cellpadding="0" width="100%" class="table_topline">
				<tr>
					<td class="td_star_edit" style="width: 133px">
						<img id="ctl00_ContentPlaceHolder1_Image24" src="<%=cp%>/resource/img/strayDog/ico_star.png" style="height: 8px; width: 9px; border-width: 0px;">&nbsp;
						<span id="ctl00_ContentPlaceHolder1_tleSupportType">후원종류</span>
					</td>
					<td class="td_con_edit" width="490px">&nbsp; 
						<span id="ctl00_ContentPlaceHolder1_lblSupportTypeInfo" style="color: Maroon;"></span>
					</td>
				</tr>
				<tr>
					<td class="td_con_edit" colspan="2">
						<div id="ctl00_ContentPlaceHolder1_CallbackPanel1">
							<div id="ctl00_ContentPlaceHolder1_CallbackPanel1_dvSuppurtType">
<script type="text/javascript" language="javascript">
    function selectRdoBtn(txt, AmountCount, rdoName) {             
        var txtAmount = document.getElementById(txt);
        var hidCount = document.getElementById(AmountCount);
        var icount = hidCount.value;
        for (var i = 0; i <= parseInt(icount, 10); i++) {
            var rdo = document.getElementById(rdoName + "_" + i.toString());
            if (rdo.checked) {
                if (rdo.value == "직접입력") {
                    txtAmount.value = "";
                    txtAmount.readOnly = false;
                    txtAmount.style.background = "transparent";
                    txtAmount.focus();
                    break;
                }
                else {
                    txtAmount.value = Set_Comma(rdo.value);
                    txtAmount.readOnly = true;
                    txtAmount.style.background = "#EEEEEE";
                    break;
                }
            }
        }
        SumAmount();
    }

    function SelelctChkSupport(checkbox, radiolist, textbox, namelabel, wonlabel, hidamountCount) {
        var chk = document.getElementById(checkbox);
        var rdl = document.getElementById(radiolist);                
        var txt = document.getElementById(textbox);
        var lblname = document.getElementById(namelabel);
        var lblwon = document.getElementById(wonlabel);
        var nAmountCount = document.getElementById(hidamountCount);
        var nRdlCount = parseInt(nAmountCount.value, 10) + 1;

        if (chk.checked) {
            rdl.disabled = false;
            txt.disabled = false;
            lblname.style.color = "Maroon";
            lblwon.style.color = "Maroon";    
            for (var i = 0; i < nRdlCount; i++) {                
                document.getElementById(radiolist +'_'+ i.toString()).disabled = false;
            }
            selectRdoBtn(textbox, hidamountCount, radiolist);
                 
        }
        else {
            rdl.disabled = true;
            txt.disabled = true;
            txt.value = "";
            lblname.style.color = "#7d7d7d";
            lblwon.style.color = "#7d7d7d";
            for (var i = 0; i < nRdlCount; i++) {
                document.getElementById(radiolist +'_'+ i.toString()).disabled = true;
            }
        }
        SumAmount();
    }

    function SetCheckedSupportType() {
        var fieldcount = document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_hidSupportFieldCount").value;
        for (var i = 0; i < fieldcount; i++) {
            var typecount = document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_hidSupportTypeCount").value;

            for (var j = 0; j < typecount; j++) {
                var hidCountControlId = "ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_hidAmountCollectionCount";
                var textAmountControlId = "ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_txtAmount";
                var rdlAmountControlId = "ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_rdlamount";
                
                var chk = document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_chkSupport");
                var rdl = document.getElementById(rdlAmountControlId);
                var txt = document.getElementById(textAmountControlId);
                var lblname = document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_lblName");
                var lblwon = document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_lblWon");
                var nAmountCount = document.getElementById(hidCountControlId);
                var nRdlCount = parseInt(nAmountCount.value, 10) + 1;

                if (chk.checked) {
                    rdl.disabled = false;
                    txt.disabled = false;
                    lblname.style.color = "Maroon";
                    lblwon.style.color = "Maroon";
//                    for (var i = 0; i < nRdlCount; i++) {
//                        document.getElementById("ctl00_ContentPlaceHolder1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_rdlamount" + '_' + i.toString()).disabled = false;
                    //                    }
                    selectRdoBtn(textAmountControlId, hidCountControlId, rdlAmountControlId);

                }
                else {
                    rdl.disabled = true;
                    txt.disabled = true;
                    txt.value = "";
                    lblname.style.color = "#7d7d7d";
                    lblwon.style.color = "#7d7d7d";
//                    for (var i = 0; i < nRdlCount; i++) {
//                        document.getElementById("ctl00_ContentPlaceHolder1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_rdlamount" + '_' + i.toString()).disabled = true;
//                    }
                }
            }
        }
        SumAmount();
    }

    function SumAmount() {
        var fieldcount = document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_hidSupportFieldCount").value;        
        var sum = 0;
        
        for (var i = 0; i < fieldcount; i++) {
            var typecount = document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_hidSupportTypeCount").value;
            
            for (var j = 0; j < typecount; j++) {
                var amountTxt = document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_txtAmount");
                var amount = Remove_Comma(amountTxt.value);
                var minTxt = document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType" + i.toString() + "_MyControl" + j.toString() + "_hidMinimumAmount");
                var MinimumAmount = Remove_Comma(minTxt.value);
                if (!amountTxt.disabled) {

                    if (IsUnderMinAmount(amount, MinimumAmount)) {
                        amountTxt.value = "";
                        amountTxt.focus();
                        return false;
                    }                    

                    amount = amount == "" ? 0 : amount;
                    sum += parseInt(amount, 10);
                } 
            }
        }

        var commaSum = Set_Comma(sum);
        if (commaSum == undefined) {
            commaSum = 0;
        }
        
        document.getElementById("ctl00_ContentPlaceHolder1_txtAmount").value = commaSum;
        document.getElementById("ctl00_ContentPlaceHolder1_txtPayAmount").value = commaSum;
        //document.getElementById("ctl00_ContentPlaceHolder1_UC_SupportField1_txtSumAmount").value = Set_Comma(sum);
        document.getElementById("ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_lblSumAmount").innerHTML = commaSum;
    }    
</script>
							<div id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_dvField">
							<div>
								<span id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_lblField"
										style="color: #0033CC; font-weight: bold;"></span>
							</div>
							<div id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_dvList">


<script src="/inc/JS/jquery-ui.js"></script>
<script language="javascript" type="text/javascript" src="../inc/JS/Script.js?ver=20180116"></script>
<script language="javascript" type="text/javascript">
    $(function () {
        $(document).tooltip({
            items: "i, [class]",
            content: function() {
                var element = $(this);
                if (element.is("i")) {
                    return element.attr("alt");
                }
                if (element.is(".lblName")) {
                    return element.attr("alt");
                }
            },
            tooltipClass : "tooltipClass"
        });
    });
</script>
											<table style="font-size: 12px;" width="100%">
												<tbody>
													<tr>
														<td valign="middle"><input
															id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_chkSupport"
															type="checkbox"
															name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$chkSupport"
															onclick="SelelctChkSupport('ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_chkSupport', 'ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount','ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_txtAmount', 'ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_lblName', 'ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_lblWon', 'ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_hidAmountCollectionCount');">
															<span
															id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_lblName"
															class="lblName" style="color: maroon;">정회원</span></td>
														<td width="360">
															<table
																id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount"
																disabled="true"
																onclick="selectRdoBtn('ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_txtAmount','ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_hidAmountCollectionCount','ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount' )"
																border="0" style="color: Maroon; font-weight: normal;">
																<tbody>
																	<tr>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_0"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$rdlamount"
																			value="10000"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_0">1만원</label></td>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_1"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$rdlamount"
																			value="20000"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_1">2만원</label></td>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_2"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$rdlamount"
																			value="30000"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_2">3만원</label></td>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_3"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$rdlamount"
																			value="50000"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_3">5만원</label></td>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_4"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$rdlamount"
																			value="100000"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_4">10만원</label></td>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_5"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$rdlamount"
																			value="직접입력"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_rdlamount_5">직접입력</label></td>
																	</tr>
																</tbody>
															</table>
														</td>
														<td width="80px"><input
															name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$txtAmount"
															type="text"
															id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_txtAmount"
															class="input_02"
															onkeydown="javascript:if (event.keyCode == 13){ return false;}"
															onkeyup="this.value = Set_Comma(this.value);"
															onblur="SumAmount()" readonly=""
															style="background: rgb(238, 238, 238); font-size: 11px; width: 55px; text-align: right;">
															<span
															id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_lblWon"
															style="color: maroon;">원</span></td>
													</tr>
												</tbody>
											</table>
											<input type="hidden"
												name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$hidAmountCollectionCount"
												id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_hidAmountCollectionCount"
												value="5"> <input type="hidden"
												name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$hidSupportTypeCode"
												id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_hidSupportTypeCode"
												value="1"> <input type="hidden"
												name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl0$hidMinimumAmount"
												id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl0_hidMinimumAmount"
												value="10000">




<script src="/inc/JS/jquery-ui.js"></script>
<script language="javascript" type="text/javascript" src="../inc/JS/Script.js?ver=20180116"></script>
<script language="javascript" type="text/javascript">
    $(function () {
        $(document).tooltip({
            items: "i, [class]",
            content: function() {
                var element = $(this);
                if (element.is("i")) {
                    return element.attr("alt");
                }
                if (element.is(".lblName")) {
                    return element.attr("alt");
                }
            },
            tooltipClass : "tooltipClass"
        });
    });
</script>
											<table style="font-size: 12px;" width="100%">
												<tbody>
													<tr>
														<td valign="middle"><input
															id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_chkSupport"
															type="checkbox"
															name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$chkSupport"
															onclick="SelelctChkSupport('ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_chkSupport', 'ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount','ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_txtAmount', 'ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_lblName', 'ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_lblWon', 'ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_hidAmountCollectionCount');">
															<span
															id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_lblName"
															class="lblName" style="color: rgb(125, 125, 125);">청소년회원(19세이하)</span>


														</td>
														<td width="360">
															<table
																id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount"
																disabled="true"
																onclick="selectRdoBtn('ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_txtAmount','ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_hidAmountCollectionCount','ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount' )"
																border="0" style="color: Maroon; font-weight: normal;">
																<tbody>
																	<tr>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_0"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$rdlamount"
																			value="3000"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_0">3천원</label></td>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_1"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$rdlamount"
																			value="5000"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_1">5천원</label></td>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_2"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$rdlamount"
																			value="7000"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_2">7천원</label></td>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_3"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$rdlamount"
																			value="9000"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_3">9천원</label></td>
																		<td><input
																			id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_4"
																			type="radio"
																			name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$rdlamount"
																			value="직접입력"><label
																			for="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_rdlamount_4">직접입력</label></td>
																	</tr>
																</tbody>
															</table>
														</td>
														<td width="80px"><input
															name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$txtAmount"
															type="text"
															id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_txtAmount"
															class="input_02" disabled=""
															onkeydown="javascript:if (event.keyCode == 13){ return false;}"
															onkeyup="this.value = Set_Comma(this.value);"
															onblur="SumAmount()" readonly="ReadOnly"
															style="background-color: #EEEEEE; font-size: 11px; width: 55px; text-align: right;">
															<span
															id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_lblWon"
															style="color: rgb(125, 125, 125);">원</span></td>
													</tr>
												</tbody>
											</table>
											<input type="hidden"
												name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$hidAmountCollectionCount"
												id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_hidAmountCollectionCount"
												value="4"> <input type="hidden"
												name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$hidSupportTypeCode"
												id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_hidSupportTypeCode"
												value="2"> <input type="hidden"
												name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$MyControl1$hidMinimumAmount"
												id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_MyControl1_hidMinimumAmount"
												value="3000">

										</div>

										<input type="hidden"
											name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$SupportType0$hidSupportTypeCount"
											id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_SupportType0_hidSupportTypeCount"
											value="2">

									</div>
									<div style="height: 1px; background-color: #e0e0e0;"></div>
									<div style="text-align: right; padding: 5px 13px 5px 0px;">
										<span style="color: Maroon;"> <span
											id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_tleTotalAmount">총
												후원금액</span> :
										</span> <span
											id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_lblSumAmount"
											style="display: inline-block; color: Maroon; width: 60px; text-align: right;">10,000</span>
										<span style="color: Maroon;">&nbsp;원</span>
									</div>
									<input type="hidden"
										name="ctl00$ContentPlaceHolder1$CallbackPanel1$UC_SupportField1$hidSupportFieldCount"
										id="ctl00_ContentPlaceHolder1_CallbackPanel1_UC_SupportField1_hidSupportFieldCount"
										value="1">
								</div>

							</div>
							<table id="ctl00_ContentPlaceHolder1_CallbackPanel1_LP"
								class="dxcpLoadingPanelWithContent" cellspacing="0"
								cellpadding="0" border="0"
								style="border-collapse: collapse; left: 0px; top: 0px; z-index: 30000; display: none;">
								<tbody>
									<tr>
										<td class="dx" style="padding-right: 8px;"><img
											src="/DXR.axd?r=1_70" alt="" align="middle"
											style="border-width: 0px;"></td>
										<td class="dx" style="padding-left: 0px;">Loading…</td>
									</tr>
								</tbody>
							</table>
							<div id="ctl00_ContentPlaceHolder1_CallbackPanel1_LD"
								class="dxcpLoadingDiv"
								style="left: 0px; top: 0px; z-index: 29999; display: none; position: absolute;">

							</div>
							<script id="dxss_1943074430" type="text/javascript">
<!--

var dxo = new ASPxClientCallbackPanel('ctl00_ContentPlaceHolder1_CallbackPanel1');
window['CallbackPanel1'] = dxo;
dxo.callBack = function(arg) { WebForm_DoCallback('ctl00$ContentPlaceHolder1$CallbackPanel1',arg,aspxCallback,'ctl00_ContentPlaceHolder1_CallbackPanel1',aspxCallbackError,true); };
dxo.uniqueID = 'ctl00$ContentPlaceHolder1$CallbackPanel1';
dxo.EndCallback.AddHandler(function(s, e) {
    SetCheckedSupportType();
    });
dxo.InlineInitialize();

//-->
</script>


						</td>
					</tr>


					<tr>
						<td class="td_stle_edit" width="128">납부방법</td>
						<td class="td_con_edit"><span class="txt_gray02">
								<table class="dxeRadioButtonList" cellspacing="0"
									cellpadding="0" id="ctl00_ContentPlaceHolder1_rdoPayType"
									border="0"
									style="border-width: 0px; border-style: None; border-collapse: collapse; border-collapse: separate;">
									<tbody>
										<tr>
											<td class="dxe" style="padding-left: 3px;"><input
												type="hidden"
												id="ctl00_ContentPlaceHolder1_rdoPayType_ValueInput"
												value="CMS"><input
												id="ctl00_ContentPlaceHolder1_rdoPayType_VI" type="hidden"
												name="ctl00$ContentPlaceHolder1$rdoPayType" value="0">
											<table cellspacing="0" cellpadding="0" border="0"
													style="border-collapse: collapse;">
													<tbody>
														<tr>
															<td><table cellspacing="0" cellpadding="0"
																	id="ctl00_ContentPlaceHolder1_rdoPayType_RB0"
																	border="0" style="border-collapse: collapse;">
																	<tbody>
																		<tr>
																			<td><input
																				id="ctl00_ContentPlaceHolder1_rdoPayType_RB0_I"
																				type="radio"
																				name="ctl00$ContentPlaceHolder1$rdoPayType_RB"
																				value=""
																				onclick="aspxERBLIClick('ctl00_ContentPlaceHolder1_rdoPayType', 0)"
																				style="margin-left: 4px; margin-right: 3px; margin-top: 4px; margin-bottom: 5px;"></td>
																			<td><label
																				for="ctl00_ContentPlaceHolder1_rdoPayType_RB0_I"
																				style="margin-left: 2px; white-space: normal;">자동이체(CMS)</label></td>
																		</tr>
																	</tbody>
																</table></td>
															<td><table cellspacing="0" cellpadding="0"
																	id="ctl00_ContentPlaceHolder1_rdoPayType_RB1"
																	border="0" style="border-collapse: collapse;">
																	<tbody>
																		<tr>
																			<td><input
																				id="ctl00_ContentPlaceHolder1_rdoPayType_RB1_I"
																				type="radio"
																				name="ctl00$ContentPlaceHolder1$rdoPayType_RB"
																				value="" checked="checked"
																				onclick="aspxERBLIClick('ctl00_ContentPlaceHolder1_rdoPayType', 1)"
																				style="margin-left: 4px; margin-right: 3px; margin-top: 4px; margin-bottom: 5px;"></td>
																			<td><label
																				for="ctl00_ContentPlaceHolder1_rdoPayType_RB1_I"
																				style="margin-left: 2px; white-space: normal;">신용카드(체크카드
																					포함)</label></td>
																		</tr>
																	</tbody>
																</table></td>
														</tr>
													</tbody>
												</table></td>
										</tr>
									</tbody>
								</table>
								<script id="dxss_775747938" type="text/javascript">
<!--

var dxo = new ASPxClientRadioButtonList('ctl00_ContentPlaceHolder1_rdoPayType');
window['rdoPayType'] = dxo;
dxo.uniqueID = 'ctl00$ContentPlaceHolder1$rdoPayType';
aspxAddDisabledItems('ctl00_ContentPlaceHolder1_rdoPayType',[[['dxeDisabled'],[''],['','RB0','RB1']]]);
dxo.SelectedIndexChanged.AddHandler(function(s, e) {
    check_rdoPayType();
    });
dxo.savedSelectedIndex = 1;
dxo.CreateItems([['자동이체(CMS)','CMS',''],['신용카드(체크카드 포함)','CARD','']]);
dxo.InlineInitialize();

//-->
</script>

						</span>
							<div id="dvCmsText" style="text-align: justify; display: block;">
								<span id="ctl00_ContentPlaceHolder1_lblCmsIs">CMS(Cash
									Management Service)는 금융결제원을 통해 후원금 자동이체를 의뢰하는 방법으로, 매월 약정하신 금액을
									송금 수수료 없이 편리하게 후원하실 수 있습니다.</span>
							</div></td>
					</tr>
					<tr>
						<td class="td_star_edit" width="127"><img
							id="ctl00_ContentPlaceHolder1_Image25"
							src="<%=cp%>/resource/img/strayDog/ico_star.png"
							style="height: 8px; width: 9px; border-width: 0px;">&nbsp;금액</td>
						<td class="td_con_edit" valign="middle">
							<table width="100%" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td colspan="2">


											<div class="dvAmount">


												<input name="ctl00$ContentPlaceHolder1$txtAmount"
													type="text" id="ctl00_ContentPlaceHolder1_txtAmount"
													class="input_02"
													onkeyup="this.value = Set_Comma(this.value);"
													onblur="CheckSingleSupportTypeMinimumAmount();"
													readonly="True"
													style="background-color: #EEEEEE; text-align: right">원
											</div> <span id="ctl00_ContentPlaceHolder1_lblAmountInfo"
											style="color: Maroon; margin-left: 3px;">청소년 회원도 1만원이상
												후원하시면 정회원이 되실 수 있습니다.</span>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="ctl00_ContentPlaceHolder1_divCMS"
				style="width: 100%; border-width: 0px; display: block;">
				<div id="div2" class="divMemberType"
					style="width: 100%; border-style: none; border-width: 0px;">
					<table class="table_03" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="td_stle_edit" width="126">예금주구분</td>
								<td colspan="2" class="td_con_edit">
									<div style="float: left; width: 44%">
										<table id="ctl00_ContentPlaceHolder1_rdoHolderType"
											class="nobod" name="HolderType"
											onclick="check_rdoMemberType('H','Holder');" border="0">
											<tbody>
												<tr>
													<td><input
														id="ctl00_ContentPlaceHolder1_rdoHolderType_0"
														type="radio"
														name="ctl00$ContentPlaceHolder1$rdoHolderType" value="P"
														checked="checked"><label
														for="ctl00_ContentPlaceHolder1_rdoHolderType_0">개인</label></td>
													<td><input
														id="ctl00_ContentPlaceHolder1_rdoHolderType_1"
														type="radio"
														name="ctl00$ContentPlaceHolder1$rdoHolderType" value="G"><label
														for="ctl00_ContentPlaceHolder1_rdoHolderType_1">사업자(단체)</label></td>
													<td><input
														id="ctl00_ContentPlaceHolder1_rdoHolderType_2"
														type="radio"
														name="ctl00$ContentPlaceHolder1$rdoHolderType" value="F"><label
														for="ctl00_ContentPlaceHolder1_rdoHolderType_2">외국인</label></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div id="copyUserInfo"
										style="float: right; width: 55%; text-align: left; padding-top: 5px; vertical-align: text-top;">
										<input id="ctl00_ContentPlaceHolder1_chkSameSponsorInfo"
											type="checkbox"
											name="ctl00$ContentPlaceHolder1$chkSameSponsorInfo"
											onclick="SameSponsorInfo();"> <span
											id="ctl00_ContentPlaceHolder1_Label6"
											style="vertical-align: 2px;">회원정보와 동일</span>
									</div>
								</td>
							</tr>
							<tr class="ARSUableRadio" style="display: none">
								<td class="td_stle_edit" width="128">자동이체 동의 방법</td>
								<td class="td_con_edit"><label>&nbsp;<input
										type="radio" name="ARSAuthYN" value="true" checked="checked">ARS
										전화인증
								</label> <label><input type="radio" name="ARSAuthYN"
										value="false">직접제출</label> <br>

									<div id="ARSAuthContentGroup">
										<ul class="ul_info">
											<span id="ctl00_ContentPlaceHolder1_ARSAuthCommonContent"
												style="color: Maroon;"><li><font color="gray">자동이체
														신청 시 전자금융거래법 제15조 및 동법 시행령 제10조에 따라 출금동의 인증이 필요합니다.</font> <br>
												<font color="#E95D4E"><b><u>하단의 [등록]버튼을 누르시면
																ARS 안내전화를 통해 출금동의 인증이 진행되며, 예금주, 예금주번호, 예금주휴대폰번호는 ARS
																전화인증이 완료되면 자동입력됩니다.</u></b></font></li></span>
											<span id="ctl00_ContentPlaceHolder1_ARSAuthPrivateContent"
												style="color: Maroon;"></span>
										</ul>
									</div>

									<div id="noAuthContentGroup">
										<ul class="ul_info">
											<span id="ctl00_ContentPlaceHolder1_noAuthCommonContent"
												style="color: Maroon;"><li>자동이체 신청 시 전자금융거래법
													제15조 및 동법 시행령 제10조에 따라 출금동의 인증이 필요합니다.</li></span>
											<span id="ctl00_ContentPlaceHolder1_noAuthPrivateContent"
												style="color: Maroon;"></span>
										</ul>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>
				<table cellpadding="0" cellspacing="0" class="table_03">
					<tbody>
						<tr>
							<td class="td_star_edit" width="126"><img
								id="ctl00_ContentPlaceHolder1_Image26"
								src="<%=cp%>/resource/img/strayDog/ico_star.png"
								style="height: 8px; width: 9px; border-width: 0px;">&nbsp;예금주</td>
							<td colspan="2" class="td_con_edit"
								style="padding-top: 0px; padding-bottom: 0px;">
								<div style="float: left;">
									<input name="ctl00$ContentPlaceHolder1$txtHolder" type="text"
										id="ctl00_ContentPlaceHolder1_txtHolder" class="input_02"
										style="margin-top: 5px; width: 200px; ">
									<div class="div_info_maroon byIdentityAuth"
										style="display: none">
										<span id="ctl00_ContentPlaceHolder1_Label7">본인인증을 통해
											입력됩니다.</span>
									</div>
								</div>
								<div id="divHForeigner"
									style="border-style: none; border-width: 0px; display: none; float: right; margin-right: 20px;">
									<table cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td class="td_star_edit" width="80"
													style="border-bottom: none;"><img
													id="ctl00_ContentPlaceHolder1_Image9"
													src="<%=cp%>/resource/img/strayDog/ico_star.png"
													style="height: 8px; width: 9px; border-width: 0px;">&nbsp;예금주번호</td>
												<td colspan="3" class="td_con_edit"
													style="border-bottom: none;"><input
													name="ctl00$ContentPlaceHolder1$txtHolderForeignerNo"
													type="text" maxlength="9"
													id="ctl00_ContentPlaceHolder1_txtHolderForeignerNo"
													title="외국인등록번호일 경우 앞 6자리만 입력해 주세요." class="input_02"
													onkeydown="return checkSpaceBar();"
													onblur="return checkSpaceBar();"
													style="width: 144px; ime-mode: disabled">
													<div class="div_info_maroon withoutIdentityAuth">
														<span id="ctl00_ContentPlaceHolder1_Label44">등록번호는
															앞 6자리만 입력</span>
													</div>
													<div class="div_info_maroon byIdentityAuth"
														style="display: none">
														<span id="ctl00_ContentPlaceHolder1_Label9">본인인증을
															통해 입력됩니다.</span>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="divHPerson"
									style="border-width: 0px; float: right; margin-right: 20px; display: block;">
									<table cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td class="td_star_edit" width="80"
													style="border-bottom: none;"><img
													id="ctl00_ContentPlaceHolder1_Image15"
													src="<%=cp%>/resource/img/strayDog/ico_star.png"
													style="height: 8px; width: 9px; border-width: 0px;">&nbsp;예금주번호</td>
												<td colspan="3" class="td_con_edit"
													style="border-bottom: none;"><input
													name="ctl00$ContentPlaceHolder1$HolderRegNo1" type="text"
													maxlength="6" id="ctl00_ContentPlaceHolder1_HolderRegNo1"
													title="주민번호 앞 6자리" class="input_02"
													onkeyup="this.value = CheckNumLength(this.value, '6');">
													<div class="div_info_maroon withoutIdentityAuth">
														<span id="ctl00_ContentPlaceHolder1_Label43">주민번호 앞
															6자리</span>
													</div>
													<div class="div_info_maroon byIdentityAuth"
														style="display: none">
														<span id="ctl00_ContentPlaceHolder1_Label10">본인인증을
															통해 입력됩니다.</span>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="divHCom"
									style="border-style: none; border-width: 0px; display: none; float: right; margin-right: 20px;">
									<table cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td class="td_star_edit" width="80"
													style="border-bottom: none;"><img
													id="ctl00_ContentPlaceHolder1_Image16"
													src="<%=cp%>/resource/img/strayDog/ico_star.png"
													style="height: 8px; width: 9px; border-width: 0px;">&nbsp;예금주번호</td>
												<td colspan="3" class="td_con_edit"
													style="border-bottom: none;"><input
													name="ctl00$ContentPlaceHolder1$HolderComNo1" type="text"
													maxlength="3" id="ctl00_ContentPlaceHolder1_HolderComNo1"
													class="input_02"
													onkeyup="this.value = CheckNumLength(this.value, '3');AutoKey(this, 'HolderComNo2', '3')"
													style="width: 30px;">&nbsp;- <input
													name="ctl00$ContentPlaceHolder1$HolderComNo2" type="text"
													maxlength="2" id="ctl00_ContentPlaceHolder1_HolderComNo2"
													class="input_02"
													onkeyup="this.value = CheckNumLength(this.value, '2');AutoKey(this, 'HolderComNo3', '2')"
													style="width: 28px;">&nbsp;- <input
													name="ctl00$ContentPlaceHolder1$HolderComNo3" type="text"
													maxlength="5" id="ctl00_ContentPlaceHolder1_HolderComNo3"
													class="input_02"
													onkeyup="this.value = CheckNumLength(this.value, '5');AutoKey(this, 'ddlBank', '5')"
													style="width: 50px;">
													<div class="div_info_maroon">
														<span id="ctl00_ContentPlaceHolder1_Label46"></span>
													</div></td>
											</tr>
										</tbody>
									</table>

								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table_03" cellspacing="0" cellpadding="0">
					<tbody>
						<tr id="phoneInputSection">
							<td class="td_star_edit needHolderPhone" style="display: none"><img
								src="<%=cp%>/resource/img/strayDog/ico_star.png"
								style="height: 8px; width: 9px; border-width: 0px;"> 예금주
								휴대폰번호</td>
							<td class="td_stle_edit optionHolderPhone">예금주 휴대폰번호</td>
							<td class="td_con_edit"><input
								name="ctl00$ContentPlaceHolder1$accountMobile1" type="text"
								maxlength="3" id="ctl00_ContentPlaceHolder1_accountMobile1"
								class="input_02" onfocusout="checkNumber(this)"
								onkeyup="checkNumber(this)" style="width: 60px;"> - <input
								name="ctl00$ContentPlaceHolder1$accountMobile2" type="text"
								maxlength="4" id="ctl00_ContentPlaceHolder1_accountMobile2"
								class="input_02" onfocusout="checkNumber(this)"
								onkeyup="checkNumber(this)" style="width: 60px;"> - <input
								name="ctl00$ContentPlaceHolder1$accountMobile3" type="text"
								maxlength="4" id="ctl00_ContentPlaceHolder1_accountMobile3"
								class="input_02" onfocusout="checkNumber(this)"
								onkeyup="checkNumber(this)" style="width: 60px;"></td>
						</tr>
					</tbody>
				</table>
				<div id="ctl00_ContentPlaceHolder1_panCmsPolicy"
					style="border-width: 0px; border-style: None;"></div>
				<div id="ctl00_ContentPlaceHolder1_panCMSInfo"
					style="border-width: 0px; border-style: None;"></div>
				<table cellspacing="0" cellpadding="0" class="table_bottomline">
					<tbody>
						<tr>
							<td class="td_star_edit" width="126"><img
								id="ctl00_ContentPlaceHolder1_Image17"
								src="<%=cp%>/resource/img/strayDog/ico_star.png"
								style="height: 8px; width: 9px; border-width: 0px;">&nbsp;은행</td>
							<td class="td_con_edit"><select
								name="ctl00$ContentPlaceHolder1$ddlBank"
								id="ctl00_ContentPlaceHolder1_ddlBank" class="select_style"
								onchange="CheckSelectedBank(this.value);" style="width: 160px;">
									<option value="004">국민</option>
									<option value="999">농협</option>
									<option value="003">기업</option>
									<option value="026">신한</option>
									<option value="020">우리</option>
									<option value="027">씨티</option>
									<option value="081">KEB하나</option>
									<option value="023">SC</option>
									<option value="071">우체국</option>
									<option value="016">축협</option>
									<option value="007">수협</option>
									<option value="048">신협</option>
									<option value="045">새마을금고</option>
									<option value="064">산림조합</option>
									<option value="025">서울</option>
									<option value="032">부산</option>
									<option value="031">대구</option>
									<option value="034">광주</option>
									<option value="035">제주</option>
									<option value="037">전북</option>
									<option value="039">경남</option>
									<option value="006">국민(주택)</option>
									<option value="088">신한(통합)</option>
									<option value="021">신한(조흥)</option>
									<option value="053">씨티(한미)</option>
									<option value="209">유안타증권</option>
									<option value="218">KB증권</option>
									<option value="238">미래에셋대우</option>
									<option value="240">삼성증권</option>
									<option value="243">한국투자증권</option>
									<option value="247">NH투자증권(구)우리투자)</option>
									<option value="261">교보증권</option>
									<option value="262">하이투자증권</option>
									<option value="263">HMC투자증권</option>
									<option value="264">키움증권</option>
									<option value="265">이트레이드증권</option>
									<option value="266">SK증권</option>
									<option value="267">대신증권</option>
									<option value="268">아이엠투자증권</option>
									<option value="269">한화증권</option>
									<option value="270">하나대투증권</option>
									<option value="278">신한금융투자</option>
									<option value="279">동부증권</option>
									<option value="280">유진투자증권</option>
									<option value="287">메리츠증권</option>
									<option value="290">부국증권</option>
									<option value="291">신영증권</option>
									<option value="292">케이프투자증권</option>
									<option value="289">NH투자증권</option>
									<option value="001">한국</option>
									<option value="002">산업</option>
									<option value="008">수출입</option>
									<option value="054">HSBC은행</option>
									<option value="050">상호저축</option>
									<option value="055">독일(도이치)</option>
									<option value="057">제이피모간</option>
									<option value="060">뱅크오브아메리카</option>
									<option value="062">중국공상</option>
									<option value="089">케이뱅크</option>
									<option value="090">카카오뱅크</option>
									<option value="005">구)외환</option>
									<option value="230">미래에셋증권</option>

							</select></td>
							<td class="td_con_edit" style="width: 310px;">
								<table width="99%" height="15" border="0" cellpadding="0"
									cellspacing="0">
									<tbody>
										<tr>
											<td width="80"><img
												id="ctl00_ContentPlaceHolder1_Image18"
												src="<%=cp%>/resource/img/strayDog/ico_star.png"
												style="height: 8px; width: 9px; border-width: 0px;"> <span
												class="td_star_edit2">출금주기</span></td>
											<td style="width: 100px;"><select
												name="ctl00$ContentPlaceHolder1$ddlCycle"
												id="ctl00_ContentPlaceHolder1_ddlCycle" class="select_style">
													<option value="1">1개월마다</option>

											</select></td>
											<td width="80"><img
												id="ctl00_ContentPlaceHolder1_Image19"
												src="<%=cp%>/resource/img/strayDog/ico_star.png"
												style="height: 8px; width: 9px; border-width: 0px;"> <span
												class="td_star_edit2">출금일자</span></td>
											<td><select name="ctl00$ContentPlaceHolder1$ddlPayDay"
												id="ctl00_ContentPlaceHolder1_ddlPayDay"
												class="select_style">
													<option value="5">5</option>
													<option value="14">14</option>
													<option value="23">23</option>
													<option value="27">27</option>

											</select></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td class="td_star_edit" width="126"><img
								id="ctl00_ContentPlaceHolder1_Image20"
								src="<%=cp%>/resource/img/strayDog/ico_star.png"
								style="height: 8px; width: 9px; border-width: 0px;">&nbsp;계좌번호</td>
							<td class="td_con_edit" colspan="2"><input
								name="ctl00$ContentPlaceHolder1$txtAccount" type="text"
								id="ctl00_ContentPlaceHolder1_txtAccount" class="input_02"
								onkeyup="this.value = CheckAccountNoLength(this.value, '16');"
								style="width: 200px; ime-mode: disabled"> <span
								style="color: Maroon;">숫자와 '-'만 입력가능</span></td>
						</tr>


						<tr>
							<td class="td_star_edit">
								<img id="ctl00_ContentPlaceHolder1_imgCmsPolicy" src="<%=cp%>/resource/img/strayDog/ico_star.png" style="height: 8px; width: 9px; border-width: 0px;">&nbsp;
								<span id="ctl00_ContentPlaceHolder1_tleCmsPolicy">CMS 약관</span>
							</td>
							<td class="td_con_edit" colspan="3">
								<input type="image" name="ctl00$ContentPlaceHolder1$btnGoCmsPolicy"
									id="ctl00_ContentPlaceHolder1_btnGoCmsPolicy" src="<%=cp%>/resource/img/strayDog/btn_detail.gif" alt="CMS약관보기" align="absbottom"
									onclick="OpenPolicy('cms'); return false;" style="border-width: 0px;">
								<input id="ctl00_ContentPlaceHolder1_chkCmsPolicy" type="checkbox" name="ctl00$ContentPlaceHolder1$chkCmsPolicy">
								<span id="ctl00_ContentPlaceHolder1_lblCmsPolicyInfo">CMS 약관에 동의합니다.</span>
							</td>
						</tr>


						<tr>
							<td class="td_stle_edit" width="126">안내사항</td>
							<td colspan="3" class="td_con_edit" style="line-height: 20px;">
								<ul class="ul_info">
									<span id="ctl00_ContentPlaceHolder1_lblCmsBaseInfo" style="color: Maroon;">
										<li><b>휴대전화번호 형식의 평생계좌</b>는 CMS자동이체신청이 불가합니다.</li></span>
									<span id="ctl00_ContentPlaceHolder1_lblCmsInfo" style="color: Maroon;">
										<li>후원금이 출금되지 않는 경우, 익월에 재출금 됩니다.</li></span>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="ctl00_ContentPlaceHolder1_divCard" style="width: 100%; border-width: 0px; display: none;">
				<div id="ctl00_ContentPlaceHolder1_panCardInfo" style="border-width: 0px; border-style: None;"></div>
				
				<table class="table_bottomline" cellspacing="0" cellpadding="0">
					<tr>
						<td class="td_stle_edit">후원신청</td>
						<td class="td_con_edit"><input type="image" name="ctl00$ContentPlaceHolder1$ibtnGoBilling"
							id="ctl00_ContentPlaceHolder1_ibtnGoBilling" src="<%=cp%>/resource/img/strayDog/btnGoCard.gif" alt="신용카드 정기후원"
							onclick="GetKCPBillKey('new');return false;" style="border-width: 0px;">
							<div style="padding-top: 3px;">
								<span style="color: Maroon;">아래의 정보는 자동으로 채워지는 정보입니다.</span>
							</div>
							<div style="padding-top: 3px;">
								<span style="color: Maroon;">회원가입을 완료하기 전에는 정기후원이 신청되지 않습니다.</span>
							</div>
						</td>
					</tr>
					<tr style="display: none;">
						<td class="td_stle_edit">결제자명</td>
						<td class="td_con_edit">
							<input name="ctl00$ContentPlaceHolder1$txtPayName" type="text" readonly="readonly" id="ctl00_ContentPlaceHolder1_txtPayName"
								class="input_02" onfocus="this.blur();" style="background-color: #EEEEEE;">
						</td>
					</tr>
					<tr>
						<td class="td_stle_edit">월납부금액</td>
						<td class="td_con_edit">
							<input name="ctl00$ContentPlaceHolder1$txtPayAmount" type="text" readonly="readonly" id="ctl00_ContentPlaceHolder1_txtPayAmount"
								class="input_02" onfocus="this.blur();" style="background-color: #EEEEEE; text-align: right">원</td>
					</tr>
					<tr>
						<td class="td_stle_edit">납부시작년월</td>
						<td class="td_con_edit">
							<input name="ctl00$ContentPlaceHolder1$txtPayStart" type="text" readonly="readonly" id="ctl00_ContentPlaceHolder1_txtPayStart"
								class="input_02" onfocus="this.blur();" style="background-color: #EEEEEE;"></td>
					</tr>
					<tr>
						<td width="126" class="td_stle_edit">안내사항</td>
						<td class="td_con_edit" style="line-height: 20px;">
							<ul class="ul_info">
								<span id="ctl00_ContentPlaceHolder1_Label16"></span>
								<span id="ctl00_ContentPlaceHolder1_lblCardInfo" style="color: Maroon;">
									<li>후원금이 출금되지 않는 경우, 익월에 재출금 됩니다.</li>
								</span>
								<span id="ctl00_ContentPlaceHolder1_lblPGInfo" style="color: Maroon;">
									<li>신용카드후원 시 KCP_자동과금, kcp.or.kr, 한국사이버결제로 표시되어 청구됩니다.</li>
									<li>카드사 방침에 따라 삼성, 현대카드를 이용한 정기후원은 불가합니다.</li>
								</span>
							</ul>
						</td>
					</tr>
				</table>
			</div>
			<div id="ctl00_ContentPlaceHolder1_divDeposit" style="width: 100%; border-width: 0px; display: none;">
				<div id="ctl00_ContentPlaceHolder1_panDepositInfo" style="border-width: 0px; border-style: None;">
				</div>
				<table class="table_bottomline" cellspacing="0" cellpadding="0">
					<tr>
						<td width="126" class="td_stle_edit">안내사항</td>
						<td class="td_con_edit" style="line-height: 20px;">
							<span id="ctl00_ContentPlaceHolder1_lblDepositInfo" style="color: Maroon;"></span>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</td>
</div>