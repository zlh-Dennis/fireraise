<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火焰筹|忘记密码</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/forgetPassword.js"></script>
</head>
<body>

	<div style="position: relative">
		<div class="center-block" style="width: 50%; left: 20%">
			<div class="modal-header">
				<h3 style="display: inline">忘记密码</h3>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h5 id="warnning" style="display: inline; color: red">  </h5>
			</div>
			<br>

			<div class="form-horizontal">
				<div class="form-group">
					<label for="forget_email" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-10">
						<input id="forget_email" autocomplete="off" style="width: 90%" type="text"	class="form-control" id="forget_email" placeholder="请输入邮箱">
					</div>
				</div>
				<div class="form-group">
					<label for="forget_password" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input style="width: 90%" type="password" class="form-control" id="forget_password" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="forget_repassword" class="col-sm-2 control-label">确认新密码</label>
					<div class="col-sm-10">
						<input style="width: 90%" type="password" class="form-control" id="forget_repassword" placeholder="请确认密码">
					</div>
				</div>
				<div class="form-group">
					<label for="forget_code" class="col-sm-2 control-label">邮箱验证码</label>
					<div style="display: inline" class="col-sm-10">
					<div class="pc_in">
						<input style="width: 72%; display: inline" type="text" autocomplete="off" class="form-control" id="forget_code" placeholder="请输入邮箱确认码">
						<input id="btnCode" type="button" value="发送验证码" class="btn btn-default" onclick="sendCode()"/>
					</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button class="btn btn-default" onclick="repassword()">重置密码</button>
			</div>
			
		</div>
	</div>

</body>
</html>