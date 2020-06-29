package com.jiudian.sys.service;

import com.jiudian.core.base.BaseService;
import com.jiudian.sys.entity.SysUser;

public interface LoginService extends BaseService<SysUser>{
    public SysUser checkUser(String username, String password, String type);
}
