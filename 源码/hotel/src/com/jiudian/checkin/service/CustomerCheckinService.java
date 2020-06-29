package com.jiudian.checkin.service;

import com.jiudian.checkin.entity.CustomerCheckin;
import com.jiudian.core.base.BaseService;
import com.jiudian.customer.entity.Customer;

import java.util.List;

public interface CustomerCheckinService extends BaseService<CustomerCheckin> {
    public List<Customer> getcustomerlist(String id);
}
