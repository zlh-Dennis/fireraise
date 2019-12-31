package com.fireraise.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fireraise.pojo.Applicant;
import com.fireraise.service.ApplicantService;
import com.fireraise.service.OperationService;
import com.fireraise.util.DateUtil;
import com.fireraise.util.IdGeneration;

@Controller
public class UploadController {

	@Resource
	private OperationService operationService;
	@Resource
	private ApplicantService applicantService;
	
	@RequestMapping("apply")
	public String apply(HttpServletRequest request, Model model) throws Exception {
		System.out.println("开始上传申请");
		Applicant applicant = new Applicant(IdGeneration.applicantID(), request.getSession()
				.getAttribute("account").toString(), DateUtil.toString(new Date()), null);
		
		// 获取表单里的内容
		List<FileItem> items = operationService.upload(request);
		// 图片保存路径
		String path = "D:\\Program\\2019-12\\fireraise\\src\\main\\webapp\\WEB-INF\\poster";
		
		// 迭代整个集合
		for(FileItem item : items) {
			if(item.isFormField()) {	// 如果是普通表单项目
				request.setCharacterEncoding("utf-8");
				if("app_name".equals(item.getFieldName())) {
					applicant.setName(item.getString());
					break;
				} else if ("app_target".equals(item.getFieldName())) {
					applicant.setTarget(Integer.valueOf(item.getString()));
					break;
				} else if ("app_text".equals(item.getFieldName())) {
					applicant.setText(item.getString());
					break;
				}
			} else {
				String pictureId = IdGeneration.pictureID();
				if("app_picture1".equals(item.getFieldName())) {
					applicant.setPicture1(pictureId);
				}
				else if("app_picture2".equals(item.getFieldName())) {
					applicant.setPicture2(pictureId);
				}
				else if("app_picture3".equals(item.getFieldName())) {
					applicant.setPicture3(pictureId);
				}
				item.write(new File(path, pictureId));
			}
		}
		
		if(applicantService.insert(applicant)) {
			model.addAttribute("type", "true");
			return "apply";
		} else {
			model.addAttribute("type", "false");
			return "apply";
		}
		
	}

}