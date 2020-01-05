package com.fireraise.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.SneakyThrows;

public class DateUtil {

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    public static String toString(Date date) {
        return sdf.format(date);
    }
    
    @SneakyThrows
    public static Date toDate(String date) {
        return sdf.parse(date);
    }
    
    /**
     * 判断某个时间是否处于起始时间到终止时间之间(等于起始时间或终止时间时也认为是在此时间周期之间)
     * @param date 要判断的时间
     * @param begin 起始时间
     * @param end 终止时间
     * @return true:是   false:否
     */
    public static Boolean inDate(String date, String begin, String end) {
        return (toDate(date).compareTo(toDate(begin)) >= 0 && toDate(date).compareTo(toDate(end)) <= 0)? true:false;
    }
	
}