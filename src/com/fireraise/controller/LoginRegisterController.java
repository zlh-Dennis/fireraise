package com.fireraise.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fireraise.pojo.Manager;
import com.fireraise.pojo.User;
import com.fireraise.service.ManagerService;
import com.fireraise.service.UserService;
import com.fireraise.util.IdGeneration;
import com.fireraise.util.MD5Util;

@Controller
public class LoginRegisterController {

	@Resource private UserService userService;
	@Resource private ManagerService managerService;
	
	@RequestMapping("login")
	@ResponseBody
	public String login(String username, String password, String remember, String source,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("开始登录");
		
		User user = userService.getOneByUsername(username);
		Manager manager = managerService.getOneByPhone(username);
		HttpSession session = request.getSession();
		System.out.println(username + "/" + password + "/" + remember);
		System.out.println(source);
		
		if(user != null) {	// 如果 user 对象不为空
			if(user.getPassword().equals(MD5Util.encryption(password))) {
				session.setAttribute("account", user);
				session.setAttribute("type", "user");
				if("true".equals(remember)) {	// 设置了记住密码，添加Cookie
					Cookie username_cookie = new Cookie("username", username);
					Cookie password_cookie = new Cookie("password", password);
					Cookie remember_cookie = new Cookie("remember", "true");
					username_cookie.setMaxAge(7*24*60*60);
					password_cookie.setMaxAge(7*24*60*60);
					remember_cookie.setMaxAge(7*24*60*60);
					response.addCookie(username_cookie);
					response.addCookie(password_cookie);
					response.addCookie(remember_cookie);
				} else {
					Cookie remember_cookie = new Cookie("remember", "false");
					remember_cookie.setMaxAge(7*24*60*60);
					response.addCookie(remember_cookie);
				}
				if(null == source)	return "Login Success";
				else {
//					response.sendRedirect(request.getContextPath() + source);
					return source;
				}
			} else {
//				response.getWriter().print("Password Error");
				return "Password Error";
			}
		} else if(manager != null) {
			if(manager.getPassword().equals(MD5Util.encryption(password))) {
				session.setAttribute("account", manager);
				session.setAttribute("type", "manager");
				if("true".equals(remember)) {	// 设置了记住密码，添加Cookie
					Cookie username_cookie = new Cookie("username", username);
					Cookie password_cookie = new Cookie("password", password);
					Cookie remember_cookie = new Cookie("remember", "true");
					response.addCookie(username_cookie);
					response.addCookie(password_cookie);
					response.addCookie(remember_cookie);
				}
				return "manager";
			} else {
//				response.getWriter().print("Password Error");
				return "Password Error";
			}
		} else {
//			response.getWriter().print("Username Error");
			return "Username Error";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("register")
	public void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		System.out.println("注册开始");
		
		if(userService.getOneByUsername(phone) != null) { // 手机号已存在
			System.out.println("手机号已存在");
			response.getWriter().print("Phone number already exists");
			return;
		}
		if(userService.getOneByUsername(email) != null) { // 邮箱已存在
			System.out.println("邮箱已存在");
			response.getWriter().print("Email already exists");
			return;
		}
		
		User user = new User(IdGeneration.userID(), name, phone, email, false, MD5Util.encryption(password), 0, null, null, null, null);
		if(userService.insert(user)) {	// 注册成功，直接登录并跳转到主页
			HttpSession session = request.getSession();
			session.setAttribute("account", user);
			session.setAttribute("type", "user");
			System.out.println("注册成功");
			response.getWriter().print("Register Success");
			return;
		} else {	// 注册失败，回复消息
			System.out.println("注册失败");
			response.getWriter().print("Register Fail");
			return;
		}
	}

}