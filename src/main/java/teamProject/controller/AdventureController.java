/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import teamProject.entity.City;
import teamProject.entity.Event;
import teamProject.service.CountyService;
import teamProject.service.TypeIndoorOutdoorService;
/**
 *
 * @author tzortziskapellas
 */

@RequestMapping("/")
@Controller
public class AdventureController {

    @GetMapping()
    public String showHome(Model model){
        return "index";
    }
    
    @GetMapping("/access-denied")
    public String showAccessDenied(){
        return "access-denied";
    }
}
