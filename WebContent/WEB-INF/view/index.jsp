<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火焰筹|首页</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/index.css" />
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/index.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var type = '${sessionScope.type}';
		if(type == null || type == ""){
			document.getElementById("person").style.display = 'none';
			document.getElementById("manager").style.display = 'none';
			document.getElementById("logout").style.display = 'none';
		} else if(type == 'user'){
			document.getElementById("register").style.display = 'none';
			document.getElementById("manager").style.display = 'none';
			document.getElementById("login").style.display = 'none';
		} else if(type == 'manager'){
			document.getElementById("register").style.display = 'none';
			document.getElementById("person").style.display = 'none';
			document.getElementById("login").style.display = 'none';
		}
	}
</script>
</head>
<body>
	
	<div id="body" style="position: relative; width: 100%; height: 100%;">
		<div class="navbar navbar-default navbar-fixed-top" style="position: relative"></div>

		<!--********************************************************顶部导航栏********************************************************-->
		<nav class="navbar navbar-default navbar-fixed-top" style="width: 100%;">

			<div class="navbar-header">
				<a class="navbar-brand" href="start">Fire Raise</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="position: relative;">

				<ul class="nav navbar-nav">	<!-- style="visibility: hidden;" -->
					<li>
						<a id="person" href="toUser.do" >个人中心 </a>
					</li>
					<li>
						<a id="result" href="query?app_again=1" >检索 </a>
					</li>
					<li>
						<a id="manager" href="toManager.done" >管理后台 </a>
					</li>
					<li>
						<a id="login" href="toLogin" style="text-decoration: none;">登录</a>&nbsp;
					</li>
					<li>
						<a id="register" href="toRegister" style="text-decoration: none;">注册</a>
					</li>
					<li>
						<a id="logout" href="logout" style="text-decoration: none;">退出</a>
					</li>
				</ul>

			</div>
		</nav>
		<!--********************************************************顶部导航栏********************************************************-->

	</div>
</body>
</html>