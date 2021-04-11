/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.repository;

import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import teamProject.entity.Event;

/**
 *
 * @author tzortziskapellas
 */
@Repository
public interface EventRepo extends JpaRepository<Event,Integer>, JpaSpecificationExecutor<Event>{

    public List<Event> findBycompanyId(int id);

    public List<Event> findBycategoryIdCategoryName(String category);

    public List<Event> findBycategoryId(int category);

    @Query ("SELECT e FROM Event e WHERE e.id not in ?1 and e.startingDate >= ?2 and e.remainingPositions >?3")
    public List<Event> findByIdNotInAndStartingDateGreaterThanAndRemainingPositionsGreaterThan(List<Integer> ids, Date date, int id);
    
    public List<Event> findByStartingDateAfterAndRemainingPositionsGreaterThan(Date date,int id);
    
    List<Event> findByRemainingPositionsGreaterThan(int positions);
    
    List<Event> findBycategoryIdCategoryNameContainingIgnoreCaseAndStartingDateAfterAndRemainingPositionsGreaterThan(String categoryName,Date date,int id);
}
