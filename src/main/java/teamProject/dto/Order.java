/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.dto;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import teamProject.entity.Event;

public class Order {

    private double totalPrice;
    private int count;
    private Event event;

    public Order() {
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
        this.totalPrice = event.getPrice() * count;
        

    }

    public double getTotalPrice() {
        NumberFormat formatter = new DecimalFormat("#0.00");    
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

}
