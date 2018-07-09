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
                        <h2>Super Organization Details</h2>
                    </div>
                    
                    <p><b>Name:</b>  <c:out value="${org.name}"/></p>
                    <p><b>Role:</b>  <c:out value="${org.role}"/></p>
                    <p><b>City:</b>  <c:out value="${org.city}"/></p>
                    <p><b>State:</b>  <c:out value="${org.state}"/> </p>
                    <p><b>Country:</b>  <c:out value="${org.country}"/></p>
                    <p><b>Phone:</b>  <c:out value="${org.phone}"/></p>
                    <p><b>Email:</b>  <c:out value="${org.email}"/></p>
                    <p><b>Description:</b>  <c:out value="${org.description}"/></p>
                    <input type="button" class="buttons btn btn-default" 
                           onclick="location.href = 'displayEditOrgForm?organizationID=${org.organizationID}'" 
                           value="Edit"/>
                    <input type="button" class="buttons btn btn-default" 
                           onclick="location.href = 'deleteOrg?organizationID=${org.organizationID}'" 
                           value="Delete"/>
                </div> <!-- End of column -->
            </div> <!-- End of row --> 
        </div> <!-- End of container -->

        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>