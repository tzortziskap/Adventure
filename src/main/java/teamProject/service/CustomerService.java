/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Customer;
import teamProject.exceptions.EmailExistException;
import teamProject.exceptions.UsernameExistException;

/**
 *
 * @author tzortziskapellas
 */

public interface CustomerService{
    
    List<Customer> getCustomers();

    Customer addCustomer(Customer customer) throws EmailExistException, UsernameExistException;

    void deleteCustomer(int id);

    Customer getCustomerById(int id) ;

    Customer updateCustomer(Customer customer);

    Customer getCustomerByEmail(String email);
    
}
