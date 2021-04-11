/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import teamProject.entity.Credentials;
import teamProject.entity.Customer;
import teamProject.entity.CustomerBooksEvent;
import teamProject.entity.Event;
import teamProject.repository.CustomerBooksEventRepo;
import teamProject.service.CustomerBooksEventService;
import teamProject.service.EventService;

@Transactional
@Service
public class CustomerBooksEventServiceImpl implements CustomerBooksEventService {
    
@Autowired
    private CustomerBooksEventRepo customerBooksEventRepo;
@Autowired
    private EventService eventService;


    @Override
    public List<CustomerBooksEvent> getCustomerBooksEvents() {
        return customerBooksEventRepo.findAll();
    }

    @Override
    public CustomerBooksEvent addCustomerBooksEvent(CustomerBooksEvent customerBooksEvent) {
        Event updateEvent = customerBooksEvent.getEventId();
        int remainingPositions = updateEvent.getRemainingPositions() - customerBooksEvent.getAmountPositions();
        updateEvent.setRemainingPositions(remainingPositions);
        eventService.updateEvent(updateEvent);
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
    public double getTotalPrice(CustomerBooksEvent book) {
        NumberFormat formatter = new DecimalFormat("#0.00");
        double eventPrice = book.getEventId().getPrice();
        int bookingPositions = book.getAmountPositions();
        double totalPrice = eventPrice * bookingPositions;
        formatter.format(totalPrice);
        return totalPrice;
    }

    @Override
    public CustomerBooksEvent create(HttpServletRequest request, String total, CustomerBooksEvent book) {
        HttpSession session = request.getSession();
        int count = book.getAmountPositions();
        Credentials credentials = (Credentials) session.getAttribute("loggedInUser");
        Customer customer = credentials.getCustomer();
        Event event= book.getEventId();
        double total_price = Double.parseDouble(total);
        CustomerBooksEvent customerBooksEvent = new CustomerBooksEvent(count, total_price, customer, event);
        return customerBooksEvent;
    }
}
