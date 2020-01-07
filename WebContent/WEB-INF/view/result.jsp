<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果页</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/result.css" />
<link rel="stylesheet" href="resources/css/dashboard.css" />
<link rel="stylesheet" href="resources/css/bootstrap-datetimepicker.css" />
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/moment-with-locales.min.js"></script>
<script src="resources/js/bootstrap-datetimepicker.js"></script>
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
	<div style="position:relative;">
		<div style="height:100%;with:100%; background-color: #FFFAF0;">
		
			<!-- 搜索栏部分开始 -->
			<div class="nav" id="db-nav" style="height:50px">
				<div class="nav-wrap" >
					<div class="nav-primary">
					
					<div style="display: inline-block;">
						<form class="form-inline" method="post" action="query">
					<div class="form-group">
						<input type="text" class="form-control" name="app_name" id="app_name" placeholder="项目名称" autocomplete="off">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="app_phone" id="app_phone" placeholder="项目发起人手机号">
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
				<div style="display: inline-block;">
					<button class="btn btn-default" onclick="back()"> 返回首页 </button>
					<script type="text/javascript">
						function back(){
							window.location.href="/fireraise/start";
						}
					</script>
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
				</div>
			</div>
			<!-- 搜索栏部分结束 -->
			
			<!-- 搜索结果显示部分开始 -->
			<div id="wrapper">
				<div id="content">
					<h1>项目查询结果:</h1>
					<div class="search_list clearfix">
						<div class="article">
							<div class="pro_list">
								
								<!-- 项目列表 -->
								<ul class="pro-list">
								
								<c:forEach items="${requestScope.applicants}" var="applicant">
									<li class="pro-item">
										<div class="pic">
											<a href="../fireraise/toDetail?applicantId=${applicant.getId()}">
												<img style="height:240px;width:180px;" src="resources/poster/${applicant.getPicture1()}.jpg">
											</a>
										</div>
										<div class="info">
											<h3>项目名：${applicant.getName()}</h3>
											<div class="pub">
												<ul class="breadcrumb">
    												<li class="active"class="active">申请人</li>
    												<li class="active">申请时间：${applicant.getBeginDate()}</li>
												</ul>
											</div>
											<p>项目简介</p>
											<textarea readonly class="form-control" rows="3" style="width: 70%">${applicant.getText()}</textarea>
										</div>
									</li>
								</c:forEach>
									
								</ul>
								
								<!-- 分页页码部分 -->
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
				</div>
			</div>
		
		</div>
	</div>

</body>
</html>