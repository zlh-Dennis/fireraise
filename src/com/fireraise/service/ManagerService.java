package com.fireraise.service;

import com.fireraise.pojo.Manager;

public interface ManagerService {

	Manager getOneById(String managerId);
	Manager getOneByPhone(String phone);
	
}