<%-- 
    Document   : loginPage
    Created on : 19 Μαρ 2021, 6:19:39 μμ
    Author     : tzortziskapellas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="http://localhost:8080/Adventure/css/login.css">
        <link href="http://localhost:8080/Adventure/css/footer.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container-fluid">   
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
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
            </nav>
        </div>
        <section class="Form my-4 mx-5">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-centered">
                        <h1 class="font-weight-bold py-3">Adventure Booking</h1>

                        <h4>Σύνδεση για:</h4>

                        <c:if test="${param.logout != null}">
                            <p class="success">You successfully logged out!!!</p>
                        </c:if>
                        <c:if test="${param.error != null}">
                            <p class="error">Invalid username and/or password</p>
                        </c:if>   
                        <c:if test="${message != null}">
                            <p class="success">${message}</p>
                        </c:if>
                        <c:if test="${successMessage != null}">
                            <p class="success">${successMessage}</p>
                        </c:if>
                        <form:form action="${pageContext.request.contextPath}/authenticate" method="post">
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <input type="text" placeholder="Username..." name="username"  class="form-control my-3 p-4" required autofocus>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <input id="pass_log_id" type="password" name="password"  placeholder="Συνθηματικό..." class="form-control my-3 p-4" required>
                                    <div id="mati" toggle=" #password-field" class="fa fa-fw  fa-eye field_icon toggle-password fa-lg"></div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-9 col-centered">
                                    <input type="submit" value="Είσοδος" class="btn1 mt-3 mb-5">
                                </div>
                            </div>
                        </form:form>
                        <div id="forgotPassword">
                            <a href="forgotpassword">Ξέχασες το συνθηματικό;</a>
                        </div>
                        <div id="formFooter">
                            <p>Δεν έχεις λογαριασμό;
                                <a class="underlineHover" href="register">Κάνε εγγραφή τώρα</a>
                        </div>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer" id="footer">
            <div class="inner_footer">
                <div class="logo_container">

                </div>

                <div class="footer_third">
                    <h1>Χρειάζεστε βοήθεια;</h1>
                    <a href="#">Όροι &amp; Προϋποθέσεις</a>
                    <a href="#">Πολιτική απορρήτου</a>
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
        <script src="js/loginJs.js"></script>
    </body>
</html>
