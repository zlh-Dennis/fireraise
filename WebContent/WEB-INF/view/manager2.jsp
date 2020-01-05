<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员页</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/dashboard.css" />
<link rel="stylesheet" href="resources/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="resources/css/image.css" />
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/moment-with-locales.min.js"></script>
<script src="resources/js/bootstrap-datetimepicker.js"></script>
<script src="resources/js/manager2.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var page = '${requestScope.page}';
		$("#user_page").val(page);

		$("#user_name").val('${requestScope.user_name}');
		$("#user_phone").val('${requestScope.user_phone}');
		$("#user_begin").val('${requestScope.user_begin}');

		if ("" == '${requestScope.user_again}')
			$("#user_again").val('1');
		else
			$("#user_again").val('${requestScope.user_again}');

		var obj = document.getElementById("user_state");
		for (var i = 0; i < 8; i++) {
			if (obj.options[i].value == '${requestScope.user_state}') {
				obj.options[i].selected = true;
				break;
			}
		}
	}

	function next() {
		var page = parseInt('${requestScope.page}');

		if ('${requestScope.isNext}' == 'false')
			return;

		$("#user_page").val(page + 1);
		$("#user_again").val(0);
		/* alert("下一页！"); */
		$("#submit").click();

	}

	function previous() {
		var page = parseInt('${requestScope.page}');

		if (page == 1)
			return;

		$("#user_page").val(page - 1);
		$("#user_again").val(0);
		/* alert("上一页！"); */
		$("#submit").click();
	}
</script>
</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">用户管理</h1>
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post" action="manager_user_query">
					<div class="form-group">
						<input type="text" class="form-control" name="user_name" id="user_name" placeholder="项目名称" autocomplete="off">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="user_phone" id="user_phone" placeholder="项目发起人手机号">
					</div>
					<div class="form-group">
						<select id="user_state" class=form-control name="user_state">
							<option value="5" disabled selected style='display: none;'>用户状态</option>
							<option value="0">未实名</option>
							<option value="1">未审核</option>
							<option value="2">已审核</option>
							<option value="3">已冻结</option>
							<option value="4">审核未通过</option>
							<option value="6">全部</option>
						</select>
					</div>
					<div class="form-group">
						<div class="form-group">
							<input type='text' class="form-control" name='user_begin' id='user_begin' readonly placeholder="请选择开始时间" />
						</div>
						<div class="form-group">
							<input type='text' class="form-control" name='user_end' id='user_end' readonly placeholder="请选择结束时间" />
						</div>
						<input id="user_page" name="user_page" style="display: none" type="text" />
						<input id="user_again" name="user_again" style="display: none" type="text" value="1" />
						<!-- style="display: none"  -->
					</div>
					&nbsp;&nbsp;
					<input id="submit" type="submit" class="btn btn-default btn-primary" value="查询" />
				</form>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				var picker1 = $('#user_begin').datetimepicker({
					minView : 2, //选择时间时，最小可以选择到那层；默认是‘hour’也可用0表示
					format : 'yyyy-mm-dd',
					locale : moment.locale('zh-cn'),
					todayBtn : true, // 如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
					clearBtn : true,
					todayHighLight : true,
					toggleActive : true,
					endDate : new Date(), // 窗口最大时间直至今天
					autoclose : true,
				});
				var picker2 = $('#user_end').datetimepicker({
					minView : 2, //选择时间时，最小可以选择到那层；默认是‘hour’也可用0表示
					format : 'yyyy-mm-dd',
					locale : moment.locale('zh-cn'),
					todayBtn : true, // 如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
					clearBtn : true,
					todayHighLight : true,
					toggleActive : true,
					endDate : new Date(), // 窗口最大时间直至今天
					autoclose : true,
				});
			});
		</script>

		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title">所有项目列表</div>
			</div>
			<div class="panel-body">

				<div class="table-responsive ">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th style="text-align: center">用户名</th>
								<th style="text-align: center">用户手机号</th>
								<th style="text-align: center">状态</th>
								<th style="text-align: center">注册时间</th>
								<th style="text-align: center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.users}" var="user">
								<tr>
									<td>${user.getName()}</td>
									<td>${user.getPhone()}</td>
									<td>
										<c:if test="${user.getState() eq '0'}">未实名</c:if> 
										<c:if test="${user.getState() eq '1'}">未审核</c:if> 
										<c:if test="${user.getState() eq '2'}">已审核</c:if> 
										<c:if test="${user.getState() eq '3'}">已冻结</c:if> 
										<c:if test="${user.getState() eq '4'}">审核未通过</c:if> 
									</td>
									<td>${user.getDate()}</td>
									<td>
										<c:if test="${user.getState() ne '0'}">
											<button id="" data-toggle="modal" data-target="#model${user.getId()}">查看详情</button>
										</c:if>
									</td>
								</tr>
								<div id="model${user.getId()}" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
									<div class="modal-dialog modal-lg" role="document">
										<div class="modal-content">
											<div style="text-align: center">
												<div style="display: inline-block;">
													<h4>身份证照片正面:</h4>
													<img class="model_img" src="resources/idcard/${user.getIDCard1()}.jpg">
												</div>
												<div style="display: inline-block;">
													<h4>身份证照片背面:</h4>
													<img class="model_img" src="resources/idcard/${user.getIDCard2()}.jpg">
												</div>
												<div>
													<c:if test="${user.getState() eq '0'}">
														<button onclick="verify('${user.getId()}','3')">冻结</button>
													</c:if> 
													<c:if test="${user.getState() eq '1'}">
														<button onclick="verify('${user.getId()}','2')">审核通过</button>&nbsp;
														<button onclick="verify('${user.getId()}','4')">审核不通过</button>
													</c:if>
													<c:if test="${user.getState() eq '2'}">
														<button onclick="verify('${user.getId()}','3')">冻结</button>
													</c:if> 
												</div>
												<br>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<nav aria-label="...">
					<ul class="pager ">
						<li>
							<a onclick="previous()" style="cursor: pointer">
								<span aria-hidden="true">&larr;</span>
								上一页
							</a>
						</li>
						<li>
							<a id="next" onclick="next()" style="cursor: pointer">
								下一页
								<span aria-hidden="true">&rarr;</span>
							</a>
						</li>
					</ul>
				</nav>

			</div>
		</div>
	</div>

</body>
</html>