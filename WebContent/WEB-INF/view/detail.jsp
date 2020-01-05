<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>项目详情</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/index.css" />
<link rel="stylesheet" href="resources/css/image.css" />
<script src="resources/js/bootstrap.js"></script>
</head>
<body>

	<div style="text-align: center"><br>

		<div id="recharge_div" class="panel panel-default" style="display: inline-block;">
			<div class="panel-body" style="width:100%;">
				<div class="form-inline" style="display: inline-block; width:100%;">

					<div style="display: inline-block;" class="form-group">
						<h4>图片展示</h4>
					</div>
					<br>
					<div style="display: inline-block;" class="form-group">
						<img class="model_img" src="resources/poster/${requestScope.applicant.getPicture1()}.jpg">
					</div>
					<div style="display: inline-block;" class="form-group">
						<img class="model_img" src="resources/poster/${requestScope.applicant.getPicture2()}.jpg">
					</div>
					<div style="display: inline-block;" class="form-group">
						<img class="model_img" src="resources/poster/${requestScope.applicant.getPicture3()}.jpg">
					</div>
					<br><br>
					<div style="display: inline-block;" class="form-group">
						<h4>文字展示</h4>
					</div>
					<br>
					<div style="display: inline-block; width:100%" class="form-group">
						<textarea readonly class="form-control" rows="3" style="width: 70%">'${requestScope.applicant.getText()}'</textarea>
					</div>
					
				</div>
			</div>
		</div>
		<br>

		<div>
			<div class="form-inline" style="display: inline-block; width: 100%;">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					<label for="recharge_money">捐赠金额：</label>
					<input type="number" class="form-control" id="raise_money" placeholder="充值金额">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					<label for="recharge_password">账户密码：</label>
					<input type="text" class="form-control" id="raise_password" placeholder="支付密码">
					<%-- <input type="text" id="raise_userId" style="display: none" value="${sessionScope.account.getId()}"> --%>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					<input type="button" onclick="raise()" class="form-control" value="点击捐赠">
				</div>
			</div>
			<script type="text/javascript">
				function raise() {
					if($("#raise_money").val() == null || $("#raise_money").val() == ""){
						alert("请输入捐赠金额");
						return;
					}
					if($("#raise_password").val() == null || $("#raise_password").val() == ""){
						alert("请输入账户密码");
						return;
					}
					if('${sessionScope.account.getId()}' == null || '${sessionScope.account.getId()}' == ""){
						alert("登录过期，请重新登录");
						return;
					}
					if('${requestScope.applicant.getTarget() - requestScope.applicant.getMoney()}' < parseInt($("#raise_money").val())){
						alert("您的捐赠金额大于所需的金额");
					}
					
					// 获取网络连接对象
					var xmlhttp = new XMLHttpRequest();
					// 设置请求方式，请求路径，是否异步
					xmlhttp.open("GET", "/fireraise/raise.do?raise_money=" + 
							$("#raise_money").val() + "&raise_password=" + $("#raise_password").val() + 
							"&raise_applicantId=" + '${requestScope.applicant.getId()}' + 
							"&raise_userId=" + '${sessionScope.account.getId()}', true);
					xmlhttp.send();
					
					xmlhttp.onreadystatechange = function() {
						if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
							var text = xmlhttp.responseText;
							
							if(text = "success")
								alert("捐赠成功");
							else if(text == "password error")
								alert("密码错误");
							else
								alert("捐赠失败，请稍后再试");
						}
					}
				}
			</script>
		</div>

	</div>
</body>
</html>