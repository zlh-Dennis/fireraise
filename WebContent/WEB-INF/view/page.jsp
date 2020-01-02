<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="pagination">
				<li >
				<c:if test="${start > 1}">
					<a href="${forward }?start=${start-1}">上一页</a>
				</c:if>
				<c:if test="${start <= 1}">
					<a href="#" class="disabled ">上一页</a>
				</c:if>
				</li>
				
				<c:forEach begin="1" end="${requestScope.allPages}" step="1" var="pageNum">
				<c:if test="${requestScope.start eq pageNum}">
					<li class="active"><a href="${forward }?start=${pageNum}">${pageNum}</a></li>
				</c:if>
				
				<c:if test="${requestScope.start ne pageNum}">
					<li ><a href="${forward }?start=${pageNum}">${pageNum}</a></li>
				</c:if>
				</c:forEach>
				
				<li >
				
				<c:if test="${start < allPages}">
					<a href="${forward }?start=${start+1}">下一页</a>
				</c:if>
				
				<c:if test="${start >= allPages}">
					<a href="#" >下一页</a>
				</c:if>
				</li>
				
			</ul>