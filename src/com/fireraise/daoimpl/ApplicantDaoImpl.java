package com.fireraise.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.fireraise.dao.ApplicantDao;
import com.fireraise.pojo.Applicant;

@Repository
public class ApplicantDaoImpl implements ApplicantDao{

	@Resource
	private HibernateTemplate ht;

	@Override
	public Boolean insert(Applicant applicant) {
		try {
			ht.save(applicant);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Applicant getOneById(String applicantId) {
		return ht.get(Applicant.class, applicantId);
	}

	@Override
	public List<Applicant> getAllByUserId(String userId) {
		Applicant example = new Applicant();
		example.setUserId(userId);
		return ht.findByExample(example);
	}

	@Override
	public List<Applicant> getAll() {
		Applicant example = new Applicant();
		return ht.findByExample(example);
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Applicant> getAllByMoHu(String name) {
		List<Applicant> list = (List<Applicant>) ht.find("from Applicant where name like '%" + name + "%'");
		return list;
	}
	
	@Override
	public Boolean updateState(String applicantId, Byte state) {
		Applicant example = ht.get(Applicant.class, applicantId);
		example.setState(state);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	* @Title: donation
	* @Description: 用户捐赠,增加此项目中的筹款金额
	* @param  applicantId 受捐的项目id
	* @param  money 受捐的金额
	 */
	@Override
	public Boolean donation(String applicantId, Integer money) {
		Applicant example = ht.get(Applicant.class, applicantId);
		example.setMoney(money + example.getMoney());
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	* @Title: withdraw
	* @Description: 提现,项目的发起人从此项目中提现一部分金额
	* @param applicantId 要提现的项目
	* @param money 提现的金额
	 */
	@Override
	public Boolean withdraw(String applicantId, Integer money) {
		Applicant example = ht.get(Applicant.class, applicantId);
		example.setMoney(example.getMoney() - money);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}