<%-- 
    Document   : Search
    Created on : Mar 10, 2021, 7:14:29 PM
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Αναζήτηση Δραστηριοτήτων</title>
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
        <link rel="stylesheet" href="/Adventure/css/search.css">
        <link href="/Adventure/css/footer.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <main>
            <div class="container">
                <h1 class="font-weight-bold py-3">Adventure Booking</h1>
                <div class="row">
                    <div class="col">
                        <h3> Φορμα αναζήτησης δραστηριοτήτων </h3>
                        <form id="form">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="name">'Ονομα</label>
                                    <input name="name" type="text" class="form-control searching inputSearching" id="name" >
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="type">Τύπος</label>
                                    <select name="typeIndoorOutdoorId.id" id="type" class="form-control typeIndoorOutdoor searching selectSearching">
                                        <option value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="price">Τιμή εώς</label>
                                    <input type="number" name="price" id="price" class="form-control price searching inputSearching">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="county">Νομός</label>
                                    <select  name="locationId.cityId.countyId.id" id="county" class="form-control county searching selectSearching">
                                        <option value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="city">Πόλη</label>
                                    <select  name="locationId.cityId.id" id="city" class="form-control city searching selectSearching">
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="level">Δυσκολία</label>
                                    <select  name="difficultyId.id" id="level" class="form-control difficulty searching selectSearching">
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="category">Κατηγορία</label>
                                    <select name="categoryId.id" id="category" class="form-control categories searching selectSearching">
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm" id="map">
                    </div>
                </div>
            </div>
            <h3 id="number"></h3>
            <div class="row row-cols-1 row-cols-md-4 g-4" id='events'>
            </div>
        </main>
        <%@ include file="footer.jsp" %>
        <script src="/Adventure/js/searchjs.js"></script>
    </body>
</html>


