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
                <h1>Super Organization</h1>
            </div>
            
            <div class="row">
                <div class="col-sm-6 body">
                    <h2 class="text-center">Search</h2><hr>
                    <form class="form-horizontal" role="form" method="GET" action="searchOrg">

                        <div class="form-group">
                            <label for="search-org-name" class="col-sm-2 control-label">Name:</label>
                            <div class="col-md-10">
                                <input type="text" name="name" placeholder="Name">
                                <label>Role:</label>
                                <select name="role">
                                    <option>Lawful</option>
                                    <option>Neutral</option>
                                    <option>Chaotic</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="search-org-location" class="col-sm-2 control-label">Location:</label>
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
                            <label for="search-org-phone" class="col-md-2 control-label">Phone:</label>
                            <div class="col-md-8">
                                <input type="tel" name="phone" placeholder="Phone Number">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="search-org-email" class="col-md-2 control-label">Email:</label>
                            <div class="col-md-10">
                                <input type="email" name="email" placeholder="Email">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <input type="submit" class="btn btn-default" value="Search">
                            </div>
                        </div>

                    </form>
                </div> <!-- End of column -->
            </div> <!-- End of row --> 

            <div class="row">
                <div class="col-sm-8 body">
                    <h2 class="text-center">Search Results</h2>
                    <table id="contactTable" class="table table-hover">
                        <tr>
                            <th width="20%">Name</th>
                            <th width="10%">Role</th>
                            <th width="20%">Location</th>
                            <th width="20%">Phone</th>
                            <th width="20%">Email</th>
                            <th width="5%"></th>
                            <th width="5%"></th>
                        </tr>
                        <c:forEach var="org" items="${orgList}">
                            <tr>
                                <td><a href="displayOrgDetails?organizationID=${org.organizationID}">
                                        <c:out value="${org.name}"/></a></td>
                                <td><c:out value="${org.role}"/></td>
                                <td><c:out value="${org.city}"/>  
                                    <c:out value="${org.state}"/>
                                    <c:out value="${org.country}"/></td>
                                <td><c:out value="${org.phone}"/></td>
                                <td><c:out value="${org.email}"/></td>
                                <td><input type="button" class="btn btn-default" 
                                           onclick="location.href = 'displayEditOrgForm?organizationID=${org.organizationID}'" 
                                           value="Edit"/></td>
                                <td><input type="button" class="buttons btn btn-default" 
                                           onclick="location.href = 'deleteOrg?organizationID=${org.organizationID}'" 
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