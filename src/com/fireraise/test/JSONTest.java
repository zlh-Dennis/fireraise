package com.fireraise.test;

import com.alibaba.fastjson.JSON;
import com.fireraise.pojo.Bankcard;
import com.fireraise.util.IdGeneration;

public class JSONTest {

	public static void main(String[] args) {
		
		Bankcard bankcard = new Bankcard(IdGeneration.bankcardID(), "测试用银行卡", "123456789", "17853243531", "1234", 10000, true);
		String value = JSON.toJSONString(bankcard);
		System.out.println(value);
		
	}

}