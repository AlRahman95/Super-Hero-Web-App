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
        <nav class="navbar navbar-inverse main-nav">
            
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" id="home" href="home">SUPER HERO</a>
                </div>
                
                <ul class="nav navbar-nav">
                    <li class="active"><a id="newSight" label="newSight" href="navSighting">New Sighting</a></li>
                    <li class="active"><a id="newSuper" label="newSuper" href="navSuper">Register a Super Hero/Villain</a></li>
                    <li class="active"><a id="newOrg" label="newOrg" href="navOrg">Register an Organization</a></li>
                </ul>
                
                <form class="navbar-form navbar-right" method="GET" action="searchDirectory">
                    <div class="form-group">
                        <select name="searchParam" id="searchParam" class="form-control">
                            <option>Sightings</option>
                            <option>Organizations</option>
                            <option>Super</option>
                        </select>  
                        <button id="search" type="submit" class="btn btn-default">Search</button>
                    </div>
                </form>
                
            </div>
        </nav>
        
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>
