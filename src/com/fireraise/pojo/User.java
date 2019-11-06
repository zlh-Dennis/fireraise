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
 * 用户类
 * @author Dennis
 */
@Getter @Setter @Table(name = "user")
@Entity @ToString @RequiredArgsConstructor
public class User {

    //@GenericGenerator定义一个通用的主键/id生成器，指定主键的生成策略
    @GeneratedValue(generator = "pkAssigned")
    @GenericGenerator(name = "pkAssigned", strategy = "assigned")
    
    @Id
    @NonNull private String id;          // 用户id
    @NonNull private String name;        // 用户姓名
    @NonNull private String phone;       // 用户手机号
    @NonNull private String email;       // 用户邮箱
    @NonNull private String password;    // 用户登录密码
    private Integer money;               // 用户账号内的金额
    @NonNull private String bankcard;    // 用户银行卡号
    private Boolean state;               // 用户账号的状态
    @NonNull private String IDCard1;     // 身份证正面照片id
    @NonNull private String IDCard2;     // 身份证反面照片id
    
    public User() {}
}