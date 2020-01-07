package com.fireraise.service;

import java.util.List;

import com.fireraise.pojo.Bankcard;

public interface BankCardService {

Boolean insert(Bankcard bankcard);
	
	Bankcard getOneById(String bankcardId);
	List<Bankcard> getAllByUser(String userId);
	
	Boolean updateState(String bankcardId, Boolean state);
	Boolean updatePassword(String bankcardId, String newPassword);
	Boolean withdrawToBankCard(String bankcardId, Integer money);
	Boolean rechargeFromBankcard(String bankcardId, Integer money);
	
}