/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import com.sipios.springsearch.anotation.SearchSpec;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import teamProject.entity.Credentials;
import teamProject.entity.CustomerBooksEvent;
import teamProject.entity.Event;
import teamProject.service.CustomerService;
import teamProject.service.EventService;

/**
 *
 * @event tzortziskapellas
 */
@Controller
@RequestMapping("/event")
public class EventController {
    
    @Autowired
    private EventService service;
    @Autowired
    private CustomerService customerService;
    
    @GetMapping()
    public String showAllAvailableEvents(Model model) {
        model.addAttribute("events", service.getAvailableEventsAccordingDate(new Date(), 0));
        return "all_events";
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showForm() {
        return "event_form";
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(Event event, HttpServletRequest request) {
        Credentials user = (Credentials) request.getSession().getAttribute("loggedInUser");
        event.setCompanyId(user.getCompany());
        service.addEvent(event);
        return "redirect:/company";//Redirect instructs client to sent a new GET request to /event
    }
    
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Event> GetmyEvents(@PathVariable("id") int id) {
        return new ResponseEntity(service.findEventsBycompanyId(id), HttpStatus.OK);
    }
    
    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes) {
        service.deleteEvent(id);
        return "redirect:/company";
    }
    
    @GetMapping("/update/{id}")
    public String showFormUpdate(@PathVariable("id") int id, Model model) {
        Event event = service.getEventById(id);
        model.addAttribute("event", event);
        return "event_form";
    }
    
    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") int id, Event event,Model model, HttpServletRequest request) {
        Credentials user = (Credentials) request.getSession().getAttribute("loggedInUser");
        Event oldEvent = service.getEventById(id);
        int userCompanyId = user.getCompany().getId();
        int oldEventCompanyId = oldEvent.getCompanyId().getId();
        if (userCompanyId==oldEventCompanyId) {
            event.setId(id);
            event.getLocationId().setId(oldEvent.getLocationId().getId());
            event.setCompanyId(user.getCompany());
            service.updateEvent(event);
        return "redirect:/company";
        }else{
            model.addAttribute("message", "Δεν έχεις δικαίωμα σε αυτή την δραστηριότητα!!!");
        return"message";
        }
    }
    
    @RequestMapping("/search")
    public String showSearchPage() {
        return "search";
    }
    
    @GetMapping("/search/all")
    @ResponseBody
    public ResponseEntity<List<Event>> AllEvents() {
        return new ResponseEntity<>(service.getEventsWhichHaveAvailablePositions(0), HttpStatus.OK);
    }
    
    @GetMapping("/search/results")
    @ResponseBody
    public ResponseEntity<List<Event>> searchForEvents(@SearchSpec Specification<Event> specs) {
        return new ResponseEntity<>(service.seachDynamically(specs), HttpStatus.OK);
    }
    
    @GetMapping("/categoryName/{category}")
    public String showEventsByCategory(@PathVariable("category") String category, Model model) {
        model.addAttribute("category", category);
        return "event_by_category";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getEventInfo(@PathVariable(name = "id") int id, Model model) {
        Event event = service.getEventById(id);
        CustomerBooksEvent book = new CustomerBooksEvent();
        model.addAttribute("event", event);
        model.addAttribute("book", book);
        return "event_info";
        
    }
    
    @GetMapping("/otherevents/{id}/{date}")
    @ResponseBody
    public ResponseEntity<List<Event>> getAvaliableEvents(@PathVariable("id") int id,
            @PathVariable("date") String date) throws ParseException {
        Date st1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        List<CustomerBooksEvent> bookings = customerService.getCustomerById(id).getCustomerBooksEventList();
        List<Event> events;
        if (!bookings.isEmpty()) {
            List<Integer> eventids = new ArrayList();
            for (int i = 0; i < bookings.size(); i++) {
                eventids.add(bookings.get(i).getEventId().getId());
            }
            events = service.getAvailableEventsAccordingDateAndEventIds(eventids, st1, 0);
        } else {
            events = service.getAvailableEventsAccordingDate(st1, 0);
        }
        
        return new ResponseEntity<>(events, HttpStatus.OK);
    }

    @GetMapping("/category/{category}")
    @ResponseBody
    public ResponseEntity<List<Event>> getAvaliableEventsByCategory(@PathVariable("category") String categoryName) {
        return new ResponseEntity<>(service.getAvailableEventsAccordingCategoryNameAndDate(categoryName, new Date(), 0), HttpStatus.OK);
    }
}
