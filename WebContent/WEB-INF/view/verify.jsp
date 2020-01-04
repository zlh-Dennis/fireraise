<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火焰筹 | 用户实名页面</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
window.onload = function() {
	$("#user_realname").val('${sessionScope.account.getName()}');
	
	if('${requestScope.type}' == "false")
		alert("申请失败，请稍后再试");
	if('${requestScope.type}' == "true")
		window.location.href="/fireraise/start";
}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.account.getState() eq '3'}">
			您的账户已冻结。
		</c:when>
		<c:when test="${sessionScope.account.getState() eq '1'}">
			您的账户已提交实名，请耐心等待管理员审核。
		</c:when>
		<c:when test="${sessionScope.account.getState() eq '2'}">
			您的账户已通过实名，无需重复此步骤。
		</c:when>
		<c:otherwise>


			<div style="position: relative">
				<div class="center-block" style="width: 50%; left: 20%">
					<div class="modal-header">
						<h3 style="display: inline">用户实名</h3>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<h5 id="warnning" style="display: inline; color: red"></h5>
					</div>
					<br>

					<form name="verify" method="post" action="../fireraise/verify" class="form-horizontal" enctype="multipart/form-data">

						<div class="form-group">
							<label for="user_realname" class="col-sm-2 control-label">真实姓名</label>
							<div class="col-sm-10">
								<input name="user_realname" style="width: 90%" type="text" class="form-control" id="user_realname" placeholder="请输入真实姓名">
							</div>
						</div>

						<div class="form-group">
							<label for="user_idcard" class="col-sm-2 control-label">身份证号</label>
							<div class="col-sm-10">
								<input name="user_idcard" style="width: 90%" type="text" class="form-control" id="user_idcard" placeholder="请输入身份证号">
							</div>
						</div>

						<div class="form-group">
							<label for="register_phone" class="col-sm-2 control-label">身份证正面照</label>
							<div class="col-sm-10">
								<input class="input1 input2 input6" type="file" name="user_idcard1" onchange="showImg1(this)">
								<img width="280px" id="getImg1">
							</div>
						</div>
						<script type="text/javascript">
							function showImg1(cell) {
								document.getElementById('getImg1').src = window.URL.createObjectURL(cell.files[0]);
							}
						</script>

						<div class="form-group">
							<label for="register_phone" class="col-sm-2 control-label">身份证背面照</label>
							<div class="col-sm-10">
								<input class="input1 input2 input6" type="file" name="user_idcard2" onchange="showImg2(this)">
								<img width="280px" id="getImg2">
							</div>
						</div>
						<script type="text/javascript">
							function showImg2(cell) {
								document.getElementById('getImg2').src = window.URL.createObjectURL(cell.files[0]);
							}
						</script>

						<input style="display: none" id="submit" type="submit">
					</form>

					<div class="modal-footer">
						<button class="btn btn-default" onclick="$('#submit').click()">认证</button>
					</div>
				</div>
			</div>


		</c:otherwise>
	</c:choose>
		
</body>
</html>