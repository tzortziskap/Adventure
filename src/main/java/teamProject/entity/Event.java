/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author tzortziskapellas
 */
@Entity
@Table(name = "event")

@NamedQueries({
    @NamedQuery(name = "Event.findAll", query = "SELECT e FROM Event e"),
    @NamedQuery(name = "Event.findById", query = "SELECT e FROM Event e WHERE e.id = :id"),
    @NamedQuery(name = "Event.findByEndingDate", query = "SELECT e FROM Event e WHERE e.endingDate = :endingDate"),
    @NamedQuery(name = "Event.findByStartingDate", query = "SELECT e FROM Event e WHERE e.startingDate = :startingDate"),
    @NamedQuery(name = "Event.findByPrice", query = "SELECT e FROM Event e WHERE e.price = :price"),
    @NamedQuery(name = "Event.findByPositions", query = "SELECT e FROM Event e WHERE e.positions = :positions"),
    @NamedQuery(name = "Event.findByName", query = "SELECT e FROM Event e WHERE e.name = :name")})
public class Event implements Serializable {
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ending_date")
    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endingDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "starting_date")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
    private Date startingDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private double price;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 16777215)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Column(name = "positions")
    private int positions;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "name")
    private String name;
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    @ManyToOne
    private Categories categoryId;
    @ManyToMany(mappedBy = "eventList")
    private List<Equipment> equipmentList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "eventId")
    private List<CustomerBooksEvent> customerBooksEventList;
    @JoinColumn(name = "company_id", referencedColumnName = "id")
    @ManyToOne
    @JsonIgnore
    private Company companyId;
    @JoinColumn(name = "difficulty_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Difficulty difficultyId;
    @JoinColumn(name = "location_id", referencedColumnName = "id")
    @ManyToOne(cascade = CascadeType.ALL)
    private Location locationId;
    @JoinColumn(name = "organiser_id", referencedColumnName = "id")
    @ManyToOne
    @JsonIgnore
    private Organiser organiserId;
    @JoinColumn(name = "type_indoor_outdoor_id", referencedColumnName = "id")
    @ManyToOne
    private TypeIndoorOutdoor typeIndoorOutdoorId;
   
    public Event() {
}

    public Event(Integer id) {
        this.id = id;
    }

    public Event(Integer id, Date endingDate, Date startingDate, double price, String description, int positions, String name) {
        this.id = id;
        this.endingDate = endingDate;
        this.startingDate = startingDate;
        this.price = price;
        this.description = description;
        this.positions = positions;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getEndingDate() {
        return endingDate;
    }

    public void setEndingDate(Date endingDate) {
        this.endingDate = endingDate;
    }

    public Date getStartingDate() {
        return startingDate;
    }

    public void setStartingDate(Date startingDate) {
        this.startingDate = startingDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPositions() {
        return positions;
    }

    public void setPositions(int positions) {
        this.positions = positions;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Categories getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Categories categoryId) {
        this.categoryId = categoryId;
    }

    
    @XmlTransient
    public List<Equipment> getEquipmentList() {
        return equipmentList;
    }

    public void setEquipmentList(List<Equipment> equipmentList) {
        this.equipmentList = equipmentList;
    }

    @XmlTransient
    public List<CustomerBooksEvent> getCustomerBooksEventList() {
        return customerBooksEventList;
    }

    public void setCustomerBooksEventList(List<CustomerBooksEvent> customerBooksEventList) {
        this.customerBooksEventList = customerBooksEventList;
    }

    public Company getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Company companyId) {
        this.companyId = companyId;
    }

    public Difficulty getDifficultyId() {
        return difficultyId;
    }

    public void setDifficultyId(Difficulty difficultyId) {
        this.difficultyId = difficultyId;
    }

    public Location getLocationId() {
        return locationId;
    }

    public void setLocationId(Location locationId) {
        this.locationId = locationId;
    }

    public Organiser getOrganiserId() {
        return organiserId;
    }

    public void setOrganiserId(Organiser organiserId) {
        this.organiserId = organiserId;
    }

    public TypeIndoorOutdoor getTypeIndoorOutdoorId() {
        return typeIndoorOutdoorId;
    }

    public void setTypeIndoorOutdoorId(TypeIndoorOutdoor typeIndoorOutdoorId) {
        this.typeIndoorOutdoorId = typeIndoorOutdoorId;
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
        if (!(object instanceof Event)) {
            return false;
        }
        Event other = (Event) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "teamProject.entity.Event[ id=" + id + " ]";
    }
    
}
