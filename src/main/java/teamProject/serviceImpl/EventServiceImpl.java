/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import teamProject.entity.Customer;
import teamProject.entity.CustomerBooksEvent;
import teamProject.entity.Event;
import teamProject.repository.EventRepo;
import teamProject.service.EventService;

@Transactional
@Service
public class EventServiceImpl implements EventService {
    
@Autowired
    private EventRepo eventRepo;

    @Override
    public List<Event> getEvents() {
        return eventRepo.findAll();
    }

    @Override
    public Event addEvent(Event event) {
        
        return eventRepo.save(event);
    }

    @Override
    public void deleteEvent(int id) {
        eventRepo.deleteById(id);
    }

    @Override
    public Event getEventById(int id) {
        return eventRepo.findById(id).get();
    }

    @Override
    public Event updateEvent(Event event) {
        return eventRepo.save(event);
    }
    
@Override
    public List<Event> seachDynamically(Specification<Event> specs){
        return eventRepo.findAll(Specification.where(specs));
        
    }

    @Override
    public List<Event> findEventsBycompanyId(int id) {
        return eventRepo.findBycompanyId(id);
    }

    @Override
    public List<Event> getEventsByCategoryName(String category) {
        return eventRepo.findBycategoryIdCategoryName(category);
    }

    @Override
    public List<Event> getEventsByCategoryId(int category) {
        return eventRepo.findBycategoryId(category);
    }

    @Override
    public List<Event> getAvailableEventsAccordingDateAndEventIds(List<Integer> ids, Date date,int positions) {
         return eventRepo.findByIdNotInAndStartingDateGreaterThanAndRemainingPositionsGreaterThan(ids,date,positions);
    }
    
    @Override
    public List<Event> getAvailableEventsAccordingDate(Date date,int positions) {
         return eventRepo.findByStartingDateAfterAndRemainingPositionsGreaterThan(date,positions);
    }

    @Override
    public List<Event> getEventsWhichHaveAvailablePositions(int positions) {
        return eventRepo.findByRemainingPositionsGreaterThan(positions);
    }
    
}
