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
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                crossorigin=""
        ></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="http://localhost:8080/Adventure/css/company_index.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <div class="container-fluid">
            <main>
                    <h1 class="font-weight-bold py-3 custom" >Adventure Booking</h1>
                <div class="container">
                    <main>
                        <div hidden id="companyid">${loggedInUser.company.id}</div>
                        <table id="company" class="table">
                            <h3>Η εταιρία μου</h3>
                            <thead>
                                <tr>
                                    <th scope="col">Όνομα Εταιρείας</th>
                                    <th scoe="col">Διεύθυνση</th>
                                    <th scope="col">ΑΦΜ</th>
                                    <th scope="col">TK</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Πόλη που εδρεύει</th>
                                    <th scope="col">Νομός που εδρεύει</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                            <td scope="col">${loggedInUser.company.name}</td>
                            <td scope="col">${loggedInUser.company.address}</td>
                            <td scope="col">${loggedInUser.company.afm}</td>
                            <td scope="col">${loggedInUser.company.postalCode}</td>
                            <td scope="col">${loggedInUser.company.email}</td>
                            <th scope="col">${loggedInUser.company.cityId.name}</th>
                            <th scope="col">${loggedInUser.company.cityId.countyId.name}</th>
                            <td><a href="${pageContext.request.contextPath}/company/update" class="btn btn-primary" >Edit</a></td>
                            </tbody>
                        </table>
                    </main>
                </div>
                <div class="row row-cols-1 row-cols-md-4 g-4">
                    <c:if test="${companysEvents != null}">
                    <c:forEach items="${companysEvents}" var = "event">
                        <div class="col">
                            <div class="card h-100">
                                <img
                                    src="${pageContext.request.contextPath}/img/${event.categoryId.imgurl}"
                                    class="card-img-top"
                                    alt="${event.categoryId.categoryName}"
                                    style="height: 200px"
                                    />
                                <div class="card-body card-main">
                                    <h5 class="card-title">${event.name}</h5>
                                    <p class="card-text">${event.description}</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">${event.categoryId.categoryName}</li>
                                    <li class="list-group-item date">${event.startingDate}</li>
                                    <li class="list-group-item">${event.locationId.cityId.name}</li>
                                </ul>
                                <div class="card-body">
                                    <a href="http://localhost:8080/Adventure/event/update/${event.id}" class="btn btn-primary btn-md">Επεξεργασία</a>
                                    <a href="http://localhost:8080/Adventure/booking/getEventCustomers/${event.id}" class="btn btn-primary btn-md">Κρατησεις</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
            </c:if>
                </div>
            </main>
        </div>
        <%@ include file="footer.jsp" %>
        <script src="js/company_index.js"></script>
    </body>
</html>
