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
        <link href="../css/event_form.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <div class="container-fluid">   
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <ul class="navbar-nav me-auto mb-2 mb-md-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="http://localhost:8080/Adventure">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/event/search">Δράστηριοτητες</a>
                            </li>
                            <security:authorize access="hasAuthority('CUSTOMER')">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/event/register">Κράτηση</a>
                                </li>
                            </security:authorize>
                            <security:authorize access="hasAuthority('COMPANY')">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/event/create">Καταχωρήση</a>
                                </li>
                            </security:authorize>
                            <li class="nav-item">
                                <a class="nav-link" href="http:/localhost:8080/Adventure/#aboutus">Σχετικά με εμάς</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#footer">Πληροφορίες</a>
                            </li>
                        </ul>
                    </div>
                    <div id="loginregister">
                        <c:if test="${loggedInUser == null}">
                            <a class="nav-link"  href="http://localhost:8080/Adventure/loginPage">Σύνδεση</a>
                            <a class="nav-link" href="http://localhost:8080/Adventure/register">Εγγραφή</a>
                        </c:if>
                        <c:if test="${loggedInUser != null}">
                            <form:form class="d-flex" action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout" class="form-control me-2">
                            </form:form>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <main>
        
        <section class="Form my-4 mx-5">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-centered">
                        <h1 class="font-weight-bold py-3">Adventure Booking</h1>
                        <form:form action="/Adventure/event/create" id="form" method="POST" modelAttribute="event">
                            <h3 class="font-weight-bold py-3">Καταχωρήστε τη δραστηριότητα </h3>

                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="name">Ονόμα δραστηριότητας</label>
                                    <form:input path="name" class="form-control"/>
                                    <form:errors path="name" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="description">Περιγραφή δραστηριότητας</label>
                                    <textarea name="description" class="form-control" id="description"></textarea>
                                    <form:errors path="description" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="startingDate">Ημερομηνία διεξαγωγής</label>
                                    <form:input path="startingDate" class="form-control" type="datetime-local"/>
                                    <form:errors path="startingDate" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="endingDate">Ημερομηνία τελους</label>
                                    <form:input path="endingDate" class="form-control" type="datetime-local"/>
                                    <form:errors path="endingDate" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="positions">Διαθέσιμες θέσεις</label>
                                    <form:input type="number" class="form-control" path="positions" />
                                    <form:errors path="positions" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="level">Δυσκολία</label>
                                    <select  name="difficultyId.id" id="level" class="form-control difficulty">
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>  
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="price">Τιμή</label>
                                    <form:input path="price" class="form-control" type="number" id="priceval" />
                                </div>  
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="category">Κατηγορία</label>
                                    <select name="categoryId" id="category" class="form-control categories">
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="type">Τύπος</label>
                                    <select name="typeIndoorOutdoorId" id="type" class="form-control typeIndoorOutdoor">
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="equipments" >Εξοπλισμος</label>
                                    <div id="list1" class="dropdown-check-list" tabindex="100">
                                        <span class="anchor">Choose...</span>
                                        <ul class="items .equipment">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="county">Νομός</label>
                                    <select  name="locationId.cityId.countyId.id" id="county" class="form-control county">
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="city">Πόλη</label>
                                    <select  name="locationId.cityId" id="city" class="form-control city">
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="inputState">Διεύθυνση</label>
                                    <form:input path="locationId.address" class="form-control" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="inputState">Ταχυδρομικός Κώδικας</label>
                                    <form:input path="locationId.postalCode" class="form-control" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <h6>Εντοπίστε στον χάρτη το σημείο που θα πραγματοποιηθεί η εκδήλωση
                                        (αφορά δραστηριότητες στη φύση, όπως trekking, kayak κλπ)  </h6>
                                    <div id="map_canvas" style="height: 500px;width: 100%"></div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="inputState">Τοποθεσια X</label>
                                    <input type="text" name="locationId.coordinateX" class="form-control" id="x" value=""/>
                                </div>  
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <label for="inputState">Τοποθεσια Y</label>
                                    <input type="text" name="locationId.coordinateY" class="form-control" id="y" value=""/>
                                </div>
                            </div>
                            <input type="submit" class="btn1 mt-3 mb-5" id="btn1" value="Create Event">
                        </form:form>
                    </div>
                </div>
            </div>

        </section>
    </main>
    
    <script src="../js/event_form.js"></script>
</body>
</html>
