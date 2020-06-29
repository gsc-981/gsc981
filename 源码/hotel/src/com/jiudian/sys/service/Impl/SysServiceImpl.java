package com.jiudian.sys.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jiudian.core.base.BaseDao;
import com.jiudian.core.base.BaseServiceImpl;
import com.jiudian.sys.dao.SysUserDao;
import com.jiudian.sys.entity.SysUser;
import com.jiudian.sys.service.SysService;
import org.springframework.util.DigestUtils;

@Service("SysService")
@Transactional
public class SysServiceImpl extends BaseServiceImpl<SysUser> implements SysService {

	@Autowired
	private SysUserDao sysUserDao;
	
	
	@Override
	public BaseDao<SysUser> getBaseDao() {
		// TODO Auto-generated method stub
		return sysUserDao;
	}


	@Override
	public void updateSysUser(SysUser sysUser) {
		SysUser newSysUser = get(sysUser.getId());
		newSysUser.setLoginId(sysUser.getLoginId());
		newSysUser.setUserName(sysUser.getUserName());
		if(!sysUser.getPassword().equals(newSysUser.getPassword())) {
			String md5password = DigestUtils.md5DigestAsHex(sysUser.getPassword().getBytes());
			newSysUser.setPassword(md5password);
		}
		update(newSysUser);
	}

}
