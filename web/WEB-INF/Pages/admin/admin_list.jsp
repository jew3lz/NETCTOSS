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
		//显示角色详细信息
		function showDetail(flag, a) {
			var detailDiv = a.parentNode.getElementsByTagName("div")[0];
			if (flag) {
				detailDiv.style.display = "block";
			}
			else
				detailDiv.style.display = "none";
		}
		//重置密码
		function resetPwd() {
			alert("请至少选择一条数据！");
			//document.getElementById("operate_result_info").style.display = "block";
		}
		//删除
		function deleteAdmin() {
			var r = window.confirm("确定要删除此管理员吗？");
			document.getElementById("operate_result_info").style.display = "block";
		}
		//全选
		function selectAdmins(inputObj) {
			var inputArray = document.getElementById("datalist").getElementsByTagName("input");
			for (var i = 1; i < inputArray.length; i++) {
				if (inputArray[i].type == "checkbox") {
					inputArray[i].checked = inputObj.checked;
				}
			}
		}

		function doSearch() {
			var url = "/NETCTOSS/admin/list/";
			var priId = $('#selModules').val();
			var role = $('#selRole').val();
			if (priId == "")
				url += "-1";
			else
				url += priId;
			if (role == "")
				url += "/*";
			else
				url += "/" + role;
			url += "/" + ${page.page};
			window.location = url;
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
		<li><a href="../user/user_info.html" class="information_off"></a></li>
		<li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
	</ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
	<form:form commandName="page" action="get">
		<!--查询-->
		<div class="search_add">
			<div>
				权限：
				<form:select path="priId" id="selModules" cssClass="select_search">
					<form:option value="-1" label="全部"/>
					<c:forEach items="${modules}" var="module">
						4 <form:option value="${module.id}" label="${module.name}"/>
					</c:forEach>
				</form:select>
			</div>
			<div>角色：<form:input id="selRole" path="roleName" value="" cssClass="text_search width200"/></div>
			<div><input type="button" value="搜索" class="btn_search" onclick="doSearch()"/></div>
			<input type="button" value="密码重置" class="btn_add" onclick="resetPwd();"/>
			<input type="button" value="增加" class="btn_add" onclick="location.href='/NETCTOSS/admin/toAdd';"/>
		</div>
		<!--删除和密码重置的操作提示-->
		<div id="operate_result_info" class="operate_fail">
			<img src="../images/close.png" onclick="this.parentNode.style.display='none';"/>
			<span>删除失败！数据并发错误。</span><!--密码重置失败！数据并发错误。-->
		</div>
		<!--数据区域：用表格展示数据-->
		<div id="data">
			<table id="datalist">
				<tr>
					<th class="th_select_all">
						<input type="checkbox" onclick="selectAdmins(this);"/>
						<span>全选</span>
					</th>
					<th>管理员ID</th>
					<th>姓名</th>
					<th>登录名</th>
					<th>电话</th>
					<th>电子邮件</th>
					<th>授权日期</th>
					<th class="width100">拥有角色</th>
					<th></th>
				</tr>
				<c:forEach items="${admins}" var="admin">
					<tr>
						<td><input type="checkbox"/></td>
						<td>${admin.admin_id}</td>
						<td>${admin.name}</td>
						<td>${admin.admin_code}</td>
						<td>${admin.telephone}</td>
						<td>${admin.email}</td>
						<td>${admin.enrolldate}</td>
						<td>
							<a class="summary" onmouseover="showDetail(true,this);"
							   onmouseout="showDetail(false,this);">${admin.roles[0].name}...</a>
							<!--浮动的详细信息-->
							<div class="detail_info">
									${admin.roleNames}
							</div>
						</td>
						<td class="td_modi">
							<input type="button" value="修改" class="btn_modify"
								 onclick="location.href='/NETCTOSS/admin/${admin.admin_id}/toUpdateAdmin';"/>
							<input type="button" value="删除" class="btn_delete" onclick="deleteAdmin();"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!--分页-->
		<div id="pages">
			<a href="#">上一页</a>
			<a href="#" class="current_page">1</a>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#">下一页</a>
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
