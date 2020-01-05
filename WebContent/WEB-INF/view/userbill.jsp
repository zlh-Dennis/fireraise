<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="resources/js/user.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var page = '${requestScope.page}';
		$("#app_page").val(page);

		$("#app_name").val('${requestScope.app_name}');
		$("#app_begin").val('${requestScope.app_begin}');
		$("#app_end").val('${requestScope.app_end}');

		if ("" == '${requestScope.app_again}')
			$("#app_again").val('1');
		else
			$("#app_again").val('${requestScope.app_again}');

	}

	function next() {
		var page = parseInt('${requestScope.page}');

		if ('${requestScope.isNext}' == 'false')
			return;

		$("#app_page").val(page + 1);
		$("#app_again").val(0);
		/* alert("下一页！"); */
		$("#submit").click();

	}

	function previous() {
		var page = parseInt('${requestScope.page}');

		if (page == 1)
			return;

		$("#app_page").val(page - 1);
		$("#app_again").val(0);
		/* alert("上一页！"); */
		$("#submit").click();
	}
</script>
</head>
<body>

	<jsp:include page="head2.jsp"></jsp:include>
	
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">用户项目管理</h1>
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post" action="userbill">
					<div class="form-group">
						<div class="form-group">
							<input type='text' class="form-control" name='app_begin' id='app_begin' readonly placeholder="请选择开始时间" />
						</div>
						<div class="form-group">
							<input type='text' class="form-control" name='app_end' id='app_end' readonly placeholder="请选择结束时间" />
						</div>
						<input id="app_page" name="app_page" style="display: none" type="text" />
						<input id="app_again" name="app_again" style="display: none" type="text" value="1" />
						<input id="userId" name="userId" style="display: none" type="text" value="${sessionScope.account.getId()}" />
						<!-- style="display: none"  -->
					</div>
					&nbsp;&nbsp;
					<input id="submit" type="submit" class="btn btn-default btn-primary" value="查询" />
				</form>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				var picker1 = $('#app_begin').datetimepicker({
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
				var picker2 = $('#app_end').datetimepicker({
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
				<div class="panel-title">所有记录列表</div>
			</div>
			<div class="panel-body">

				<div class="table-responsive ">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th style="text-align: center">项目名称</th>
								<th style="text-align: center">捐赠时间</th>
								<th style="text-align: center">捐赠金额</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.bills}" var="bill">
								<tr>
									<td style="text-align: center">${requestScope.applicants.get( bill.getEnd() )}</td>
									<td style="text-align: center">${bill.getDate()}</td>
									<td style="text-align: center">${bill.getMoney()}</td>
								</tr>
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