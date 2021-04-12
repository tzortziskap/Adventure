/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.Date;
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

    public List<Event> getEventsByCategoryName(String category);

    public List<Event> getEventsByCategoryId(int category);
    
    public List<Event> getAvailableEventsAccordingDateAndEventIds(List<Integer> ids,Date date,int positions);
    
    public List<Event> getAvailableEventsAccordingDate(Date date, int positions);
    
    List<Event> getEventsWhichHaveAvailablePositions(int positions);
    
    public List<Event> getAvailableEventsAccordingCategoryNameAndDate(String categoryName, Date date, int positions);

    Event changeTheRemainPositions(Event updateEvent);
}
