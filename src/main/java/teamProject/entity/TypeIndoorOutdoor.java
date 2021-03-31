/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author tzortziskapellas
 */
@Entity
@Table(name = "type_indoor_outdoor")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TypeIndoorOutdoor.findAll", query = "SELECT t FROM TypeIndoorOutdoor t"),
    @NamedQuery(name = "TypeIndoorOutdoor.findById", query = "SELECT t FROM TypeIndoorOutdoor t WHERE t.id = :id"),
    @NamedQuery(name = "TypeIndoorOutdoor.findByTypeIndoorOutdoor", query = "SELECT t FROM TypeIndoorOutdoor t WHERE t.typeIndoorOutdoor = :typeIndoorOutdoor")})
public class TypeIndoorOutdoor implements Serializable {
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "type_indoor_outdoor")
    private String typeIndoorOutdoor;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "typeIndoorOutdoorId")
    private List<Event> eventList;

    public TypeIndoorOutdoor() {
}

    public TypeIndoorOutdoor(Integer id) {
        this.id = id;
    }

    public TypeIndoorOutdoor(Integer id, String typeIndoorOutdoor) {
        this.id = id;
        this.typeIndoorOutdoor = typeIndoorOutdoor;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeIndoorOutdoor() {
        return typeIndoorOutdoor;
    }

    public void setTypeIndoorOutdoor(String typeIndoorOutdoor) {
        this.typeIndoorOutdoor = typeIndoorOutdoor;
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
        if (!(object instanceof TypeIndoorOutdoor)) {
            return false;
        }
        TypeIndoorOutdoor other = (TypeIndoorOutdoor) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "teamProject.entity.TypeIndoorOutdoor[ id=" + id + " ]";
    }
    
}
