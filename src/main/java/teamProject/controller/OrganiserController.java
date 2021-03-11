/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import teamProject.entity.Organiser;
import teamProject.service.OrganiserService;

/**
 *
 * @organiser tzortziskapellas
 */ 
@Controller
@RequestMapping("/organiser")
public class OrganiserController {
    @Autowired
    private OrganiserService service;


 @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showForm(){
        return " ";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String create(Organiser organiser, RedirectAttributes attributes){
        service.addOrganiser(organiser);
        return " ";//Redirect instructs client to sent a new GET request to /organiser
    }
    
    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes){
        service.deleteOrganiser(id);
        return " ";
    }
    
    @GetMapping("/update/{id}")
    public String showFormUpdate(@PathVariable("id") int id, Model model){
        Organiser organiser = service.getOrganiserById(id);
        model.addAttribute("organiserToEdit", organiser);
        return " ";
    }
    
    @PostMapping("/update")
    public String update(Organiser organiser, RedirectAttributes attributes){
        service.updateOrganiser(organiser);
        return " ";
    }
}

