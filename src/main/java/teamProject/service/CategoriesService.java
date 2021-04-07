/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Categories;

/**
 *
 * @author tzortziskapellas
 */
public interface CategoriesService {
    
    List<Categories> getCategoriess();

    void addCategories(Categories categories);

    void deleteCategories(int id);

    Categories getCategoriesById(int id) ;

    Categories updateCategories(Categories categories);

    Categories findBycategoryName(String category);
    
}
