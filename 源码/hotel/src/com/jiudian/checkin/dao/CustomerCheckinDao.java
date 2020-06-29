package com.jiudian.checkin.dao;

import com.jiudian.checkin.entity.Checkin;
import com.jiudian.checkin.entity.CustomerCheckin;
import com.jiudian.core.base.BaseDao;
import com.jiudian.customer.entity.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerCheckinDao extends BaseDao<CustomerCheckin> {

    public List<Customer> getcustomerlist(String id) {
        Checkin checkin = getHibernateTemplate().get(Checkin.class, id);
        String hql = "SELECT c.customerByCustomerId FROM CustomerCheckin c WHERE c.checkinByCheckinId=?";
        List<Customer> customers = (List<Customer>)this.getHibernateTemplate().find(hql, checkin);
        return customers;
    }
}
