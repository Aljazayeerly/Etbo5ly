package com.iti.jet.gp.etbo5ly.model.pojo;
// Generated May 6, 2016 12:05:20 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;


import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name="user"
    ,catalog="mydb"
)
@Inheritance(strategy=InheritanceType.JOINED)

public class User  implements java.io.Serializable {


     private Integer id;
     private String name;
     private String email;
     private String password;
     private Boolean enabled;
     private byte[] image;
     private Date registerationDate;
     private String phone;
     private String address;
     private Set<Role> roles = new HashSet<Role>(0);
     private Set<Order> ordersForCookId = new HashSet<Order>(0);
     private Set<Order> ordersForCustomerId = new HashSet<Order>(0);

    public User() {
    }

	
    public User(String name, String email, String password, String phone, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
    }
    public User(String name, String email, String password, Boolean enabled, byte[] image, Date registerationDate, String phone, String address, Set roles, Set ordersForCookId, Set ordersForCustomerId) {
       this.name = name;
       this.email = email;
       this.password = password;
       this.enabled = enabled;
       this.image = image;
       this.registerationDate = registerationDate;
       this.phone = phone;
       this.address = address;
       this.roles = roles;
       this.ordersForCookId = ordersForCookId;
       this.ordersForCustomerId = ordersForCustomerId;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    @Column(name="id", unique=true, nullable=true)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="name", nullable=false, length=45)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="email", nullable=false, length=45)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="password", nullable=false, length=45)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    
    @Column(name="enabled")
    public Boolean getEnabled() {
        return this.enabled;
    }
    
    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    
    @Column(name="image")
    public byte[] getImage() {
        return this.image;
    }
    
    public void setImage(byte[] image) {
        this.image = image;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="registeration_date", length=19)
    public Date getRegisterationDate() {
        return this.registerationDate;
    }
    
    public void setRegisterationDate(Date registerationDate) {
        this.registerationDate = registerationDate;
    }

    
    @Column(name="phone", nullable=false, length=25)
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    
    @Column(name="address", nullable=false, length=100)
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

@ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="user_has_role", catalog="mydb", joinColumns = { 
        @JoinColumn(name="user_id", nullable=false, updatable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="role_id", nullable=false, updatable=false) })
    public Set<Role> getRoles() {
        return this.roles;
    }
    
    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="userByCookId")
    public Set<Order> getOrdersForCookId() {
        return this.ordersForCookId;
    }
    
    public void setOrdersForCookId(Set<Order> ordersForCookId) {
        this.ordersForCookId = ordersForCookId;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="userByCustomerId")
    public Set<Order> getOrdersForCustomerId() {
        return this.ordersForCustomerId;
    }
    
    public void setOrdersForCustomerId(Set<Order> ordersForCustomerId) {
        this.ordersForCustomerId = ordersForCustomerId;
    }




}


