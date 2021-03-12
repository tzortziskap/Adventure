/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
    
    @Autowired
    private CountyService countyService;
    @Autowired
    private TypeIndoorOutdoorService indoorOutdoorService;
    
    @GetMapping()
    public String showHome(Model model){
        model.addAttribute("counties", countyService.getCountys());
        model.addAttribute("indoorOutdoors", indoorOutdoorService.getTypeIndoorOutdoors());
        return "index";
    }
    
    @GetMapping("/find")
    public String returnCities(@PathVariable("id") int id, Model model){
        List<City> cities = countyService.getCountyById(id).getCityList();
        model.addAttribute("cities", cities);
        return "index";
    }
    
    
}
