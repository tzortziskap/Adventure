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

        <script>
            $(document).ready(function () {
            let id = document.getElementById("companyid").value;
            console.log(id)
                    $.ajax({
                    type: "GET",
                            url: "${pageContext.request.contextPath}/event/view/" + id,
                            dataType: 'json'

                    }).done(function (results) {
            var my_obj = JSON.parse((JSON.stringify(results)));
            let nym = results.event.length;
            document.getElementById("number").innerHTML = "Αριθμος δραστηριοτήτων " + nym;
            $('#eventstable tbody').html('');
            $("#map").html("");
            $("#map").append("<h3>Χάρτης</h3>");
            $("#map").html('<div id="mapid" >></div>');
            createpoints(results);
            });
            });
            function createpoints(results) {
            let points = [];
            for (var i = 0; i < results.event.length; i++) {


            var row = $('<tr ><td>' + results.event[i].name + '</td>' +
                    '<td>' + results.event[i].startingDate + '</td>' +
                    '<td>' + results.event[i].endingDate + '</td>' +
                    '<td>' + results.event[i].price + '</td>' +
                    '<td>' + results.event[i].difficultyId.level + '</td>' +
                    '<td>' + results.event[i].typeIndoorOutdoorId.typeIndoorOutdoor + '</td>' +
                    '<td>' + JSON.stringify(results.event[i].categoriesList) + '</td>' +
                    '<td>' + JSON.stringify(results.event[i].equipmentList) + '</td>' +
                    '<td>' + JSON.stringify(results.event[i].positions) + '</td>' +
                    
                    '<td> <a href="'+"${pageContext.request.contextPath}"+"/event/delete/" + results.event[i].id + '"> delete Event</a></td>' +
                    //'<td>' + "${pageContext.request.contextPath}/event/update/" + results.event[i].id+ '</td>' +
                    //'<td>' + results.event[i].locationId.coordinateX + '</td>' +
                    //'<td>' + results.event[i].locationId.coordinateY + '</td>' +
                    "</tr>");
            points.push({name: results.event[i].name, x: results.event[i].locationId.coordinateX,
                    y: results.event[i].locationId.coordinateY,
                    start: results.event[i].startingDate,
                    end: results.event[i].endingDate,
                    type:results.event[i].typeIndoorOutdoorId.typeIndoorOutdoor});
            $('#eventstable tbody').append(row);
            }
            createmap(points, map);
            }

            function createmap(result, map) {



            map = L.map('mapid').setView([38.25, 25.07], 13);
            L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
            maxZoom: 6,
                    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
                    'Imagery Β© <a href="https://www.mapbox.com/">Mapbox</a>',
                    id: 'mapbox/streets-v11',
                    tileSize: 512,
                    zoomOffset: - 1
            }).addTo(map);
            var bounds = new L.LatLngBounds();
            for (var i = 0; i < result.length; i++) {
            var marker = L.marker([result[i].x, result[i].y]).addTo(map);
            marker.bindPopup("<b>" + result[i].name + "</b><br/>" +
                    "Ημερομηνία Ενάρξης Δραστηριότητας: " + result[i].start + "<br/>" +
                    "Ημερομηνία Τέλους Δραστηριότητας: " + result[i].end + "<br/>" +
                    "Είδος:" + result[i].type);
            bounds.extend(marker.getLatLng());
            }
            map.fitBounds(bounds);
            }



        </script>


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
        <form:form method="POst" action="" modelAttribute="event">
            <h3> Το profill μου </h3>
            <label> Ονόμα εταιρίας </label>
            <form:input path="companyId" value="${event.companyId.name}"/>
            <label> Διευθυνση εταιρίας </label>
            <form:input path="companyId" value="${event.companyId.address}"/>

        </form:form>
        <input type="text" hidden value="${event.companyId.id}" id="companyid"/>

        <div class="col-sm" id="map">




        </div>

    </div>



</div>
<br/>
<br/>
<table id="eventstable" class="table">
    <h3 id="number"></h3>
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Starting Date</th>
            <th scope="col">Ending Date</th>
            <th scope="col">Price</th>
            <th scope="col">Diff</th>
            <th scope="col">Type</th>
            <th scope="col">Category</th>
            <th scope="col">Equipment</th>
            <th scope="col">Positions</th>

            <th scope="col">Delete</th>
            <th scope="col">Update</th>

        </tr>

    </thead>
    <tbody>
    </tbody>

</table>
</div>

</main>


<script>


</script>
</body>

</html>
