/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.sort;

import java.util.Comparator;
import teamProject.entity.City;

/**
 *
 * @author tzortziskapellas
 */
public class CityComparator implements Comparator<City>{

    @Override
    public int compare(City o1, City o2) {
        return o1.getName().compareTo(o2.getName());
    }
    
}
