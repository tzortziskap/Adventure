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
        <link href="/Adventure/css/customer_index.css" rel="stylesheet" type="text/css">
        <link href="/Adventure/css/footer.css" rel="stylesheet" type="text/css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <div class="container">
            <main>
                <div class="container bootstrap snippets bootdey">
                    <div class="row">
                        <div class="profile-info col-md-9">
                            <div class="panel">
                                <div class="panel-body bio-graph-info">
                                    <h1>Επεξεργασία</h1>
                                    <form:form id="guestForm" method="post" action="/Adventure/company/update/${loggedInUser.company.id}" modelAttribute="customerToEdit">
                                        <div class="form-inline my-3 ">
                                            <div class="col-lg-6">
                                                <label for="compfirstname">Όνομα:</label>
                                                <input type="text" class="form-control" value="${loggedInUser.company.name}" name="name" id="compfirstname"  placeholder="Όνομα..." required autofocus >
                                            </div>
                                            <div class="col-lg-6 ">
                                                <label for="compafm">ΑΦΜ</label>
                                                <input type="text" class="form-control" value="${loggedInUser.company.afm}" name="afm" id="afm"  placeholder="ΑΦΜ..." required >
                                            </div>
                                        </div>
                                        <div class="form-inline my-3 ">
                                            <div class="col-lg-6">
                                                <label for="compemail">Ε-mail:</label>
                                                <i class="error">${compEmailExist}</i>
                                                <input type="email" class="form-control" value="${loggedInUser.company.email}" name="email" id="compemail"  placeholder="Ε-mail..." required >
                                            </div>
                                            <div class="col-lg-6">
                                                <label for="compusername">Username:</label>
                                                <i class="error">${compUsernameExist}</i>
                                                <input class="form-control" value="${loggedInUser.company.credentialsId.username}" name="credentialsId.username" id="compusername"  placeholder="Enter your Username" required >
                                            </div>
                                        </div>
                                        <div class="form-inline my-3">
                                            <div class="col-lg-6">
                                                <label for="compaddress">Διεύθυνση:</label>
                                                <input type="text" class="form-control" value="${loggedInUser.company.address}" name="address" id="compaddress"  placeholder="Διεύθυνση..." required >
                                            </div>
                                            <div class="col-lg-6">
                                                <label for="comppostalCode">Ταχυδρομικός Κώδικας:</label>
                                                <input type="text" class="form-control" value="${loggedInUser.company.postalCode}" name="postalCode" id="comppostalCode"  placeholder="Ταχυδρομικός Κώδικας..." required >
                                            </div>
                                        </div>

                                        <div class="form-inline my-3 ">
                                            <div class="col-lg-6">
                                                <label for="compcounty">Νομός:</label>
                                                <select  class="county form-control" id="compcounty" required>
                                                    <option  value=''>Choose...</option>
                                                    <option hidden selected value="${loggedInUser.company.cityId.countyId.id}">${loggedInUser.company.cityId.countyId.name}</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-6 ">
                                                <label for="compcity">Πόλη:</label>
                                                <select name="cityId" class="city form-control" id="compcity" required>
                                                    <option value=''>Choose...</option>
                                                    <option hidden selected value="${loggedInUser.company.cityId.id}">${loggedInUser.company.cityId.name}</option>
                                                </select>
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
        <%@ include file="footer.jsp" %>
        <script src="/Adventure/js/customer_update.js"></script>
    </body>
</html>
