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
import teamProject.entity.City;
import teamProject.repository.CityRepo;
import teamProject.service.CityService;

@Transactional
@Service
public class CityServiceImpl implements CityService {
    
@Autowired
    private CityRepo cityRepo;

    @Override
    public List<City> getCitys() {
        return cityRepo.findAll();
    }

    @Override
    public void addCity(City city) {
        cityRepo.save(city);
    }

    @Override
    public void deleteCity(int id) {
        cityRepo.deleteById(id);
    }

    @Override
    public City getCityById(int id) {
        return cityRepo.findById(id).get();
    }

    @Override
    public City updateCity(City city) {
        return cityRepo.save(city);
    }
    
}
