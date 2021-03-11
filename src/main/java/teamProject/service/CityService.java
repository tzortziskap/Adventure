/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.City;

/**
 *
 * @author tzortziskapellas
 */

public interface CityService{
    
    List<City> getCitys();

    void addCity(City city);

    void deleteCity(int id);

    City getCityById(int id) ;

    City updateCity(City city);
}
