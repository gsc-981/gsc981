package com.jiudian.customer.service.Impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.jiudian.core.base.BaseDao;
import com.jiudian.core.base.BaseServiceImpl;
import com.jiudian.customer.dao.CustomerDao;
import com.jiudian.customer.entity.Customer;
import com.jiudian.customer.service.CustomerService;
import com.jiudian.core.util.JsonReturn;
import com.jiudian.vip.dao.VipDao;
import com.jiudian.vip.entity.Vip;

@Service("CustomerService")
@Transactional
public class CustomerServiceImpl extends BaseServiceImpl<Customer> implements CustomerService{

	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private VipDao vipDao;
	
	
	@Override
	public BaseDao<Customer> getBaseDao() {
	
		return customerDao;
	}

	@Override
	public String findByPage() {
		List<Customer> list = getAll();
		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setCount(rowCount("customer"));
		jsonReturn.setData(list);
		String jsonString = JSON.toJSONString(jsonReturn);
		return jsonString;
	}

	@Override
	public List<Customer> findAll() {
		List<Customer> list = customerDao.getAll();
		return list;
	}

	@Override
	public Customer findbyId(String customerId) {
		Customer customer = customerDao.get(customerId);
		return customer;
	}


	@Override
	public void deleteCustomer(Customer customer) {
		if(customer.getVipByVipId()!=null)
		{
			Vip vip = customer.getVipByVipId();
			vipDao.delete(vip);
		}
		customerDao.delete(customer);
		
	}

	@Override
	public void updataCustomer(Customer customer) {
		Customer newcustomer = get(customer.getId());
		newcustomer.setNotes(customer.getNotes());
		newcustomer.setCustomerName(customer.getCustomerName());
		newcustomer.setCustomerAddress(customer.getCustomerAddress());
		newcustomer.setCustomerCard(customer.getCustomerCard());
		newcustomer.setCustomerPhone(customer.getCustomerPhone());
		newcustomer.setCustomerSex(customer.getCustomerSex());
		update(newcustomer);

	}

	@Override
	public void addCustomer(Customer customer, String birthday, String password) {
		if(birthday==null||birthday.equals(""))
		{
			customerDao.save(customer);
		}
		else
		{
			int nums = 1;
			Vip vip = new Vip();
			String vipLevel = "白银会员";
			int vipCredit = 10;
			SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = sdf.parse(birthday);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			vip.setPhone(customer.getCustomerPhone());
			vip.setPassword(password);
			vip.setNums(nums);
			vip.setVipCredit(vipCredit);
			vip.setVipLevel(vipLevel);
			vip.setBirthday(date);
			vipDao.save(vip);
			customer.setVipByVipId(vip);
			customerDao.save(customer);
		}
		
	}

	/*@Override
	public String findByPage(int page, int limit) {
		List<Customer> list = pagingBySql(sqlString, first, max, values)
		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setCount(10);
		jsonReturn.setData(list);
		String jsonString = JSON.toJSONString(jsonReturn);
		ServletActionContext.getResponse().getWriter().write(jsonString);
		return null;
	}*/

	

}
