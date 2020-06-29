package com.jiudian.customer.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jiudian.core.base.BaseAction;
import com.jiudian.customer.entity.Customer;
import com.jiudian.customer.service.CustomerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;


@Controller
@ParentPackage("my-default")
@Namespace("/")
@Scope("prototype")
public class CustomerAction extends BaseAction implements ModelDriven<Customer> {

	private Customer customer = new Customer();

	@Override
	public Customer getModel() {
		return customer;
	}
	
	@Autowired
	private CustomerService customerService ;
	
	private int page;
	private int limit;
	
	
	
	public void setPage(int page) {
		this.page = page;
	}



	public void setLimit(int limit) {
		this.limit = limit;
	}


	@Action(value="/sys/customer/findAll",
			interceptorRefs = {@InterceptorRef("MyInterceptor")})
	public void findAll() throws IOException
	{
		String josnString = customerService.findByPage();
		ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write(josnString);
	}
	
	@Action(value="/sys/customer/findAllCustomer",
			interceptorRefs = {@InterceptorRef("MyInterceptor")},
			results = {@Result(name = "findAll", location = "/customer/customer-list.jsp")})
	public String finddAllCustomer()
	{
		List<Customer> list = customerService.findAll();
		ActionContext.getContext().getValueStack().push(list);
		return "findAll";
	}
	
	@Action(value="/sys/custoemr/showMessage",
			interceptorRefs = {@InterceptorRef("MyInterceptor")},
			results = {@Result(name = "showMessage", location = "/customer/customer-show.jsp")})
	public String showMessage()
	{
		
		customer = customerService.findbyId(customer.getId());
		return "showMessage";
	}
	
	@Action(value="/sys/custoemr/edit",
			interceptorRefs = {@InterceptorRef("MyInterceptor")},
			results = {@Result(name = "edit", location = "/customer/customer-edit.jsp")})
	public String edit()
	{
		customer = customerService.findbyId(customer.getId());
		if(customer.getVipByVipId()!=null)
		{
			String vipid = customer.getVipByVipId().getId();
			ActionContext.getContext().getValueStack().push(vipid);
		}
		return "edit";
	}
	
	@Action(value="/sys/customer/updata",
			results = {@Result(name = "exist", location = "/customer/exist.jsp"),
						@Result(name = "ok", location = "/sys/ok.jsp")},
			interceptorRefs = {@InterceptorRef("MyInterceptor")})
	public String updata()
	{
		try {
			customerService.updataCustomer(customer);
		}catch (Exception e) {
			return "exist";
		}
		return "ok";
	}

	@Action(value="/sys/customer/save",
			results = {@Result(name = "save", location = "/front/index.jsp"),
						@Result(name = "error", location = "/front/signup-fail.jsp")})
	public String save()
	{
		String res = "save";
		String birthday = request.getParameter("birthday");
		String password = request.getParameter("password");
		try {
			customerService.addCustomer(customer, birthday, password);
		}catch (Exception e) {
			res = "error";
		}
		return res;
	}

	@Action(value="/sys/customer/syssave",
			interceptorRefs = {@InterceptorRef("MyInterceptor")},
			results = {@Result(name = "ok", location = "/sys/ok.jsp"),
					@Result(name = "exist", location = "/customer/exist.jsp")})
	public String syssave()
	{
		String birthday = request.getParameter("birthday");
		String password = request.getParameter("password");
		try {
			customerService.addCustomer(customer, birthday, password);
		}catch (Exception e) {
			return "exist";
		}
		return "ok";
	}
	
	@Action(value="/sys/customer/delete",
			interceptorRefs = {@InterceptorRef("MyInterceptor")},
			results = {@Result(name = "delete" ,type="redirectAction",location = "findAllCustomer.action")})
	public String delete()
	{
		customer = customerService.findbyId(request.getParameter("id"));
		customerService.deleteCustomer(customer);
		return "delete";	
	}
}
