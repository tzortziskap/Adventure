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
import teamProject.entity.TypeIndoorOutdoor;
import teamProject.repository.TypeIndoorOutdoorRepo;
import teamProject.service.TypeIndoorOutdoorService;

@Transactional
@Service
public class TypeIndoorOutdoorServiceImpl implements TypeIndoorOutdoorService {
    
@Autowired
    private TypeIndoorOutdoorRepo typeIndoorOutdoorRepo;

    @Override
    public List<TypeIndoorOutdoor> getTypeIndoorOutdoors() {
        return typeIndoorOutdoorRepo.findAll();
    }

    @Override
    public void addTypeIndoorOutdoor(TypeIndoorOutdoor typeIndoorOutdoor) {
        typeIndoorOutdoorRepo.save(typeIndoorOutdoor);
    }

    @Override
    public void deleteTypeIndoorOutdoor(int id) {
        typeIndoorOutdoorRepo.deleteById(id);
    }

    @Override
    public TypeIndoorOutdoor getTypeIndoorOutdoorById(int id) {
        return typeIndoorOutdoorRepo.findById(id).get();
    }

    @Override
    public TypeIndoorOutdoor updateTypeIndoorOutdoor(TypeIndoorOutdoor typeIndoorOutdoor) {
        return typeIndoorOutdoorRepo.save(typeIndoorOutdoor);
    }
    
}
