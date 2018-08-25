package com.simple_crm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simple_crm.entity.Customer;

@Repository
public class CustomerDAO   {

	@Autowired
	private SessionFactory sessionFactory;
 
	public List<Customer> getCustomers() {

		Session session = sessionFactory.getCurrentSession();
		Query<Customer> q = session.createQuery("from Customer order by firstName", Customer.class);
		List<Customer> customers = q.getResultList();

		return customers;

	}
 
	public List<Customer> searchCustomers(String query) {
		Session session = sessionFactory.getCurrentSession();
		Query<Customer> q = session.createQuery("from Customer WHERE firstName like :query", Customer.class);
		q.setParameter("query", query + '%');
		List<Customer> customers = q.getResultList();

		return customers;
	}
 
	public void saveCustomer(Customer customer) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(customer);
	}
 
	public Customer getCustomer(int id) {
		Session session = sessionFactory.getCurrentSession();
		Customer customer = session.get(Customer.class, id);
		return customer;
	}
 
	public void updateCustomer(Customer updatedCustomer) {

		Session session = sessionFactory.getCurrentSession();
		session.save(updatedCustomer);

	}
 
	public void deleteCustomer(int id) {
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("delete Customer WHERE id = " + id).executeUpdate();
	}

}
