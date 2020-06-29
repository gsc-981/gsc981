package com.jiudian.sys.service;

import com.jiudian.core.base.BaseService;
import com.jiudian.sys.entity.SysUser;

public interface SysService extends BaseService<SysUser> {

	void updateSysUser(SysUser sysUser);

}
