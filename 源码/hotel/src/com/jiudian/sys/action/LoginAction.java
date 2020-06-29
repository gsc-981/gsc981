package com.jiudian.sys.action;

import com.alibaba.fastjson.JSON;
import com.jiudian.sys.entity.SysUser;
import com.jiudian.sys.service.LoginService;
import com.jiudian.core.util.JsonReturn;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;

@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class LoginAction extends ActionSupport{

    @Autowired
    private LoginService loginService;

    String state;
    String username;
    String password;
    String type;

    @Action(value = "/sys/login",
            results = {@Result(name = "index", location = "/sys/login.jsp")})
    public String index() {
        return "index";
    }

    @Action(value = "/sys/login/logincheck")
    public void logincheck() throws IOException {
        JsonReturn jsonReturn = new JsonReturn();
        //如果还没有登录过则检查
        if(ServletActionContext.getRequest().getSession().getAttribute("sysuser")==null) {
            //检查用户密码是否正确
            SysUser sysUser = loginService.checkUser(username, password, type);
            //检验通过
            if (sysUser != null) {
                //session记录登录信息
                ServletActionContext.getRequest().getSession().setAttribute("sysuser", sysUser);
                //返回登录成功标志
                jsonReturn.setMsg("success");
            }
            else {
                jsonReturn.setMsg("error");
            }
        }
        //登录过则跳过检查
        else {
            jsonReturn.setMsg("success");
        }
        //返回json
        String jsonstring = JSON.toJSONString(jsonReturn);
        ServletActionContext.getResponse().getWriter().write(jsonstring);
    }

    @Action(value = "/sys/registration",
            results = {@Result(name = "index", location = "/sys/index.jsp")})
    public String registration() {

        return "index";
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setType(String type) {
        this.type = type;
    }


    public String getState() {
        return state;
    }

}
