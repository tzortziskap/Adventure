/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

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
import teamProject.entity.Company;
import teamProject.entity.Credentials;
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
    public String show(Model model, HttpServletRequest request) {
        Credentials credentials = (Credentials)request.getSession().getAttribute("loggedInUser");
        Company company = credentials.getCompany();
        List<Event> events = service.getAllEventsByCompanyId(company.getId());
        model.addAttribute("companysEvents",events );
        return "company_index";
    }
    
    @GetMapping("/eventsByCompany/{id}")
    @ResponseBody
    public ResponseEntity<List<Event>> getEventsByCompany(@PathVariable(value = "id") int id) {
        return new ResponseEntity(service.getCompanyById(id).getEventList(), HttpStatus.OK);
    }
    

    @PostMapping("/register")
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

      @GetMapping("/update")
    public String showFormUpdate(Model model, HttpServletRequest request){
        model.addAttribute("compEmailExist", request.getParameter("compEmailExist"));
        model.addAttribute("compUsernameExist", request.getParameter("compUsernameExist"));
        return "company_update";
    }
    
    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") int id, Company company,Model model, RedirectAttributes attributes, HttpServletRequest request){
        Credentials checkCredentials = (Credentials)request.getSession().getAttribute("loggedInUser");
        int sessionId = checkCredentials.getId();
        int companyId = service.getCompanyById(id).getCredentialsId().getId();
        if(sessionId!=companyId){
            model.addAttribute("message", "Δεν έχετε δικαίωμα σε αυτό το λογαριασμό");
            return "message";
        }else{
            company.setId(id);
            try {
                Company newCompany = service.updateCompany(company);
                HttpSession session = request.getSession();
                Credentials loggedInUser = credentialsService.findByUsername(newCompany.getCredentialsId().getUsername());
                loggedInUser.setPassword(null);
                loggedInUser.setPasswordResetToken(null);
                session.setAttribute("loggedInUser", loggedInUser);
            }catch (UsernameExistException ex){
                attributes.addAttribute("compUsernameExist", ex.getMessage());
                return "redirect:/company/update";
            } catch (EmailExistException ex) {
                attributes.addAttribute("compEmailExist", ex.getMessage());
                return "redirect:/company/update";
            }
            return "redirect:/company";
    }
    }
}
