package com.fireraise.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fireraise.pojo.Applicant;
import com.fireraise.pojo.User;
import com.fireraise.service.ApplicantService;
import com.fireraise.service.OperationService;
import com.fireraise.service.UserService;

@Controller
public class ManagerController {
	@Resource ApplicantService applicantService;
	@Resource OperationService operationService;
	@Resource UserService userService;

	@RequestMapping("manager_audit")
	@ResponseBody
	public String audit(String applicantId, String state) throws Exception {
		Applicant applicant = applicantService.getOneById(applicantId);
		User user = userService.getOneById(applicant.getUserId());
		
		Byte i = Byte.valueOf(state);
		if (applicantService.updateState(applicantId, i)) {
			switch (state) {
			case "1": {
				String mailText = "您申请的项目：" + applicant.getName() + " 已经通过审核.";
				operationService.SendEmail(user.getEmail(), "审核通过", mailText);
				break;
			}
			case "3": {
				String mailText = "您申请的项目：" + applicant.getName() + " 已经被冻结.";
				operationService.SendEmail(user.getEmail(), "项目冻结", mailText);
				break;
			}
			case "5": {
				String mailText = "您申请的项目：" + applicant.getName() + " 未通过审核.请修改后重新申请";
				operationService.SendEmail(user.getEmail(), "项目冻结", mailText);
				break;
			}
			}
			return "success";
		} else
			return "false";
	}

	@RequestMapping("manager_userverify")
	@ResponseBody
	public String verify(String userId, String state) throws Exception {
		User user = userService.getOneById(userId);
		Byte i = Byte.valueOf(state);
		
		if (userService.updateState(userId, i)) {
			switch (state) {
			case "2": {
				String mailText = "您的实名认证已经通过审核.";
				operationService.SendEmail(user.getEmail(), "实名认证通过", mailText);
				break;
			}
			case "3": {
				String mailText = "您的账户已经被冻结.";
				operationService.SendEmail(user.getEmail(), "账户冻结", mailText);
				break;
			}
			case "4": {
				String mailText = "您的实名认证未通过审核.请修改后重新申请";
				operationService.SendEmail(user.getEmail(), "实名认证不通过", mailText);
				break;
			}
			}
			return "success";
		} else
			return "false";
	}
	
	@RequestMapping("manager_app_query")
	public String appQuery(Model model, String app_name, String app_phone, String app_state, String app_begin,
			String app_end, String app_page, String app_again) {
		Byte state = null == app_state || "".equals(app_state) ? null : Byte.valueOf(app_state);
		Integer page;

		if ("1".equals(app_again))
			page = 1;
		else
			page = Integer.valueOf(app_page);

		// 直接查询所有的项目，然后在每个过滤器中过滤
		List<Applicant> allApplicants = applicantService.dateFilter(
				applicantService.nameFilter(applicantService.phoneFilter(
						applicantService.stateFilter(applicantService.getAll(), state), app_phone), app_name),
				app_begin, app_end);
		List<Applicant> applicants = null;
		Integer size = allApplicants.size();

		Map<String, String> users = new HashMap<String, String>();
		for(User user : userService.getAll())
			users.put(user.getId(), user.getPhone());
		model.addAttribute("users", users);
		
		if (size > page * 5) {
			applicants = allApplicants.subList((page - 1) * 5, page * 5);
			model.addAttribute("isNext", "true");
		} else {
			applicants = allApplicants.subList((page - 1) * 5, size);
			model.addAttribute("isNext", "false");
		}

		System.out.println("size = " + applicants.size());

		model.addAttribute("applicants", applicants);
		model.addAttribute("page", page);
		model.addAttribute("app_name", app_name);
		model.addAttribute("app_phone", app_phone);
		model.addAttribute("app_state", app_state);
		model.addAttribute("app_begin", app_begin);
		model.addAttribute("app_end", app_end);
		model.addAttribute("app_all", applicants.size());
		model.addAttribute("app_max", applicants.size() / 5);

		return "manager";
	}
	
	@RequestMapping("manager_user_query")
	public String userQuery(Model model, String user_name, String user_phone, String user_state, String user_begin,
			String user_end, String user_page, String user_again) {
		Byte state = null == user_state || "".equals(user_state) ? null : Byte.valueOf(user_state);
		Integer page;

		if ("1".equals(user_again))
			page = 1;
		else
			page = Integer.valueOf(user_page);

		// 直接查询所有的项目，然后在每个过滤器中过滤
		List<User> allUsers = userService.nameFilter(
				userService.stateFilter(
						userService.dateFilter(
								userService.getAll(), user_begin, user_end), state), user_name);
		
		List<User> users = null;
		Integer size = allUsers.size();

		if (size > page * 5) {
			users = allUsers.subList((page - 1) * 5, page * 5);
			model.addAttribute("isNext", "true");
		} else {
			users = allUsers.subList((page - 1) * 5, size);
			model.addAttribute("isNext", "false");
		}

		System.out.println("size = " + users.size());

		model.addAttribute("users", users);
		model.addAttribute("page", page);
		model.addAttribute("user_name", user_name);
		model.addAttribute("user_phone", user_phone);
		model.addAttribute("user_state", user_state);
		model.addAttribute("user_begin", user_begin);
		model.addAttribute("user_end", user_end);
		model.addAttribute("user_all", users.size());
		model.addAttribute("user_max", users.size() / 5);

		return "manager2";
	}

}