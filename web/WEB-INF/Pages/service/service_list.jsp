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
		//删除
		function deleteAccount() {
			var r = window.confirm("确定要删除此业务账号吗？删除后将不能恢复。");
			document.getElementById("operate_result_info").style.display = "block";
		}
		//开通或暂停
		function setState() {
			var r = window.confirm("确定要开通此业务账号吗？");
			document.getElementById("operate_result_info").style.display = "block";
		}

		function doSearch(page) {
			var osusername = $('#osusername').val();
			var unixhost = $('#unixhost').val();
			var idcardNo = $('#idcardno').val();
			var status = $('#status').val();
			//根据条件变量状态生成RESTful查询的url
			var url = "/NETCTOSS/service/list/";
			if (osusername == "")
				url += "*";
			else
				url += osusername;
			if (unixhost == "")
				url += "/*"
			else
				url += "/" + unixhost;
			if (idcardNo == "")
				url += "/*";
			else
				url += "/" + idcardNo;
			//添加状态
			url += '/' + status;
			//添加页数
			url += '/' + page;
			window.location = url;//对应GET请求
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
	<form:form commandName="page" method="get">
		<!--查询-->
		<div class="search_add">
			<div>OS 账号：<form:input path="os_username" id="osusername" value=""
						     cssClass="width100 text_search"/></div>
			<div>服务器 IP：<form:input path="unix_host" id="unixhost" value=""
							cssClass="width100 text_search"/></div>
			<div>身份证：<form:input path="idcard_no" id="idcardno" value="" cssClass="text_search"/></div>
			<div>状态：
				<form:select path="status" id="status" cssClass="select_search">
					<form:option value="-1">全部</form:option>
					<form:option value="0">开通</form:option>
					<form:option value="1">暂停</form:option>
					<form:option value="2">删除</form:option>
				</form:select>
			</div>
			<div><input type="button" value="搜索" class="btn_search" onclick="doSearch(1);"/></div>
			<input type="button" value="增加" class="btn_add" onclick="location.href='/NETCTOSS/service/toAdd';"/>
		</div>
		<!--删除的操作提示-->
		<div id="operate_result_info" class="operate_success">
			<img src="../images/close.png" onclick="this.parentNode.style.display='none';"/>
			删除成功！
		</div>
		<!--数据区域：用表格展示数据-->
		<div id="data">
			<table id="datalist">
				<tr>
					<th class="width50">业务ID</th>
					<th class="width70">账务账号ID</th>
					<th class="width150">身份证</th>
					<th class="width70">姓名</th>
					<th>OS 账号</th>
					<th class="width50">状态</th>
					<th class="width100">服务器 IP</th>
					<th class="width100">资费</th>
					<th class="width200"></th>
				</tr>
				<tr>
					<c:forEach items="${services}" var="s">
					<td><a href="service_detail.html" title="查看明细">${s.id}</a></td>
					<td>${s.account_id}</td>
					<td>${s.idcard_no}</td>
					<td>${s.real_name}</td>
					<td>${s.os_username}</td>
					<td>${s.status}</td>
					<td>${s.unix_host}</td>
					<td>
						<a class="summary" onmouseover="showDetail(true,this);"
						   onmouseout="showDetail(false,this);">${s.cost_name}</a>
						<!--浮动的详细信息-->
						<div class="detail_info">
								${s.cost_descr}
						</div>
					</td>
					<td class="td_modi">
						<input type="button" value="暂停" class="btn_pause" onclick="setState();"/>
						<input type="button" value="修改" class="btn_modify"
							 onclick="location.href='service_modi.html';"/>
						<input type="button" value="删除" class="btn_delete"
							 onclick="deleteAccount();"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			<p>业务说明：<br/>
				1、创建即开通，记载创建时间；<br/>
				2、暂停后，记载暂停时间；<br/>
				3、重新开通后，删除暂停时间；<br/>
				4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br/>
				5、业务账号不设计修改密码功能，由用户自服务功能实现；<br/>
				6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p>
		</div>
		<!--分页-->
		<div id="pages">
			<a href="javascript:;doSearch(1)">首页</a>
			<c:choose>
				<c:when test="${page.page>1}">
					<a href="javascript:;doSearch(${page.page-1})">上一页</a>
				</c:when>
				<c:otherwise>
					<a href="#">上一页</a>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="1" end="${page.totalPage}" var="p">
				<c:choose>
					<c:when test="${page.page==p}">
						<a href="javascript:;doSearch(${p})" class="current_page">${p}</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:;doSearch(${p})">${p}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${page.page<page.totalPage}">
					<a href="javascript:;doSearch(${page.page+1})">下一页</a>
				</c:when>
				<c:otherwise>
					<a href="#">下一页</a>
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
