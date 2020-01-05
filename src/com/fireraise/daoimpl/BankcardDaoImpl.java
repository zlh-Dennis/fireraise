package com.fireraise.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.fireraise.dao.BankcardDao;
import com.fireraise.pojo.Bankcard;

@Repository
public class BankcardDaoImpl implements BankcardDao {

	@Resource
	private HibernateTemplate ht;
	
	@Override
	public Boolean insert(Bankcard bankcard) {
		try {
			ht.save(bankcard);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Bankcard getOneById(String bankcardId) {
		return ht.get(Bankcard.class, bankcardId);
	}

	@Override
	public List<Bankcard> getAllByUser(String userId) {
		Bankcard example = new Bankcard();
		example.setUserId(userId);
		return ht.findByExample(example);
	}

	@Override
	public Boolean updateState(String bankcardId, Boolean state) {
		Bankcard bankcard = ht.get(Bankcard.class, bankcardId);
		bankcard.setState(state);
		try {
			ht.update(bankcard);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean updatePassword(String bankcardId, String newPassword) {
		Bankcard bankcard = ht.get(Bankcard.class, bankcardId);
		bankcard.setPassword(newPassword);
		try {
			ht.update(bankcard);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	* @Title: withdrawToBankCard
	* @Description: 提现,从用户的账户提现到银行卡
	* @param bankcardId 要提现的银行卡
	* @param money 提现的金额
	 */
	@Override
	public Boolean withdrawToBankCard(String bankcardId, Integer money) {
		Bankcard bankcard = ht.get(Bankcard.class, bankcardId);
		bankcard.setMoney(bankcard.getMoney() + money);
		try {
			ht.update(bankcard);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	* @Title: rechargeFromBankcard
	* @Description: 充值,从用户的银行卡充值到用户账户
	* @param bankcardId 要充值的银行卡
	* @param money 充值金额
	 */
	@Override
	public Boolean rechargeFromBankcard(String bankcardId, Integer money) {
		Bankcard bankcard = ht.get(Bankcard.class, bankcardId);
		bankcard.setMoney(bankcard.getMoney() - money);
		try {
			ht.update(bankcard);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}