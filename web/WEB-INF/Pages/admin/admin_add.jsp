﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
	<script language="javascript" type="text/javascript">
		//保存成功的提示消息
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
	<form action="/NETCTOSS/admin/add" method="post" class="main_form">
		<div class="text_info clearfix"><span>姓名：</span></div>
		<div class="input_info">
			<input type="text" name="name"/>
			<span class="required">*</span>

			<div class="validate_msg_long">20长度以内的汉字、字母、数字的组合</div>
		</div>
		<div class="text_info clearfix"><span>管理员账号：</span></div>
		<div class="input_info">
			<input type="text" name="admin_code"/>
			<span class="required">*</span>

			<div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
		</div>
		<div class="text_info clearfix"><span>密码：</span></div>
		<div class="input_info">
			<input type="password" name="password"/>
			<span class="required">*</span>

			<div class="validate_msg_long error_msg">30长度以内的字母、数字和下划线的组合</div>
		</div>
		<div class="text_info clearfix"><span>重复密码：</span></div>
		<div class="input_info">
			<input type="password"/>
			<span class="required">*</span>

			<div class="validate_msg_long error_msg">两次密码必须相同</div>
		</div>
		<div class="text_info clearfix"><span>电话：</span></div>
		<div class="input_info">
			<input type="text" class="width200" name="telephone"/>
			<span class="required">*</span>

			<div class="validate_msg_medium error_msg">正确的电话号码格式：手机或固话</div>
		</div>
		<div class="text_info clearfix"><span>Email：</span></div>
		<div class="input_info">
			<input type="text" class="width200" name="email"/>
			<span class="required">*</span>

			<div class="validate_msg_medium error_msg">50长度以内，正确的 email 格式</div>
		</div>
		<div class="text_info clearfix"><span>角色：</span></div>
		<div class="input_info_high">
			<div class="input_info_scroll">
				<ul>
					<c:forEach items="${roles}" var="r">
						<li><input type="checkbox" value="${r.role_id}" name="roleIds"/>${r.name}</li>
					</c:forEach>
				</ul>
			</div>
			<span class="required">*</span>

			<div class="validate_msg_tiny error_msg">至少选择一个</div>
		</div>
		<div class="button_info clearfix">
			<input type="submit" value="保存" class="btn_save"/>
			<input type="button" value="取消" class="btn_save"/>
		</div>
	</form>
</div>
<!--主要区域结束-->
<div id="footer">
	<span>NetCTOSS项目</span>
	<br/>
	<span>版权所有(C)XXX.Inc </span>
</div>
</body>
</html>
