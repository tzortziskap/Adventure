/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import teamProject.entity.Customer;
import teamProject.exceptions.EmailExistException;
import teamProject.exceptions.UsernameExistException;
import teamProject.repository.CustomerRepo;
import teamProject.service.CredentialsService;
import teamProject.service.CustomerService;
import teamProject.service.RolesService;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepo customerRepo;
    @Autowired
    private RolesService rolesService;
    @Autowired
    private CredentialsService credentialsService;


    @Override
    public List<Customer> getCustomers() {
        return customerRepo.findAll();
    }

    @Override
    public Customer addCustomer(Customer customer) throws EmailExistException, UsernameExistException{
        if(customerRepo.findByEmail(customer.getEmail())!=null){
            throw new EmailExistException("Υπάρχει ήδη λογαριασμός με αύτο το mail.");
        }else{
        customer.getCredentialsId().setRolesId(rolesService.getRolesById(1));
        credentialsService.addCredentials(customer.getCredentialsId());
        return customerRepo.save(customer);
        }
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
    public Customer updateCustomer(Customer customer) throws EmailExistException, UsernameExistException {
        Customer newCustomer = customerRepo.findById(customer.getId()).get();
         if(customerRepo.findByEmail(customer.getEmail())!=null && !customer.getEmail().equals(newCustomer.getEmail())){
            throw new EmailExistException("Υπάρχει ήδη λογαριασμός με αύτο το mail.");
        }
        customer.getCredentialsId().setId(newCustomer.getCredentialsId().getId());
        credentialsService.updateCredentials(customer.getCredentialsId());
        return customerRepo.save(customer);
    }

    @Override
    public Customer getCustomerByEmail(String email) {
        return customerRepo.findByEmail(email);
    }

}
