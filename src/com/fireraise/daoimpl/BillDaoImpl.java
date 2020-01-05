package com.fireraise.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.fireraise.dao.BillDao;
import com.fireraise.pojo.Bill;

@Repository
public class BillDaoImpl implements BillDao {

	@Resource
	private HibernateTemplate ht;
	
	@Override
	public Boolean insert(Bill bill) {
		try {
			ht.save(bill);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Bill getOnById(String billId) {
		return ht.get(Bill.class, billId);
	}

	@Override
	public List<Bill> getAllByUser(String userId) {
		Bill example = new Bill();
		example.setUserId(userId);
		return ht.findByExample(example);
	}

}