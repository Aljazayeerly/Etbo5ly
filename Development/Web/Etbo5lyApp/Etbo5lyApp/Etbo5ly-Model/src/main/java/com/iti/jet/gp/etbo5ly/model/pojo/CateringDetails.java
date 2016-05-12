package com.iti.jet.gp.etbo5ly.model.pojo;
// Generated May 6, 2016 12:05:20 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * CateringDetails generated by hbm2java
 */
@Entity
@Table(name="catering_details")
public class CateringDetails  implements java.io.Serializable {


     private int cateringDetailsId;
     private Order order;
     private String name;
     private String description;
     private String quantity;
     private Float price;

    public CateringDetails() {
    }

	
    public CateringDetails(int cateringDetailsId, Order order) {
        this.cateringDetailsId = cateringDetailsId;
        this.order = order;
    }
    public CateringDetails(int cateringDetailsId, Order order, String name, String description, String quantity, Float price) {
       this.cateringDetailsId = cateringDetailsId;
       this.order = order;
       this.name = name;
       this.description = description;
       this.quantity = quantity;
       this.price = price;
    }
   
     @Id 

    
    @Column(name="catering_details_id", unique=true, nullable=false)
    public int getCateringDetailsId() {
        return this.cateringDetailsId;
    }
    
    public void setCateringDetailsId(int cateringDetailsId) {
        this.cateringDetailsId = cateringDetailsId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="order_id", nullable=false)
    public Order getOrder() {
        return this.order;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }

    
    @Column(name="name", length=45)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="description", length=150)
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    
    @Column(name="quantity", length=45)
    public String getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    
    @Column(name="price", precision=12, scale=0)
    public Float getPrice() {
        return this.price;
    }
    
    public void setPrice(Float price) {
        this.price = price;
    }




}


