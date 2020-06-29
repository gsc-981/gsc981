package com.jiudian.customer.dao;

import org.springframework.stereotype.Repository;

import com.jiudian.core.base.BaseDao;
import com.jiudian.customer.entity.Customer;

import java.util.List;

@Repository
public class CustomerDao extends BaseDao<Customer> {

    public List<Customer> idcardFind(String customerCard) {
        List<Customer> customers = findByHql("FROM Customer c WHERE c.customerCard=?", customerCard);
        return customers;
    }
}
