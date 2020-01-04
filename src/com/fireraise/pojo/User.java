package com.fireraise.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @Table(name = "user")
@Entity @ToString @AllArgsConstructor
public class User {

	// @GenericGenerator定义一个通用的主键/id生成器，指定主键的生成策略
	@GeneratedValue(generator = "pkAssigned")
	@GenericGenerator(name = "pkAssigned", strategy = "assigned")

	@Id
	private String id; 			// 用户id
	private String name; 		// 用户姓名
	private String date;		// 用户注册日期
	private String phone; 		// 用户手机号
	private String email; 		// 用户邮箱
	private Boolean mailState;  // 用户邮箱状态：true：已激活；false：未激活
	private String password; 	// 用户登录密码
	private Integer money; 		// 用户账号内的金额
	private Byte state; 		// 用户账号的状态: 0:未实名; 2:冻结; 1:正常
	private String IdCard; 		// 身份证号
	private String IDCard1; 	// 身份证正面照片id
	private String IDCard2; 	// 身份证反面照片id

	public User() {}
}