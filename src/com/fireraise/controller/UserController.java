package com.fireraise.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fireraise.pojo.Applicant;
import com.fireraise.pojo.User;
import com.fireraise.service.ApplicantService;
import com.fireraise.service.OperationService;
import com.fireraise.service.UserService;
import com.fireraise.util.DateUtil;
import com.fireraise.util.IdGeneration;

@Controller
public class UserController {

	@Resource private OperationService operationService;
	@Resource private ApplicantService applicantService;
	@Resource private UserService userService;

	@RequestMapping("user_app_query")
	public String appQuery(Model model, String app_name, String app_state, String app_begin,
			String app_end, String app_page, String app_again, String userId) {
		Byte state = null == app_state || "".equals(app_state) ? null : Byte.valueOf(app_state);
		Integer page;

		if ("1".equals(app_again))
			page = 1;
		else
			page = Integer.valueOf(app_page);

		// 直接查询所有的项目，然后在每个过滤器中过滤
		List<Applicant> allApplicants = applicantService.dateFilter(
				applicantService.nameFilter(
						applicantService.stateFilter(
								applicantService.getAllByUserId(userId), state), app_name),
				app_begin, app_end);
		
		List<Applicant> applicants = null;
		Integer size = allApplicants.size();

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
		model.addAttribute("app_state", app_state);
		model.addAttribute("app_begin", app_begin);
		model.addAttribute("app_end", app_end);
		model.addAttribute("app_all", applicants.size());
		model.addAttribute("app_max", applicants.size() / 5);

		return "user";
	}
	
	@RequestMapping("user_forzen")
	@ResponseBody
	public String forzen(String applicantId) {
		if(applicantService.updateState(applicantId, (byte)4))
			return "success";
		else
			return "fail";
	}
	
	@RequestMapping("apply")
	public String apply(HttpServletRequest request, Model model) throws Exception {
		System.out.println("开始上传申请");
		User user = (User) request.getSession().getAttribute("account");
		Applicant applicant = new Applicant(IdGeneration.applicantID(), user.getId(), DateUtil.toString(new Date()));

		// 获取表单里的内容
		List<FileItem> items = operationService.upload(request);
		// 图片保存路径
		String path = "D:\\Program\\2019-12\\fireraise\\src\\main\\webapp\\WEB-INF\\poster";

		// 迭代整个集合
		for (FileItem item : items) {
			if (item.isFormField()) { // 如果是普通表单项目
				System.out.println("这是普通表单项目:  ");
				request.setCharacterEncoding("UTF-8");
				if ("app_name".equals(item.getFieldName())) {
					applicant.setName(item.getString("UTF-8"));
				} else if ("app_target".equals(item.getFieldName())) {
					applicant.setTarget(Integer.valueOf(item.getString("UTF-8")));
				} else if ("app_text".equals(item.getFieldName())) {
					applicant.setText(item.getString("UTF-8"));
				}
				System.out.println(item.getFieldName() + " = " + item.getString("UTF-8"));
			} else {
				System.out.println("这是图片表单:");
				String pictureId = IdGeneration.pictureID();
				System.out.println("pictureId = " + pictureId);
				if ("app_picture1".equals(item.getFieldName())) {
					applicant.setPicture1(pictureId);
				} else if ("app_picture2".equals(item.getFieldName())) {
					applicant.setPicture2(pictureId);
				} else if ("app_picture3".equals(item.getFieldName())) {
					applicant.setPicture3(pictureId);
				}
				item.write(new File(path, pictureId + ".jpg"));
			}
		}
		System.out.println(applicant.toString());
		if (applicantService.insert(applicant)) {
			model.addAttribute("type", "true");
			return "apply";
		} else {
			model.addAttribute("type", "false");
			return "apply";
		}
	}

	@RequestMapping("verify")
	public String verify(HttpServletRequest request, Model model) throws Exception {
		System.out.println("开始上传申请");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("account");

		// 获取表单里的内容
		List<FileItem> items = operationService.upload(request);
		// 图片保存路径
		String path = "D:\\Program\\2019-12\\fireraise\\src\\main\\webapp\\WEB-INF\\idcard";

		User verUser = new User();
		verUser.setId(user.getId());
		// 迭代整个集合
		for (FileItem item : items) {
			if (item.isFormField()) { // 如果是普通表单项目
				System.out.println("这是普通表单项目:  ");
				request.setCharacterEncoding("UTF-8");
				if ("user_realname".equals(item.getFieldName())) {
					verUser.setName(item.getString("UTF-8"));
				} else if ("user_idcard".equals(item.getFieldName())) {
					verUser.setIdCard(item.getString("UTF-8"));
				}
				System.out.println(item.getFieldName() + " = " + item.getString("UTF-8"));
			} else {
				System.out.println("这是图片表单:");
				String pictureId = IdGeneration.pictureID();
				System.out.println("pictureId = " + pictureId);
				if ("user_idcard1".equals(item.getFieldName())) {
					verUser.setIDCard1(pictureId);
				} else if ("user_idcard2".equals(item.getFieldName())) {
					verUser.setIDCard2(pictureId);
				}
				item.write(new File(path, pictureId + ".jpg"));
			}
		}
		System.out.println(verUser.toString());
		
		if (userService.verify(verUser)) {
			User sessionUser = (User) session.getAttribute("account");
			session.setAttribute("account", userService.getOneById(sessionUser.getId()));
			model.addAttribute("type", "true");
			return "verify";
		} else {
			model.addAttribute("type", "false");
			return "verify";
		}
	}

}