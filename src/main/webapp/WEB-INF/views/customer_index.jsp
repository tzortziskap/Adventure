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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
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
                                    <li><a href="#"> <i class="fa fa-edit"></i> Επεξεργασία</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="profile-info col-md-9">
                            <div class="panel">
                                <div class="panel-body bio-graph-info">
                                    <h1>Πληροφορίες</h1>
                                    <div class="row">
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
                                            <p><span>Ηλικία</span>: ${loggedInUser.customer.dateOfBirth}</p>
                                        </div>
                                        <div class="bio-row">
                                            <p><span>Πόλη </span>: ${loggedInUser.customer.cityId.name}</p>
                                        </div>
                                        <div class="bio-row">
                                            <p><span>Νομός </span>: ${loggedInUser.customer.cityId.countyId.name}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="customerid">${loggedInUser.customer.id}</div>
                <h3 id="number">Οι δραστηριοτήτες μου</h3>
                <div class="form-check form-check-inline">
                    <input id="guestRadio" class="form-check-input" type="radio" name="type" 
                           value="tablerd" checked>
                    <label class="form-check-label" for="inlineRadio1">Εμφανίση σε πίνακα</label>
                </div>
                <div class="form-check form-check-inline">
                    <input id="guestRadio" class="form-check-input" type="radio" name="type" value="all">
                    <label class="form-check-label" for="inlineRadio2">Εμφανίση στον χάρτη</label>
                </div>
                <div id="table">
                    <table id="eventstable" class="table" width="100%">

                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">x</th>
                                <th scope="col">y</th>
                                <th scope="col">Name</th>

                                <th scope="col">Starting Date</th>
                                <th scope="col">Ending Date</th>
                                <th scope="col">Price</th>
                                <th scope="col">level</th>
                                <th scope="col">Τυπος</th>

                                <th scope="col">Category</th>
                                <th scope="col">Equip</th>
                                <th scope="col">Περισσότερες Πληροφορίες</th>




                            </tr>
                        </thead>
                        <tbody>


                        </tbody>

                    </table>

                </div>
                <div class="col-sm" id="map">
                </div>
                <h3>Οι κρατήσεις μου</h3>
                <div>
                    <table id="bookings" class="table" width="100%">
                        <thead>
                            <tr>
                                <th scope="col">Ονόμα δραστηριότητας</th>
                                <th scope="col">Πόσο που πληρώθηκε</th>

                            </tr>
                        </thead>
                        <tbody>

                        </tbody>

                    </table>
                </div>




                <h3>Δραστηριότητες που θα μπορουσάτε να συμμετασχέτε......</h3>
                <div id="table1">
                    <table id="eventstobook" class="table">

                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">x</th>
                                <th scope="col">y</th>
                                <th scope="col">Name</th>

                                <th scope="col">Starting Date</th>
                                <th scope="col">Ending Date</th>
                                <th scope="col">Price</th>
                                <th scope="col">level</th>
                                <th scope="col">Τυπος</th>

                                <th scope="col">Category</th>
                                <th scope="col">Equip</th>
                                <th scope="col">Περισσότερες Πληροφορίες</th>
                                <th scope="col">Κράτηση</th>




                            </tr>
                        </thead>
                        <tbody>


                        </tbody>

                    </table>

                </div>
                <div id="mapbook">
                    <h3>Χάρτης με δραστηριότητες που θα μπορουσάτε να συμμετασχέτε......</h3>
                    <div class="col-sm" id="map1">


                    </div>
                </div>
                <br/>
                <br/>

                <button id="button3" class="btn btn-primary" >Κλείσιμο/Εμφάνιση Χάρτη</button>
                <br/>
                <br/>


                <div>

                    <h3>Αλλαγή στοιχείών λογαριασμού</h3>
                    <br/>
                    <br/>
                    <a href="${pageContext.request.contextPath}/update/${loginedUser.id}" class="btn btn-primary"  >Αλλαγή username/password</a>
                    <a href="${pageContext.request.contextPath}/delete/customer/${loginedUser.customer.id}"   class="btn btn-primary" >Διαγραφή λογαριασμού<a/>
                        <a href="${pageContext.request.contextPath}/disable/customer/${loginedUser.customer.id}"   class="btn btn-primary" >Απενεργοποιήση λογαριασμού<a/>

                            </div>

                            </main>
                            </div>
                            <script src="http://localhost:8080/Adventure/js/customer_index.js"></script>
                            </body>
                            </html>
