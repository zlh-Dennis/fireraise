package com.fireraise.test;

import com.fireraise.util.DateUtil;

public class DateUtilTest {

	public static void main(String[] args) {
		System.out.println(DateUtil.inDate("2020-01-01 00:00", "2020-01-01 00:00", "2020-01-01 23:59"));
		System.out.println(DateUtil.inDate("2020-01-01 00:01", "2020-01-01 00:00", "2020-01-01 23:59"));
		System.out.println(DateUtil.inDate("2020-01-01 23:59", "2020-01-01 00:00", "2020-01-01 23:59"));
		System.out.println(DateUtil.inDate("2020-01-01 00:02", "2020-01-01 00:00", "2020-01-01 23:59"));
		System.out.println(DateUtil.inDate("2020-01-01 01:00", "2020-01-01 00:00", "2020-01-01 23:59"));
		System.out.println(DateUtil.inDate("2020-01-01 23:58", "2020-01-01 00:00", "2020-01-01 23:59"));
	}

}