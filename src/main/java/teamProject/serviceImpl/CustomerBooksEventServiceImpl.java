/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import teamProject.entity.CustomerBooksEvent;
import teamProject.entity.Event;
import teamProject.repository.CustomerBooksEventRepo;
import teamProject.service.CustomerBooksEventService;

@Transactional
@Service
public class CustomerBooksEventServiceImpl implements CustomerBooksEventService {
    
@Autowired
    private CustomerBooksEventRepo customerBooksEventRepo;

    @Override
    public List<CustomerBooksEvent> getCustomerBooksEvents() {
        return customerBooksEventRepo.findAll();
    }

    @Override
    public CustomerBooksEvent addCustomerBooksEvent(CustomerBooksEvent customerBooksEvent) {
        return customerBooksEventRepo.save(customerBooksEvent);
    }

    @Override
    public void deleteCustomerBooksEvent(int id) {
        customerBooksEventRepo.deleteById(id);
    }

    @Override
    public CustomerBooksEvent getCustomerBooksEventById(int id) {
        return customerBooksEventRepo.findById(id).get();
    }

    @Override
    public CustomerBooksEvent updateCustomerBooksEvent(CustomerBooksEvent customerBooksEvent) {
        return customerBooksEventRepo.save(customerBooksEvent);
    }

    @Override
    public int getRemainingPositionsOfAnEvent(int id) {
        return customerBooksEventRepo.countBookingById(id);
    }
    
}
