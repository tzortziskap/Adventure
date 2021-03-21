package teamProject.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import teamProject.entity.Company;
import teamProject.entity.Customer;

@Controller
public class AuthenticationController {

    @GetMapping("/loginPage")
    public String showLoginPage() {
        return "loginPage";
    }

    @GetMapping("/register")
    public String showRegisterPage(@ModelAttribute("customer") Customer customer, @ModelAttribute("company") Company company,
            Model model, HttpServletRequest request) {
        model.addAttribute("custEmailExist", request.getParameter("custEmailExist"));
        model.addAttribute("custUsernameExist", request.getParameter("custUsernameExist"));
        model.addAttribute("compEmailExist", request.getParameter("compEmailExist"));
        model.addAttribute("compUsernameExist", request.getParameter("compUsernameExist"));

        return "registerPage";
    }
}
