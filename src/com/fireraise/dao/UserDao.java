package com.fireraise.dao;

import java.util.List;

import com.fireraise.pojo.User;

public interface UserDao {

    Boolean insert(User user);
    
    User getOneById(String userId);
    User getOneByPhone(String userPhone);
    User getOneByEmail(String userEmail);
    List<User> getAllUser();
    
    Boolean updatePassword(String userId, String newPassword);
    Boolean updateState(String userId, Byte state);
    Boolean updateEmail(String userId, String newEmail);
    Boolean updateName(String userId, String name);
    Boolean updateIdcard(String userId, String idcard);
    Boolean updateIdcard1(String userId, String Idcard1);
    Boolean updateIdcard2(String userId, String Idcard2);
    Boolean verifyEmail(String userId);
    
    Boolean withdrawToBankCard(String userId, Integer money); // 从个人账户提现到银行卡
    Boolean withdrawToAccount(String userId, Integer money); // 从项目提现到个人账户
    Boolean donation(String userId, Integer money); // 从个人账户捐款
    Boolean recharge(String userId, Integer money); // 从银行卡充值到个人账户
}