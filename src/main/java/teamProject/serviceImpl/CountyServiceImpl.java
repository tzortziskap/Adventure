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
import teamProject.entity.County;
import teamProject.repository.CountyRepo;
import teamProject.service.CountyService;

@Transactional
@Service
public class CountyServiceImpl implements CountyService {
    
@Autowired
    private CountyRepo countyRepo;

    @Override
    public List<County> getCountys() {
        return countyRepo.findAll();
    }

    @Override
    public void addCounty(County county) {
        countyRepo.save(county);
    }

    @Override
    public void deleteCounty(int id) {
        countyRepo.deleteById(id);
    }

    @Override
    public County getCountyById(int id) {
        return countyRepo.findById(id).get();
    }

    @Override
    public County updateCounty(County county) {
        return countyRepo.save(county);
    }
    
}
