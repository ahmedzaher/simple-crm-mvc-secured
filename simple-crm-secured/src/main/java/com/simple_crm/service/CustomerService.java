package com.simple_crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simple_crm.dao.CustomerDAO;
import com.simple_crm.entity.Customer;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDAO myCustomerDAO;
	
	@Transactional
	public  List<Customer> getCustomers(){
		return myCustomerDAO.getCustomers();
	}

	@Transactional
	public void addCustomer(Customer customer) {
		myCustomerDAO.saveCustomer(customer);
		
	}

	@Transactional
	public Customer getCustomer(int id) {
		return myCustomerDAO.getCustomer(id); 
	}
	@Transactional
	public void updateCustomer(Customer customer) {
		myCustomerDAO.saveCustomer(customer); 
		
	}

	@Transactional
	public void deleteCustomer(int id) {
		myCustomerDAO.deleteCustomer(id); 
	}
	@Transactional
	public List<Customer> searchCustomers(String query) {
		return myCustomerDAO.searchCustomers(query);
	}
	
}
