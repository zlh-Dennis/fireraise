package com.fireraise.dao;

import java.util.List;

import com.fireraise.pojo.Bill;

public interface BillDao {

	Boolean insert(Bill bill);
	
	Bill getOnById(String billId);
	List<Bill> getAllByUser(String userId);
	
}