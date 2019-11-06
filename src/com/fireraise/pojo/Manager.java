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
 * 管理员类
 * @author Dennis
 */
@Getter @Setter @Table(name = "manager")
@Entity @ToString @AllArgsConstructor
public class Manager {
    
    //@GenericGenerator定义一个通用的主键/id生成器，指定主键的生成策略
    @GeneratedValue(generator = "pkAssigned")
    @GenericGenerator(name = "pkAssigned", strategy = "assigned")
    
    @Id
    private String id;          // 管理员id
    private String phone;       // 管理员手机号
    private String password;    // 管理员登录密码
    
    public Manager() {}
}