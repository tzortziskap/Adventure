/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author tzortziskapellas
 */
@Entity
@Table(name = "customer_books_event")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CustomerBooksEvent.findAll", query = "SELECT c FROM CustomerBooksEvent c"),
    @NamedQuery(name = "CustomerBooksEvent.findById", query = "SELECT c FROM CustomerBooksEvent c WHERE c.id = :id"),
    @NamedQuery(name = "CustomerBooksEvent.findByAmountPositions", query = "SELECT c FROM CustomerBooksEvent c WHERE c.amountPositions = :amountPositions"),
    @NamedQuery(name = "CustomerBooksEvent.findByTotalPrice", query = "SELECT c FROM CustomerBooksEvent c WHERE c.totalPrice = :totalPrice")})
public class CustomerBooksEvent implements Serializable {
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount_positions")
    private int amountPositions;
    @Basic(optional = false)
    @NotNull
    @Column(name = "total_price")
    private double totalPrice;
    @JoinColumn(name = "customer_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Customer customerId;
    @JoinColumn(name = "event_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Event eventId;

    public CustomerBooksEvent() {
}

    public CustomerBooksEvent(Integer id) {
        this.id = id;
    }

    public CustomerBooksEvent(Integer id, int amountPositions, double totalPrice) {
        this.id = id;
        this.amountPositions = amountPositions;
        this.totalPrice = totalPrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getAmountPositions() {
        return amountPositions;
    }

    public void setAmountPositions(int amountPositions) {
        this.amountPositions = amountPositions;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    public Event getEventId() {
        return eventId;
    }

    public void setEventId(Event eventId) {
        this.eventId = eventId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CustomerBooksEvent)) {
            return false;
        }
        CustomerBooksEvent other = (CustomerBooksEvent) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "teamProject.entity.CustomerBooksEvent[ id=" + id + " ]";
    }
    
}
