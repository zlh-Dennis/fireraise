package com.fireraise.dao;

import com.fireraise.pojo.Manager;

public interface ManagerDao {

    Manager getOneById(String managerId);
    Manager getOneByPhone(String managerPhone);
    
}