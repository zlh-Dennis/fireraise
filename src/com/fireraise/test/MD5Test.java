package com.fireraise.test;

import com.fireraise.util.MD5Util;

public class MD5Test {

	public static void main(String[] args) {
		String test1 = "1234";
		String test2 = "123456";
		String test3 = "123456789";
		String test4 = "1234567890";
		String test5 = "1096731721";
		
		System.out.println("test1: " + MD5Util.encryption(test1));
		System.out.println("test2: " + MD5Util.encryption(test2));
		System.out.println("test3: " + MD5Util.encryption(test3));
		System.out.println("test4: " + MD5Util.encryption(test4));
		System.out.println("test5: " + MD5Util.encryption(test5));
	}

}