<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Super Hero Database</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/> 
        <div class="container">
            
            <div class="header panel-heading text-center">
                <h1>Super Hero Database</h1>
            </div>
            
            <div class="row align-items-center">
                <div class="col-sm-8 body">
                    <h1 class="text-center">About</h1>
                    <p>Welcome to the Super Hero Database. If you have ever spotted any super hero, villain, and/or 
                    organization with super heroes/villains, then this is the place to record this data so the 
                    world can be aware. This purpose and function of this website is to store, catalog, and provide 
                    data relating to super-powered individuals and organizations.</p>
                    
                    <p><b>New Sighting:</b><br>
                    If you have spotted a super hero or super villain at a specific location, then you can head over
                    to the New Sighting page where you can add the location of the super hero that you have seen.</p>
                    
                    <p><b>Register a New Super Hero/Villain:</b><br>
                    Head over to this page to add a super hero or villain that you know of.</p>
                    
                    <p><b>Register an Organization: </b><br>
                    If you know of an organization run by super heroes or super villains, then head to this page
                    to register the organization.</p>
                    
                    <p><b>Search:</b><br>
                    Click on the search drop-down menu at the top right corner to search for super hero/villain
                    sightings, super heroes/villains, organizations, etc.</p>
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-9 body">
                    <h2 class="text-center">Latest Super Hero Sightings</h2>
                    
                    <table id="contactTable" class="table table-hover">
                        <tr>
                            <th width="20%">Location</th>
                            <th width="10%">Latitude</th>
                            <th width="10%">Longitude</th>
                            <th width="10%">Date</th>
                            <th width="20%">Description</th>
                            <th width="5%"></th>
                            <th width="5%"></th>
                        </tr>
                        <c:forEach var="sighting" items="${sightingList}">
                            <tr>
                                <td><a href="displaySightingDetails?sightingID=${sighting.sightingID}">
                                        <c:out value="${sighting.city}"/>   
                                        <c:out value="${sighting.state}"/> 
                                        <c:out value="${sighting.country}"/></a></td>
                                <td><c:out value="${sighting.latitudeCoordinates}"/> 
                                    <c:out value="${sighting.latitudeDirection}"/></td>
                                <td><c:out value="${sighting.longitudeCoordinates}"/> 
                                    <c:out value="${sighting.longitudeDirection}"/></td>
                                <td><c:out value="${sighting.date}"/></td>
                                <td><c:out value="${sighting.description}"/></td>
                                <td><input type="button" class="btn btn-default" 
                                           onclick="location.href='displayEditSightingForm?sightingID=${sighting.sightingID}'" 
                                           value="Edit"/></td>
                                <td><input type="button" class="buttons btn btn-default" 
                                           onclick="location.href='deleteSighting?sightingID=${sighting.sightingID}'" 
                                           value="Delete"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                    
                </div> <!-- End of column -->
            </div> <!-- End of row --> 
        </div> <!-- End of container -->
        
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>
