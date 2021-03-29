/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import org.springframework.data.jpa.domain.Specification;
import teamProject.entity.Event;

/**
 *
 * @author tzortziskapellas
 */

public interface EventService{
    
    List<Event> getEvents();

    Event addEvent(Event event);

    void deleteEvent(int id);

    Event getEventById(int id) ;

    Event updateEvent(Event event);
    
    public List<Event> seachDynamically(Specification<Event> specs);
    
    List<Event> findEventsBycompanyId(int id);
}
