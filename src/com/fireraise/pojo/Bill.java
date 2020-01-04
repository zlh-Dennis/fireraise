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

/**
 * 
* @ClassName: Bill
* @Description: 账单类 用于记录与钱款流动相关的操作
*
 */
@Getter @Setter @Table(name = "bill")
@Entity @ToString @AllArgsConstructor
public class Bill {

	//@GenericGenerator定义一个通用的主键/id生成器，指定主键的生成策略
    @GeneratedValue(generator = "pkAssigned")
    @GenericGenerator(name = "pkAssigned", strategy = "assigned")
    
    @Id
	private String id;		//账单编号
	private String userId;	//操作的用户id
	private Byte type;		//账单类型 1：从银行卡充值到账户； 2：从账户提现到银行卡； 3：从账户捐款到项目； 4：从项目提现到银行卡
	private String begin;	//资金流出方id
	private String end;		//资金流入方id
	private String date;	//操作日期 xxxx-xx-xx xx:xx
	private Integer money;	//操作金额
	
	public Bill() {}
	
}