package com.iti.jet.gp.etbo5ly.model.pojo;
// Generated May 6, 2016 12:05:20 PM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.context.annotation.PropertySource;

/**
 * StatusHasOrder generated by hbm2java
 */
@Entity
@Table(name="status_has_order",catalog = "etbo5ly")
public class StatusHasOrder  implements java.io.Serializable {


     private StatusHasOrderId id;
     private Order order;
     private OrderStatus orderStatus;
     private Date time;

    public StatusHasOrder() {
    }

    public StatusHasOrder(StatusHasOrderId id, Order order, OrderStatus orderStatus, Date time) {
       this.id = id;
       this.order = order;
       this.orderStatus = orderStatus;
       this.time = time;
    }
   
     @EmbeddedId

    
    @AttributeOverrides( {
        @AttributeOverride(name="statusStatusId", column=@Column(name="status_status_id", nullable=false) ), 
        @AttributeOverride(name="orderOrderId", column=@Column(name="order_order_id", nullable=false) ) } )
    public StatusHasOrderId getId() {
        return this.id;
    }
    
    public void setId(StatusHasOrderId id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="order_order_id", nullable=false, insertable=false, updatable=false)
    public Order getOrder() {
        return this.order;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="status_status_id", nullable=false, insertable=false, updatable=false)
    public OrderStatus getOrderStatus() {
        return this.orderStatus;
    }
    
    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="time", nullable=false, length=19)
    public Date getTime() {
        return this.time;
    }
    
    public void setTime(Date time) {
        this.time = time;
    }




}


