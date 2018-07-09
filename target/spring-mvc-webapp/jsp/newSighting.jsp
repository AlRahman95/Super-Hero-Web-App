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
                <h1>Super Hero Sighting</h1>
            </div>

            <div class="row">
                <div class="col-sm-6 body">
                    <h2>Add New Super Hero Sighting</h2><hr>
                    <form class="form-horizontal" role="form" method="POST" action="newSighting">

                        <div class="form-group">
                            <label for="add-location" class="col-sm-2 control-label">Location:</label>
                            <div class="col-md-10">
                                <input type="text" name="city" placeholder="City"/>
                                <select name="state">
                                    <option></option>
                                    <option>NY</option>
                                    <option>NJ</option>
                                    <option>CT</option>
                                    <option>PA</option>
                                </select>
                                <select name="country">
                                    <option>United States</option>
                                    <option>Canada</option>
                                    <option>United Kingdom</option>
                                    <option>Japan</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="add-latitude" class="col-md-2 control-label">Latitude:</label>
                            <div class="col-md-10">
                                <input type="number" step=".01" name="latitude" placeholder="Latitude Coordinates">
                                <select name="latitudeDirection">
                                    <option>N</option>
                                    <option>S</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="add-longitude" class="col-md-2 control-label">Longitude:</label>
                            <div class="col-md-8">
                                <input type="number" step=".01" name="longitude" placeholder="Longitude Coordinates">
                                <select name="longitudeDirection">
                                    <option>E</option>
                                    <option>W</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="add-date" class="col-md-2 control-label">Date:</label>
                            <div class="col-md-10">
                                <input type="date" name="date">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="add-description" class="col-md-2 control-label">Description:</label>
                            <div class="col-md-10">
                                <textarea type="text" class="form-control" rows="3" name="description" placeholder="Description of sighting"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <input type="submit" class="btn btn-default" value="Submit"/>
                            </div>
                        </div>

                    </form>
                </div> <!-- End of column -->
            </div> <!-- End of row --> 

            <div class="row">
                <div class="col-sm-9 body">
                    <h2>Super Hero Sighting Summary</h2>
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
