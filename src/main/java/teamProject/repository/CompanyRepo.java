/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import teamProject.entity.Company;
import teamProject.entity.Event;

/**
 *
 * @author tzortziskapellas
 */
@Repository
public interface CompanyRepo extends JpaRepository<Company, Integer> {

    Company findByEmail(String email);

    @Query("SELECT e FROM Event e WHERE e.companyId.id=?1")
    List<Event> allEventsByCompany(int id);
}
