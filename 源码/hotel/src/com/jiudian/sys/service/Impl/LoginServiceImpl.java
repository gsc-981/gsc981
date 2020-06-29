package com.jiudian.sys.service.Impl;

import com.jiudian.core.base.BaseDao;
import com.jiudian.core.base.BaseServiceImpl;
import com.jiudian.sys.dao.SysUserDao;
import com.jiudian.sys.entity.SysUser;
import com.jiudian.sys.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.List;


@Service("LoginService")
@Transactional
public class LoginServiceImpl extends BaseServiceImpl<SysUser> implements LoginService {

    @Autowired
    private SysUserDao sysUserDao;
    
    @Override
    public SysUser checkUser(String username, String password,String type) {
        SysUser sysUser = new SysUser();
        sysUser.setLoginId(username);

        //密码md5加密
        String md5password = DigestUtils.md5DigestAsHex(password.getBytes());
        //sysUser.setPassword(md5password);

        //sysUser.setType(type);
        //查询
        List<SysUser> list = this.findByHql("FROM SysUser s WHERE s.loginId=? AND s.password=?", username, md5password);

        //返回查询结果
        if(list.size() > 0) {
            return list.get(0);
        }
        else {
            return null;
        }
        //this.save(sysUser);
        //this.findByHql("FROM SysUser s WHERE s.loginId=? AND s.able=?", "admin", 1);
        //this.executeHql("UPDATE SysUser s SET s.type=? WHERE s.loginId=?", "0", "admin");
        //System.out.println(ls);
        //SysUser sysUser1 = this.load("8f239d9b-d49b-47c2-ae25-636160d832c7");
        //sysUser1.setUserName("666");
        //this.update(sysUser1);
        //this.delete(sysUser1);
        //System.out.println(sysUser1);
        //this.getAll();
    }

    @Override
    public BaseDao getBaseDao() {
        return sysUserDao;
    }

}
