package com.fireraise.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.fireraise.pojo.Bankcard;
import com.fireraise.pojo.User;
import com.fireraise.service.BankCardService;
import com.fireraise.service.UserService;
import com.fireraise.util.IdGeneration;

@Controller
public class BankCardController {

	@Resource private BankCardService bankCardService;
	@Resource private UserService userService;
	
	@RequestMapping("addBankcard")
	@ResponseBody
	public String addBankcard(String addBankcard_number, String addBankcard_name, String addBankcard_password, String userId) {
		System.out.println(addBankcard_number + " " + addBankcard_name + " " + addBankcard_password + " " + userId);
		
		Bankcard bankcard = new Bankcard(IdGeneration.bankcardID(), addBankcard_name, addBankcard_number, userId, addBankcard_password, 10000, true);
		
		if(bankCardService.insert(bankcard))
			return "success";
		else
			return "fail";
	}
	
	@RequestMapping("recharge")
	@ResponseBody
	public String recharge(HttpServletRequest request, String recharge_bankcard, String recharge_money, String recharge_password, String userId) {
		System.out.println(recharge_bankcard + " " + recharge_money + " " + recharge_password + " " + userId);
		Integer money = Integer.valueOf(recharge_money);
		
		Bankcard bankcard = bankCardService.getOneById(recharge_bankcard);
		
		if(!recharge_password.equals(bankcard.getPassword())) return "password error";
		
		if(money > bankcard.getMoney()) return "money error";
		
		Boolean flag1 = userService.recharge(userId, money);
		Boolean flag2 = bankCardService.rechargeFromBankcard(recharge_bankcard, money);
		
		if(flag1 && flag2) {
			System.out.println("充值成功");
			User user = userService.getOneById(userId);
			request.getSession().setAttribute("account", user);
			return "success";
		} else if(!flag1 && flag2) {
			userService.recharge(userId, money);
			User user = userService.getOneById(userId);
			request.getSession().setAttribute("account", user);
			return "success";
		} else if(flag1 && !flag2) {
			bankCardService.rechargeFromBankcard(recharge_bankcard, money);
			User user = userService.getOneById(userId);
			request.getSession().setAttribute("account", user);
			return "success";
		}
		
		return "fail";
	}
	
	@RequestMapping("withdraw")
	@ResponseBody
	public String withdraw(HttpServletRequest request, String withdraw_bankcard, String withdraw_money, String withdraw_password, String userId) {
		System.out.println(withdraw_bankcard + " " + withdraw_money + " " + withdraw_password + " " + userId);
		Integer money = Integer.valueOf(withdraw_money);
		
		Bankcard bankcard = bankCardService.getOneById(withdraw_bankcard);
		User user = userService.getOneById(userId);
		
		if(!withdraw_password.equals(bankcard.getPassword())) return "password error";
		
		if(money > user.getMoney()) return "money error";
		
		Boolean flag1 = userService.withdrawToBankCard(userId, money);
		Boolean flag2 = bankCardService.withdrawToBankCard(withdraw_bankcard, money);
		
		if(flag1 && flag2) {
			System.out.println("提现成功");
			User user1 = userService.getOneById(userId);
			request.getSession().setAttribute("account", user1);
			return "success";
		} else if(!flag1 && flag2) {
			userService.withdrawToBankCard(userId, money);
			User user1 = userService.getOneById(userId);
			request.getSession().setAttribute("account", user1);
			return "success";
		} else if(flag1 && !flag2) {
			bankCardService.withdrawToBankCard(withdraw_bankcard, money);
			User user1 = userService.getOneById(userId);
			request.getSession().setAttribute("account", user1);
			return "success";
		}
		
		return "fail";
	}
	
	@RequestMapping(value = "change_bankcard",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String getBankcard(String bankcardId, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		Bankcard bankcard = bankCardService.getOneById(bankcardId);
		System.out.println(bankcard.toString());
		return JSON.toJSONString(bankcard);
	}
	
	@RequestMapping("forzen_bankcard")
	@ResponseBody
	public String forzen(String bankcardId) {
		System.out.println("冻结的银行卡id为：" + bankcardId);
		if(bankCardService.updateState(bankcardId, false))
			return "success";
		else
			return "false";
	}
	
}