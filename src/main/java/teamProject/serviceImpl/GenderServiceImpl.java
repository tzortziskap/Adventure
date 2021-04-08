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
import teamProject.entity.Gender;
import teamProject.repository.GenderRepo;
import teamProject.service.GenderService;

@Transactional
@Service
public class GenderServiceImpl implements GenderService {
    
@Autowired
    private GenderRepo genderRepo;

    @Override
    public List<Gender> getGenders() {
        return genderRepo.findAll();
    }

    @Override
    public void addGender(Gender gender) {
        genderRepo.save(gender);
    }

    @Override
    public void deleteGender(int id) {
        genderRepo.deleteById(id);
    }

    @Override
    public Gender getGenderById(int id) {
        return genderRepo.findById(id).get();
    }

    @Override
    public Gender updateGender(Gender gender) {
        return genderRepo.save(gender);
    }
    
}
