/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
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
        event.setRemainingPositions(event.getPositions());
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
        Event oldEvent = eventRepo.findById(event.getId()).get();
        int totalPositions  = oldEvent.getPositions();
        int remainPositions = oldEvent.getRemainingPositions();
        int newRemainPositions = event.getPositions();
        if(newRemainPositions==totalPositions){
            event.setRemainingPositions(remainPositions);
        }else if(newRemainPositions>totalPositions){
            newRemainPositions = newRemainPositions - totalPositions + remainPositions;
            event.setRemainingPositions(newRemainPositions);
        }else if(newRemainPositions<totalPositions){
            event.setRemainingPositions(newRemainPositions);
        }
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
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
    try {
        date = formatter.parse(formatter.format(date));
        return eventRepo.findByStartingDateAfterAndRemainingPositionsGreaterThan(date,positions);
    } catch (ParseException ex) {
        return getEventsWhichHaveAvailablePositions(positions);
    }
         
    }

    @Override
    public List<Event> getEventsWhichHaveAvailablePositions(int positions) {
        return eventRepo.findByRemainingPositionsGreaterThan(positions);
    }

    @Override
    public List<Event> getAvailableEventsAccordingCategoryNameAndDate(String categoryName, Date date, int positions) {
             SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
    try {
        date = formatter.parse(formatter.format(date));
        return eventRepo.findBycategoryIdCategoryNameContainingIgnoreCaseAndStartingDateAfterAndRemainingPositionsGreaterThan(categoryName,date,positions);
    } catch (ParseException ex) {
        return getEventsByCategoryName(categoryName);
    }
    }

    @Override
    public Event changeTheRemainPositions(Event updateEvent) {
        return eventRepo.save(updateEvent);
    }
    
}
