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
                        <c:choose>
                            <c:when test="${superHuman.isHero}">
                                <h2><c:out value="Super Hero Details"/></h2>
                            </c:when>
                            <c:otherwise>
                                <h2><c:out value="Super Villain Details"/></h2>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <p><b>Hero/Villain:</b>  <c:out value="${heroVillain}"/></p> 
                    <p><b>Name:</b>  <c:out value="${superHuman.name}"/></p>
                    <p><b>Height:</b>  <c:out value="${superHuman.heightInFeet}"/> ft.  
                               <c:out value="${superHuman.heightInInches}"/> in.</p>
                    <p><b>Weight:</b>  <c:out value="${superHuman.weight}"/> lbs.</p>
                    <p><b>Power:</b>  <c:out value="${superHuman.power}"/> </p>
                    <p><b>Power Level:</b>  <c:out value="${superHuman.powerLevel}"/></p>
                    <p><b>Description:</b>  <c:out value="${superHuman.description}"/></p>
                    <input type="button" class="buttons btn btn-default" 
                           onclick="location.href = 'displayEditSuperForm?superID=${superHuman.superID}'" 
                           value="Edit"/>
                    <input type="button" class="buttons btn btn-default" 
                           onclick="location.href = 'deleteSuper?superID=${superHuman.superID}'" 
                           value="Delete"/>
                </div> <!-- End of column -->
            </div> <!-- End of row --> 
        </div> <!-- End of container -->

        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

