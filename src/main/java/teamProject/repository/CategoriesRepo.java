/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import teamProject.entity.Categories;

/**
 *
 * @author tzortziskapellas
 */
@Repository
public interface CategoriesRepo extends JpaRepository<Categories,Integer>{

    public Categories findBycategoryNameContainingIgnoreCase(String category);
    
}
