package com.fireraise.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 操作记录类
 * @author Dennis
 */
@Getter @Setter @Table(name = "recard")
@Entity @ToString @AllArgsConstructor
public class Recard {

    //@GenericGenerator定义一个通用的主键/id生成器，指定主键的生成策略
    @GeneratedValue(generator = "pkAssigned")
    @GenericGenerator(name = "pkAssigned", strategy = "assigned")
    
    @Id
    private String id;          // 记录id
    private String userId;      // 操作发起人id
    private String appId;       // 操作项目id
    private Integer money;      // 操作金额
    private Boolean type;       // true:捐款; false:提现
    private String date;        // 操作发起时间
    
    public Recard () {}
    
}