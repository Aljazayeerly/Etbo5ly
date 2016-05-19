package com.iti.jet.gp.etbo5ly.model.pojo;
// Generated May 20, 2016 12:10:15 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Country generated by hbm2java
 */
@Entity
@Table(name="country"
    ,catalog="etbo5ly"
)
public class Country  implements java.io.Serializable {


     private int countryId;
     private String countryName;
     private String countryNameAr;
     private Set<City> cities = new HashSet<City>(0);

    public Country() {
    }

	
    public Country(int countryId, String countryName) {
        this.countryId = countryId;
        this.countryName = countryName;
    }
    public Country(int countryId, String countryName, String countryNameAr, Set<City> cities) {
       this.countryId = countryId;
       this.countryName = countryName;
       this.countryNameAr = countryNameAr;
       this.cities = cities;
    }
   
     @Id 

    
    @Column(name="country_id", unique=true, nullable=false)
    public int getCountryId() {
        return this.countryId;
    }
    
    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }

    
    @Column(name="country_name", nullable=false, length=45)
    public String getCountryName() {
        return this.countryName;
    }
    
    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    
    @Column(name="country_name_ar", length=45)
    public String getCountryNameAr() {
        return this.countryNameAr;
    }
    
    public void setCountryNameAr(String countryNameAr) {
        this.countryNameAr = countryNameAr;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="country")
    public Set<City> getCities() {
        return this.cities;
    }
    
    public void setCities(Set<City> cities) {
        this.cities = cities;
    }




}


