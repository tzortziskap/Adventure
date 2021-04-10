/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import teamProject.entity.Credentials;
import teamProject.entity.Customer;
import teamProject.entity.CustomerBooksEvent;
import teamProject.entity.Event;
import teamProject.exceptions.EmailExistException;
import teamProject.exceptions.UsernameExistException;
import teamProject.service.CredentialsService;
import teamProject.service.CustomerService;

/**
 *
 * @customer tzortziskapellas
 */ 
@Controller
@RequestMapping("/customer")
public class CustomerController {
    
    @Autowired
    private CustomerService service;
    @Autowired
    private CredentialsService credentialsService;
    
    @GetMapping()
    public String show() {
        return "customer_index";
    }
    
    @PostMapping("/register")
    public String create(@Valid @ModelAttribute("customer") Customer customer, BindingResult result, RedirectAttributes attributes){
        try {
            service.addCustomer(customer);
        }catch (UsernameExistException ex){
            attributes.addAttribute("custUsernameExist", ex.getMessage());
            return "redirect:/register";
        } catch (EmailExistException ex) {
            attributes.addAttribute("custEmailExist", ex.getMessage());
            return "redirect:/register";
        } 
        return "redirect:/loginPage";//Redirect instructs client to sent a new GET request to /customer
    }
    
    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes){
        service.deleteCustomer(id);
        return " ";
    }
    
    @GetMapping("/update")
    public String showFormUpdate(Model model, HttpServletRequest request){
         model.addAttribute("custEmailExist", request.getParameter("custEmailExist"));
        model.addAttribute("custUsernameExist", request.getParameter("custUsernameExist"));
        return "customer_update";
    }
    
    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") int id, Customer customer,Model model, RedirectAttributes attributes, HttpServletRequest request,Principal principal){
        Credentials checkCredentials = (Credentials)request.getSession().getAttribute("loggedInUser");
        int sessionId = checkCredentials.getId();
        int customerId = service.getCustomerById(id).getCredentialsId().getId();
        if(sessionId!=customerId){
            model.addAttribute("message", "Δεν έχετε δικαίωμα σε αυτό το λογαριασμό");
            return "message";
        }else{
            customer.setId(id);
            try {
                Customer newCustomer = service.updateCustomer(customer);
                HttpSession session = request.getSession();
                Credentials loggedInUser = credentialsService.findByUsername(newCustomer.getCredentialsId().getUsername());
                loggedInUser.setPassword(null);
                loggedInUser.setPasswordResetToken(null);
                session.setAttribute("loggedInUser", loggedInUser);
            }catch (UsernameExistException ex){
                attributes.addAttribute("custUsernameExist", ex.getMessage());
                return "redirect:/customer/update";
            } catch (EmailExistException ex) {
                attributes.addAttribute("custEmailExist", ex.getMessage());
                return "redirect:/customer/update";
            }
            return "customer_index";
    }
    }
    
    @GetMapping("/myevents/{id}")
    @ResponseBody
    public ResponseEntity myEvents(@PathVariable("id") int id){
         Customer customer = service.getCustomerById(id);
         List<CustomerBooksEvent> CustomerBooksEvents = customer.getCustomerBooksEventList();
         List<Event> events = new ArrayList();
         for (CustomerBooksEvent CustomerBooksEvent : CustomerBooksEvents){
             events.add(CustomerBooksEvent.getEventId());
         }
         return new ResponseEntity<>(events, HttpStatus.OK);
     }
}

