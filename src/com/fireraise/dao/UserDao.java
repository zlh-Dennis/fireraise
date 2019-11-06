package com.fireraise.dao;

import java.util.List;

import com.fireraise.pojo.User;

public interface UserDao {

    Boolean insert(User user);
    
    User getOneById(String userId);
    User getOneByPhone(String userPhone);
    List<User> getAllUser();
    
    Boolean updatePassword(String userId, String newPassword);
    Boolean updateState(String userId, Boolean state);
    
    Boolean withdraw(String userId, Integer money); // 从个人账户提现到银行卡
    Boolean donation(String userId, Integer money); // 从个人账户捐款
    Boolean recharge(String userId, Integer money); // 从银行卡充值到个人账户
}