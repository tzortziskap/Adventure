/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Difficulty;

/**
 *
 * @author tzortziskapellas
 */
public interface DifficultyService{
    
    List<Difficulty> getDifficultys();

    void addDifficulty(Difficulty difficulty);

    void deleteDifficulty(int id);

    Difficulty getDifficultyById(int id) ;

    Difficulty updateDifficulty(Difficulty difficulty);
}
