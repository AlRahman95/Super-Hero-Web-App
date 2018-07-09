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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Al Rahman
 */
public class SuperHeroSightingsDaoDbImpl implements SuperHeroSightingsDAO {

    private JdbcTemplate jdbcTemplate;

    @Override
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    //Super Hero/Villain SQL statements
    public static final String SQL_INSERT_SUPER = "insert into superHuman "
            + "(Hero, SuperName, HeightInFeet, HeightInInches, Weight, Power, PowerLevel, PowerDescription) "
            + "values (?,?,?,?,?,?,?,?)";
    public static final String SQL_DELETE_SUPER = "delete from superHuman where SuperID = ?";
    public static final String SQL_UPDATE_AUTHOR = "update Supers set Hero = ?, SuperName = ?,"
            + " HeightInFeet = ?, HeightInInches = ?, Weight= ?, Power = ?, PowerLevel = ?, PowerDescription = ?  where SuperID = ?";
    public static final String SQL_SELECT_ALL_AUTHORS = "select * from superHuman";
   
    @Override
    public int addOrganization(Organization organization) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int addSighting(Sighting sighting) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int addSuper(SuperHuman superHuman) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateOrganization(Organization organization) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateSighting(Sighting sighting) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateSuper(SuperHuman superHuman) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeOrganization(int orgID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeSighting(int sightingID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeSuper(int superID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public SuperHuman getSuper(int superID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Organization getOrganization(int organizationID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Sighting getSighting(int sightingID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Organization> searchOrganization(int searchParam, String value) throws FileNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Sighting> searchSighting(int searchParam, String value) throws FileNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<SuperHuman> searchSuper(int searchParam, String value) throws FileNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //Mappers
    public static final class SuperMapper implements RowMapper<SuperHuman> {

        @Override
        public SuperHuman mapRow(ResultSet rs, int row) throws SQLException {
            SuperHuman superHuman = new SuperHuman();
            //remember to set the two collections via queries
            superHuman.setSuperID(rs.getInt("SuperID"));
            superHuman.setIsHero(rs.getBoolean("Hero"));
            superHuman.setName(rs.getString("SuperName"));
            superHuman.setHeightInFeet(rs.getInt("HeightInFeet"));
            superHuman.setHeightInInches(rs.getInt("HeightInInches"));
            superHuman.setWeight(rs.getDouble("Weight"));
            superHuman.setPower(rs.getString("Power"));
            superHuman.setPowerLevel(rs.getInt("PowerLevel"));
            superHuman.setDescription(rs.getString("PowerDescription"));
            return superHuman;
        }
    }

    public static final class SightingMapper implements RowMapper<Sighting> {

        @Override
        public Sighting mapRow(ResultSet rs, int row) throws SQLException {
            Sighting sighting = new Sighting();
            sighting.setSightingID(rs.getInt("SightingID"));
            sighting.setLocationID(rs.getInt("LocationID"));
            sighting.setCity(rs.getString("City"));
            sighting.setState(rs.getString("State"));
            sighting.setCountry(rs.getString("Country"));
            sighting.setLatitudeCoordinates(rs.getString("Latitude"));
            sighting.setLatitudeDirection((rs.getString("LatitudeDirection")).charAt(0));
            sighting.setLongitudeCoordinates(rs.getString("Longitude"));
            sighting.setLongitudeDirection((rs.getString("LongitudeDirection")).charAt(0));
            sighting.setDate(rs.getDate("SightingDate"));
            return sighting;
            //MAKE SURE QUERY IS A JOIN TABLE BETWEEN LOCATION AND SIGHTING
        }
    }

    public static final class OrganizationMapper implements RowMapper<Organization> {

        @Override
        public Organization mapRow(ResultSet rs, int row) throws SQLException {
            Organization organization = new Organization();
            //setters, all of the setters
            organization.setOrganizationID(rs.getInt("OrganizationID"));
            organization.setName(rs.getString("OrganizationName"));
            organization.setRole(rs.getString("Role"));
            organization.setCity(rs.getString("City"));
            organization.setState(rs.getString("State"));
            organization.setCountry(rs.getString("Country"));
            organization.setPhone(rs.getString("Phone"));
            organization.setEmail(rs.getString("Email"));
            organization.setDescription(rs.getString("Description"));
            return organization;
        }
    }
}
