package com.example.demo.data;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity // This tells Hibernate to make a table out of this class
@Table(name="hotel")
public class Hotel {
  @Id
  private Integer hotel_id;

  private String country;

  private String city;
  @OneToMany(mappedBy="hotel")
  private Set<Room> rooms;
  
  public Integer getId() {
    return hotel_id;
  }

  public void setId(Integer id) {
    this.hotel_id = id;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String name) {
    this.country = name;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String email) {
    this.city = email;
  }
}
