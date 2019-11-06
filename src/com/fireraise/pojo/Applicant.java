package com.fireraise.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 项目类
 * @author Dennis
 */
@Getter @Setter @Table(name = "applican")
@Entity @ToString @RequiredArgsConstructor
public class Applicant {

    //@GenericGenerator定义一个通用的主键/id生成器，指定主键的生成策略
    @GeneratedValue(generator = "pkAssigned")
    @GenericGenerator(name = "pkAssigned", strategy = "assigned")
    
    @Id
    @NonNull private String id;          // 项目id
    @NonNull private String userId;      // 项目发起人id
    @NonNull private String beginDate;   // 项目开始时间
    private String endDate;              // 项目结束时间
    private Integer avilable;            // 项目可提取金额
    private Integer money;               // 项目总筹集的金额
    private Boolean state;               // 项目的状态
    @NonNull private String text;        // 项目的文本描述
    @NonNull private String picture1;    // 项目图片1，同时也是项目的封面
    @NonNull private String picture2;    // 项目图片2
    @NonNull private String picture3;    // 项目图片3
    
    public Applicant() {}
}