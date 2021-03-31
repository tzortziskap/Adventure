/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import teamProject.entity.Company;
import teamProject.entity.Credentials;
import teamProject.entity.Customer;
import teamProject.entity.Event;
import teamProject.exceptions.EmailExistException;
import teamProject.exceptions.UsernameExistException;
import teamProject.service.CompanyService;
import teamProject.service.CredentialsService;

/**
 *
 * @company tzortziskapellas
 */
@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService service;
    @Autowired
    private CredentialsService credentialsService;

    @GetMapping()
    public String show(@ModelAttribute("event") Event event,Model model, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        if(principal!=null){
            Credentials loginedUser = credentialsService.findByUsername(principal.getName());
            List<Event> companysEvents = loginedUser.getCompany().getEventList();
            model.addAttribute("loginedUser", loginedUser);
            model.addAttribute("companysEvents", companysEvents);
        }
        return "company_index";
    }
    
    @GetMapping("/eventsByCompany/{id}")
    @ResponseBody
    public ResponseEntity<List<Event>> getEventsByCompany(@PathVariable(value = "id") int id) {
        return new ResponseEntity(service.getCompanyById(id).getEventList(), HttpStatus.OK);
    }
    

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("company") Company company, BindingResult result, RedirectAttributes attributes) {
        try {
            service.addCompany(company);
        } catch (UsernameExistException ex) {
            attributes.addAttribute("compUsernameExist", ex.getMessage());
            return "redirect:/register";
        } catch (EmailExistException ex) {
            attributes.addAttribute("compEmailExist", ex.getMessage());
            return "redirect:/register";
        }
        return "redirect:/loginPage";//Redirect instructs client to sent a new GET request to /customer
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes) {
        service.deleteCompany(id);
        return " ";
    }

    @GetMapping("/update/{id}")
    public String showFormUpdate(@PathVariable("id") int id, Model model) {
        Company company = service.getCompanyById(id);
        model.addAttribute("companyToEdit", company);
        return " ";
    }

    @PostMapping("/update")
    public String update(Company company, RedirectAttributes attributes) {
        service.updateCompany(company);
        return " ";
    }
}
