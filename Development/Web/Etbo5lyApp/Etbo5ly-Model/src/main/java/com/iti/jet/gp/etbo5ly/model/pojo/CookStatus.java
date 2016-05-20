package com.iti.jet.gp.etbo5ly.model.pojo;
// Generated May 20, 2016 12:10:15 AM by Hibernate Tools 3.6.0


import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * CookStatus generated by hbm2java
 */
@Entity
@Table(name="cook_status"
    ,catalog="etbo5ly"
)
public class CookStatus  implements java.io.Serializable {


     private Integer statusId;
     private String status;
     @JsonIgnore
     private Set<Cook> cooks = new HashSet<Cook>(0);

    public CookStatus() {
    }

	
    public CookStatus(String status) {
        this.status = status;
    }
    public CookStatus(String status, Set<Cook> cooks) {
       this.status = status;
       this.cooks = cooks;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="status_id", unique=true, nullable=false)
    public Integer getStatusId() {
        return this.statusId;
    }
    
    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    
    @Column(name="status", nullable=false, length=45)
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="cookStatus")
    public Set<Cook> getCooks() {
        return this.cooks;
    }
    
    public void setCooks(Set<Cook> cooks) {
        this.cooks = cooks;
    }




}


