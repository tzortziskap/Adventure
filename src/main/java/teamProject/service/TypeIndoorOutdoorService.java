/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.TypeIndoorOutdoor;

/**
 *
 * @author tzortziskapellas
 */
public interface TypeIndoorOutdoorService {
    
    List<TypeIndoorOutdoor> getTypeIndoorOutdoors();

    void addTypeIndoorOutdoor(TypeIndoorOutdoor typeIndoorOutdoor);

    void deleteTypeIndoorOutdoor(int id);

    TypeIndoorOutdoor getTypeIndoorOutdoorById(int id) ;

    TypeIndoorOutdoor updateTypeIndoorOutdoor(TypeIndoorOutdoor typeIndoorOutdoor);
}
