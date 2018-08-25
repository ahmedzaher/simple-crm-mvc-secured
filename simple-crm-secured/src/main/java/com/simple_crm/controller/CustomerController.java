package com.simple_crm.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.simple_crm.entity.Customer;
import com.simple_crm.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/list")
	public String listCustomers(Model model) {
		List<Customer> customers= customerService.getCustomers();
		model.addAttribute("customers", customers); 
		return "list-customers";
	}
	
	@GetMapping("/process-search")
	public String searchCustomers(@RequestParam("query") String query, Model model) {
		List<Customer> customers= customerService.searchCustomers(query);
		model.addAttribute("customers", customers); 
		return "list-customers";
	}
	
	@GetMapping("/show-add")
	public String showAddCustomer(Model model) { 
		Customer customer = new Customer();
		model.addAttribute("customer", customer); 
		return "add-customer";
	}
	@PostMapping("/process-add")
	public String processAddCustomer(@Valid @ModelAttribute("customer") Customer customer , BindingResult bindingResult) { 
		
		
		if(bindingResult.hasErrors()) {
			return "add-customer";
			
		}else {
			customerService.addCustomer(customer);
			return "redirect:/customer/list";
		}
		
	}
	@GetMapping("/show-update")
	public String showUpdateCustomer(@RequestParam("customer-id") int id, Model model) { 
		
		Customer customer = customerService.getCustomer(id); 
		model.addAttribute("customer", customer); 
		
		return "update-customer";
	}
	
	@GetMapping("/process-delete")
	public String processDeleteCustomer(@RequestParam("customer-id") int id ) { 
		
		customerService.deleteCustomer(id);  
		
		return "redirect:/customer/list";
	}
	
	
	
}
