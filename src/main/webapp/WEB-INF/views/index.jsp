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
        <link href="css/style.css" rel="stylesheet" type="text/css">
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
                                <a class="nav-link" href="#">Δράστηριοτητες</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/event/create">Καταχωρήση</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Πληροφορίες</a>
                            </li>
                        </ul>
                    </div>
                    <div id="loginregister">
                        <c:if test="${loggedInUser == null}">
                            <a class="nav-link"  href="#">Σύνδεση</a>
                            <a class="nav-link" href="#">Εγγραφή</a>
                        </c:if>
                        <c:if test="${loggedInUser != null}">
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
                <form id="form">
                    <h2>Search for an Event</h2>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Starting date</label>
                            <input type="date" class="form-control" id="inputEmail4" placeholder="Email">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="categories">Κατηγορία</label>
                            <select id="categories" class="form-control categories">
                                <option value=''>Choose...</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="county">Νομός</label>
                            <select  id="county" class="form-control county">
                                <option value=''>Choose...</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="city">Πόλη</label>
                            <select id="city" class="form-control city">
                                <option value=''>Choose...</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary searcheve">Search for evants</button>
                </form>
                <h3>Our main events by Category</h3>
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
                                        <a class="btn btn-primary">Μάθε περισσότερα</a>
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
                                        <a class="btn btn-primary">Μάθε περισσότερα</a>
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
                                        <a class="btn btn-primary">Μάθε περισσότερα</a>
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
                                        <a class="btn btn-primary">Μάθε περισσότερα</a>
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
                                        <a class="btn btn-primary">Μάθε περισσότερα</a>
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
                                        <a class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.Second slide-->
                    </div>
                    <!--/.Slides-->
                    <!--/.Carousel Wrapper-->
            </main>
        </div>
        <script src="js/indexjs.js"></script>
    </body>
</html>
