<%@page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
	<script language="javascript" type="text/javascript" src="/NETCTOSS/js/jquery.js"></script>
	<script language="javascript" type="text/javascript">
		//校验身份证
		function check_idcardno(idcardno) {
			//重置生日
			$("#birthdate").val("");

			//如果身份证为空，则给出提示
			if (idcardno == "") {
				$("#idcardno_msg").text("身份证号不能为空！").addClass("error_msg");
				return;
			}

			//如果身份证格式不对，则给出提示
			var reg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
			if (!reg.test(idcardno)) {
				$("#idcardno_msg").text("身份证号格式不正确！").addClass("error_msg");
				return;
			}

			//校验通过，给予提示，并移除错误样式
			$("#idcardno_msg").text("有效的身份证号").removeClass("error_msg");

			//根据身份证提取出生日，赋值给生日字段
			var birthdate = idcardno.substring(6, 10) + "-" + idcardno.substring(10, 12) + "-" + idcardno.substring(12, 14);
			$("#birthdate").val(birthdate);
		}
		//查询推荐人ID
		function search_recommender() {
			//重置recommender_id
			$("#recommender_id").val("");

			//如果身份证为空，则返回
			var idcardno = $("#recommender_idcardno").val();
			if (idcardno == "") {
				$("#recommender_msg").text("正确的身份证号码格式").removeClass("error_msg");
				return;
			}

			//如果身份证格式不对，则给出提示
			var reg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
			if (!reg.test(idcardno)) {
				$("#recommender_msg").text("身份证号格式不正确！").addClass("error_msg");
				return;
			}

			$.post(
				  "searchAccount",
				  {"idcardNo": idcardno},
				  function (data) {
					  if (data == "") {
						  $("#recommender_msg").text("推荐人不存在！").addClass("error_msg");
					  } else {
						  $("#recommender_msg").text("推荐人有效！").removeClass("error_msg");
						  $("#recommender_id").val(data.account_id);
					  }
				  }
			);
		}

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

		//显示选填的信息项
		function showOptionalInfo(imgObj) {
			var div = document.getElementById("optionalInfo");
			if (div.className == "hide") {
				div.className = "show";
				imgObj.src = "/NETCTOSS/images/hide.png";
			}
			else {
				div.className = "hide";
				imgObj.src = "/NETCTOSS/images/show.png";
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
	<li><a href="../index.html" class="index_off"></a></li>
	<li><a href="../role/role_list.html" class="role_off"></a></li>
	<li><a href="../admin/admin_list.html" class="admin_off"></a></li>
	<li><a href="../fee/fee_list.html" class="fee_off"></a></li>
	<li><a href="../account/account_list.html" class="account_on"></a></li>
	<li><a href="../service/service_list.html" class="service_off"></a></li>
	<li><a href="../bill/bill_list.html" class="bill_off"></a></li>
	<li><a href="../report/report_list.html" class="report_off"></a></li>
	<li><a href="/NETCTOSS/user/info" class="information_off"></a></li>
	<li><a href="/NETCTOSS/user/toChangePwd" class="password_off"></a></li>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
	<!--保存成功或者失败的提示消息-->
	<div id="save_result_info" class="save_fail">保存失败，该身份证已经开通过账务账号！</div>
	<form action="/NETCTOSS/fee/add" method="post" class="main_form">
		<!--必填项-->
		<div class="text_info clearfix"><span>姓名：</span></div>
		<div class="input_info">
			<input type="text" name="real_name"/>
			<span class="required">*</span>

			<div class="validate_msg_long">20长度以内的汉字、字母和数字的组合</div>
		</div>
		<div class="text_info clearfix"><span>身份证：</span></div>
		<div class="input_info">
			<input type="text" name="idcard_no" onblur="check_idcardno(this.value);"/>
			<span class="required">*</span>

			<div class="validate_msg_long" id="idcardno_msg">正确的身份证号码格式</div>
		</div>
		<div class="text_info clearfix"><span>登录账号：</span></div>
		<div class="input_info">
			<input type="text" name="login_name"/>
			<span class="required">*</span>

			<div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
		</div>
		<div class="text_info clearfix"><span>密码：</span></div>
		<div class="input_info">
			<input type="password" name="login_passwd"/>
			<span class="required">*</span>

			<div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
		</div>
		<div class="text_info clearfix"><span>重复密码：</span></div>
		<div class="input_info">
			<input type="password"/>
			<span class="required">*</span>

			<div class="validate_msg_long">两次密码必须相同</div>
		</div>
		<div class="text_info clearfix"><span>电话：</span></div>
		<div class="input_info">
			<input type="text" class="width200" name="telephone"/>
			<span class="required">*</span>

			<div class="validate_msg_medium">正确的电话号码格式：手机或固话</div>
		</div>
		<!--可选项-->
		<div class="text_info clearfix"><span>可选项：</span></div>
		<div class="input_info">
			<img src="../images/show.png" alt="展开" onclick="showOptionalInfo(this);"/>
		</div>
		<div id="optionalInfo" class="hide">
			<div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
			<div class="input_info">
				<input type="text" id="recommender_idcardno" onblur="search_recommender();"/>
				<input type="hidden" name="recommender_id" id="recommender_id"/>

				<div class="validate_msg_long" id="recommender_msg">正确的身份证号码格式</div>
			</div>
			<div class="text_info clearfix"><span>生日：</span></div>
			<div class="input_info">
				<input type="text" name="birthdate" readonly class="readonly" id="birthdate"/>
			</div>
			<div class="text_info clearfix"><span>Email：</span></div>
			<div class="input_info">
				<input type="text" class="width350" name="email"/>

				<div class="validate_msg_tiny">50长度以内，合法的 Email 格式</div>
			</div>
			<div class="text_info clearfix"><span>职业：</span></div>
			<div class="input_info">
				<select name="occupation">
					<option value="">全部</option>
					<option value="1">干部</option>
					<option value="2">学生</option>
					<option value="3">技术人员</option>
					<option value="4">其他</option>
				</select>
			</div>
			<div class="text_info clearfix"><span>性别：</span></div>
			<div class="input_info fee_type">
				<input type="radio" name="gender" value="1" checked="checked" id="female"/>
				<label for="female">女</label>
				<input type="radio" name="gender" value="0" id="male"/>
				<label for="male">男</label>
			</div>
			<div class="text_info clearfix"><span>通信地址：</span></div>
			<div class="input_info">
				<input type="text" class="width350" name="mailaddress"/>

				<div class="validate_msg_tiny">50长度以内</div>
			</div>
			<div class="text_info clearfix"><span>邮编：</span></div>
			<div class="input_info">
				<input type="text" name="zipcode"/>

				<div class="validate_msg_long">6位数字</div>
			</div>
			<div class="text_info clearfix"><span>QQ：</span></div>
			<div class="input_info">
				<input type="text" name="qq"/>

				<div class="validate_msg_long">5到13位数字</div>
			</div>
		</div>
		<!--操作按钮-->
		<div class="button_info clearfix">
			<input type="submit" value="保存" class="btn_save"/>
			<input type="button" value="取消" class="btn_save" onclick="history.back();"/>
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