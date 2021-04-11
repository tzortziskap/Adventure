<%-- 
    Document   : Search
    Created on : Mar 10, 2021, 7:14:29 PM
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Το προφίλ μου</title>
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
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
        <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Maps -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                crossorigin=""
        ></script>
        <link href="http://localhost:8080/Adventure/css/customer_index.css" rel="stylesheet" type="text/css">
        <link href="http://localhost:8080/Adventure/css/footer.css" rel="stylesheet" type="text/css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <div class="container">
            <main>
                <div class="container bootstrap snippets bootdey">
                    <div class="row">
                        <div class="profile-nav col-md-3">
                            <div class="panel">
                                <div class="user-heading round">
                                    <c:if test="${loggedInUser.customer.genderId.id == 1}">
                                        <a href="#">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">
                                        </a>
                                    </c:if>
                                    <c:if test="${loggedInUser.customer.genderId.id == 2}">
                                        <a href="#">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                                        </a>
                                    </c:if>
                                    <h1>${loggedInUser.customer.firstname} ${loggedInUser.customer.lastname}</h1>
                                    <p>${loggedInUser.customer.email}</p>
                                </div>

                                <ul class="nav nav-pills nav-stacked">
                                    <li class="active"><a href="http://localhost:8080/Adventure/customer"> <i class="fa fa-user"></i> Προφίλ</a></li>
                                    <li><a href="http://localhost:8080/Adventure/customer/update"> <i class="fa fa-edit"></i> Επεξεργασία</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="profile-info col-md-9">
                            <div class="panel">
                                <div class="panel-body bio-graph-info">
                                    <h1>Πληροφορίες</h1>
                                    <div class="row profile-info">
                                        <div class="bio-row">
                                            <p><span>Όνομα </span>: ${loggedInUser.customer.firstname}</p>
                                        </div>
                                        <div class="bio-row">
                                            <p><span>Επίθετο </span>: ${loggedInUser.customer.lastname}</p>
                                        </div>
                                        <div class="bio-row">
                                            <p><span>Username </span>: ${loggedInUser.username}</p>
                                        </div>
                                        <div class="bio-row">
                                            <p><span>Email </span>: ${loggedInUser.customer.email}</p>
                                        </div>
                                        <div class="bio-row">
                                            <p><span>Ηλικία</span>: <span class="age"><fmt:formatDate pattern="yyyy-MM-dd" value="${loggedInUser.customer.dateOfBirth}" /></span></p>
                                        </div>
                                        <div class="bio-row">
                                            <p><span>Νομός </span>: ${loggedInUser.customer.cityId.countyId.name}</p>
                                        </div>
                                        <div class="bio-row">
                                            <p><span>Πόλη </span>: ${loggedInUser.customer.cityId.name}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div hidden id="customerid">${loggedInUser.customer.id}</div>
                <h3 id="number">Οι δραστηριοτήτες μου</h3>
                <div id="table">
                    <table id="eventstable" class="table" width="100%">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">x</th>
                                <th scope="col">y</th>
                                <th scope="col">Όνομα</th>
                                <th scope="col">Ημερομηνία</th>
                                <th scope="col">Τιμή</th>
                                <th scope="col">Πόλη</th>
                                <th scope="col">Κατηγορία</th>
                                <th scope="col">Περισσότερες Πληροφορίες</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm" id="map">
                </div>
                <div class="suggestions" id="table1">
                    <h3>Δραστηριότητες που θα μπορουσάτε να συμμετασχέτε</h3>
                    <table id="eventstobook" class="table">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">x</th>
                                <th scope="col">y</th>
                                <th scope="col">Όνομα</th>
                                <th scope="col">Ημερομηνία</th>
                                <th scope="col">Τιμή</th>
                                <th scope="col">Πόλη</th>
                                <th scope="col">Κατηγορία</th>
                                <th scope="col">Περισσότερες Πληροφορίες</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
<%@ include file="footer.jsp" %>
        <script src="http://localhost:8080/Adventure/js/customer_index.js"></script>
    </body>
</html>
