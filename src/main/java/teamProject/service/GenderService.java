/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Gender;

/**
 *
 * @author tzortziskapellas
 */

public interface GenderService{
    
    List<Gender> getGenders();

    void addGender(Gender gender);

    void deleteGender(int id);

    Gender getGenderById(int id) ;

    Gender updateGender(Gender gender);
}
