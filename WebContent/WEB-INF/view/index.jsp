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

				<ul class="nav navbar-nav" style="visibility: hidden;">
					<li>
						<a href="index">首页 </a>
					</li>
					<li>
						<a href="movie">电影 </a>
					</li>
					<li>
						<a href="#">书籍 </a>
					</li>
					<li>
						<a href="#">音乐 </a>
					</li>
				</ul>

				<form action="userOperation/search" class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" style="width: 200%" name="string" class="form-control" autocomplete="off" />
						<span class="input-group-btn" style="position: absolute; left: 392px;">
							<input type="submit" class="btn btn-default" value="搜索" />
						</span>
					</div>
				</form>

				<!-- <div id="navigation" style="position: relative; left: 25%; line-height: 50px; height: 50px; display: inline; width: 50%;">
					<ul class="nav navbar-nav">
						<li> 
						<a href="toUser.do" style="visibility: hidden;"> &nbsp; &nbsp; &nbsp; &nbsp;个人中心 </a> 
						</li>
					</ul>
				</div> -->

				<div style="position: relative; left: 35%; line-height: 50px; height: 50px; font-size: 18px; display: inline; width: 50%;">
					<a id="person" href="toUser.do" >个人中心 </a>
					<a id="manager" href="toManager.done" >管理后台 </a>
					<a id="login" href="toLogin" style="text-decoration: none;">登录</a>&nbsp;
					<a id="register" href="toRegister" style="text-decoration: none;">注册</a>
					<a id="logout" href="logout" style="text-decoration: none;">退出</a>
				</div>

			</div>
		</nav>
		<!--********************************************************顶部导航栏********************************************************-->

		<div style="width: 100%; height: 10px;"></div>
		
		<!--********************************************************  项目展示  ********************************************************-->
		<div style="width: 80%; height: 100%;" class="center-block">
			<div class="cursor_label center-block cursor_img" style="width: 100%; height: 500px; position: relative;">
				<div style="width: 750px; height: 500px; left: 0px; position: relative; background-color: yellow">

					<div style="width: 80%; height: 100%;" class="center-block">
						<c:forEach begin="0" end="4" var="applicant" varStatus="i" items="${requestScope.applicants}">
							<div>
								<span class="page-span-top" style="left: ${i.index * 153 + 1}px;">
									<a href="toDetail?applicantId=${applicant.getId()}">
										<img id="index_image${i.index}" class="img page-img-show" src="resources/poster/${applicant.getPicture1()}.jpg" alt="${applicant.getName()}">
									</a>
									<%-- <p id="movie_name${i.index}" style="top: 10px;" class="text-center font-weight">${item.getMovieName()}</p>
										 <p id="movie_score${i.index}" style="margin-top: 15px;" class="text-center font-weight">${item.getScore()}</p> --%>
								</span>
								
							</div>
						</c:forEach>
						<script type="text/javascript">
								function detail(applicantId){
									alert(applicantId);
									
									// 获取网络连接对象
									var xmlhttp = new XMLHttpRequest();
									// 设置请求方式，请求路径，是否异步
									xmlhttp.open("POST", "/fireraise/toDetail?" + "applicantId=" + applicantId,	true);
									xmlhttp.send();
								}
								</script>
					</div>

				</div>
			</div>
		</div>

		<%-- <br><br><br><br><br><br><br><br><br><br><br>
		<div style="text-align: center; position: relative;">
			<c:forEach items="${requestScope.applicants}" var="applicant">
				<br>
				<div class="center" style="width: 70%; position: relative; display: inline-block;">
					<div style="display: inline-block">
						<div style="display: inline-block">
							<img class="index_img" src="resources/poster/${applicant.getPicture1()}.jpg" style="display: inline-block;">
						</div>
						<div style="display: inline-block">项目名： ${applicant.getName()}</div>
					</div>
				</div>
			</c:forEach>
		</div> --%>

		<!--********************************************************  项目展示  ********************************************************-->
	</div>
	
</body>
</html>