﻿<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
	<script language="javascript" type="text/javascript">
		var timer;
		//启动跳转的定时器
		function startTimes() {
			timer = window.setInterval(showSecondes, 1000);
		}

		var i = 5;
		function showSecondes() {
			if (i > 0) {
				i--;
				document.getElementById("secondes").innerHTML = i;
			}
			else {
				window.clearInterval(timer);
				location.href = "/NETCTOSS/login/toIndex";
			}
		}

		//取消跳转
		function resetTimer() {
			if (timer != null && timer != undefined) {
				window.clearInterval(timer);
				location.href = "/NETCTOSS/login/toIndex";
			}
		}
	</script>
</head>
<body class="error_power_page" onload="startTimes();">
<br/><br/><br/><br/>
<h1 id="error">
	您无权访问此页面，&nbsp;<span id="secondes">5</span>&nbsp;秒后将自动跳转，立即跳转请点击&nbsp;
	<a class="/NETCTOSS/login/toIndex" href="javascript:resetTimer();">返回</a>
</h1>
</body>
</html>
