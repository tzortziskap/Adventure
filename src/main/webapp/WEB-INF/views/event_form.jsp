<%-- 
    Document   : Search
    Created on : Mar 10, 2021, 7:14:29 PM
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Δημιούργια Δραστηριότητας</title>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                crossorigin=""
        ></script>
        <script src="http://maps.google.com/maps/api/js?libraries=places&region=uk&language=en&sensor=true"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                crossorigin=""
        ></script>

        <link href="../css/event_form.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Αναζήτηση</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Καταχωρήση</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Διοργανωτές/Επισκέεπτες
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#">Εγγραφή</a>
                                <a class="dropdown-item" href="#">Συνδεση</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Πληροφορίες</a>
                        </li>
                    </ul>
                    <div id="loginregister">
                        <a class="nav-link active"  href="#">Αποσύνδεση</a>
                    </div>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <main>
        <section class="Form my-4 mx-5">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-centered">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../js/event_form.js"></script>
</body>
</html>
