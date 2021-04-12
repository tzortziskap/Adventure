<%-- 
    Document   : Search
    Created on : Mar 10, 2021, 7:14:29 PM
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Δημιούργια Δραστηριότητας</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
        <!-- Maps -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                crossorigin=""
        ></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
        <link href="http://localhost:8080/Adventure/css/event_info.css" rel="stylesheet" type="text/css">
        <link href="http://localhost:8080/Adventure/css/footer.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <main>
            <div class="container">
                <div class="row align-items-start">
                    <div class="col-md-4">
                        <img src="/Adventure/img/${event.categoryId.imgurl}" alt="1" width="90%" class="rounded float-left"/>
                        <div id="location">
                            <h3>Σημείο Συνάντησης</h3>
                            <table class="table">
                                <tr>
                                    <th scoe="col">Πόλη</th>
                                    <td>${event.locationId.cityId.name}</td>
                                </tr>
                                <tr>
                                    <th scoe="col">Διευθύνση</th>
                                    <td>${event.locationId.address}</td>
                                </tr>
                                <tr>
                                    <th scoe="col">ΤΚ</th>
                                    <td>${event.locationId.postalCode}</td>
                                </tr>
                                <tr>
                                    <th scoe="col">Συντεταγμένες Χ</th>
                                    <td id="x">${event.locationId.coordinateX}</td>
                                </tr>
                                <tr>
                                    <th scoe="col">Συντεταγμένες Υ</th>
                                    <td id="y">${event.locationId.coordinateY}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <h3>Πληροφορίες Δραστηριότητας </h3>
                        <table  class="table">
                            <tr>
                                <th scope="col">Ονόμα</th>
                                <td>${event.name}</td>
                            </tr>
                            <tr>
                                <th scope="col">Περιγραφή</th>
                                <td scope="col">${event.description}</td>
                            </tr>
                            <tr>
                                <th scoe="col">Κόστος</th>
                                <td>${event.price} EUR</td>
                            </tr>
                            <tr>
                                <th scope="col">Ημερομηνία Ενάρξης</th>
                                <td class="date">${event.startingDate}</td>
                            </tr>
                            <tr>
                                <th scope="col">Ημερομηνία Τελους</th>
                                <td class="date">${event.endingDate}</td>
                            </tr>
                            <tr>
                                <th scoe="col">Κατηγορία</th>
                                <td>${event.categoryId.categoryName}</td>
                            </tr>
                            <tr>
                                <th scoe="col">Δυσκολια</th>
                                <td>${event.difficultyId.level}</td>
                            </tr>
                            <tr>
                                <th scoe="col">Είδος</th>
                                <td>${event.typeIndoorOutdoorId.typeIndoorOutdoor}</td>
                            </tr>
                            <tr>
                                <th scoe="col">Διαθέσιμες Θέσεις</th>
                                <td>${event.remainingPositions}</td>
                            </tr>
                            <tr>
                                <th scoe="col">Εταίρια που το διοργανωνεί</th>
                                <td>${event.companyId.name}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-3">
                        <h3>Εξοπλισμός</h3>
                        <div class="equipment">
                            <ul class="list-group">
                                <c:forEach items="${event.equipmentList}" var = "equipment">
                                    <li>${equipment.name}</li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h3>Eμφάνιση στον Χάρτη</h3>
                        <div class="col-sm" id="map">
                            <div id="mapid" ></div>
                        </div>
                    </div>
                    
                        <c:if test="${loggedInUser.company.id == event.companyId.id}">
                            <div class="col-md-6">
                            <a href="http://localhost:8080/Adventure/event/update/${event.id}" class="btn btn-primary btn-lg">Επεξεργασία</a>
                            </div>
                        </c:if>
                            <c:if test="${event.remainingPositions != 0}">
                    <security:authorize access="!hasAuthority('COMPANY')">
                    <form:form class= "form-inline" action="http://localhost:8080/Adventure/payment/${event.id}" method="GET" modelAttribute="book">
                         <div class="form-inline my-3 ">
                        <div class="col-md-7">
                            <label class="form-check-label" for="count">Aριθμός θέσεων</label>
                            <input type="number" style ="width: 100%" id="count" placeholder="Αριθμός Θέσεων" class="form-control" name="amountPositions" min="1" max="${event.remainingPositions}" required>
                        </div>
                        <div class="col-md-5">
                            <input type="submit"  class="btn btn-primary btn-lg" value="Συνέχεια" />
                        </div>
                         </div>
                    </form:form>
                    </security:authorize>
                            </c:if>
                </div>
            </div>
        </main>
        <%@ include file="footer.jsp" %>
        <script src="http://localhost:8080/Adventure/js/event_info.js"></script>
    </body>
</html>
