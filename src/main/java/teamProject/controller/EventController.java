/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import com.sipios.springsearch.anotation.SearchSpec;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
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
import teamProject.entity.Event;
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

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showForm(@ModelAttribute("event") Event event, Model model) {
        return "event_form";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(Event event, RedirectAttributes attributes) {
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

    @PostMapping("/update")
    public String update(Event event, RedirectAttributes attributes) {
        service.updateEvent(event);
        return " ";
    }

    @RequestMapping("/search")
    public String showSearchPage() {
        return "search";
    }

    @GetMapping("/search/all")
    @ResponseBody
    public ResponseEntity<List<Event>> AllEvents() {
        return new ResponseEntity<>(service.getEvents(), HttpStatus.OK);
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
        model.addAttribute("event", event);
        model.addAttribute("bookings", "0");
        return "event_info";

    }
}
