package teamProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import teamProject.entity.Company;
import teamProject.entity.Customer;

@Controller
public class AuthenticationController {
    
    @GetMapping("/loginPage")
    public String showLoginPage(){
        return "loginPage";
    }
   
    @GetMapping("/register")
    public String showRegisterPage(@ModelAttribute("customer") Customer customer, @ModelAttribute("company") Company company, Model model){
        return "registerPage";
    }
}
