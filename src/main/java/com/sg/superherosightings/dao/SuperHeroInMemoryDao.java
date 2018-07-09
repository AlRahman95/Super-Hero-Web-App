/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Sighting;
import com.sg.superherosightings.dto.SuperHuman;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Al Rahman
 */
public class SuperHeroInMemoryDao {

    // holds all of our Contact objects - simulates the database
    private Map<Integer, Sighting> sightingMap = new HashMap<>();
    private Map<Integer, SuperHuman> superMap = new HashMap<>();
    private Map<Integer, Organization> orgMap = new HashMap<>();
    // used to assign ids to Contacts - simulates the auto increment
    // primary key for Contacts in a database
    private static int contactIdCounter = 0;

 
    public Sighting addSighting(Sighting sighting) {
        // assign the current counter values as the contactid
        sighting.setSightingID(contactIdCounter);
        // increment the counter so it is ready for use for the 
        // next contact
        contactIdCounter++;
        sightingMap.put(sighting.getSightingID(), sighting);
        return sighting;
    }
   
    public void removeSighting(int sightingID) {
        sightingMap.remove(sightingID);
    }
    
    public void updateSighting(Sighting sighting) {
        sightingMap.put(sighting.getSightingID(), sighting);
    }
    
    public List<Sighting> getAllSighting() {
        Collection<Sighting> s = sightingMap.values();
        return new ArrayList(s);
    }
    
    public Sighting getSightingById(int sightingID) {
        return sightingMap.get(sightingID);
    }
    
    public SuperHuman addSuper(SuperHuman sup) {
        // assign the current counter values as the contactid
        sup.setSuperID(contactIdCounter);
        // increment the counter so it is ready for use for the 
        // next contact
        contactIdCounter++;
        superMap.put(sup.getSuperID(), sup);
        return sup;
    }
   
    public void removeSuper(int superID) {
        superMap.remove(superID);
    }
    
    public void updateSuper(SuperHuman sup) {
        superMap.put(sup.getSuperID(), sup);
    }
    
    public List<SuperHuman> getAllSuper() {
        Collection<SuperHuman> s = superMap.values();
        return new ArrayList(s);
    }
    
    public SuperHuman getSuperById(int superID) {
        return superMap.get(superID);
    }
    
    public Organization addOrg(Organization org) {
        // assign the current counter values as the contactid
        org.setOrganizationID(contactIdCounter);
        // increment the counter so it is ready for use for the 
        // next contact
        contactIdCounter++;
        orgMap.put(org.getOrganizationID(), org);
        return org;
    }
   
    public void removeOrg(int orgID) {
        orgMap.remove(orgID);
    }
    
    public void updateOrg(Organization org) {
        orgMap.put(org.getOrganizationID(), org);
    }
    
    public List<Organization> getAllOrg() {
        Collection<Organization> o = orgMap.values();
        return new ArrayList(o);
    }
    
    public Organization getOrgById(int orgID) {
        return orgMap.get(orgID);
    }
}
