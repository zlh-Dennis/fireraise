<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/dashboard.css" />
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand">平台管理</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">

				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">欢迎: ${sessionScope.account.getPhone()}</a></li>
					<li><a href="logout">退出登录</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a  href="start">首页</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="toUser.do">我的申请</a></li>
					<li><a href="userbill?app_again=1">我的捐赠</a></li>
					<li><a href="toUserBank.do">我的账户</a></li>
					<li><a href="toApply.do">项目申请</a></li>
					<li><a href="toVerify.do">账号实名</a></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>