<%@page language="java" pageEncoding="utf-8" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="../styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css"/>
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript">
		function doSubmit() {
			//提交表单
			var name = $('#admin_code').val();
			var passwd = $('#password').val();
			var code = $('#code').val();

			if (name.length > 30) {
				$('#admin_no').html("30长度的字母、数字和下划线");
			}
			if (name.length > 30) {
				$('#pwd').html("30长度的字母、数字和下划线");
			}
			//发生请求
			$.ajax({
				url: "login/" + code,
				type: "get",
				dataType: "json",
				beforeSend: function (xhr) {
					//将账号和密码放入HTTP请求的Header部分
					xhr.setRequestHeader("name", name);
					xhr.setRequestHeader("passwd", passwd);
				},
				//data是服务器返回内容
				success: function (data) {
					//根据返回的map中的login值判断是否登陆成功
					var ok = data.login;
					if (ok)
						window.location = "/NETCTOSS/login/toIndex";
					else {
						//登陆未成功将返回的错误信息显示
						$("#code_error").html(data.code_error);
						$("#error").html(data.error);
						//刷新验证码信息
						$('#scode').attr("src", "/NETCTOSS/login/getCode?date=" + new Date().getTime());
					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					// 通常 textStatus 和 errorThrown 之中
					// 只有一个会包含信息
//					alert(XMLHttpRequest.responseText);
				}
			});
		}

		function changeScode(img) {
			img.src = "getCode?date=" + new Date().getTime();
		}

	</script>
</head>
<body class="index">
<form id="loginForm">
	<div class="login_box">
		<table>
			<tr>
				<td class="login_info">账号：</td>
				<td colspan="2"><input id="admin_code" type="text" class="width150"/></td>
				<td class="login_error_info"><span class="required" id="admin_no"></span></td>
			</tr>
			<tr>
				<td class="login_info">密码：</td>
				<td colspan="2"><input id="password" type="password" class="width150"/></td>
				<td><span class="required" id="pwd"></span></td>
			</tr>
			<tr>
				<td class="login_info">验证码：</td>
				<td class="width70"><input id="code" type="text" class="width70"/></td>
				<td><img src="getCode" id="scode" alt="验证码" onclick="changeScode(this);" title="点击更换"/></td>
				<td><span class="required" id="code_error"></span></td>
			</tr>
			<tr>
				<td></td>
				<td class="login_button" colspan="2">
					<a href="#" onkeydown="" onclick="doSubmit();"><img src="/NETCTOSS/images/login_btn.png"/></a>
				</td>
				<td><span class="required" id="error" style="color: red"></span></td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>
