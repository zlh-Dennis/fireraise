<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">众筹管理平台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
        	
          <ul class="nav navbar-nav navbar-right">
          	<li><a href="index.html">首页</a></li>
          	<li><a href="#">欢迎, ${sessionScope.admin.adminName }</a></li>
            <li><a href="#" title="修改个人资料和密码的页面">设置</a></li>
            <li><a href="<%=basePath%>admin/exit.action" title="退出登录">退出</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
        	<ul class="nav nav-sidebar">
            <li class="active"><a href="<%=basePath%>admin/index.action">首页</a></li>
           </ul>
          <ul class="nav nav-sidebar">
            <li><a href="<%=basePath%>pages/p_list.action">所有项目*</a></li>
            <li><a href="<%=basePath%>pages/audit.action">项目审核</a></li>
            <li><a href="#">项目跟踪</a></li>
            <li><a href="#">项目评论</a></li>
            <li><a href="<%=basePath%>pages/list.action">项目分类*</a></li>
            <li><a href="#">项目推荐</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">注册用户</a></li>
            <li><a href="">用户资金</a></li>
            <li><a href="">用户日志</a></li>
            <li><a href="">实名审核</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">新闻管理</a></li>
            <li><a href="">问题管理</a></li>
            <li><a href="<%=basePath%>admin/admin_list.action">管理用户</a></li>
            <li><a href="">管理日志</a></li>
          </ul>
        </div>