/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author tzortziskapellas
 */
@Controller
public class ForgotPasswordController {
    
    @GetMapping("/forgotpassword")
    public String showForgotPasswordForm(Model model){
        return "forgotPasswordPage ";
    }
}
