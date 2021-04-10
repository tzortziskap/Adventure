/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import teamProject.dto.Order;
import teamProject.entity.CustomerBooksEvent;

/**
 *
 * @author tzortziskapellas
 */
public interface CustomerBooksEventService{
    
    List<CustomerBooksEvent> getCustomerBooksEvents();

    CustomerBooksEvent addCustomerBooksEvent(CustomerBooksEvent customerBooksEvent);

    void deleteCustomerBooksEvent(int id);

    CustomerBooksEvent getCustomerBooksEventById(int id) ;

    CustomerBooksEvent updateCustomerBooksEvent(CustomerBooksEvent customerBooksEvent);
    
    public CustomerBooksEvent create(HttpServletRequest request, String total, Order order);
}
