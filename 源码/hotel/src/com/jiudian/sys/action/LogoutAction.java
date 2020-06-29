package com.jiudian.sys.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class LogoutAction extends ActionSupport {

    @Action(value = "/front/vipLogout",
            results = {@Result(name = "toindex", type = "redirect", location = "/front/index.jsp")})
    public String vipLogout() {
        ServletActionContext.getContext().getSession().remove("user");
        ServletActionContext.getContext().getSession().remove("vip");
        ServletActionContext.getContext().getSession().remove("phone");
        return "toindex";
    }

    @Action(value = "/sys/Logout",
            results = {@Result(name = "toindex", type = "redirect", location = "/sys/login.jsp")})
    public String Logout() {
        ServletActionContext.getContext().getSession().remove("sysuser");
        return "toindex";
    }
}
