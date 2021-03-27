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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import teamProject.entity.City;
import teamProject.entity.Categories;
import teamProject.service.CategoriesService;

/**
 *
 * @author tzortziskapellas
 */
@Controller
@RequestMapping("/categories")
public class CategoryController {
        
    @Autowired
    private CategoriesService categoryService;
    
    @GetMapping()
    @ResponseBody
    public ResponseEntity<List<Categories>> getCategorys(){
        return new ResponseEntity(categoryService.getCategoriess(), HttpStatus.OK);
    }
    
}
