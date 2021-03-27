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
        <title>JSP Page</title>
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

        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css">


        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                background-color: rgb(209, 209, 214);
            }

            .row {
                background-color: white;
                border-radius: 30px;
            }

            img {
                border-top-left-radius: 30px;
                border-bottom-left-radius: 30px;
            }

            label {
                justify-content: left !important;
            }

            .btn1 {
                border: none;
                outline: none;
                height: 50px;
                width: 100%;
                background-color: black;
                color: white;
                border-radius: 4px;
                font-weight: bold;
            }

            .btn1:hover {
                background-color: white;
                border: 1px solid;
                color: black;
            }

            footer {
                text-align: center;
                color: whitesmoke;
                line-height: 50px;
                position: sticky;
                bottom: 0;
                background-color: aqua;
                width: 100%;
            }

            footer a {
                text-decoration: none;
                color: whitesmoke;
            }


            input {}
            #mapid { height: 180px; }
        </style>
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
                                <a class="dropdown-item" href="#">Εγγραγή</a>

                                <a class="dropdown-item" href="#">Συνδεση</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Πληροφορίες</a>
                        </li>
                    </ul>

                    <div id="loginregister">
                        <a class="nav-link active"  href="#">Log in</a>
                        <a class="nav-link active" href="#">Register</a>        
                    </div>

                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    </div>
    <br/>

    <main>
        <section class="Form my-4 mx-5">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-lg-12 px-5 pt-5">

                        <form:form action="/Adventure/event/create" method="POST" modelAttribute="event">
                            <h3> Καταχωρήστε τη δραστηριότητα </h3>
                            <div class="form-inline my-3">
                                <div class="col-lg-6">
                                    <label for="name">Ονόμα δραστηριότητας</label>
                                    <form:input path="name" />
                                    <form:errors path="name" />


                                </div>
                                <div class="col-lg-6 my-3">

                                    <label for="description">Περιγραφή δραστηριότητας</label>
                                    <textarea name="description" class="form-control" id="description" rows="3"></textarea>
                                       <form:errors path="description" />


                                </div>
                                <div class="col-lg-6 my-3">

                                    <label for="type">Ειδός δραστηριοτήτας</label>
                                    <form:select path="typeIndoorOutdoorId" items="${type}" itemValue="id" itemLabel="typeIndoorOutdoor"/>

                                </div>

                                <div class="col-lg-6 my-3">

                                    <label for="startingDate">Ημερομηνία διεξαγωγής</label>
                                    <form:input path="startingDate" type="datetime-local"/>
                                    <form:errors path="startingDate" />


                                </div>
                                <div class="col-lg-6 my-3">

                                    <label for="endingDate">Ημερομηνία τελους</label>
                                    <form:input path="endingDate" type="datetime-local"/>
                                    <form:errors path="endingDate" />
                                </div>
                       
                            
                            </div>
                                        <div class="col-lg-6 my-3">

                                    <label for="positions">Διαθέσιμες θέσεις</label>
                                    <form:input path="positions" />
                                    <form:errors path="positions" />
                                </div>
                                 

                            <div class="col-lg-6 my-3">

                                <label for="difficulty">Δυσκολία</label>
                                <form:select path="difficultyId" items="${difficulty}" itemLabel="level" itemValue="id"/>

                            </div>  

                            <div class="col-lg-6 my-3">

                                <label for="price">Τιμή</label>
                                <form:input path="price" min="1" max="100" id="priceval" />

                            </div>  
                            <div class="mb-3">

                                <label for="categories">Κατηγορία</label>
                                <form:select path="categoriesList" items="${categories}"  itemLabel="categoryName" itemValue="id"/>
                                <form:errors path="categoriesList" />
                            </div>




                            <br/>



                            <div class="col-auto">
                                <label for="equipments" >Εξοπλισμος</label>
                                <br/>
                                <div class="col-auto">
                                    <c:forEach var="customer" items="${equipments}">

                                        <input type="checkbox" name="equipmentList" value="${customer.id}">${customer.name}<br/>

                                        </input>
                                    </c:forEach>

                                </div>
                            </div><!-- comment -->




                            <div class="col-lg-6 my-3">

                                <h6>Εντοπίστε στον χάρτη το σημείο που θα πραγματοποιηθεί η εκδήλωση
                                    (αφορά δραστηριότητες στη φύση, όπως trekking, kayak κλπ)  </h6>

                                <div id="map_canvas" style="height: 500px;width: 100%"></div>

                            </div>

                            <div class="col-lg-6 my-3">

                                <label for="inputState">Τοποθεσια X</label>
                                <input type="text" name="locationId.coordinateX" id="x" value=""/>


                            </div>  
                            <div class="col-lg-6 my-3">

                                <label for="inputState">Τοποθεσια Y</label>
                                <input type="text" name="locationId.coordinateY"  id="y" value=""/>


                            </div>
                            <div class="form-inline my-3 ">
                                <h6>Η διευθυνση που θα πραγματοποιηθεί η εκδήλωση ή το σημείο συνάντησης </h6>

                                <label for="inputState">Πόλη</label>
                                <form:select path="locationId.cityId" items="${cities}" itemLabel="name" itemValue="id"/>
                                <label for="inputState">Adress</label>
                                <form:input path="locationId.address" />
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Postal code</label>
                                        <form:input path="locationId.postalCode" />

                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="companyId">Εταιρεία</label>
                                    <form:hidden path="companyId" value="1" />
                                </div>
                            </div>
                            <input type="submit" class="btn1 mt-3 mb-5" id="btn1" value="Create Event">


                        </form:form>
                    </div>

                </div>
            </div>
        </section>
    </main>

    <script>
        var map = L.map("map_canvas").setView([38.25, 25.07], 5);
        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
            maxZoom: 10,
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
                    'Imagery Β© <a href="https://www.mapbox.com/">Mapbox</a>',
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1}).addTo(map);
           map.on("contextmenu", function (event) {
            $(".leaflet-marker-icon").remove();
            $(".leaflet-popup").remove();
            $(".leaflet-pane.leaflet-shadow-pane").remove();


            L.marker(event.latlng).addTo(map);
            var coord = event.latlng;
            var lat = coord.lat;
            var lng = coord.lng;
            document.getElementById("x").setAttribute('value', lat);
            document.getElementById("y").setAttribute('value', lng);


        });

        $(document).ready(function () {
            $("#cityDiv").prop("hidden", true);
            $("#county").change(function () {
                if ($("#countySpacer").is(":selected")) {
                    $("#cityDiv").prop("hidden", true);
                } else {
                    var data = $("#county").children("option:selected").val();
                    var url = "http://localhost:8080/Adventure/county/cities/" + data;
                    $.getJSON(url, function (result) {
                        $('#city').empty();
                        $('#city').append('<option selected id="citySpacer" value="SPACER">Choose...</option>');
                        $('#city').populate(result);
                        $("#cityDiv").prop("hidden", false);
                    });
                }
            });
            (function ($) {
                // Populates a select drop-down with options in a list 
                $.fn.populate = function (list) {
                    return this.append(list.map(item => $('<option>', {
                            text: item.name,
                            value: item.id
                        })));
                };
            })(jQuery);
        });
    </script>
</body>

</html>
