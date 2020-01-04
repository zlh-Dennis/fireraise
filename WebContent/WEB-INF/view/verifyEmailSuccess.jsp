<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>邮箱验证</title>
</head>
<body>
	<c:if test="${requestScope.result eq 'success'}">
		您的邮箱验证成功，请<a href="toLogin">点击此处</a>前去登录。
	</c:if>
	
	<c:if test="${requestScope.result eq 'fail'}">
		您的邮箱验证失败,已重新发送验证邮件，请注意查收。
	</c:if>
	
</body>
</html>