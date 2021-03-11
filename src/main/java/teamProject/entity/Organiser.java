/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author tzortziskapellas
 */
@Entity
@Table(name = "organiser")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Organiser.findAll", query = "SELECT o FROM Organiser o"),
    @NamedQuery(name = "Organiser.findById", query = "SELECT o FROM Organiser o WHERE o.id = :id"),
    @NamedQuery(name = "Organiser.findByFirstname", query = "SELECT o FROM Organiser o WHERE o.firstname = :firstname"),
    @NamedQuery(name = "Organiser.findByLastname", query = "SELECT o FROM Organiser o WHERE o.lastname = :lastname"),
    @NamedQuery(name = "Organiser.findByDateOfBirth", query = "SELECT o FROM Organiser o WHERE o.dateOfBirth = :dateOfBirth"),
    @NamedQuery(name = "Organiser.findByEmail", query = "SELECT o FROM Organiser o WHERE o.email = :email"),
    @NamedQuery(name = "Organiser.findByAddress", query = "SELECT o FROM Organiser o WHERE o.address = :address"),
    @NamedQuery(name = "Organiser.findByPostalCode", query = "SELECT o FROM Organiser o WHERE o.postalCode = :postalCode")})
public class Organiser implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "firstname")
    private String firstname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "lastname")
    private String lastname;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_of_birth")
    @Temporal(TemporalType.DATE)
    private Date dateOfBirth;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "address")
    private String address;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "postal_code")
    private String postalCode;
    @JoinColumn(name = "city_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private City cityId;
    @JoinColumn(name = "credentials_id", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Credentials credentialsId;
    @OneToMany(mappedBy = "organiserId")
    private List<Event> eventList;

    public Organiser() {
    }

    public Organiser(Integer id) {
        this.id = id;
    }

    public Organiser(Integer id, String firstname, String lastname, Date dateOfBirth, String email, String address, String postalCode) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.address = address;
        this.postalCode = postalCode;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public City getCityId() {
        return cityId;
    }

    public void setCityId(City cityId) {
        this.cityId = cityId;
    }

    public Credentials getCredentialsId() {
        return credentialsId;
    }

    public void setCredentialsId(Credentials credentialsId) {
        this.credentialsId = credentialsId;
    }

    @XmlTransient
    public List<Event> getEventList() {
        return eventList;
    }

    public void setEventList(List<Event> eventList) {
        this.eventList = eventList;
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
        if (!(object instanceof Organiser)) {
            return false;
        }
        Organiser other = (Organiser) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "teamProject.entity.Organiser[ id=" + id + " ]";
    }
    
}
