/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import teamProject.entity.City;
import teamProject.entity.County;
import teamProject.service.CountyService;
import teamProject.sort.CityComparator;

/**
 *
 * @author tzortziskapellas
 */
@Controller
@RequestMapping("/county")
public class CountyController {

    @Autowired
    private CountyService countyService;

    @GetMapping()
    @ResponseBody
    public ResponseEntity<List<County>> getCountys() {
        return new ResponseEntity(countyService.getCountys(), HttpStatus.OK);
    }

    @GetMapping("/cities/{id}")
    @ResponseBody
    public ResponseEntity<List<City>> getCitiesByCountyId(@PathVariable(value = "id") int id) {
        List<City> cities = countyService.getCountyById(id).getCityList();
        Collections.sort(cities, new CityComparator());
        return new ResponseEntity(cities,HttpStatus.OK);
    }

}
