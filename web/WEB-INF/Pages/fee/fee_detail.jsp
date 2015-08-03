<%@page language="java" pageEncoding="utf-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
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
	<form:form commandName="cost" cssClass="main_form">w
		<div class="text_info clearfix"><span>资费ID：</span></div>
		<div class="input_info"><form:input path="cost_id" cssClass="readonly" readonly="true"/></div>
		<div class="text_info clearfix"><span>资费名称：</span></div>
		<div class="input_info"><form:input path="name" cssClass="readonly" readonly="true"/></div>
		<div class="text_info clearfix"><span>资费状态：</span></div>
		<div class="input_info">
			<form:select path="status" cssClass="readonly" disabled="true">
				<form:option value="0">开通</form:option>
				<form:option value="1">暂停</form:option>
				<form:option value="2">删除</form:option>
			</form:select>
		</div>
		<div class="text_info clearfix"><span>资费类型：</span></div>
		<div class="input_info fee_type">
			<form:radiobutton path="cost_type" value="1" label="包月"/>
			<form:radiobutton path="cost_type" value="2" label="套餐"/>
			<form:radiobutton path="cost_type" value="3" label="计时"/>
		</div>
		<div class="text_info clearfix"><span>基本时长：</span></div>
		<div class="input_info">
			<form:input path="base_duration" cssClass="readonly" readonly="true"/>
			<span>小时</span>
		</div>
		<div class="text_info clearfix"><span>基本费用：</span></div>
		<div class="input_info">
			<form:input path="base_cost" cssClass="readonly" readonly="true"/>
			<span>元</span>
		</div>
		<div class="text_info clearfix"><span>单位费用：</span></div>
		<div class="input_info">
			<form:input path="unit_cost" cssClass="readonly" readonly="true"/>
			<span>元/小时</span>
		</div>
		<div class="text_info clearfix"><span>创建时间：</span></div>
		<div class="input_info"><form:input path="creatime" cssClass="readonly" readonly="true"/></div>
		<div class="text_info clearfix"><span>启动时间：</span></div>
		<div class="input_info"><form:input path="startime" cssClass="readonly" readonly="true"/></div>
		<div class="text_info clearfix"><span>资费说明：</span></div>
		<div class="input_info_high">
			<form:textarea path="descr" cssClass="width300 height70 readonly" readonly="true"></form:textarea>
		</div>
		<div class="button_info clearfix">
			<input type="button" value="返回" class="btn_save" onclick="location.href='/NETCTOSS/fee/list/1';"/>
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
