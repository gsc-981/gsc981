package com.jiudian.sys.action;

import java.util.List;

import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;

import com.jiudian.core.base.BaseAction;
import com.jiudian.sys.entity.SysUser;
import com.jiudian.sys.service.SysService;
import com.jiudian.vip.entity.Vip;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import org.springframework.util.DigestUtils;

@Controller
@ParentPackage("my-default")
@Namespace("/")
@Scope("prototype")
public class SysAction extends BaseAction implements ModelDriven<SysUser>{

	private SysUser sysUser = new SysUser();
	
	@Autowired
	private SysService sysService;
	
	@Action(value = "/sys/sysUser/findAll",
			interceptorRefs = {@InterceptorRef("MyInterceptor")},
			results = {@Result(name = "findAll",location = "/sysUser/sysUser-list.jsp") })
	public String findAll()
	{
		List<SysUser> list = sysService.getAll();
		ActionContext.getContext().getValueStack().set("list", list);
		return "findAll";
	}
	
	@Action(value = "/sys/sysUser/edit",
			interceptorRefs = {@InterceptorRef("MyInterceptor")},
			results = {@Result(name = "edit",location = "/sysUser/sysUser-edit.jsp")})
	public String edit()
	{
		sysUser = sysService.get(sysUser.getId());
		return "edit";
	}
	
	@Action(value = "/sys/sysUser/update",
			interceptorRefs = {@InterceptorRef("MyInterceptor")})
	public void update()
	{	
		sysService.updateSysUser(sysUser);
	}
	
	@Action(value = "/sys/sysUser/delete",
			interceptorRefs = {@InterceptorRef("MyInterceptor")},
			results = {@Result(name = "delete",type = "redirectAction",location = "findAll")})
	public String delete()
	{
		sysUser = sysService.get(sysUser.getId());
		sysService.delete(sysUser);
		return "delete";
	}
	
	@Action(value = "/sys/sysUser/save",
			interceptorRefs = {@InterceptorRef("MyInterceptor")},
			results = {@Result(name = "save", location = "/sys/ok.jsp"),
			@Result(name = "exist", location = "/sysUser/exist.jsp")})
	public String save()
	{
		String res = "save";
		String md5password = DigestUtils.md5DigestAsHex(sysUser.getPassword().getBytes());
		sysUser.setPassword(md5password);
		try {
			sysService.save(sysUser);
		}catch (Exception e){
			res = "exist";
		}
		return res;
	}
	
	@Override
	public SysUser getModel() {
		// TODO Auto-generated method stub
		return sysUser;
	}
}
