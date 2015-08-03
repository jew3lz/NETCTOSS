<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="../styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css"/>
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
		<li><a href="../user/user_info.html" class="information_off"></a></li>
		<li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
	</ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
	<form:form action="" commandName="account" cssClass="main_form">
		<!--必填项-->
		<div class="text_info clearfix"><span>账务账号ID：</span></div>
		<div class="input_info"><form:input path="id" readonly="true" cssClass="readonly"/></div>
		<div class="text_info clearfix"><span>姓名：</span></div>
		<div class="input_info"><form:input path="real_name" readonly="true" cssClass="readonly"/></div>
		<div class="text_info clearfix"><span>身份证：</span></div>
		<div class="input_info">
			<form:input path="idcard_no" readonly="true" cssClass="readonly"/>
		</div>
		<div class="text_info clearfix"><span>登录账号：</span></div>
		<div class="input_info">
			<form:input path="login_name" readonly="true" cssClass="readonly"/>
		</div>
		<div class="text_info clearfix"><span>电话：</span></div>
		<div class="input_info">
			<form:input path="telephone" cssClass="width200 readonly" readonly="true"/>
		</div>
		<div class="text_info clearfix"><span>推荐人账务账号ID：</span></div>
		<div class="input_info"><form:input path="recommender_id" readonly="true" cssClass="readonly"/></div>
		<div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
		<div class="input_info"><input type="text" readonly class="readonly" value="230198765432123456"/></div>
		<div class="text_info clearfix"><span>状态：</span></div>
		<div class="input_info">
			<form:select disabled="true" path="status">
				<form:option value="0">开通</form:option>
				<form:option value="1">暂停</form:option>
				<form:option value="2">删除</form:option>
			</form:select>
		</div>
		<div class="text_info clearfix"><span>开通/暂停/删除时间：</span></div>
		<div class="input_info"><form:input path="create_date" readonly="true" cssClass="readonly"/></div>

		<div class="text_info clearfix"><span>上次登录时间：</span></div>
		<div class="input_info"><form:input path="last_login_time" readonly="true" cssClass="readonly"/></div>
		<div class="text_info clearfix"><span>上次登录IP：</span></div>
		<div class="input_info"><form:input path="last_login_ip" readonly="true" cssClass="readonly"/></div>
		<!--可选项数据-->
		<div class="text_info clearfix"><span>生日：</span></div>
		<div class="input_info">
			<form:input path="birthdate" readonly="true" cssClass="readonly"/>
		</div>
		<div class="text_info clearfix"><span>Email：</span></div>
		<div class="input_info">
			<form:input path="email" cssClass="width350 readonly" readonly="true"/>
		</div>
		<div class="text_info clearfix"><span>职业：</span></div>
		<div class="input_info">
			<select disabled>
				<option>干部</option>
				<option>学生</option>
				<option>技术人员</option>
				<option>其他</option>
			</select>
		</div>
		<div class="text_info clearfix"><span>性别：</span></div>
		<div class="input_info fee_type">
			<form:radiobutton path="gender" value="1" label="男" name="radSex" checked="checked" id="female"
						disabled="true"/>
			<form:radiobutton path="gender" value="0" label="女" name="radSex" id="male" disabled="true"/>
		</div>
		<div class="text_info clearfix"><span>通信地址：</span></div>
		<div class="input_info"><input type="text" class="width350 readonly" readonly value="北京市海淀区北三环中路甲18号中鼎大厦"/>
		</div>
		<div class="text_info clearfix"><span>邮编：</span></div>
		<div class="input_info"><form:input path="mailaddress" cssClass="readonly" readonly="true"/></div>
		<div class="text_info clearfix"><span>QQ：</span></div>
		<div class="input_info"><form:input path="qq" cssClass="readonly" readonly="true"/></div>
		<!--操作按钮-->
		<div class="button_info clearfix">
			<input type="button" value="返回" class="btn_save"
				 onclick="location.href='/NETCTOSS/account/account_list/*/*/*/-1/1';"/>
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
