<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
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

		//显示修改密码的信息项
		function showPwd(chkObj) {
			if (chkObj.checked)
				document.getElementById("divPwds").style.display = "block";
			else
				document.getElementById("divPwds").style.display = "none";
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
	<!--保存成功或者失败的提示消息-->
	<%--<div id="save_result_info" class="save_fail">保存失败，旧密码错误！</div>--%>
	<form:form commandName="account" action="/NETCTOSS/account/${account.id}" method="put" cssClass="main_form">
		<!--必填项-->
		<div class="text_info clearfix"><span>账务账号ID：</span></div>
		<div class="input_info">
			<form:input path="id" readonly="true" cssClass="readonly"/>
		</div>
		<div class="text_info clearfix"><span>姓名：</span></div>
		<div class="input_info">
			<form:input path="real_name"/>
			<span class="required">*</span>

			<div class="validate_msg_long error_msg">20长度以内的汉字、字母和数字的组合</div>
		</div>
		<div class="text_info clearfix"><span>身份证：</span></div>
		<div class="input_info">
			<form:input path="idcard_no" readonly="true" cssClass="readonly"/>
		</div>
		<div class="text_info clearfix"><span>登录账号：</span></div>
		<div class="input_info">
			<form:input path="login_name" readonly="true" cssClass="readonly"/>
			<!--
			<div class="change_pwd">
			    <input id="chkModiPwd" type="checkbox" onclick="showPwd(this);" />
			    <label for="chkModiPwd">修改密码</label>
			</div>
			-->
		</div>
		<!--修改密码部分-->
		<!--
		<div id="divPwds">
		<div class="text_info clearfix"><span>旧密码：</span></div>
		<div class="input_info">
		<input type="password" />
		<span class="required">*</span>
		<div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
		</div>
		<div class="text_info clearfix"><span>新密码：</span></div>
		<div class="input_info">
		<input type="password" />
		<span class="required">*</span>
		<div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
		</div>
		<div class="text_info clearfix"><span>重复新密码：</span></div>
		<div class="input_info">
		<input type="password" />
		<span class="required">*</span>
		<div class="validate_msg_long">两次密码必须相同</div>
		</div>
		</div>
		-->
		<div class="text_info clearfix"><span>电话：</span></div>
		<div class="input_info">
			<form:input path="telephone" cssClass="width200"/>
			<span class="required">*</span>

			<div class="validate_msg_medium error_msg">正确的电话号码格式：手机或固话</div>
		</div>
		<div class="text_info clearfix"><span>推荐人ID号码：</span></div>
		<div class="input_info">
			<form:input path="recommender_id"/>
			<div class="validate_msg_long error_msgs">正确的ID号码格式</div>
		</div>
		<div class="text_info clearfix"><span>生日：</span></div>
		<div class="input_info">
			<form:input path="birthdate" readonly="true" class="readonly"/>
		</div>
		<div class="text_info clearfix"><span>Email：</span></div>
		<div class="input_info">
			<form:input path="email" cssClass="width200"/>

			<div class="validate_msg_medium">50长度以内，合法的 Email 格式</div>
		</div>
		<div class="text_info clearfix"><span>职业：</span></div>
		<div class="input_info">
			<select>
				<option>干部</option>
				<option>学生</option>
				<option>技术人员</option>
				<option>其他</option>
			</select>
		</div>
		<div class="text_info clearfix"><span>性别：</span></div>
		<div class="input_info fee_type">
			<form:radiobutton path="gender" value="1" label="男" name="radSex" id="female"/>
			<form:radiobutton path="gender" value="0" label="女" name="radSex" id="male"/>
		</div>
		<div class="text_info clearfix"><span>通信地址：</span></div>
		<div class="input_info">
			<form:input path="mailaddress" cssClass="width350"/>

			<div class="validate_msg_tiny">50长度以内</div>
		</div>
		<div class="text_info clearfix"><span>邮编：</span></div>
		<div class="input_info">
			<form:input path="zipcode"/>

			<div class="validate_msg_long">6位数字</div>
		</div>
		<div class="text_info clearfix"><span>QQ：</span></div>
		<div class="input_info">
			<form:input path="qq"/>

			<div class="validate_msg_long">5到13位数字</div>
		</div>
		<!--操作按钮-->
		<div class="button_info clearfix">
			<input type="submit" value="保存" class="btn_save"/>
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
