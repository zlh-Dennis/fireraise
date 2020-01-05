package com.fireraise.util;

import java.util.UUID;

public class UUIDGenerator {

	public String getUUID(int number) {
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		// 去掉"-"符号
		String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23)
				+ str.substring(24);
		return temp.substring(0, number);
	}

}