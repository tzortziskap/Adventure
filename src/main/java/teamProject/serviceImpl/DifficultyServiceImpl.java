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
import teamProject.entity.Difficulty;
import teamProject.repository.DifficultyRepo;
import teamProject.service.DifficultyService;

@Transactional
@Service
public class DifficultyServiceImpl implements DifficultyService {
    
@Autowired
    private DifficultyRepo difficultyRepo;

    @Override
    public List<Difficulty> getDifficultys() {
        return difficultyRepo.findAll();
    }

    @Override
    public void addDifficulty(Difficulty difficulty) {
        difficultyRepo.save(difficulty);
    }

    @Override
    public void deleteDifficulty(int id) {
        difficultyRepo.deleteById(id);
    }

    @Override
    public Difficulty getDifficultyById(int id) {
        return difficultyRepo.findById(id).get();
    }

    @Override
    public Difficulty updateDifficulty(Difficulty difficulty) {
        return difficultyRepo.save(difficulty);
    }
    
}
