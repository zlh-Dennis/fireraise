<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火焰筹 | 用户登录</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/login.js"></script>
<script type="text/javascript">
$(function(){
    $('input:radio').click(function(){
        var domName = $(this).attr('name');

        var $radio = $(this);
        // if this was previously checked
        if ($radio.data('waschecked') == true){
            $radio.prop('checked', false);
            $("input:radio[name='" + domName + "']").data('waschecked',false);
            //$radio.data('waschecked', false);
        } else {
            $radio.prop('checked', true);
            $("input:radio[name='" + domName + "']").data('waschecked',false);
            $radio.data('waschecked', true);
        }
    });
});
</script>
</head>
<body>

	<div style="position: relative">
		<div class="center-block" style="width: 50%; left: 20%">
			<div class="modal-header">
				<h3 style="display: inline">用户登录</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h5 id="warnning" style="display: inline; color: red">  </h5>
			</div>
			<br>

			<div class="form-horizontal">
				<div class="form-group">
					<label for="login_username" class="col-sm-2 control-label">手机号或邮箱</label>
					<div class="col-sm-10">
						<input style="width: 90%" autocomplete="off" type="text" class="form-control" id="login_username" placeholder="请输入手机号或邮箱">
					</div>
				</div>
				<div class="form-group">
					<label for="login_password" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input style="width: 90%" type="password" class="form-control" id="login_password" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox" style="width: 90%; display: flex; justify-content: space-between">
							<label id="remember_label"> 
								<input id="remember" name="remember" value="true" type="radio"> 记住密码
							</label> 
							<b style="text-align: right"> <a href="toForgetPassword">忘记密码</a> </b>
						</div>
					</div>
				</div>
				<input style="display:none" id="source" type="text" value="${source}">
			</div>

			<div class="modal-footer">
				<button class="btn btn-default" onclick="login()">登录</button>
			</div>
		</div>
	</div>

</body>
</html>