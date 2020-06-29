package com.jiudian.customer.service;

import java.util.List;

import com.jiudian.core.base.BaseService;
import com.jiudian.customer.entity.Customer;

public interface CustomerService extends BaseService<Customer> {

	String findByPage();

	List<Customer> findAll();

	Customer findbyId(String customerId);


	void addCustomer(Customer customer, String birthday, String password);

	void deleteCustomer(Customer customer);

	void updataCustomer(Customer customer);



	//String findByPage(int page, int limit);

}
