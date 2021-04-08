/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import java.text.ParseException;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import teamProject.entity.CustomerBooksEvent;
import teamProject.service.CustomerBooksEventService;
import teamProject.service.CustomerService;
import teamProject.service.EventService;

/**
 *
 * @author tzortziskapellas
 */
@Controller
@RequestMapping("/booking")
public class CustomerBooksEventController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private EventService eventService;
    @Autowired
    private CustomerBooksEventService customerBooksEventService;

    @GetMapping()
    public String showForm(Model model, @ModelAttribute("book") CustomerBooksEvent customerBooksEvent) {
        model.addAttribute("events", eventService.getEvents());
        return " ";
    }

    @PostMapping("/create")
    public String processOrder(@ModelAttribute("paragelia") @Valid CustomerBooksEvent customerBooksEvent,
            BindingResult result) {

        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError e : errors) {
                System.out.println(">>>>>error====" + e);
            }
            return " ";
        }
        customerBooksEventService.addCustomerBooksEvent(customerBooksEvent);

        return " ";
    }
    
    
}
