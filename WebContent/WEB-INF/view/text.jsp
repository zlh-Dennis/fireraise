<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>众筹管理后台</title>
		<link rel="stylesheet" href="<%=basePath%>admin/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>admin/css/dashboard.css" />
	</head>
	<body>
		

			<div class="panel panel-default">
  <div class="panel-heading">
    <div class="panel-title">
    	所有项目列表
    </div>
  </div>
  <div class="panel-body">
   
          <div class="table-responsive ">
            <table class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>项目类型</th>
                  <th>项目名称</th>
                  <th>项目进度</th>
                  <th>开始日期</th>
                  <th>结束日期</th>
                  <th>已筹金额</th>
                  <th>发起人</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${requestScope.list}" var="p">
                <tr>
                  <td>${p.psId}</td>
                  <td>
                  ${p.pst.pstName} 
                 </td>
                  <td>${p.psName}</td>
                  <td>
                  <fmt:formatNumber type="number" value="${p. psGetmoney/p.psMoney}" pattern="#%.00"/> 
                  </td>
                  <td>
                  <fmt:formatDate value="${p.psStarttime }"  pattern="yyyy-MM-dd HH:mm:ss"/>
                  </td>
                  <td>
                  <fmt:formatDate value="${p.psEndtime }"  pattern="yyyy-MM-dd HH:mm:ss"/>
                  </td>
                  <td>${p.psGetmoney }</td>
                  <td>${p.user.usName}</td>
                  <td>
                  	<a href="<%=basePath %>pages/p_detail1.action?id=${p.psId}">详情</a>
                  	<!--<a href="#" title="查看项目详情"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a>-->
                  	<!--&nbsp;&nbsp;
                  	<a href="#" title="编辑项目信息"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>-->
                  </td>
                </tr>
                 </c:forEach> 
               
              </tbody>
            </table>
          </div>

  
	</body>
</html>
