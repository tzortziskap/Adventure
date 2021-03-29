/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
import teamProject.entity.Event;

/**
 *
 * @author tzortziskapellas
 */
@Repository
public interface EventRepo extends JpaRepository<Event,Integer>, JpaSpecificationExecutor<Event>{

    public List<Event> findBycompanyId(int id);
    
}
