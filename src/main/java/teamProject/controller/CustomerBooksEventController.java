/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.controller;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import teamProject.entity.CustomerBooksEvent;
import teamProject.entity.Event;
import teamProject.service.EventService;

/**
 *
 * @author tzortziskapellas
 */
@Controller
@RequestMapping("/booking")
public class CustomerBooksEventController {

    @Autowired
    private EventService eventService;

    @GetMapping("/{eventID}")
    public String checkout(@PathVariable("eventID") int id, Model model, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            Event event = eventService.getEventById(id);
            model.addAttribute("event", event);
            return "booking";
        } else {
            return "loginPage";
        }
    }
    @RequestMapping(value = "/getEventCustomers/{id}", method = RequestMethod.GET)
    public String getCustomers(@PathVariable("id") int id, Model model, RedirectAttributes attributes) {
        Event event = eventService.getEventById(id);
        List<CustomerBooksEvent> bookings = event.getCustomerBooksEventList();
        model.addAttribute("bookings", bookings);
        model.addAttribute("number", bookings.size());
        return "participants";
    }
}
