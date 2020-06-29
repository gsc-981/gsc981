package com.jiudian.vip.dao;

import org.springframework.stereotype.Repository;

import com.jiudian.core.base.BaseDao;
import com.jiudian.vip.entity.Vip;

import java.util.List;

@Repository
public class VipDao extends BaseDao<Vip> {

	public Vip returnVip(Vip vip) {

		save(vip);
		return vip;
	}

	public List<Vip> phoneFind(String phone) {
		List<Vip> vips = findByHql("FROM Vip v WHERE v.phone=?", phone);
		return vips;
	}

}
