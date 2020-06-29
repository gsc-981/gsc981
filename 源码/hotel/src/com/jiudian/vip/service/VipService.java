package com.jiudian.vip.service;

import java.util.List;

import com.jiudian.core.base.BaseService;
import com.jiudian.vip.entity.Vip;

public interface VipService extends BaseService<Vip> {

	List<Vip> findAll();

	Vip findById(String id);

	void updataVip(Vip vip);

	void deleteVip(Vip vip);

	Vip returnVip(Vip vip);

	List<Vip> findVip(String vipPhone);

	Vip logincheck(String username, String password);

}
