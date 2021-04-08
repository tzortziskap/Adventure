/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
            credentialsService.deleteCredentials(customer.getCredentialsId().getId());
            return "redirect:/register";
        } 
        return "redirect:/loginPage";//Redirect instructs client to sent a new GET request to /customer
    }
    
    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes){
        service.deleteCustomer(id);
        return " ";
    }
    
    @GetMapping("/update/{id}")
    public String showFormUpdate(@PathVariable("id") int id, Model model){
        Customer customer = service.getCustomerById(id);
        model.addAttribute("customerToEdit", customer);
        return " ";
    }
    
    @PostMapping("/update")
    public String update(Customer customer, RedirectAttributes attributes){
        service.updateCustomer(customer);
        return " ";
    }
    
    @GetMapping("/getmybookings/{id}")
    @ResponseBody
    public ResponseEntity getAvaliableEvents(@PathVariable("id") int id) throws ParseException {
         Customer customer = service.getCustomerById(id);
         List<CustomerBooksEvent> events = customer.getCustomerBooksEventList();
         return new ResponseEntity<>(events, HttpStatus.OK);
     }
}

