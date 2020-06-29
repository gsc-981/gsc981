package com.jiudian.checkin.action;

import com.jiudian.checkin.service.CustomerCheckinService;
import com.jiudian.checkin.service.Impl.CustomerCheckinServiceImpl;
import com.jiudian.customer.entity.Customer;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@ParentPackage("my-default")
@Namespace("/")
@Scope("prototype")
public class CustomerCheckinAction extends ActionSupport{

    @Autowired
    private CustomerCheckinService customerCheckinService;

    private String id;

    /**
     * 显示入住顾客详情页面
     * */
    @Action(value = "/sys/checkin/getOneRoomCustomers",

            interceptorRefs = {@InterceptorRef("MyInterceptor")},
            results = {@Result(name = "getOneRoomCustomers", location = "/checkin/customer-room.jsp")})
    public String getOneRoomCustomers() {
        List<Customer> customers = customerCheckinService.getcustomerlist(id);
        ServletActionContext.getContext().put("customers", customers);
        return "getOneRoomCustomers";
    }

    public void setId(String id) {
        this.id = id;
    }
}
