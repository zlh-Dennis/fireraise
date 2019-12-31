package com.fireraise.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageChangeController {

	@RequestMapping({"start","/"})
	public String start() {
		return "index";
	}
	
	@RequestMapping("toLogin")
	public String toLogin(Model model, HttpServletRequest request) {
		model.addAttribute("source",request.getParameter("servletPath"));
		return "login";
	}
	
	@RequestMapping("toRegister")
	public String toRegister() {
		return "register";
	}
	
	@RequestMapping("toApply.do")
	public String toApply() {
		System.out.println("前往申请请求页面");
		return "apply";
	}
	
}