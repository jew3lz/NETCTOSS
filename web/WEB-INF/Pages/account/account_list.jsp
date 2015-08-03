<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
	<script type="text/javascript" src="/NETCTOSS/js/jquery.js"></script>
	<script language="javascript" type="text/javascript">

		//按钮处理
		function doSearch(page) {
			var idCardId = $('#idCardNo').val();
			var loginName = $('#login_name').val();
			var realName = $('#real_name').val();
			var status = $('#status').val();
			//根据条件变量状态生成RESTful查询的url
			var url = "/NETCTOSS/account/account_list/"
			if (idCardId == "")
				url += '*';
			else
				url += idCardId;
			if (realName == "")
				url += '/*';
			else
				url += '/' + realName;
			if (loginName == "")
				url += '/*';
			else
				url += '/' + loginName
			url += '/' + status;
			//添加页数
			url += '/' + page;

			window.location = url;//对应GET请求
		}

		//删除
		function deleteAccount(id) {
			var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
			$({
					  url:"/NETCTOSS/account" + id,
					  type:"delete",
					  success: function (msg) {
						  if (msg) {
							  window.location = "/NETCTOSS/account/account_list/*/*/*/-1/" + ${page.page};
						  }
					  }
				  }
			)
			document.getElementById("operate_result_info").style.display = "block";
		}

		//开通或暂停
		function setState(id) {
			var r = window.confirm("确定要开通或暂停此账务账号吗？");
			if (r) {
				window.location = "/NETCTOSS/account/" + id + "/changeStatus";
			}
			document.getElementById("operate_result_info").style.display = "block";
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
	<form:form commandName="page">
		<!--查询-->
		<div class="search_add">
			<div>身份证：<form:input path="idcard_no" type="text" value="" id="idCardNo"
						   cssClass="text_search"/></div>
			<div>姓名：<form:input path="real_name" type="text" addClass="width70 text_search" value=""
						  id="real_name"/></div>
			<div>登录名：<form:input path="login_name" type="text" value="" cssClass="text_search"
						   id="login_name"/></div>
			<div>
				状态：
				<form:select path="status" id="status" cssClass="select_search">
					<form:option value="-1">全部</form:option>
					<form:option value="0">开通</form:option>
					<form:option value="1">暂停</form:option>
					<form:option value="2">删除</form:option>
				</form:select>
			</div>
			<div><input type="button" value="搜索" class="btn_search" onclick="doSearch(1)"/></div>
			<input type="button" value="增加" class="btn_add" onclick="location.href='/NETCTOSS/account/toAdd';"/>
		</div>
		<!--删除等的操作提示-->
		<div id="operate_result_info" class="operate_success">
			<img src="../images/close.png" onclick="this.parentNode.style.display='none';"/>
			删除成功，且已删除其下属的业务账号！
		</div>
		<!--数据区域：用表格展示数据-->
		<div id="data">
			<table id="datalist">
				<tr>
					<th>账号ID</th>
					<th>姓名</th>
					<th class="width150">身份证</th>
					<th>登录名</th>
					<th>状态</th>
					<th class="width100">创建日期</th>
					<th class="width150">上次登录时间</th>
					<th class="width200"></th>
				</tr>
				<c:forEach items="${accounts}" var="account">
					<tr>
						<td>${account.id}</td>
						<td><a href="/NETCTOSS/account/${account.id}">${account.real_name}</a></td>
						<td>${account.idcard_no}</td>
						<td>${account.login_name}</td>
						<td>${account.status}</td>
						<td>${account.create_date}</td>
						<td>${account.last_login_time}</td>
						<td class="td_modi">
							<input type="button" value="暂停" id="btn_change" class="btn_pause"
								 onclick="setState(${account.id});"/>
							<input type="button" value="修改" class="btn_modify"
								 onclick="location.href='/NETCTOSS/account/${account.id}/toUpdate';"/>
							<input type="button" value="删除" class="btn_delete"
								 onclick="deleteAccount();"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			<p>业务说明：<br/>
				1、创建则开通，记载创建时间；<br/>
				2、暂停后，记载暂停时间；<br/>
				3、重新开通后，删除暂停时间；<br/>
				4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br/>
				5、暂停账务账号，同时暂停下属的所有业务账号；<br/>
				6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br/>
				7、删除账务账号，同时删除下属的所有业务账号。</p>
		</div>
		<!--分页-->
		<div id="pages">
			<a href="javascript:;doSearch(1)">首页</a>
			<c:choose>
				<c:when test="${page.page>1}">
					<a href="javascript:;doSearch(${page.page-1})">上一页</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:;">上一页</a>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${page.totalPage}">
				<c:choose>
					<c:when test="${i==page.page}">
						<a href="javascript:;doSearch(${i})" class="current_page">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:;doSearch(${i})">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${page.page<page.totalPage}">
					<a href="javascript:;doSearch(${page.page+1})">下一页</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:;">下一页</a>
				</c:otherwise>
			</c:choose>
			<a href="javascript:;doSearch(${page.totalPage})">末页</a>
		</div>
	</form:form>
</div>
<!--主要区域结束-->
<div id="footer">
	<p>NetCTOSS项目</p>

	<p>版权所有(C)XXX.Inc </p>
</div>
</body>
</html>
