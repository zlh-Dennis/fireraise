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
<script src="resources/js/manager.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var page = '${requestScope.page}';
		$("#app_page").val(page);

		$("#app_name").val('${requestScope.app_name}');
		$("#app_phone").val('${requestScope.app_phone}');
		$("#app_begin").val('${requestScope.app_begin}');
		$("#app_end").val('${requestScope.app_end}');

		if ("" == '${requestScope.app_again}')
			$("#app_again").val('1');
		else
			$("#app_again").val('${requestScope.app_again}');

		var obj = document.getElementById("app_state");
		for (var i = 0; i < 8; i++) {
			if (obj.options[i].value == '${requestScope.app_state}') {
				obj.options[i].selected = true;
				break;
			}
		}
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

	<jsp:include page="head.jsp"></jsp:include>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">项目管理</h1>
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post" action="manager_app_query">
					<div class="form-group">
						<input type="text" class="form-control" name="app_name" id="app_name" placeholder="项目名称" autocomplete="off">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="app_phone" id="app_phone" placeholder="项目发起人手机号">
					</div>
					<div class="form-group">
						<select id="app_state" class=form-control name="app_state">
							<option value="7" disabled selected style='display: none;'>项目状态</option>
							<option value="0">未审核</option>
							<option value="1">正常</option>
							<option value="2">已完成</option>
							<option value="3">已冻结</option>
							<option value="4">已停止</option>
							<option value="5">审核未通过</option>
							<option value="6">全部</option>
						</select>
					</div>
					<div class="form-group">
						<div class="form-group">
							<input type='text' class="form-control" name='app_begin' id='app_begin' readonly placeholder="请选择开始时间" />
						</div>
						<div class="form-group">
							<input type='text' class="form-control" name='app_end' id='app_end' readonly placeholder="请选择结束时间" />
						</div>
						<input id="app_page" name="app_page" style="display: none" type="text" />
						<input id="app_again" name="app_again" style="display: none" type="text" value="1" />
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
				<div class="panel-title">所有项目列表</div>
			</div>
			<div class="panel-body">

				<div class="table-responsive ">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th style="text-align: center">项目名称</th>
								<th style="text-align: center">发起人</th>
								<th style="text-align: center">项目状态</th>
								<th style="text-align: center">开始时间</th>
								<th style="text-align: center">结束时间</th>
								<th style="text-align: center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.applicants}" var="applicant">
								<tr>
									<td>${applicant.getName()}</td>
									<td>${requestScope.users.get( applicant.getUserId() )}</td>
									<td>
										<c:if test="${applicant.getState() eq '0'}">未审核</c:if> 
										<c:if test="${applicant.getState() eq '1'}">正常</c:if> 
										<c:if test="${applicant.getState() eq '2'}">已完成</c:if> 
										<c:if test="${applicant.getState() eq '3'}">已冻结</c:if> 
										<c:if test="${applicant.getState() eq '4'}">已停止</c:if> 
										<c:if test="${applicant.getState() eq '5'}">未通过审核</c:if>
									</td>
									<td>${applicant.getBeginDate()}</td>
									<td>${applicant.getEndDate()}</td>
									<td><button id="" data-toggle="modal" data-target="#model${applicant.getId()}">查看详情</button></td>
								</tr>
								<div id="model${applicant.getId()}" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
									<div class="modal-dialog modal-lg" role="document">
										<div class="modal-content">
											<div style="text-align: center">
													<div style="display: inline-block;">
														<h4>封面海报：</h4>
														<img class="model_img" src="resources/poster/${applicant.getPicture1()}.jpg">
													</div>
													<div style="display: inline-block;">
														<h4>海报1：</h4>
														<img class="model_img" src="resources/poster/${applicant.getPicture2()}.jpg">
													</div>
													<div style="display: inline-block;">
														<h4>海报2：</h4>
														<img class="model_img" src="resources/poster/${applicant.getPicture3()}.jpg">
													</div>
												
												<h4>文字介绍：</h4>
												<h5>${applicant.getText()}</h5>
												<div>
													<c:if test="${applicant.getState() eq '0'}">
														<button onclick="audit('${applicant.getId()}','1')">审核通过</button>
														<button onclick="audit('${applicant.getId()}','5')">审核不通过</button>
													</c:if> 
													<c:if test="${applicant.getState() eq '1'}">
														<button onclick="audit('${applicant.getId()}','3')">冻结</button>
													</c:if> 
													<c:if test="${applicant.getState() eq '2'}">已完成</c:if> 
													<c:if test="${applicant.getState() eq '3'}">已冻结</c:if> 
													<c:if test="${applicant.getState() eq '4'}">已停止</c:if> 
													<c:if test="${applicant.getState() eq '5'}">未通过审核</c:if>
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