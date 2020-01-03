package com.fireraise.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fireraise.pojo.User;
import com.fireraise.service.OperationService;
import com.fireraise.service.UserService;
import com.fireraise.util.IdGeneration;

@Controller
public class OperationController {

	@Resource private UserService userService;
	@Resource private OperationService operationService;
	
	@RequestMapping("sendCode")
	@ResponseBody
	public String sendForgetCode(String username) throws Exception {
		User user = userService.getOneByUsername(username);
		if(user == null) {
			System.out.println("用户不存在");
			return "Username Error";
		}
		
		System.out.println("正在生成验证码");
		String code = IdGeneration.getUUID(6);
		String mailText = " 您这次的验证码为: " + code + " 。如果不是您的操作，请无视。";
		if(operationService.SendEmail(username, "火焰筹验证码", mailText)) {
			System.out.println("验证码发送成功");
			return code;
		}
		else return "fail";
		
	}
}