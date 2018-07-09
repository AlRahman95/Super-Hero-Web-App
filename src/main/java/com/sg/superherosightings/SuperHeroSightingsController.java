/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings;

import com.sg.superherosightings.dao.SuperHeroInMemoryDao;
import com.sg.superherosightings.dto.Organization;
import com.sg.superherosightings.dto.Sighting;
import com.sg.superherosightings.dto.SuperHuman;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Al Rahman
 */
@Controller
public class SuperHeroSightingsController {

    private SuperHeroInMemoryDao dao;

    @Inject
    public SuperHeroSightingsController(SuperHeroInMemoryDao dao) {
        this.dao = dao;
    }
    
    /*---------------------------------------Navigation----------------------------------------------*/
    @RequestMapping(value = {"/", "home"})
    public String initial() {
        return "home";
    }

    @RequestMapping(value = "/navSighting")
    public String NavigateNewSighting() {
        return "newSighting";
    }

    @RequestMapping(value = "/navSuper")
    public String NavigateNewSuper() {
        return "newSuper";
    }

    @RequestMapping(value = "/navOrg")
    public String NavigateNewOrg() {
        return "newOrg";
    }
    
    @RequestMapping(value = "/searchDirectory", method = RequestMethod.GET)
    public String searchDirectory(Model model, HttpServletRequest request) {
        String page = request.getParameter("searchParam");
        String searchPage = "search" + page;
        return searchPage;
    }

    /*---------------------------Super Hero Sighting Methods----------------------------------------------*/
    @RequestMapping(value = "/newSighting", method = RequestMethod.POST)
    public String createSighting(Model model, HttpServletRequest request) {
        Sighting sighting = new Sighting();
        sighting.setCity(request.getParameter("city"));
        sighting.setState(request.getParameter("state"));
        sighting.setCountry(request.getParameter("country"));
        sighting.setLatitudeCoordinates(request.getParameter("latitude"));
        sighting.setLatitudeDirection(request.getParameter("latitudeDirection").charAt(0));
        sighting.setLongitudeCoordinates(request.getParameter("longitude"));
        sighting.setLongitudeDirection(request.getParameter("longitudeDirection").charAt(0));
        sighting.setDescription(request.getParameter("description"));
        sighting.setDate(java.sql.Date.valueOf(request.getParameter("date")));

        List<Sighting> list = new ArrayList<>();
        list.add(dao.addSighting(sighting));
        model.addAttribute("sightingList", list);
        return "newSighting";
    }

    @RequestMapping(value = "/displaySightingDetails", method = RequestMethod.GET)
    public String displaySightingDetails(HttpServletRequest request, Model model) {
        int sightingID = Integer.parseInt(request.getParameter("sightingID"));
        Sighting sighting = dao.getSightingById(sightingID);
        model.addAttribute("sighting", sighting);
        return "sightingDetails";
    }

    @RequestMapping(value = "/deleteSighting", method = RequestMethod.GET)
    public String removeSighting(HttpServletRequest request) {
        int sightingID = Integer.parseInt(request.getParameter("sightingID"));
        dao.removeSighting(sightingID);
        return "newSighting";
    }

    @RequestMapping(value = "/displayEditSightingForm", method = RequestMethod.GET)
    public String displayEditSightingForm(HttpServletRequest request, Model model) {
        int sightingID = Integer.parseInt(request.getParameter("sightingID"));
        Sighting sighting = dao.getSightingById(sightingID);
        model.addAttribute("sighting", sighting);
        return "editSighting";
    }

    @RequestMapping(value = "/editSighting", method = RequestMethod.POST)
    public String editSighting(@Valid @ModelAttribute("sighting") Sighting sighting, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "editSighting";
        }
        dao.updateSighting(sighting);
        
        List<Sighting> list = new ArrayList<>();
        list.add(sighting);
        model.addAttribute("sightingList", list);
        return "editSighting";
    }
    
