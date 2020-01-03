package com.fireraise.serviceimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fireraise.dao.UserDao;
import com.fireraise.pojo.Applicant;
import com.fireraise.pojo.User;
import com.fireraise.service.UserService;
import com.fireraise.util.DateUtil;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	
	@Override
	public Boolean insert(User user) {
		return userDao.insert(user);
	}

	@Override
	public User getOneById(String userId) {
		return userDao.getOneById(userId);
	}

	@Override
	public User getOneByUsername(String username) {
		User userPhone = userDao.getOneByPhone(username);
		User userEmail = userDao.getOneByEmail(username);
		return userPhone != null? userPhone:userEmail;
	}

	@Override
	public List<User> getAll() {
		return userDao.getAllUser();
	}
	
	@Override
	public Boolean updatePassword(String userId, String newPassword) {
		return userDao.updatePassword(userId, newPassword);
	}

	@Override
	public Boolean updateState(String userId, Byte state) {
		return userDao.updateState(userId, state);
	}

	@Override
	public Boolean updateEmail(String userId, String newEmail) {
		return userDao.updateEmail(userId, newEmail);
	}

	@Override
	public Boolean verifyEmail(String userId) {
		// TODO Auto-generated method stub
		return userDao.verifyEmail(userId);
	}

	@Override
	public Boolean verify(User user) {
		if(userDao.updateName(user.getId(), user.getName()) && 
		   userDao.updateIdcard(user.getId(), user.getIdCard()) && 
		   userDao.updateIdcard1(user.getId(), user.getIDCard1()) && 
		   userDao.updateIdcard2(user.getId(), user.getIDCard2()) &&
		   userDao.updateState(user.getId(), (byte)1))
			return true;
		else
			return false;
	}
	
	@Override
	public Boolean withdrawToBankCard(String userId, Integer money) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean withdrawToAccount(String userId, Integer money) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean donation(String userId, Integer money) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean recharge(String userId, Integer money) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> nameFilter(List<User> users, String name) {
		List<User> list = new ArrayList<User>();
		if (null == name || "".equals(name))
			return users;

		for (User user : users)
			if (name.equals(user.getName()))
				list.add(user);
		System.out.println("经过用户名过滤器过滤之后，还剩：" + list.size());
		return list;
	}

	@Override
	public List<User> stateFilter(List<User> users, Byte state) {
		List<User> list = new ArrayList<User>();
		if (null == state || state == (byte) 5 || state == (byte) 6)
			return users;

		for (User user : users)
			if (state == user.getState())
				list.add(user);
		System.out.println("经过状态过滤器过滤之后，还剩：" + list.size());
		return list;
	}

	@Override
	public List<User> dateFilter(List<User> users, String beginDate, String endDate) {
		List<User> list = new ArrayList<User>();
		if ((null == beginDate || "".equals(beginDate)) && (null == endDate || "".equals(endDate)))
			return users;
		
		if ((null == beginDate || "".equals(beginDate)) && (null != endDate && !"".equals(endDate)))
			beginDate = "2000-01-01 00:00";
			
		if ((null != beginDate && !"".equals(beginDate)) && (null == endDate || "".equals(endDate)))
			endDate = DateUtil.toString(new Date());
		
		for (User user : users)
			if(DateUtil.inDate(user.getDate(), beginDate + " 00:00", endDate + " 23:59"))
				list.add(user);
		System.out.println("经过时间过滤器过滤之后，还剩：" + list.size());
		return list;
	}

}