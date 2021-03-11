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
import teamProject.entity.Roles;
import teamProject.repository.RolesRepo;
import teamProject.service.RolesService;

@Transactional
@Service
public class RolesServiceImpl implements RolesService {
    
@Autowired
    private RolesRepo rolesRepo;

    @Override
    public List<Roles> getRoles() {
        return rolesRepo.findAll();
    }

    @Override
    public void addRoles(Roles roles) {
        rolesRepo.save(roles);
    }

    @Override
    public void deleteRoles(int id) {
        rolesRepo.deleteById(id);
    }

    @Override
    public Roles getRolesById(int id) {
        return rolesRepo.findById(id).get();
    }

    @Override
    public Roles updateRoles(Roles roles) {
        return rolesRepo.save(roles);
    }
    
}
