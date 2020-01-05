package com.fireraise.serviceimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fireraise.dao.ApplicantDao;
import com.fireraise.dao.UserDao;
import com.fireraise.pojo.Applicant;
import com.fireraise.service.ApplicantService;
import com.fireraise.util.DateUtil;

@Service
public class ApplicantServiceImpl implements ApplicantService {

	@Resource
	private ApplicantDao applicantDao;
	@Resource
	private UserDao userDao;

	@Override
	public Boolean insert(Applicant applicant) { // 在Controller层进行验证
		return applicantDao.insert(applicant);
	}

	@Override
	public Applicant getOneById(String applicantId) {
		return applicantDao.getOneById(applicantId);
	}

	@Override
	public List<Applicant> getAllByUserId(String userId) {
		return applicantDao.getAllByUserId(userId);
	}

	@Override
	public List<Applicant> getAll() {
		return applicantDao.getAll();
	}
	
	@Override
	public List<Applicant> getAllByMoHu(String name) {
		if(null == name || "".equals(name))
			return applicantDao.getAll();
		else
			return applicantDao.getAllByMoHu(name);
	}
	
	@Override
	public Boolean updateState(String applicantId, Byte state) {
		return applicantDao.updateState(applicantId, state);
	}

	@Override
	public Boolean donation(String applicantId, Integer money) { // 在Controller层进行验证
		return applicantDao.donation(applicantId, money);
	}

	@Override
	public Boolean withdraw(String applicantId, Integer money) { // 在Controller层进行验证
		return applicantDao.withdraw(applicantId, money);
	}

	/**
	 * @Description: 名称过滤器。将名称不是 name 的项目过滤掉
	 * @Title: nameFilter
	 * @param
	 */
	@Override
	public List<Applicant> nameFilter(List<Applicant> applicants, String name) {
		List<Applicant> list = new ArrayList<Applicant>();
		if (null == name || "".equals(name))
			return applicants;

		for (Applicant applicant : applicants)
			if (name.equals(applicant.getName()))
				list.add(applicant);
		System.out.println("经过项目名过滤器过滤之后，还剩：" + list.size());
		return list;
	}
	

	@Override
	public List<Applicant> phoneFilter(List<Applicant> applicants, String phone) {
		List<Applicant> list = new ArrayList<Applicant>();
		if (null == phone || "".equals(phone))
			return applicants;

		for (Applicant applicant : applicants) {
			System.out.println(userDao.getOneById(applicant.getUserId()).getPhone());
			System.out.println(phone);
			if (phone.equals(userDao.getOneById(applicant.getUserId()).getPhone()))
				list.add(applicant);
		}
		System.out.println("经过用户过滤器过滤之后，还剩：" + list.size());
		return list;
	}

	@Override
	public List<Applicant> stateFilter(List<Applicant> applicants, Byte state) {
		List<Applicant> list = new ArrayList<Applicant>();
		if (null == state || state == (byte) 6 || state == (byte) 7)
			return applicants;

		for (Applicant applicant : applicants)
			if (state == applicant.getState())
				list.add(applicant);
		System.out.println("经过状态过滤器过滤之后，还剩：" + list.size());
		return list;
	}

	@Override
	public List<Applicant> dateFilter(List<Applicant> applicants, String beginDate, String endDate) {
		List<Applicant> list = new ArrayList<Applicant>();
		if ((null == beginDate || "".equals(beginDate)) && (null == endDate || "".equals(endDate)))
			return applicants;
		
		if ((null == beginDate || "".equals(beginDate)) && (null != endDate && !"".equals(endDate)))
			beginDate = "2000-01-01 00:00";
			
		if ((null != beginDate && !"".equals(beginDate)) && (null == endDate || "".equals(endDate)))
			endDate = DateUtil.toString(new Date());
		
		for (Applicant applicant : applicants)
			if(DateUtil.inDate(applicant.getBeginDate(), beginDate + " 00:00", endDate + " 23:59"))
				list.add(applicant);
		System.out.println("经过时间过滤器过滤之后，还剩：" + list.size());
		return list;
	}

}