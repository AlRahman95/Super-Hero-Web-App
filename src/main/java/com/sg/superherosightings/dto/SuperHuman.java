/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dto;

import java.util.ArrayList;
import java.util.List;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Al Rahman
 */
public class SuperHuman {
    
    private int superID;
    private boolean isHero;
    @NotEmpty(message = "You must supply a value for a Name.")
    @Length(max = 50, message = "Hero/Villain name must be no more than 50 characters in length.")
    private String name;
    @NotNull
    private int heightInFeet;
    @NotNull
    private int heightInInches;
    @NotNull
    private double weight;
    @NotEmpty(message = "You must supply a value for a power.")
    @Length(max = 30, message = "Power must be no more than 30 characters in length.")
    private String power;
    private int powerLevel;
    @Length(max = 100, message = "Description must be no more than 100 characters in length.")
    private String description;
    private List<Organization> organizations;
    private List<Sighting> sightings;
    
    public SuperHuman() {
        this.organizations = new ArrayList<>();
        this.sightings = new ArrayList<>();
    }
    
    public int getSuperID() {
        return superID;
    }

    public void setSuperID(int superID) {
        this.superID = superID;
    }

    public boolean getIsHero() {
        return isHero;
    }

    public void setIsHero(boolean isHero) {
        this.isHero = isHero;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getHeightInFeet() {
        return heightInFeet;
    }

    public void setHeightInFeet(int heightInFeet) {
        this.heightInFeet = heightInFeet;
    }
    
    public int getHeightInInches() {
        return heightInInches;
    }

    public void setHeightInInches(int heightInInches) {
        this.heightInInches = heightInInches;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getPower() {
        return power;
    }


    public void setPower(String power) {
        this.power = power;
    }

    public int getPowerLevel() {
        return powerLevel;
    }


    public void setPowerLevel(int powerLevel) {
        this.powerLevel = powerLevel;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
    public List<Organization> getOrganizations() {
        return organizations;
    }


    public void setOrganizations(List<Organization> organizations) {
        this.organizations = organizations;
    }

    
    public List<Sighting> getSightings() {
        return sightings;
    }

    
    public void setSightings(List<Sighting> sightings) {
        this.sightings = sightings;
    }
    
}
