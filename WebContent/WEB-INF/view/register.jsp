<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火焰筹|用户注册</title>
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
				<h5 style="display: inline">
					<font style="color: red">这里显示用户注册时的信息</font>
				</h5>
			</div>
			<br>

			<form class="form-horizontal">
				<div class="form-group">
					<label for="register_name" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-10">
						<input style="width:90%" type="text" class="form-control" id="register_name"
							placeholder="请输入真实姓名">
					</div>
				</div>

				<div class="form-group">
					<label for="register_phone" class="col-sm-2 control-label">手机号</label>
					<div class="col-sm-10">
						<input style="width:90%" type="text" class="form-control" id="register_phone"
							placeholder="请输入手机号">
					</div>
				</div>

				<div class="form-group">
					<label for="register_email" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-10">
						<input style="width:72%; display:inline" type="text" class="form-control" id="register_email"
							placeholder="请输入邮箱">
							<button class="btn btn-default" onclick="send_confirmCode()">发送确认码</button>
					</div>
				</div>

				<div class="form-group">
					<label for="register_bankcard" class="col-sm-2 control-label">银行卡号</label>
					<div class="col-sm-10">
						<input style="width:90%" type="text" class="form-control" id="register_bankcard"
							placeholder="请输入银行卡号">
					</div>
				</div>

				<div class="form-group">
					<label for="register_password" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input style="width:90%" type="password" class="form-control" id="register_password"
							placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="" register_repassword"" class="col-sm-2 control-label">确认密码</label>
					<div class="col-sm-10">
						<input style="width:90%" type="password" class="form-control"
							id="register_repassword" placeholder="请确认密码">
					</div>
				</div>

				<span class="center-block" style="width: 70%">
					<div class="form-group">
						<label for="exampleInputFile">请上传身份证正面照</label> <input type="file"
							id="register_card1" name="register_card1">
					</div>
				</span> <span class="center-block" style="width: 70%">
					<div class="form-group">
						<label for="exampleInputFile">请上传身份证背面照</label> <input type="file"
							id="register_card2" name="register_card2">
					</div>
				</span>
			</form>

			<div class="modal-footer">
				<button class="btn btn-default" onclick="register()">注册</button>
			</div>
		</div>
	</div>

</body>
</html>