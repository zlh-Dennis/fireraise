package com.fireraise.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fireraise.pojo.Applicant;
import com.fireraise.pojo.Bankcard;
import com.fireraise.pojo.User;
import com.fireraise.service.ApplicantService;
import com.fireraise.service.BankCardService;
import com.fireraise.service.UserService;

@Controller
public class PageChangeController {

	@Resource private ApplicantService applicantService;
	@Resource private UserService userService;
	@Resource private BankCardService bankCardService;
	
	@RequestMapping("toUserBank.do")
	public String toUserBank(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("account");
		
		List<Bankcard> bankcards = bankCardService.getAllByUser(user.getId());
		System.out.println(bankcards.size());
		
		model.addAttribute("bankcards", bankcards);
		return "userbank";
	}
	
	@RequestMapping("toDetail")
	public String toDetail(String applicantId, Model model) {
		System.out.println(applicantId + "!!!!!11111");
		
		Applicant applicant = applicantService.getOneById(applicantId);
		model.addAttribute("applicant",applicant);
		
		System.out.println(applicant.getName());
		return "detail";
	}
	
	@RequestMapping("toProject")
	public String toProject() {
		return "project";
	}
	
	@RequestMapping({"start","/"})
	public String start(Model model) {
		List<Applicant> applicants = applicantService.getAll();
		
		model.addAttribute("applicants", applicants);
		return "index";
	}
	
	@RequestMapping("toUserRaise.do")
	public String toUserRaise() {
		
		
		return "userRaise";
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
	public String toApply(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("account");
		
		if(user.getState() != (byte)2) return "redirect:toVerify.do";
		
		System.out.println("前往申请请求页面");
		return "apply";
	}
	
	@RequestMapping("toUser.do")
	public String toUser(HttpServletRequest request, Model model) {
		System.out.println("前往用户管理页面");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("account");
		
		List<Applicant> allApplicants = applicantService.getAllByUserId(user.getId());
		List<Applicant> applicants;
		
		Integer size = allApplicants.size();
		Integer page = 1;
		
		if(size > page*5) {
			applicants = allApplicants.subList((page-1)*5, page*5);
			model.addAttribute("isNext","true");
		}
		else {
			applicants = allApplicants.subList((page-1)*5, size);
			model.addAttribute("isNext", "false");
		}
		
		model.addAttribute("page", page);
		model.addAttribute("applicants", applicants);
		return "user";
	}
	
	@RequestMapping("toVerify.do")
	public String toVerify() {
		System.out.println("前往实名认证页面");
		return "verify";
	}
	
	@RequestMapping("toForgetPassword")
	public String toForgetPassword() {
		return "forgetPassword";
	}
	
	@RequestMapping("toUploadTest")
	public String toUploadTest() {
		return "uploadText";
	}
	
	@RequestMapping("toManagerUser.done")
	public String toManagerUser(Model model) {
		List<User> allUsers = userService.getAll();
		List<User> users;
		
		Integer size = allUsers.size();
		Integer page = 1;
		if(size > page*5) {
			users = allUsers.subList((page-1)*5, page*5);
			model.addAttribute("isNext","true");
		}
		else {
			users = allUsers.subList((page-1)*5, size);
			model.addAttribute("isNext", "false");
		}
		
		model.addAttribute("page", page);
		model.addAttribute("users", users);
		
		return "manager2";
	}
	
	@RequestMapping("toManager.done")
	public String toManager(Model model) {
		List<Applicant> allApplicants = applicantService.getAll();
		List<Applicant> applicants;
		
		Map<String, String> users = new HashMap<String, String>();
		for(User user : userService.getAll())
			users.put(user.getId(), user.getPhone());
		model.addAttribute("users", users);
		
		Integer size = allApplicants.size();
		Integer page = 1;
		if(size > page*5) {
			applicants = allApplicants.subList((page-1)*5, page*5);
			model.addAttribute("isNext","true");
		}
		else {
			applicants = allApplicants.subList((page-1)*5, size);
			model.addAttribute("isNext", "false");
		}
		
		model.addAttribute("page", page);
		model.addAttribute("applicants", applicants);
		return "manager";
	}
}