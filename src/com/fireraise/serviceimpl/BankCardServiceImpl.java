package com.fireraise.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fireraise.dao.BankcardDao;
import com.fireraise.pojo.Bankcard;
import com.fireraise.service.BankCardService;

@Service
public class BankCardServiceImpl implements BankCardService {

	@Resource private BankcardDao bankCardDao;
	
	@Override
	public Boolean insert(Bankcard bankcard) {
		return bankCardDao.insert(bankcard);
	}

	@Override
	public Bankcard getOneById(String bankcardId) {
		return bankCardDao.getOneById(bankcardId);
	}

	@Override
	public List<Bankcard> getAllByUser(String userId) {
		return bankCardDao.getAllByUser(userId);
	}

	@Override
	public Boolean updateState(String bankcardId, Boolean state) {
		return bankCardDao.updateState(bankcardId, state);
	}

	@Override
	public Boolean updatePassword(String bankcardId, String newPassword) {
		return bankCardDao.updatePassword(bankcardId, newPassword);
	}

	@Override
	public Boolean withdrawToBankCard(String bankcardId, Integer money) {
		return bankCardDao.withdrawToBankCard(bankcardId, money);
	}

	@Override
	@Transactional
	public Boolean rechargeFromBankcard(String bankcardId, Integer money) {
		return bankCardDao.rechargeFromBankcard(bankcardId, money);
	}

}