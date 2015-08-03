﻿<%@page language="java" pageEncoding="utf-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
	<script language="javascript" type="text/javascript">
		//保存结果的提示
		function showResult() {
			showResultDiv(true);
			window.setTimeout("showResultDiv(false);", 3000);
		}
		function showResultDiv(flag) {
			var divResult = document.getElementById("save_result_info");
			if (flag)
				divResult.style.display = "block";
			else
				divResult.style.display = "none";
		}

		//切换资费类型
		function feeTypeChange(type) {
			var inputArray = document.getElementById("main").getElementsByTagName("input");
			if (type == 1) {
				inputArray[5].readOnly = true;
				inputArray[5].value = "";
				inputArray[5].className += " readonly";
				inputArray[6].readOnly = false;
				inputArray[6].className = "width100";
				inputArray[7].readOnly = true;
				inputArray[7].className += " readonly";
				inputArray[7].value = "";
			}
			else if (type == 2) {
				inputArray[5].readOnly = false;
				inputArray[5].className = "width100";
				inputArray[6].readOnly = false;
				inputArray[6].className = "width100";
				inputArray[7].readOnly = false;
				inputArray[7].className = "width100";
			}
			else if (type == 3) {
				inputArray[5].readOnly = true;
				inputArray[5].value = "";
				inputArray[5].className += " readonly";
				inputArray[6].readOnly = true;
				inputArray[6].value = "";
				inputArray[6].className += " readonly";
				inputArray[7].readOnly = false;
				inputArray[7].className = "width100";
			}
		}
	</script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
	<img src="/NETCTOSS/images/logo.png" alt="logo" class="left"/>
	<a href="#">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
	<ul id="menu">
		<li><a href="/NETCTOSS/login/toIndex" class="index_off"></a></li>
		<li><a href="/NETCTOSS/role/list/1" class="role_off"></a></li>
		<li><a href="/NETCTOSS/admin/list/-1/*/1" class="admin_off"></a></li>
		<li><a href="/NETCTOSS/fee/list/1" class="fee_off"></a></li>
		<li><a href="/NETCTOSS/account/account_list/*/*/*/-1/1" class="account_off"></a></li>
		<li><a href="/NETCTOSS/service/list/*/*/*/-1/1" class="service_off"></a></li>
		<li><a href="../bill/bill_list.html" class="bill_off"></a></li>
		<li><a href="../report/report_list.html" class="report_off"></a></li>
		<li><a href="/NETCTOSS/user/info" class="information_off"></a></li>
		<li><a href="/NETCTOSS/user/toChangePwd" class="password_off"></a></li>
	</ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
	<div id="save_result_info" class="save_success">保存成功！</div>
	<form:form commandName="cost" cssClass="main_form" action="/NETCTOSS/fee/${cost.cost_id}" method="put">
		<div class="text_info clearfix"><span>资费ID：</span></div>
		<div class="input_info"><form:input path="cost_id" type="text" cssClass="readonly" readonly="true"/></div>
		<div class="text_info clearfix"><span>资费名称：</span></div>
		<div class="input_info">
			<form:input type="text" cssClass="width300" path="name"/>
			<span class="required">*</span>

			<div class="validate_msg_short">50长度的字母、数字、汉字和下划线的组合</div>
		</div>
		<div class="text_info clearfix"><span>资费类型：</span></div>
		<div class="input_info fee_type">
			<form:radiobutton path="cost_type" value="1" label="包月" onclick="feeTypeChange(1)" id="monthly"/>
			<form:radiobutton path="cost_type" value="2" label="套餐" onclick="feeTypeChange(2)" id="package"/>
			<form:radiobutton path="cost_type" value="3" label="计时" onclick="feeTypeChange(3)" id="timeBased"/>
		</div>
		<div class="text_info clearfix"><span>基本时长：</span></div>
		<div class="input_info">
			<form:input type="text" cssClass="width100" path="base_duration"/>
			<span class="info">小时</span>
			<span class="required">*</span>

			<div class="validate_msg_long">1-600之间的整数</div>
		</div>
		<div class="text_info clearfix"><span>基本费用：</span></div>
		<div class="input_info">
			<form:input type="text" path="base_cost" class="width100"/>
			<span class="info">元</span>
			<span class="required">*</span>

			<div class="validate_msg_long">0-99999.99之间的数值</div>
		</div>
		<div class="text_info clearfix"><span>单位费用：</span></div>
		<div class="input_info">
			<form:input type="text" path="unit_cost" class="width100"/>
			<span class="info">元/小时</span>
			<span class="required">*</span>

			<div class="validate_msg_long">0-99999.99之间的数值</div>
		</div>
		<div class="text_info clearfix"><span>资费说明：</span></div>
		<div class="input_info_high">
			<form:textarea path="descr" cssClass="width300 height70"/>
			<div class="validate_msg_short">100长度的字母、数字、汉字和下划线的组合</div>
		</div>
		<div class="button_info clearfix">
			<input type="submit" value="保存" class="btn_save" onclick="showResult();"/>
			<input type="button" value="取消" class="btn_save"/>
		</div>
	</form:form>
</div>
<!--主要区域结束-->
<div id="footer">
	<span>NetCTOSS项目</span>
	<br/>
	<span>版权所有(C)XXX.Inc </span>
</div>
</body>
</html>
