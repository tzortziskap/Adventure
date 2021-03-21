/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import teamProject.Utility;
import teamProject.entity.Credentials;
import teamProject.exceptions.CredentialsNotFoundException;
import teamProject.service.CredentialsService;

/**
 *
 * @author tzortziskapellas
 */
@Controller
public class ForgotPasswordController {
    
    @Autowired
    private CredentialsService credentialsService;
    
    @Autowired
    private JavaMailSender mailSender; 
    
    @GetMapping("/forgotpassword")
    public String showForgotPasswordForm(Model model){
        return "forgotPasswordPage";
    }
    
    @PostMapping("/forgotpassword")
    public String processForgotPasswordForm(HttpServletRequest request,Model model){
        String username = request.getParameter("username");
        String token = RandomString.make(45);
        try {
            String email = credentialsService.updateResetPasswordToken(token, username);
            String resetPasswordLink = Utility.getSiteUrl(request) + "/reset_password?token=" + token;
            sendEmail(email,resetPasswordLink);
            model.addAttribute("successMessage","Έχουμε στειλει ένα σύνδεσμο επαννεκίνησης κωδικού μέσω e-mail.<br>Παρακαλώ ελεγξτέ τα mail σας.");
        } catch (CredentialsNotFoundException e) {
            model.addAttribute("error", e.getMessage());
            return "forgotPasswordPage";
        } catch (UnsupportedEncodingException | MessagingException ex) {
             model.addAttribute("error", "Πρόβλημα στην αποστολή μηνύματος.");
        } 
        
        return "loginPage";
    }

    private void sendEmail(String email, String resetPasswordLink) throws  UnsupportedEncodingException, MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper =  new MimeMessageHelper(message);
        helper.setFrom("contact@adventure.com","AdventureBooking Support");
        helper.setTo(email);
        String subject = "Εδώ είναι ο σύνδεσμος για να αλλάξεις τον κωδικό σου.";
        String content = "<p>Γεια σας,</p>"
                + "<p>Έχετε ζητήσει αλλαγή κωδικού.</p>"
                + "<p>Κάντε κλικ στο παρακάτω σύνδεσμο:</p>"
                + "<p><b><a href= \"" + resetPasswordLink +"\">Άλλαξε το κωδικό μου.</a><b></p>"
                + "<p>Αγνοήστε αυτό το e-mail σε περίπτωση που θυμάστε το κωδικό</p>";
        helper.setSubject(subject);
        helper.setText(content,true);
        mailSender.send(message);
    }
    
    @GetMapping("/reset_password")  
    public String showResetPasswordForm(@Param(value="token") String token,Model model){
        Credentials credentials = credentialsService.get(token);
        if(credentials==null){
            model.addAttribute("message","Invalid token");
        }
        model.addAttribute("token",token);
        return "reset_password_form";
    }
    
    @PostMapping("/reset_password")
    public String proccessResetPassword(HttpServletRequest request, Model model){
         String token = request.getParameter("token");
         String password = request.getParameter("password");
         String confirmPassword = request.getParameter("confirmPassword");
         Credentials credentials = credentialsService.get(token);
         if(credentials==null || !password.equals(confirmPassword)){
             model.addAttribute("message", "Invalid Token");
             return "message";
         }else{
             credentialsService.updatePassword(credentials, password);
             model.addAttribute("message","Έχεις αλλάξει επιτυχώς το κωδικό σου.");
             return "loginPage";
         }
    }
}
