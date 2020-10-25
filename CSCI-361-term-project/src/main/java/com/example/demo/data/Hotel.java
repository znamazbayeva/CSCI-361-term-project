package com.example.demo.data;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity // This tells Hibernate to make a table out of this class
@Table(name="hotel")
public class Hotel {
  @Id
  private int hotel_id;

  private String country_name;

  private String city;

  @OneToMany(mappedBy="hotel")
  private Set<RoomType> roomTypes;
  
  public int getId() {
    return hotel_id;
  }

  public void setId(int id) {
    this.hotel_id = id;
  }

  public String getCountry() {
    return country_name;
  }

  public void setCountry(String name) {
    this.country_name = name;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String email) {
    this.city = email;
  }
}

