package com.fireraise.service;

import java.util.List;

import com.fireraise.pojo.User;

public interface UserService {

	Boolean insert(User user);
    
    User getOneById(String userId);
    User getOneByUsername(String username);
    List<User> getAll();
    
    Boolean updatePassword(String userId, String newPassword);
    Boolean updateState(String userId, Byte state);
    Boolean updateEmail(String userId, String newEmail);
    Boolean verifyEmail(String userId);
    Boolean verify(User user);
    
    Boolean withdrawToBankCard(String userId, Integer money); // 从个人账户提现到银行卡
    Boolean withdrawToAccount(String userId, Integer money); // 从项目提现到个人账户
    Boolean donation(String userId, Integer money); // 从个人账户捐款
    Boolean recharge(String userId, Integer money); // 从银行卡充值到个人账户
    
    List<User> nameFilter(List<User> users, String name);
    List<User> stateFilter(List<User> users, Byte state);
    List<User> dateFilter(List<User> users, String beginDate, String endDate);
    
//    Boolean sendMessage();
	
}