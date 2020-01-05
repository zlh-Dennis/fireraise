package com.fireraise.serviceimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fireraise.dao.BillDao;
import com.fireraise.pojo.Bill;
import com.fireraise.service.BillService;
import com.fireraise.util.DateUtil;

@Service
public class BillServiceImpl implements BillService {

	@Resource private BillDao billdao;
	
	@Override
	public Boolean insert(Bill bill) {
		return billdao.insert(bill);
	}

	@Override
	public Bill getOnById(String billId) {
		return billdao.getOnById(billId);
	}

	@Override
	public List<Bill> getAllByUser(String userId) {
		return billdao.getAllByUser(userId);
	}

	@Override
	public List<Bill> dateFilter(List<Bill> bills, String beginDate, String endDate) {
		List<Bill> list = new ArrayList<Bill>();
		if ((null == beginDate || "".equals(beginDate)) && (null == endDate || "".equals(endDate)))
			return bills;
		
		if ((null == beginDate || "".equals(beginDate)) && (null != endDate && !"".equals(endDate)))
			beginDate = "2000-01-01 00:00";
			
		if ((null != beginDate && !"".equals(beginDate)) && (null == endDate || "".equals(endDate)))
			endDate = DateUtil.toString(new Date());
		
		for (Bill bill : bills)
			if(DateUtil.inDate(bill.getDate(), beginDate + " 00:00", endDate + " 23:59"))
				list.add(bill);
		System.out.println("经过时间过滤器过滤之后，还剩：" + list.size());
		return list;
	}

//	@Override
//	public List<Bill> typeFilter(List<Bill> list, Byte type) {
//		List<Bill> bills = new ArrayList<Bill>();
//		if (null == type)
//			return list;
//
//		for (Bill bill : list)
//			if (type == bill.getType())
//				bills.add(bill);
//		System.out.println("经过状态过滤器过滤之后，还剩：" + bills.size());
//		
//		return bills;
//	}

}