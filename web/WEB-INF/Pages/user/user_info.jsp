<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="../styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css"/>
	<script language="javascript" type="text/javascript">
		//保存成功的提示信息
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
	<img src="../images/logo.png" alt="logo" class="left"/>
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
	<!--保存操作后的提示信息：成功或者失败-->
	<div id="save_result_info" class="save_success">保存成功！</div>
	<!--保存失败，数据并发错误！-->
	<form:form commandName="admin" action="/NETCTOSS/user/${admin.admin_id}/update" method="put" cssClass="main_form">
		<div class="text_info clearfix"><span>管理员账号：</span></div>
		<div class="input_info"><form:input path="admin_code" readonly="true" cssClass="readonly"/></div>
		<div class="text_info clearfix"><span>角色：</span></div>
		<div class="input_info">
			<form:input path="roleNames" readonly= "true" cssClass="readonly width400"/>
		</div>
		<div class="text_info clearfix"><span>姓名：</span></div>
		<div class="input_info">
			<form:input path="name"/>
			<span class="required">*</span>

			<div class="validate_msg_long error_msg">20长度以内的汉字、字母的组合</div>
		</div>
		<div class="text_info clearfix"><span>电话：</span></div>
		<div class="input_info">
			<form:input path="telephone" cssClass="width200"/>

			<div class="validate_msg_medium">电话号码格式：手机或固话</div>
		</div>
		<div class="text_info clearfix"><span>Email：</span></div>
		<div class="input_info">
			<form:input path="email" cssClass="width200"/>

			<div class="validate_msg_medium">50长度以内，符合 email 格式</div>
		</div>
		<div class="text_info clearfix"><span>创建时间：</span></div>
		<div class="input_info"><form:input path="enrolldate" readonly="true" cssClass="readonly"/>
		</div>
		<div class="button_info clearfix">
			<input type="submit" value="保存" class="btn_save"/>
			<input type="button" value="取消" class="btn_save"/>
		</div>
	</form:form>
</div>
<!--主要区域结束-->
<div id="footer">
	<p>NetCTOSS项目</p>

	<p>版权所有(C)XXX.Inc</p>
</div>
</body>
</html>
