<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
	<script type="text/javascript" src="/NETCTOSS/js/jquery.js"></script>
	<script type="text/javascript">
		function checkPwd(pwd) {
			$.get("/NETCTOSS/checkPwd/" + pwd,
				  function (data) {
					  if (data) {
						  $('#submitBtn').setAttribute("disabled", "false");
					  } else {
						  $("#pwd_MSG").val("密码错误")
					  }
				  }
			)
		}

		function submitForm() {
			$('#form1').attr("action", "/NETCTOSS/user/changePwd" + $('#password').value);
			$('#form1').submit();
		}
	</script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
	<img src="/NETCTOSS/images/logo.png" alt="logo" class="left"/>
	<a href="/NETCTOSS/login/logOut">[退出]</a>
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
		<li><a href="../user/user_info.html" class="information_off"></a></li>
		<li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
	</ul>
</div>
<!--导航区域结束-->
<div id="main">
	<!--保存操作后的提示信息：成功或者失败-->
	<div id="save_result_info" class="save_success">保存成功！</div>
	<!--保存失败，旧密码错误！-->
	<form action="" method="put" class="main_form" id="form1">
		<div class="text_info clearfix"><span>旧密码：</span></div>
		<div class="input_info">
			<input type="password" class="width200" onblur="checkPwd(this.value)" id="pwd"/><span
			  class="required">*</span>

			<div class="validate_msg_medium" id="pwd_MSG"></div>
		</div>
		<div class="text_info clearfix"><span>新密码：</span></div>
		<div class="input_info">
			<input type="password" id="password" class="width200"/><span class="required">*</span>

			<div class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
		</div>
		<div class="text_info clearfix"><span>重复新密码：</span></div>
		<div class="input_info">
			<input type="password" class="width200"/><span class="required">*</span>

			<div class="validate_msg_medium">两次新密码必须相同</div>
		</div>
		<div class="button_info clearfix">
			<input type="button" value="保存" class="btn_save" disabled="true" id="submitBtn"
				 onclick="submitForm()"/>
			<input type="button" value="取消" class="btn_save"/>
		</div>
	</form>
</div>
<!--主要区域结束-->
<div id="footer">
	<p>NetCTOSS项目</p>

	<p>版权所有(C)XXX.Inc</p>
</div>
</body>
</html>
