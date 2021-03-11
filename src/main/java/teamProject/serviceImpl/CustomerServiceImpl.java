/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import teamProject.entity.Customer;
import teamProject.repository.CustomerRepo;
import teamProject.repository.RolesRepo;
import teamProject.service.CustomerService;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepo customerRepo;
    @Autowired
    private RolesRepo roleRepo;

    @Override
    public List<Customer> getCustomers() {
        return customerRepo.findAll();
    }

    @Override
    public Customer addCustomer(Customer customer) {
        customerRepo.save(customer);
        return customer;
    }

    @Override
    public void deleteCustomer(int id) {
        customerRepo.deleteById(id);
    }

    @Override
    public Customer getCustomerById(int id) {
        return customerRepo.findById(id).get();
    }

    @Override
    public Customer updateCustomer(Customer customer) {
        return customerRepo.save(customer);
    }

}
