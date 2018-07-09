<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Directive for Spring Form tag libraries -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
                <h1>Super Hero/Villain</h1>
            </div>

            <div class="row">
                <div class="col-sm-6 body">
                    
                        <c:choose>
                            <c:when test="${superHuman.isHero}">
                                <h2><c:out value="Edit Super Hero"/></h2><hr>
                            </c:when>
                            <c:otherwise>
                                <h2><c:out value="Edit Super Villain"/></h2><hr>
                            </c:otherwise>
                        </c:choose>
                    
                    <sf:form class="form-horizontal" role="form" modelAttribute="superHuman" method="POST" action="editSuper">

                        <div class="form-group">
                            <label for="edit-hero-name" class="col-sm-2 control-label">Hero/Villain:</label>
                            <div class="col-md-10">
                                <select name="heroVillain">
                                    <option>Hero</option>
                                    <option>Villain</option>
                                </select>
                                <sf:input type="text" name="name" path="name" placeholder="Name"/>
                                <sf:errors path="name" cssclass="error"></sf:errors>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="edit-height" class="col-md-2 control-label">Height:</label>
                            <div class="col-md-10">
                                <sf:input type="number" step="1" name="heightInFeet" path="heightInFeet" placeholder="Feet"/>
                                <sf:errors path="heightInFeet" cssclass="error"></sf:errors>
                                <sf:input type="number" step="1" name="heightInInches" path="heightInInches" placeholder="Inches"/>
                                <sf:errors path="heightInInches" cssclass="error"></sf:errors>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="edit-weight" class="col-md-2 control-label">Weight:</label>
                            <div class="col-md-8">
                                <sf:input type="number" step="10" name="weight" path="weight" placeholder="Pounds"/>
                                <sf:errors path="weight" cssclass="error"></sf:errors>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="edit-power" class="col-md-2 control-label">Power:</label>
                            <div class="col-md-10">
                                <sf:input type="text" name="power" path="power" placeholder="Name of Power"/>
                                <sf:errors path="power" cssclass="error"></sf:errors>
                            </div>
                            <label>Power Level:</label><select name="powerLevel" class="numbers"></select>
                        </div>
                        
                        <div class="form-group">
                            <label for="edit-description" class="col-md-2 control-label">Description:</label>
                            <div class="col-md-10">
                                <sf:textarea type="text" class="form-control" rows="3" name="description" path="description" placeholder="Description of power"/>
                                <sf:errors path="description" cssclass="error"></sf:errors>
                                <sf:hidden path="superID"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <input type="submit" class="btn btn-default" value="Update">
                            </div>
                        </div>

                    </sf:form>
                </div> <!-- End of column -->
            </div> <!-- End of row --> 

            <div class="row">
                <div class="col-sm-8 body">
                    
                    <c:choose>
                            <c:when test="${superHuman.isHero}">
                                <h2><c:out value="Super Hero Summary"/></h2>
                            </c:when>
                            <c:otherwise>
                                <h2><c:out value="Super Villain Summary"/></h2>
                            </c:otherwise>
                        </c:choose>
                    
                    <table id="contactTable" class="table table-hover">
                        <tr>
                            <th width="20%">Name</th>
                            <th width="7%">Hero/Villain</th>
                            <th width="13%">Height</th>
                            <th width="14%">Weight</th>
                            <th width="20%">Power</th>
                            <th width="6%">Power Level</th>
                            <th width="5%"></th>
                            <th width="5%"></th>
                        </tr>
                        <c:forEach var="superHuman" items="${superHumanList}">
                            <tr>
                                <td><a href="displaySuperDetails?superID=${superHuman.superID}">
                                    <c:out value="${superHuman.name}"/></a></td>
                                <td><c:choose>
                                        <c:when test="${superHuman.isHero}">
                                            <c:out value="Hero"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="Villain"/>
                                        </c:otherwise>
                                </c:choose></td>
                                <td><c:out value="${superHuman.heightInFeet}"/> ft. 
                                    <c:out value="${superHuman.heightInInches}"/> in.</td>
                                <td><c:out value="${superHuman.weight}"/> lbs.</td>
                                <td><c:out value="${superHuman.power}"/></td>
                                <td><c:out value="${superHuman.powerLevel}"/></td>
                                <td><input type="button" class="btn btn-default" 
                                           onclick="location.href='displayEditSuperForm?superID=${superHuman.superID}'" 
                                           value="Edit"/></td>
                                <td><input type="button" class="buttons btn btn-default" 
                                           onclick="location.href='deleteSuper?superID=${superHuman.superID}'" 
                                           value="Delete"/></td>
                            </tr>
                        </c:forEach>
                    </table>                    
                </div> <!-- End of column -->
            </div> <!-- End of row --> 
        </div> <!-- End of container --> 

        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>

    </body>
</html>

