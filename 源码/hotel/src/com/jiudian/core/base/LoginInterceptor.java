package com.jiudian.core.base;

import com.jiudian.sys.entity.SysUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        System.out.println("========================执行拦截器=====================");
        System.out.println("调用的类："+actionInvocation.getAction().getClass().getName());
        System.out.println("调用的Action方法是："+actionInvocation.getProxy().getActionName());
        System.out.println("调用的方法是："+actionInvocation.getProxy().getMethod());
        SysUser sysUser = (SysUser)ActionContext.getContext().getSession().get("sysuser");
        if(sysUser!=null) {
            System.out.println("==========================放行=========================");
            return actionInvocation.invoke();
        }
        else {
            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!拦截!!!!!!!!!!!!!!!!!!!!!!!!!!");
            return "noPermissions";
        }
    }
}
