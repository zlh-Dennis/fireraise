package com.fireraise.service;

import java.util.List;

import com.fireraise.pojo.Bill;

public interface BillService {

	Boolean insert(Bill bill);
	
	Bill getOnById(String billId);
	List<Bill> getAllByUser(String userId);
	
	List<Bill> typeFilter(List<Bill> list, Byte type);
	List<Bill> timeFilter(List<Bill> list, String begin, String end);
	
}