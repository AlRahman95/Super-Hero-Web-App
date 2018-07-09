/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Al Rahman
 */
public class Sighting {

    private int sightingID;
    private int locationID;
    @Length(max = 30, message = "City must be no more than 30 characters in length.")
    private String city;
    private String state;
    private String country;
    @NotEmpty(message = "You must supply a value for latitude coordinates.")
    @Length(max = 5, message = "Latitude coordinates must be no more than 5 characters in length.")
    private String latitudeCoordinates;
    private char latitudeDirection;
    @NotEmpty(message = "You must supply a value for longitude coordinates.")
    @Length(max = 5, message = "Longitude coordinates must be no more than 5 characters in length.")
    private String longitudeCoordinates;
    private char longitudeDirection;
    @NotEmpty(message = "You must supply a value for date.")
    private Date date;
    @Length(max = 100, message = "Description must be no more than 100 characters in length.")
    private String description;
    private List<SuperHuman> supers;

    public Sighting() {
        this.supers = new ArrayList<>();
    }

    public int getSightingID() {
        return sightingID;
    }

    public void setSightingID(int sightingID) {
        this.sightingID = sightingID;
    }

    public int getLocationID() {
        return locationID;
    }

    public void setLocationID(int locationID) {
        this.locationID = locationID;
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

    public String getLatitudeCoordinates() {
        return latitudeCoordinates;
    }

    public void setLatitudeCoordinates(String latitudeCoordinates) {
        this.latitudeCoordinates = latitudeCoordinates;
    }

    public char getLatitudeDirection() {
        return latitudeDirection;
    }

    public void setLatitudeDirection(char latitudeDirection) {
        this.latitudeDirection = latitudeDirection;
    }

    public String getLongitudeCoordinates() {
        return longitudeCoordinates;
    }

    public void setLongitudeCoordinates(String longitudeCoordinates) {
        this.longitudeCoordinates = longitudeCoordinates;
    }

    public char getLongitudeDirection() {
        return longitudeDirection;
    }

    public void setLongitudeDirection(char longitudeDirection) {
        this.longitudeDirection = longitudeDirection;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<SuperHuman> getSupers() {
        return supers;
    }

    public void setSupers(List<SuperHuman> supers) {
        this.supers = supers;
    }
}
