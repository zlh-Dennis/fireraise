package com.fireraise.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerLoginFilter implements Filter {

	@Override
	public void destroy() {
		System.out.println("请求处理已结束");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//实际发送的是Http请求，所以可以转成HttpServletRequest类型
        //getSession()方法是HttpServletRequest接口提供的
        HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse resp=(HttpServletResponse)response;
        
        //req.getSession(false)获取当前会话对象，如果没有会话，返回null
        HttpSession session=req.getSession(false);
        
        if(null != session && "manager".equals(session.getAttribute("type"))){
        	System.out.println("直接放行");
        	System.out.println(req.getRequestURL().toString());
            chain.doFilter(request, response); //如果登录了，放行去访问资源
        }else{
        	System.out.println("正在处理请求");
            //如果没有登录，则重定向到warning.html页面
            //为了避免访问warning.html出问题，建议这里使用绝对路径
            
            //获取程序的上下文路径，也就是程序的路径
            String contextPath = req.getContextPath();
            String servletPath = req.getServletPath();
            //连接上/warning.html是warning页面的完整路径http://localhost:8084/C02_D16_UseFilter2/warning.html
            String path = contextPath + "/toLogin?servletPath=" + servletPath;
            resp.sendRedirect(path); // 请求转发到登录页
        }
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("已拦截请求");
	}

}