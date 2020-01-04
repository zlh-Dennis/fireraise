package com.fireraise.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @Table(name = "applican")
@Entity @ToString
public class Applicant {

    //@GenericGenerator定义一个通用的主键/id生成器，指定主键的生成策略
    @GeneratedValue(generator = "pkAssigned")
    @GenericGenerator(name = "pkAssigned", strategy = "assigned")
    
    @Id
    private String id;          		 // 项目id
    private String name;				 // 项目名
    private String userId;      		 // 项目发起人id
    private String beginDate;   		 // 项目开始时间
    private String endDate;              // 项目结束时间
    private Integer avilable;            // 项目可提取金额
    private Integer money;               // 项目总筹集的金额
    private Integer target;	 			 // 项目目标金额
    private Byte state;      		     // 项目的状态  正常:1;未审核:0;已完成:2;已冻结:3;已停止:4;审核未通过：5
    private String text;        		 // 项目的文本描述
    private String picture1;    		 // 项目图片1，同时也是项目的封面
    private String picture2;    		 // 项目图片2
    private String picture3;    		 // 项目图片3
    
    public Applicant() {}
    
    public Applicant(String id, String userId, String beginDate) {
    	this.id = id;
    	this.userId = userId;
    	this.beginDate = beginDate;
    	this.avilable = 0;
    	this.money = 0;
    	this.state = (byte) 0;
    }
    
}