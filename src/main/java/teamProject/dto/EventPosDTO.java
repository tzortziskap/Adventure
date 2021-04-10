/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.dto;

import java.util.List;
import java.util.Set;
import teamProject.entity.Event;

/**
 *
 * @author user
 */
public class EventPosDTO {

    private Event eventId;
    private Integer pos;
    private Integer bookings=0;

    public EventPosDTO(Event event, Integer pos, Integer bookings) {
        this.eventId = event;
        this.pos = pos;
        this.bookings = bookings;
    }

    public Event getEventId() {
        return eventId;
    }

    public void setEventId(Event eventId) {
        this.eventId = eventId;
    }

    public Integer getPos() {
        return pos;
    }

    public void setPos(Integer pos) {
        this.pos = pos;
    }

    public Integer getBookings() {
        return bookings;
    }

    public void setBookings(Integer bookings) {
        this.bookings = bookings;
    }

    public EventPosDTO() {
    }

   
}
