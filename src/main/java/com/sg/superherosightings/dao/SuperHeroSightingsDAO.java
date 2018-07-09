/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Sighting;
import com.sg.superherosightings.dto.SuperHuman;
import java.io.FileNotFoundException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author Al Rahman
 */
public interface SuperHeroSightingsDAO {
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate);
    public int addOrganization(Organization organization);
    public int addSighting(Sighting sighting);
    public int addSuper(SuperHuman superHuman);
    public void updateOrganization(Organization organization);
    public void updateSighting(Sighting sighting);
    public void updateSuper(SuperHuman superHuman);
    public void removeOrganization(int orgID);
    public void removeSighting(int sightingID);
    public void removeSuper(int superID);
    public SuperHuman getSuper(int superID);
    public Organization getOrganization(int organizationID);
    public Sighting getSighting(int sightingID);
    public List<Organization> searchOrganization(int searchParam, String value) throws FileNotFoundException;
    public List<Sighting> searchSighting(int searchParam, String value) throws FileNotFoundException;
    public List<SuperHuman> searchSuper(int searchParam, String value) throws FileNotFoundException;  
}
