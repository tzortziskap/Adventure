/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import teamProject.entity.Customer;
import teamProject.service.CityService;
import teamProject.service.CountyService;
import teamProject.service.CustomerService;
import teamProject.service.RolesService;

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
    private CountyService countyService;


 @GetMapping("/register")
    public String showForm(@ModelAttribute("customer") Customer customer, Model model){
        model.addAttribute("counties",countyService.getCountys());
        return "customer-register-form";
    }
    
    @PostMapping("/register")
    public String create(@Valid @ModelAttribute("customer") Customer customer, BindingResult result, RedirectAttributes attributes){
        if(result.hasErrors()){
            return "redirect:/customer/register";
        }
        service.addCustomer(customer);
        attributes.addFlashAttribute("registered", "Successfully registered");
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
}

