package com.fireraise.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.fireraise.dao.ManagerDao;
import com.fireraise.pojo.Manager;

@Repository
public class ManagerDaoImpl implements ManagerDao {

	@Resource
	private HibernateTemplate ht;

	@Override
	public Manager getOneById(String managerId) {
		// TODO Auto-generated method stub
		return ht.get(Manager.class, managerId);
	}

	@Override
	public Manager getOneByPhone(String managerPhone) {
		Manager example = new Manager();
		example.setPhone(managerPhone);
		List<Manager> list = ht.findByExample(example);
		return list.size() == 0? null:list.get(0);
	}
	
}