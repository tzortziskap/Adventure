/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import teamProject.entity.TypeIndoorOutdoor;

/**
 *
 * @author tzortziskapellas
 */
@Repository
public interface TypeIndoorOutdoorRepo extends JpaRepository<TypeIndoorOutdoor,Integer> {
    
}
