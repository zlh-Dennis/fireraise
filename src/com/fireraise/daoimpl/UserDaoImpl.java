package com.fireraise.daoimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.fireraise.dao.UserDao;
import com.fireraise.pojo.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Resource
	private HibernateTemplate ht;

	@Override
	public Boolean insert(User user) {
		try {
			ht.save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public User getOneById(String userId) {
		return ht.get(User.class, userId);
	}

	@Override
	public User getOneByPhone(String userPhone) {
		User example = new User();
		example.setPhone(userPhone);
		List<User> list = ht.findByExample(example);
		return list.size() == 0? null:list.get(0);
	}
	
	@Override
	public User getOneByEmail(String userEmail) {
		User example = new User();
		example.setEmail(userEmail);
		List<User> list = ht.findByExample(example);
		return list.size() == 0? null:list.get(0);
	}

	@Override
	public List<User> getAllUser() {
		User example = new User();
		return ht.findByExample(example);
//		Session session = HibernateUtil.getSession();
//		Query<User> query = session.createQuery("select * from User");
//		return query.list();
	}

	@Override
	public Boolean updatePassword(String userId, String newPassword) {
		User example = ht.get(User.class, userId);
		example.setPassword(newPassword);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean updateState(String userId, Byte state) {
		User example = ht.get(User.class, userId);
		example.setState(state);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean updateEmail(String userId, String newEmail) {
		User example = ht.get(User.class, userId);
		example.setEmail(newEmail);
		example.setMailState(false);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public Boolean updateName(String userId, String name) {
		User example = ht.get(User.class, userId);
		example.setName(name);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean updateIdcard(String userId, String idcard) {
		User example = ht.get(User.class, userId);
		example.setIdCard(idcard);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean updateIdcard1(String userId, String Idcard1) {
		User example = ht.get(User.class, userId);
		example.setIDCard1(Idcard1);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean updateIdcard2(String userId, String Idcard2) {
		User example = ht.get(User.class, userId);
		example.setIDCard2(Idcard2);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 
	* @Title: activiteEmail
	* @Description: 验证用户的绑定邮箱
	* @param userId 要验证的用户id
	 */
	@Override
	public Boolean verifyEmail(String userId) {
		User example = ht.get(User.class, userId);
		example.setMailState(true);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 
	* @Title: withdraw
	* @Description: 提现,用户从自己的账户提现到银行卡
	* @param userId 要提现的用户
	* @param money 提现的金额
	 */
	@Override
	public Boolean withdrawToBankCard(String userId, Integer money) {
		User example = ht.get(User.class, userId);
		example.setMoney(example.getMoney() - money);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	* @Title: withdrawToAccount
	* @Description: 提现. 从项目提现到个人账户
	* @param userId 提现发起人
	* @param money 提现金额
	 */
	@Override
	public Boolean withdrawToAccount(String userId, Integer money) {
		User example = ht.get(User.class, userId);
		example.setMoney(example.getMoney() +- money);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 
	* @Title: donation
	* @Description: 捐赠,用户从自己账户向项目中捐赠钱款
	* @param userId 要捐赠的用户
	* @param money 捐赠的金额
	 */
	@Override
	public Boolean donation(String userId, Integer money) {
		User example = ht.get(User.class, userId);
		example.setMoney(example.getMoney() - money);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	* @Title: recharge
	* @Description: 充值,用户从自己的银行卡中充值金额
	* @param userId 执行充值操作的用户
	* @param money 充值的金额
	 */
	@Override
	public Boolean recharge(String userId, Integer money) {
		User example = ht.get(User.class, userId);
		example.setMoney(example.getMoney() + money);
		try {
			ht.update(example);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}