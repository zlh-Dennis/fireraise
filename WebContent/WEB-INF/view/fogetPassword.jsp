<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火焰筹|重置密码</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<script src="resources/js/bootstrap.js"></script>
</head>
<body>

	<div style="position: relative">
		<div class="center-block" style="width: 50%; left: 20%">
			<div class="modal-header">
				<h3 style="display: inline">重置密码</h3>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h5 style="display: inline">
					<font style="color: red">这里显示重置密码时的信息</font>
				</h5>
			</div>
			<br>

			<form class="form-horizontal">
				<div class="form-group">
					<label for="foget_email" class="col-sm-2 control-label">邮箱</label>
					<div style="display: inline" class="col-sm-10">
						<input style="width: 72%; display: inline" type="text"
							class="form-control" id="foget_email" placeholder="请输入邮箱">
						<button class="btn btn-default" onclick="send_confirmCode()">发送确认码</button>
					</div>
				</div>
				<div class="form-group">
					<label for="foget_password" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input style="width: 90%" type="password" class="form-control"
							id="foget_password" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="foget_repassword" class="col-sm-2 control-label">确认密码</label>
					<div class="col-sm-10">
						<input style="width: 90%" type="password" class="form-control"
							id="foget_repassword" placeholder="请确认密码">
					</div>
				</div>
				<div class="form-group">
					<label for="foget_code" class="col-sm-2 control-label">邮箱验证码</label>
					<div class="col-sm-10">
						<input style="width: 90%" type="password" class="form-control"
							id="foget_code" placeholder="请输入邮箱确认码">
					</div>
				</div>
			</form>

			<div class="modal-footer">
				<button class="btn btn-default" onclick="repassword()">重置密码</button>
			</div>
		</div>
	</div>

</body>
</html>