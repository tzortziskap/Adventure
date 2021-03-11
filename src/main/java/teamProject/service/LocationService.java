/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Location;

/**
 *
 * @author tzortziskapellas
 */

public interface LocationService{
    
    List<Location> getLocations();

    void addLocation(Location location);

    void deleteLocation(int id);

    Location getLocationById(int id) ;

    Location updateLocation(Location location);
}
