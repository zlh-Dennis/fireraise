<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火焰筹 | 用户注册</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/register.js"></script>
</head>

<body>

	<div style="position: relative">
		<div class="center-block" style="width: 50%; left: 20%">
			<div class="modal-header">
				<h3 style="display: inline">用户注册</h3>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h5 id="warnning" style="display: inline; color: red">  </h5>
			</div>
			<br>

			<div class="form-horizontal">
				<div class="form-group">
					<label for="register_name" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-10">
						<input style="width:90%" autocomplete="off" type="text" class="form-control" id="register_name" placeholder="请输入真实姓名">
					</div>
				</div>

				<div class="form-group">
					<label for="register_phone" class="col-sm-2 control-label">手机号</label>
					<div class="col-sm-10">
						<input style="width:90%" autocomplete="off" type="text" class="form-control" id="register_phone" placeholder="请输入手机号">
					</div>
				</div>

				<div class="form-group">
					<label for="register_email" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-10">
						<input style="width:90%; display:inline" autocomplete="off" type="text" class="form-control" id="register_email" placeholder="请输入邮箱">
					</div>
				</div>

				<div class="form-group">
					<label for="register_password" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input style="width:90%" type="password" class="form-control" id="register_password" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="register_repassword" class="col-sm-2 control-label">确认密码</label>
					<div class="col-sm-10">
						<input style="width:90%" type="password" class="form-control" id="register_repassword" placeholder="请确认密码">
					</div>
				</div>
				
			</div>

			<div class="modal-footer">
				<button class="btn btn-default" onclick="register()">注册</button>
			</div>
		</div>
	</div>

</body>
</html>