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
            <div class="row">
                <div class="col-sm-6 body">
                    <div class="panel-heading">
                        <h2>Sighting Details</h2><hr>
                    </div>
                    
                    <p><b>City:</b>  <c:out value="${sighting.city}"/></p> 
                    <p><b>State:</b>  <c:out value="${sighting.state}"/></p>
                    <p><b>Country:</b>  <c:out value="${sighting.country}"/></p>
                    <p><b>Latitude Coordinates:</b>  <c:out value="${sighting.latitudeCoordinates}"/> <c:out value="${sighting.latitudeDirection}"/></p>
                    <p><b>Longitude Coordinates:</b>  <c:out value="${sighting.longitudeCoordinates}"/> <c:out value="${sighting.longitudeDirection}"/> </p>
                    <p><b>Date:</b>  <c:out value="${sighting.date}"/></p>
                    <p><b>Description:</b>  <c:out value="${sighting.description}"/></p>
                    <input type="button" class="buttons btn btn-default" 
                           onclick="location.href='displayEditSightingForm?sightingID=${sighting.sightingID}'" 
                           value="Edit"/>
                    <input type="button" class="buttons btn btn-default" 
                           onclick="location.href='deleteSighting?sightingID=${sighting.sightingID}'" 
                           value="Delete"/>
                </div> <!-- End of column -->
            </div> <!-- End of row --> 
        </div> <!-- End of container -->

        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>
