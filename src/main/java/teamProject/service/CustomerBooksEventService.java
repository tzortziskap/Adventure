/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
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
    
    Integer getRemainingPositionsOfAnEvent(int id);
}
