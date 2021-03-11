/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import teamProject.entity.Location;
import teamProject.repository.LocationRepo;
import teamProject.service.LocationService;

@Transactional
@Service
public class LocationServiceImpl implements LocationService {
    
@Autowired
    private LocationRepo locationRepo;

    @Override
    public List<Location> getLocations() {
        return locationRepo.findAll();
    }

    @Override
    public void addLocation(Location location) {
        locationRepo.save(location);
    }

    @Override
    public void deleteLocation(int id) {
        locationRepo.deleteById(id);
    }

    @Override
    public Location getLocationById(int id) {
        return locationRepo.findById(id).get();
    }

    @Override
    public Location updateLocation(Location location) {
        return locationRepo.save(location);
    }
    
}
