package com.jiudian.vip.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONField;
import com.jiudian.core.base.BaseAction;
import com.jiudian.core.util.JsonReturn;
import com.jiudian.customer.entity.Customer;
import com.jiudian.vip.entity.Vip;
import com.jiudian.vip.service.VipService;
import com.mysql.fabric.xmlrpc.base.Array;

@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class FrontLoginAction extends BaseAction {

	@Autowired
	private VipService vipService;
	
	private String state;
	private String username;
	private String password;
	
	@Action(value = "/sys/vip/logincheck")
	public void logincheck() throws IOException
	{
		JsonReturn jsonReturn = new JsonReturn();
		if(ServletActionContext.getRequest().getSession().getAttribute("user")==null)
		{
			Vip vip = vipService.logincheck(username,password);
			if(vip != null )
			{
				String name = null;
				Collection<Customer> collection = vip.getCustomersByVipId();
				for(Customer customer : collection)
				{
					 name = customer.getCustomerName();
					 
				}
				ServletActionContext.getRequest().getSession().setAttribute("user", name);
				ServletActionContext.getRequest().getSession().setAttribute("vip", vip.getId());
				ServletActionContext.getRequest().getSession().setAttribute("phone", vip.getPhone());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String birthday = sdf.format(vip.getBirthday());
				jsonReturn.setMsg(birthday);
			}
			else
			{
				jsonReturn.setMsg("error");
			}
		}
		else
		{
			jsonReturn.setMsg("success");
		}
		String jsonString = JSON.toJSONString(jsonReturn);
		ServletActionContext.getResponse().getWriter().write(jsonString);
	}
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
