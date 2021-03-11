/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.County;

/**
 *
 * @author tzortziskapellas
 */
public interface CountyService {
    
    List<County> getCountys();

    void addCounty(County county);

    void deleteCounty(int id);

    County getCountyById(int id) ;

    County updateCounty(County county);
    
}
