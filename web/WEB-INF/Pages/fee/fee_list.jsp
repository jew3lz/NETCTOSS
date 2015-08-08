<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>NetCTOSS</title>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global.css"/>
	<link type="text/css" rel="stylesheet" media="all" href="/NETCTOSS/styles/global_color.css"/>
	<script type="text/javascript" src="/NETCTOSS/js/jquery.js"></script>
	<script language="javascript" type="text/javascript">
		//排序按钮的点击事件
		function sort(btnObj) {
			if (btnObj.className == "sort_desc")
				btnObj.className = "sort_asc";
			else
				btnObj.className = "sort_desc";
		}

		//启用
		function startFee(id) {
			var r = window.confirm("确定要启用此资费吗?资费启用后将不能修改和删除.");
			if (r) {
				window.location = ("../" + id + "/startCost");
			}
		}
		//删除
		function deleteFee(id) {
			var r = window.confirm("确定要删除此资费吗?");
			// TODO 动态显示操作信息
			if (r) {
				//确定删除,属于GET请求,要用DELETE请求,要用AJAX
				//window.location =  "../"+id;
				$.ajax({
					url: "../" + id,
					type: "DELETE",
					success: function (msg) {
						if (msg) {
							window.location = "../list/" + ${page.page};
						}
					}
				});
			}

		}
	</script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
	<img src="/NETCTOSS/images/logo.png" alt="logo" class="left"/>
	<a href="../../login/logOut">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
	<ul id="menu">
		<li><a href="/NETCTOSS/login/toIndex" class="index_off"></a></li>
		<li><a href="/NETCTOSS/role/list/1" class="role_off"></a></li>
		<li><a href="/NETCTOSS/admin/list/-1/*/1" class="admin_off"></a></li>
		<li><a href="1" class="fee_on"></a></li>
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
		<!--排序-->
		<div class="search_add">
			<div>
				<input type="button" value="月租" class="sort_asc" onclick="sort(this);"/>
				<input type="button" value="基费" class="sort_asc" onclick="sort(this);"/>
				<input type="button" value="时长" class="sort_asc" onclick="sort(this);"/>
			</div>
			<input type="button" value="增加" class="btn_add" onclick="location.href='../toAdd';"/>
		</div>
		<!--启用操作的操作提示-->
		<div id="operate_result_info" class="operate_success">
			<img src="../images/close.png" onclick="this.parentNode.style.display='none';"/>
			删除成功！
		</div>
		<!--数据区域：用表格展示数据-->
		<div id="data">
			<table id="datalist">
				<tr>
					<th>资费ID</th>
					<th class="width100">资费名称</th>
					<th>基本时长</th>
					<th>基本费用</th>
					<th>单位费用</th>
					<th>创建时间</th>
					<th>开通时间</th>
					<th class="width50">状态</th>
					<th class="width200"></th>
				</tr>
				<c:forEach items="${costs}" var="cost">
					<tr>
						<td>${cost.cost_id}</td>
						<td><a href="/NETCTOSS/fee/${cost.cost_id}/detail">${cost.name}</a></td>
						<td>${cost.base_duration} 小时</td>
						<td>${cost.base_cost} 元</td>
						<td>${cost.unit_cost} 元/小时</td>
						<td>${cost.creatime}</td>
						<td>${cost.startime}</td>
						<td>${cost.status=="1"?"暂停":"开通"}</td>
						<td>
								<%-- 判断要在暂停状态下才能进行操作 --%>
							<c:if test="${cost.status=='1'}">
								<input type="button" value="启用" class="btn_start"
									 onclick="startFee(${cost.cost_id});"/>
								<input type="button" value="修改" class="btn_modify"
									 onclick="location.href='../${cost.cost_id}/toUpdate';"/>
								<input type="button" value="删除" class="btn_delete"
									 onclick="deleteFee(${cost.cost_id});"/>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<p>业务说明：<br/>
				1.创建资费时,状态为暂停,记载创建时间;<br/>
				2.暂停状态下,可修改,可删除;<br/>
				3.开通后,记载开通时间,且开通后不能修改.不能再停用.也不能删除;<br/>
				4.业务账号修改资费时,在下月底统一触发,修改其关联的资费ID（此触发动作由程序处理）
			</p>
		</div>
		<!--分页-->
		<div id="pages">
			<c:choose>
				<c:when test="${page.page>1}">
					<a href="${page.page-1}">上一页</a>
				</c:when>
				<c:otherwise>
					<a>上一页</a>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${page.totalPage}">
				<c:choose>
					<c:when test="${i==page.page}">
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
					<a>下一页</a>
				</c:otherwise>
			</c:choose>
			<%-- 当前页+1 --%>
		</div>
	</form>
</div>
<!--主要区域结束-->
<div id="footer">
	<p>[NetCTOSS项目]</p>

	<p>版权所有(C)XXX.Inc </p>
</div>
</body>
</html>
