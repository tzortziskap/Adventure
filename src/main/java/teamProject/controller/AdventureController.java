/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 *
 * @author tzortziskapellas
 */

@RequestMapping("/Adventure")
@Controller
public class AdventureController {
    
    @GetMapping
    public String showHome(){
        return "index";
    }
    
    
}
