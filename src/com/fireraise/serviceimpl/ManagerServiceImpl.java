package com.fireraise.serviceimpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fireraise.dao.ManagerDao;
import com.fireraise.pojo.Manager;
import com.fireraise.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Resource
	private ManagerDao managerDao;
	
	@Override
	public Manager getOneByPhone(String phone) {
		return managerDao.getOneByPhone(phone);
	}

	@Override
	public Manager getOneById(String managerId) {
		return managerDao.getOneById(managerId);
	}

}
