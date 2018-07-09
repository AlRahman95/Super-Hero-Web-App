/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dto;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Al Rahman
 */
public class Organization {
    private int organizationID;
    @NotEmpty(message = "You must supply a value for organization name.")
    @Length(max = 30, message = "Name must be no more than 30 characters in length.")
    private String name;
    private String role;
    @Length(max = 30, message = "City must be no more than 30 characters in length.")
    private String city;
    private String state;
    private String country;
    @Length(max = 10, message = "Phone must be no more than 10 characters in length.")
    private String phone;
    @Email(message = "Please enter a valid email address.")
    @Length(max = 50, message = "Email must be no more than 30 characters in length.")
    private String email;
    @Length(max = 100, message = "Description must be no more than 100 characters in length.")
    private String description;
    private List<SuperHuman> members;
    
    public Organization() {
        this.members = new ArrayList<>();
    }

    public int getOrganizationID() {
        return organizationID;
    }

    public void setOrganizationID(int organizationID) {
        this.organizationID = organizationID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<SuperHuman> getMembers() {
        return members;
    }

    public void setMembers(List<SuperHuman> members) {
        this.members = members;
    }
    
    
}
