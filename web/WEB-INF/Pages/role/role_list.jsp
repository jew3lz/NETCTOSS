<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
	<script language="javascript" type="text/javascript">
		function deleteRole() {
			var r = window.confirm("确定要删除此角色吗？");
			document.getElementById("operate_result_info").style.display = "block";
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
<!--主要区域开始-->
<div id="main">
	<form action="" method="">
		<!--查询-->
		<div class="search_add">
			<input type="button" value="增加" class="btn_add" onclick="location.href='/NETCTOSS/role/toAdd';"/>
		</div>
		<!--删除的操作提示-->
		<div id="operate_result_info" class="operate_success">
			<img src="../images/close.png" onclick="this.parentNode.style.display='none';"/>
			删除成功！
		</div>
		<!--删除错误！该角色被使用，不能删除。-->
		<!--数据区域：用表格展示数据-->
		<div id="data">
			<table id="datalist">
				<tr>
					<th>角色 ID</th>
					<th>角色名称</th>
					<th class="width600">拥有的权限</th>
					<th class="td_modi"></th>
				</tr>
				<c:forEach items="${roles}" var="role">
					<tr>
						<td>${role.role_id}</td>
						<td>${role.name}</td>
						<td>${role.prisName}</td>
						<td>
							<input type="button" value="修改" class="btn_modify"
								 onclick="location.href='/NETCTOSS/role/${role.role_id}/toUpdate';"/>
							<input type="button" value="删除" class="btn_delete" onclick="deleteRole();"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!--分页-->
		<div id="pages">
			<c:choose>
				<c:when test="${page.page>1}">
					<a href="${page.page-1}">上一页</a>
				</c:when>
				<c:otherwise>
					<a href="#">上一页</a>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="1" end="${page.totalPage}" var="i">
				<c:choose>
					<c:when test="${page.page==i}">
						<a href="${i}" class="current_page">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${page.page<page.totalPage}">
					<a href="${page.page+1}">下一页</a>
				</c:when>
				<c:otherwise>
					<a href="#">下一页</a>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
</div>
<!--主要区域结束-->
<div id="footer">
	<p>NetCTOSS项目</p>

	<p>版权所有(C)XXX.Inc </p>
</div>
</body>
</html>
