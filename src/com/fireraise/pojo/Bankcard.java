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

@Getter @Setter @Table(name = "bankcard")
@Entity @ToString @AllArgsConstructor
public class Bankcard {
	
	//@GenericGenerator定义一个通用的主键/id生成器，指定主键的生成策略
    @GeneratedValue(generator = "pkAssigned")
    @GenericGenerator(name = "pkAssigned", strategy = "assigned")
    
    @Id
	private String id;			//银行卡id
    private String name;		//银行卡名
    private String number;		//银行卡号
	private String userId;		//银行卡持有人id
	private String password;	//银行卡支付密码,六位纯数字
	private Integer money;		//银行卡现有金额
	private Boolean state;		//银行卡状态：true 激活； false：冻结
	
	public Bankcard() {}
	
}