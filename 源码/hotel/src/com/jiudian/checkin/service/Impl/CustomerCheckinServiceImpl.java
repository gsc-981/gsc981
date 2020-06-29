package com.jiudian.checkin.service.Impl;

import com.jiudian.checkin.dao.CustomerCheckinDao;
import com.jiudian.checkin.entity.CustomerCheckin;
import com.jiudian.checkin.service.CustomerCheckinService;
import com.jiudian.core.base.BaseDao;
import com.jiudian.core.base.BaseServiceImpl;
import com.jiudian.customer.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("CustomerCheckinService")
@Transactional
public class CustomerCheckinServiceImpl extends BaseServiceImpl<CustomerCheckin> implements CustomerCheckinService {
    @Autowired
    private CustomerCheckinDao customerCheckinDao;

    @Override
    public BaseDao<CustomerCheckin> getBaseDao() {
        return customerCheckinDao;
    }

    @Override
    public List<Customer> getcustomerlist(String id) {
        return customerCheckinDao.getcustomerlist(id);
    }
}