//    @RequestMapping(value = "/searchSightings", method = RequestMethod.GET)
//    public String searchSightings(HttpServletRequest request, Model model) {
//        Map<String, String> searchSightingsMap = new HashMap<>();
//        
//        final String CITY = "0";
//        final String STATE = "0";
//        final String COUNTRY = "0";
//        final String LATITUDE_COORDINATES = "0";
//        final String LATITUDE_DIRECTION = "0";
//        final String LONGITUDE_COORDINATES = "0";
//        final String LONGITUDE_DIRECTION = "0";
//        final String DATE = "0";
//        
//        String city = request.getParameter("city");
//        String state = request.getParameter("state");
//        String country = request.getParameter("country");
//        String latitudeCoordinates = request.getParameter("latitude");
//        char latitudeDirection = request.getParameter("latitudeDirection").charAt(0);
//        sighting.setLongitudeCoordinates(request.getParameter("longitude"));
//        sighting.setLongitudeDirection(request.getParameter("longitudeDirection").charAt(0));
//        sighting.setDescription(request.getParameter("description"));
//        sighting.setDate(java.sql.Date.valueOf(request.getParameter("date")));
//        
//        if (firstName != null && !firstName.isEmpty()) {
//            criteria.put(CITY, firstName);
//        }
//        if (lastName != null && !lastName.isEmpty()) {
//            criteria.put(SearchTerm.LAST_NAME, lastName);
//        }
//        if (company != null && !company.isEmpty()) {
//            criteria.put(SearchTerm.COMPANY, company);
//        }
//        if (phone != null && !phone.isEmpty()) {
//            criteria.put(SearchTerm.PHONE, phone);
//        }
//        if (email != null && !email.isEmpty()) {
//            criteria.put(SearchTerm.EMAIL, email);
//        }
//        List<Contact> contactSearchList = dao.searchContacts(criteria);
//        
//        model.addAttribute("contactSearchList", contactSearchList);
//        return "searchSightings";
//    }
    
    /*---------------------------Super Hero/Villain Methods----------------------------------------------*/
    
    @RequestMapping(value = "/newSuper", method = RequestMethod.POST)
    public String createSuper(Model model, HttpServletRequest request) {
        SuperHuman superHuman = new SuperHuman();
        if (request.getParameter("heroVillain").equalsIgnoreCase("hero")) {
            superHuman.setIsHero(true);
        } else {
            superHuman.setIsHero(false);
        }
        superHuman.setName(request.getParameter("name"));
        superHuman.setHeightInFeet(Integer.parseInt(request.getParameter("heightInFeet")));
        superHuman.setHeightInInches(Integer.parseInt(request.getParameter("heightInInches")));
        superHuman.setWeight(Integer.parseInt(request.getParameter("weight")));
        superHuman.setPower(request.getParameter("power"));
        superHuman.setPowerLevel(Integer.parseInt(request.getParameter("powerLevel")));
        superHuman.setDescription(request.getParameter("description"));

        List<SuperHuman> list = new ArrayList<>();
        list.add(dao.addSuper(superHuman));
        model.addAttribute("superHumanList", list);
        return "newSuper";
    }
    
    @RequestMapping(value = "/displaySuperDetails", method = RequestMethod.GET)
    public String displaySuperDetails(HttpServletRequest request, Model model) {
        int superID = Integer.parseInt(request.getParameter("superID"));
        SuperHuman superHuman = dao.getSuperById(superID);
        
        String heroVillain;
        if (superHuman.getIsHero() == true) {
            heroVillain = "Hero";
        } else {
            heroVillain = "Villain";
        }
        
        model.addAttribute("superHuman", superHuman);
        model.addAttribute("heroVillain", heroVillain);
        return "superDetails";
    }
    
    @RequestMapping(value = "/deleteSuper", method = RequestMethod.GET)
    public String removeSuper(HttpServletRequest request) {
        int superID = Integer.parseInt(request.getParameter("superID"));
        dao.removeSighting(superID);
        return "newSuper";
    }
    
    @RequestMapping(value = "/displayEditSuperForm", method = RequestMethod.GET)
    public String displayEditSuperForm(HttpServletRequest request, Model model) {
        int superID = Integer.parseInt(request.getParameter("superID"));
        SuperHuman superHuman = dao.getSuperById(superID);
        model.addAttribute("superHuman", superHuman);
        return "editSuper";
    }
    
    @RequestMapping(value = "/editSuper", method = RequestMethod.POST)
    public String editSuper(@Valid @ModelAttribute("superHuman") SuperHuman superHuman, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "editSuper";
        }
        dao.updateSuper(superHuman);
        
        List<SuperHuman> list = new ArrayList<>();
        list.add(superHuman);
        model.addAttribute("superHumanList", list);
        return "editSuper";
    }
    
    /*---------------------------Organization Methods----------------------------------------------*/
    @RequestMapping(value = "/newOrg", method = RequestMethod.POST)
    public String createOrg(Model model, HttpServletRequest request) {
        Organization org = new Organization();
        
        org.setName(request.getParameter("name"));
        org.setRole(request.getParameter("role"));
        org.setCity(request.getParameter("city"));
        org.setState(request.getParameter("state"));
        org.setCountry(request.getParameter("country"));
        org.setPhone(request.getParameter("phone"));
        org.setEmail(request.getParameter("email"));
        org.setDescription(request.getParameter("description"));

        List<Organization> list = new ArrayList<>();
        list.add(dao.addOrg(org));
        model.addAttribute("orgList", list);
        return "newOrg";
    }
    
    @RequestMapping(value = "/displayOrgDetails", method = RequestMethod.GET)
    public String displayOrgDetails(HttpServletRequest request, Model model) {
        int organizationID = Integer.parseInt(request.getParameter("organizationID"));
        Organization org = dao.getOrgById(organizationID);
        model.addAttribute("org", org);
        return "orgDetails";
    }
    
    @RequestMapping(value = "/deleteOrg", method = RequestMethod.GET)
    public String removeOrg(HttpServletRequest request) {
        int organizationID = Integer.parseInt(request.getParameter("organizationID"));
        dao.removeOrg(organizationID);
        return "newOrg";
    }
    
    @RequestMapping(value = "/displayEditOrgForm", method = RequestMethod.GET)
    public String displayEditOrgForm(HttpServletRequest request, Model model) {
        int organizationID = Integer.parseInt(request.getParameter("organizationID"));
        Organization org = dao.getOrgById(organizationID);
        model.addAttribute("org", org);
        return "editOrg";
    }
    
    @RequestMapping(value = "/editOrg", method = RequestMethod.POST)
    public String editOrg(@Valid @ModelAttribute("org") Organization org, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "editOrg";
        }
        dao.updateOrg(org);
        
        List<Organization> list = new ArrayList<>();
        list.add(org);
        model.addAttribute("orgList", list);
        return "editOrg";
    }
}
