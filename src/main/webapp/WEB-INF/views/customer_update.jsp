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
                                <a class="nav-link" href="http://localhost:8080/Adventure#aboutus">Σχετικά με εμάς</a>
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
                            <security:authorize access="hasAuthority('CUSTOMER')">
                                <a class="nav-link"  href="http://localhost:8080/Adventure/customer">Το προφίλ μου</a>
                            </security:authorize>
                            <security:authorize access="hasAuthority('COMPANY')">
                                <a class="nav-link"  href="http://localhost:8080/Adventure/company">Το προφίλ μου</a>
                            </security:authorize>
                            <form:form class="d-flex" action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout" class="form-control me-2">
                            </form:form>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
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
                                    <li><a href="http://localhost:8080/Adventure/customer"> <i class="fa fa-user"></i> Προφίλ</a></li>
                                    <li class="active"><a href="http://localhost:8080/Adventure/customer/update"> <i class="fa fa-edit"></i> Επεξεργασία</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="profile-info col-md-9">
                            <div class="panel">
                                <div class="panel-body bio-graph-info">
                                    <h1>Επεξεργασία</h1>
                                    <form:form id="guestForm" method="post" action="http://localhost:8080/Adventure/customer/update/${loggedInUser.customer.id}" modelAttribute="customerToEdit">
                                        <div class="form-inline my-3 ">
                                            <div class="col-lg-6">
                                                <label for="custfirstname">Όνομα:</label>
                                                <input type="text" class="form-control" value="${loggedInUser.customer.firstname}" name="firstname" id="custfirstname"  placeholder="Όνομα..." required autofocus >
                                            </div>
                                            <div class="col-lg-6 ">
                                                <label for="custlastname">Επίθετο:</label>
                                                <input type="text" class="form-control" value="${loggedInUser.customer.lastname}" name="lastname" id="custlastname"  placeholder="Επίθετο..." required >
                                            </div>
                                        </div>

                                        <div class="form-inline my-3 ">
                                            <div class="col-lg-6">
                                                <label for="custdateOfBirth">Ημερομηνία Γέννησης</label>
                                                <input type="date" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${loggedInUser.customer.dateOfBirth}" />" name="dateOfBirth" id="custdateOfBirth" required >
                                            </div>
                                            <div class="col-lg-6">
                                                <label for="custgender">Φύλο</label>
                                                <select name="genderId" class="gender form-control" id="custgender" required>
                                                    <option value=''>Choose...</option>
                                                    <option hidden selected value="${loggedInUser.customer.genderId.id}">${loggedInUser.customer.genderId.name}</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-inline my-3">
                                            <div class="col-lg-6">
                                                <label for="custaddress">Διεύθυνση:</label>
                                                <input type="text" class="form-control" value="${loggedInUser.customer.address}" name="address" id="custaddress"  placeholder="Διεύθυνση..." required >
                                            </div>
                                            <div class="col-lg-6">
                                                <label for="custpostalCode">Ταχυδρομικός Κώδικας:</label>
                                                <input type="text" class="form-control" value="${loggedInUser.customer.postalCode}" name="postalCode" id="custpostalCode"  placeholder="Ταχυδρομικός Κώδικας..." required >
                                            </div>
                                        </div>

                                        <div class="form-inline my-3 ">
                                            <div class="col-lg-6">
                                                <label for="custcounty">Νομός:</label>
                                                <select  class="county form-control" id="custcountycounty" required>
                                                    <option  value=''>Choose...</option>
                                                    <option hidden selected value="${loggedInUser.customer.cityId.countyId.id}">${loggedInUser.customer.cityId.countyId.name}</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-6 ">
                                                <label for="custcity">Πόλη:</label>
                                                <select name="cityId"  class="city form-control" id="custcity" required>
                                                    <option value=''>Choose...</option>
                                                    <option hidden selected value="${loggedInUser.customer.cityId.id}">${loggedInUser.customer.cityId.name}</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-inline my-3 ">
                                            <div class="col-lg-6">
                                                <label for="custemail">Ε-mail:</label>
                                                <c:if test="${custEmailExist != null}">
                                                    <i class="error">${custEmailExist}</i>
                                                </c:if>
                                                <input type="email" class="form-control" value="${loggedInUser.customer.email}" name="email" id="custemail"  placeholder="Ε-mail..." required >
                                            </div>
                                            <div class="col-lg-6">
                                                <label for="custusername">Username:</label>
                                                <c:if test="${custUsernameExist != null}">
                                                    <i class="error">${custUsernameExist}</i>
                                                </c:if>
                                                <input class="form-control" value="${loggedInUser.customer.credentialsId.username}" name="credentialsId.username" id="custusername"  placeholder="Enter your Username" required >
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="submit" value="Ενημέρωση" class="btn1 mt-3 mb-5">
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <footer class="footer" id="footer">
            <div class="inner_footer">
                <div class="logo_container">

                </div>

                <div class="footer_third">
                    <h1>Χρειάζεστε βοήθεια;</h1>
                    <a href="#">Όροι &amp; Προϋποθέσεις</a>
                    <a href="#">Πολιτική απορρήτου</a>
                    <a href="${pageContext.request.contextPath}/chat">Online Βοήθεια</a>
                </div>
                <div class="footer_third">
                    <h1>Περισσότερα</h1>
                    <a href="#">Φυλλάδια</a>
                    <a href="#">Δωρεά</a>
                    <a href="#">Διακυβέρνηση</a>
                    <a href="#">Αναφορές αντικτύπου</a>
                </div>
                <div class="footer_third">
                    <h1>Ακολουθησέ μας</h1>
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                    <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus-official"></i></a></li>

                    <span>
                        © 2021 Adventure Booking<br>
                        Greece, Athens<br>
                        77 Ermou Street 18537<br>
                        Monday - Saturday 09:00 - 18:00<br>
                        2106000018, 6983333347<br>
                        adventurebookinggroupproject@gmail.com
                    </span>
                </div>
                <div class="map">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12580.106256748013!2d23.718013433025146!3d37.97650937556948!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14a1bd2327d1bb15%3A0xa3501c4310ecdfb8!2zzpXPgc68zr_PjSA3NywgzpHOuM6uzr3OsSAxMDUgNTU!5e0!3m2!1sel!2sgr!4v1609183451261!5m2!1sel!2sgr"
                        width="300" height="300" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false"
                        tabindex="0"></iframe>
                </div>
            </div>
        </footer>
        <script src="http://localhost:8080/Adventure/js/customer_update.js"></script>
    </body>
</html>
