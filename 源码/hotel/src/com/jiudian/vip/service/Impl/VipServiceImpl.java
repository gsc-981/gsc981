package com.jiudian.vip.service.Impl;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiudian.core.base.BaseDao;
import com.jiudian.core.base.BaseServiceImpl;
import com.jiudian.customer.entity.Customer;
import com.jiudian.vip.dao.VipDao;
import com.jiudian.vip.entity.Vip;
import com.jiudian.vip.service.VipService;

@Service("vipService")
@Transactional
public class VipServiceImpl extends BaseServiceImpl<Vip> implements VipService {

	@Autowired
	private VipDao vipDao;
	
	@Override
	public BaseDao<Vip> getBaseDao() {
		// TODO Auto-generated method stub
		return vipDao;
	}
	
	@Override
	public List<Vip> findAll() {
		
		List<Vip> list = vipDao.getAll();
		return list;
	}


	@Override
	public Vip findById(String id) {
		Vip vip = vipDao.get(id);
		return vip;
	}

	@Override
	public void updataVip(Vip vip) {
		Vip newvip = get(vip.getId());
		newvip.setBirthday(vip.getBirthday());
		newvip.setNums(vip.getNums());
		newvip.setVipCredit(vip.getVipCredit());
		newvip.setVipLevel(vip.getVipLevel());
		update(newvip);
	}

	@Override
	public void deleteVip(Vip vip) {
		Collection<Customer> customersByVipId = vip.getCustomersByVipId();
		for(Customer customer:customersByVipId)
		{
			customer.setVipByVipId(null);
		}
		vipDao.delete(vip);
		
	}

	@Override
	public Vip returnVip(Vip vip) {
		vip = vipDao.returnVip(vip);
		return vip;
	}

	@Override
	public List<Vip> findVip(String vipPhone) {
		List<Vip> list = vipDao.findBySql("select * from vip where phone = ?0 ",vipPhone);
		return list;
	}

	@Override
	public Vip logincheck(String username, String password) {
		List<Vip> list = vipDao.findBySql("select * from vip where phone = ?0 and password = ?1", username,password);
		if(list.size()>0)
		{
			Vip vip = list.get(0);
			return vip;
		}
		else
		{
			return null;
		}
	}

}
