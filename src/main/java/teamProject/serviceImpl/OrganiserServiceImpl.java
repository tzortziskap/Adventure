/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import teamProject.entity.Organiser;
import teamProject.entity.Roles;
import teamProject.repository.OrganiserRepo;
import teamProject.service.OrganiserService;

@Transactional
@Service
public class OrganiserServiceImpl implements OrganiserService {
    
@Autowired
    private OrganiserRepo organiserRepo;

    @Override
    public List<Organiser> getOrganisers() {
        return organiserRepo.findAll();
    }

    @Override
    public Organiser addOrganiser(Organiser organiser) {
        return organiserRepo.save(organiser);
    }

    @Override
    public void deleteOrganiser(int id) {
        organiserRepo.deleteById(id);
    }

    @Override
    public Organiser getOrganiserById(int id) {
        return organiserRepo.findById(id).get();
    }

    @Override
    public Organiser updateOrganiser(Organiser organiser) {
        return organiserRepo.save(organiser);
    }
    
}
