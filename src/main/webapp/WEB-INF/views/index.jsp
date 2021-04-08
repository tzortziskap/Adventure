<%-- 
    Document   : index
    Created on : Mar 11, 2021, 9:19:27 PM
    Author     : tzortziskapellas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="http://localhost:8080/Adventure/css/index.css" rel="stylesheet" type="text/css">
        <link href="http://localhost:8080/Adventure/css/footer.css" rel="stylesheet" type="text/css">
        <title>Adventure Booking</title>
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
                                <a class="nav-link" href="http:/localhost:8080/Adventure#aboutus">Σχετικά με εμάς</a>
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
                <h1 class="font-weight-bold py-3">Adventure Booking</h1>
                <h3>Βασικές Κατηγορίες Δραστηριοτήτων</h3>
                <!--Carousel Wrapper-->
                <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
                    <!--Controls-->
                    <div class="controls-top">
                        <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a>
                        <a class="btn-floating" href="#multi-item-example" data-slide="next"><i
                                class="fas fa-chevron-right"></i></a>
                    </div>
                    <!--/.Controls-->
                    <!--Indicators-->
                    <ol class="carousel-indicators">
                        <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
                        <li data-target="#multi-item-example" data-slide-to="1"></li>
                        <li data-target="#multi-item-example" data-slide-to="2"></li>
                    </ol>
                    <!--/.Indicators-->
                    <!--Slides-->
                    <div class="carousel-inner" role="listbox">
                        <!--First slide-->
                        <div class="carousel-item active">
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/pezoporia.jpeg" alt="Πεζοπορία">
                                    <div class="card-body">
                                        <h4 class="card-title">Πεζοπορία</h4>
                                        <p class="card-text">Η Πεζοπορία απευθύνεται σε όλους του ανθρώπους ανεξαρτήτου ηλικίας 
                                            και ειδικά σε όσους αγαπούν το περπάτημα και την περιπλάνηση στη φύση!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Πεζοπορία" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/toxovolia.jpeg" alt="Τοξοβολία">
                                    <div class="card-body">
                                        <h4 class="card-title">Τοξοβολία</h4>
                                        <p class="card-text">Οι τοξότες αποκτούν πνευματική δύναμη. 
                                            Με την προπόνηση αναπτύσσουν ικανότητες συγκέντρωσης, 
                                            ακρίβειας και υπομονής!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Τοξοβολία" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/ippasia.jpeg" alt="Ιππασία">
                                    <div class="card-body">
                                        <h4 class="card-title">Ιππασία</h4>
                                        <p class="card-text">Η ιππασία λοιπόν, είναι μία δραστηριότητα που δεν κάνει διακρίσεις, απευθύνεται σε μικρούς και μεγάλους!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Ιππασία" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.First slide-->
                        <!--Second slide-->
                        <div class="carousel-item">

                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/mageiriki.jpeg" alt="Μαγειρική">
                                    <div class="card-body">
                                        <h4 class="card-title">Μαγειρική</h4>
                                        <p class="card-text">Μαθήματα Μαγειρικής και Ζαχαροπλαστικής για ερασιτέχνες και επαγγελματίες. Απόλυτα πρακτικά!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Μαγειρική" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/katadisi.jpeg" alt="Κατάδυση">
                                    <div class="card-body">
                                        <h4 class="card-title">Κατάδυση</h4>
                                        <p class="card-text">Ανακάλυψε τον συναρπαστικό κόσμο που βρίσκεται κάτω από την θάλασσα!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Κατάδυση" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/anarixisi.jpeg" alt="Αναρρίχηση">
                                    <div class="card-body">
                                        <h4 class="card-title">Αναρρίχηση</h4>
                                        <p class="card-text">Το σκαρφάλωμα είναι μέσα στο DNA μας οπότε μας ταιριάζει. 
                                            Θυμάσαι που σαν παιδί σκαρφάλωνες στα δέντρα και στις ξερολιθιές!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Αναρρίχηση" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.Second slide-->
                        <!--Third slide-->
                        <div class="carousel-item">

                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/canoe.jpg" alt="Κανό Καγιάκ">
                                    <div class="card-body">
                                        <h4 class="card-title">Κανό Καγιάκ</h4>
                                        <p class="card-text">Μέσα σε ένα κανό καγιάκ, μερικά μόλις εκατοστά πάνω από το νερό, 
                                            βρισκόμαστε στο ιδανικό σημείο για να απολαύσουμε το ποτάμι και την φύση 
                                            και να χαλαρώσουμε εντελώς. </p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Κανό Καγιάκ" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/ski.png" alt="Ski">
                                    <div class="card-body">
                                        <h4 class="card-title">Ski</h4>
                                        <p class="card-text">Ααααχ, φύση, καθαρός αέρας, χιονισμένα τοπία, λευκές βουνοκορφές, πανύψηλα πεύκα, μαγικά χρώματα, η αίσθηση των ζεστών ακτίνων του ήλιου στο πρόσωπο. Μαγεία!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Ski" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/bike.jpeg" alt="Ορεινή ποδηλασία">
                                    <div class="card-body">
                                        <h4 class="card-title">Ορεινή ποδηλασία</h4>
                                        <p class="card-text">Η ορεινή ποδηλασία οδηγεί σε απομακρυσμένες περιοχές, 
                                            όπου μπορεί αυτόματα να βοηθήσει στη χαλάρωση, ιδιαίτερα τα άτομα που ζουν, 
                                            σε μια μεγάλη και θορυβώδη πόλη.</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Ορεινή ποδηλασία" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.Third slide-->
                    </div>
                    <!--/.Slides-->
                    <!--/.Carousel Wrapper-->
                </div>
                <form:form action="/Adventure/event/search" id="form" method="GET">
                    <h2>Search for an Event</h2>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="categories">Κατηγορία</label>
                            <select name="categoryId.id" id="categories" class="form-control categories">
                                <option value=''>Choose...</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="county">Νομός</label>
                            <select  name="locationId.cityId.countyId.id" id="county" class="form-control county">
                                <option value=''>Choose...</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="type">Τύπος</label>
                            <select name="typeIndoorOutdoorId.id" id="type" class="form-control typeIndoorOutdoor searching selectSearching">
                                <option  value=''>Choose...</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="city">Πόλη</label>
                            <select name="locationId.cityId.id" id="city" class="form-control city">
                                <option value=''>Choose...</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary searcheve">Αναζήτηση Δραστηριοτήτων</button>
                </form:form>
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
        <script src="js/indexjs.js"></script>
    </body>
</html>
