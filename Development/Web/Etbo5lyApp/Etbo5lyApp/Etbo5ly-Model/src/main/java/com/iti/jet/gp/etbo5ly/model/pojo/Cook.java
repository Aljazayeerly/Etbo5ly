package com.iti.jet.gp.etbo5ly.model.pojo;
// Generated May 6, 2016 12:05:20 PM by Hibernate Tools 4.3.1

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Cook generated by hbm2java
 */
@Entity
@Table(name = "cook")
@PrimaryKeyJoinColumn(name = "id")

public class Cook extends User implements java.io.Serializable {

//     private Integer id;
    private CookStatus cookStatus;
    private Date startWorkingHours;
    private Date endWorkingHours;
    private Set<Document> documents = new HashSet<Document>(0);
    private Set<MenuItems> menuItems = new HashSet<MenuItems>(0);

    public Cook() {
    }

    public Cook(CookStatus cookStatus) {
        this.cookStatus = cookStatus;
    }

    public Cook(CookStatus cookStatus, Date startWorkingHours, Date endWorkingHours, Set documents, Set menuItems) {
        this.cookStatus = cookStatus;
        this.startWorkingHours = startWorkingHours;
        this.endWorkingHours = endWorkingHours;
        this.documents = documents;
        this.menuItems = menuItems;
    }

//      @GeneratedValue(strategy=IDENTITY)
//    @Column(name="id", unique=true, nullable=true)
//    public Integer getId() {
//        return this.id;
//    }
//    
//    public void setId(Integer id) {
//        this.id = id;
//    }
    @ManyToOne(fetch = FetchType.EAGER)//salma-changed it to eager
    @JoinColumn(name = "cook_status_id", nullable = false)
    public CookStatus getCookStatus() {
        return this.cookStatus;
    }

    public void setCookStatus(CookStatus cookStatus) {
        this.cookStatus = cookStatus;
    }

    @Temporal(TemporalType.TIME)
    @Column(name = "start_working_hours", length = 8)
    public Date getStartWorkingHours() {
        return this.startWorkingHours;
    }

    public void setStartWorkingHours(Date startWorkingHours) {
        this.startWorkingHours = startWorkingHours;
    }

    @Temporal(TemporalType.TIME)
    @Column(name = "end_working_hours", length = 8)
    public Date getEndWorkingHours() {
        return this.endWorkingHours;
    }

    public void setEndWorkingHours(Date endWorkingHours) {
        this.endWorkingHours = endWorkingHours;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "cook")
    @JsonIgnore
    public Set<Document> getDocuments() {
        return this.documents;
    }

    public void setDocuments(Set<Document> documents) {
        this.documents = documents;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "cook", cascade = CascadeType.ALL)//salma-changed it to eager
    @JsonIgnore
    public Set<MenuItems> getMenuItems() {
        return this.menuItems;
    }

    public void setMenuItems(Set<MenuItems> menuItems) {
        this.menuItems = menuItems;
    }

}
