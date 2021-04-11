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
        <script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>
        <link href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css" rel="stylesheet"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="http://localhost:8080/Adventure/css/event_form.css" rel="stylesheet" type="text/css">
        <link href="http://localhost:8080/Adventure/css/footer.css" rel="stylesheet" type="text/css">

    </head>
    <body>

        <%@ include file="nav.jsp" %>
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
                                        <input name="name" class="form-control" required/>
                                        <form:errors path="name" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="description">Περιγραφή δραστηριότητας</label>
                                        <textarea name="description" value="${event.description}" class="form-control" id="description" required></textarea>
                                        <form:errors path="description" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="startingDate">Ημερομηνία διεξαγωγής</label>
                                        <input name="startingDate" class="form-control" type="datetime-local" required/>
                                        <form:errors path="startingDate" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="endingDate">Ημερομηνία τελους</label>
                                        <input name="endingDate" class="form-control" type="datetime-local" required/>
                                        <form:errors path="endingDate" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="positions">Διαθέσιμες θέσεις</label>
                                        <input type="number" class="form-control" name="positions" required/>
                                        <form:errors path="positions" />
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="level">Δυσκολία</label>
                                        <select  name="difficultyId.id" id="level" class="form-control difficulty" required>
                                            <option value=''>Choose...</option>
                                        </select>
                                    </div>  
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="price">Τιμή</label>
                                        <input path="price" class="form-control" type="number" id="priceval" required/>
                                    </div>  
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="category">Κατηγορία</label>
                                        <select name="categoryId" id="category" class="form-control categories" required>
                                            <option  value=''>Choose...</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="type">Τύπος</label>
                                        <select name="typeIndoorOutdoorId" id="type" class="form-control typeIndoorOutdoor" required>
                                            <option  value=''>Choose...</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="equipments" >Εξοπλισμος</label>
                                        <select data-placeholder="Begin typing a name to filter..." multiple class="chosen-select form-control equipment" name="equipmentList" required>
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="county">Νομός</label>
                                        <select  name="locationId.cityId.countyId.id" id="county" class="form-control county" required>
                                            <option  value=''>Choose...</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="city">Πόλη</label> 
                                        <select  name="locationId.cityId" id="city" class="form-control city" required>
                                            <option  value=''>Choose...</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="inputState">Διεύθυνση</label>
                                        <input name="locationId.address" class="form-control" required/>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="inputState">Ταχυδρομικός Κώδικας</label>
                                        <input name="locationId.postalCode" class="form-control" required/>
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
                                        <input type="text" name="locationId.coordinateX" class="form-control" id="x"/>
                                    </div>  
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-9 col-centered">
                                        <label for="inputState">Τοποθεσια Y</label>
                                        <input type="text" name="locationId.coordinateY" class="form-control" id="y"/>
                                    </div>
                                </div>
                                <input hidden type="text" value="${loggedInUser.company.id}" name="companyId"/>
                                <input type="submit" class="btn1 mt-3 mb-5" id="btn1" value="Create Event">
                            </form:form>
                        </div>
                    </div>
                </div>

            </section>
        </main>
        <%@ include file="footer.jsp" %>
        <script src="http://localhost:8080/Adventure/js/event_form.js"></script>
    </body>
</html>
