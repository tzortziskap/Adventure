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
        <link rel="stylesheet" href="http://localhost:8080/Adventure/css/payment.css">
        <link href="http://localhost:8080/Adventure/css/footer.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <main>
            <div class="container justify-content-center">
                <h4>Η συναλλαγή μέσω Paypal ολοκληρώθηκε επιτυχώς!</h4>
                <table class="table">
                    <tr>
                        <td><b>Εταιρεία</b></td>
                        <td>${book.eventId.companyId.name}</td>
                    </tr>
                    <tr>
                        <td><b>Πληρωτής</b></td>
                        <td>${payer.firstName} ${payer.lastName}</td>      
                    </tr>
                    <tr>
                        <td><b>Περιγραφή υπηρεσίας</b></td>
                        <td>${book.eventId.name}</td>
                    </tr>
                    <tr>
                        <td><b>Τιμή ανα θέση</b></td>
                        <td>${book.eventId.price} EUR</td>
                    </tr>
                    <tr>
                        <td><b>Αριθμός θέσεων</b></td>
                        <td>${book.amountPositions} </td>
                    </tr>
                    <tr>
                        <td><b>Σύνολο</b></td>
                        <td>${transaction.amount.total} ${transaction.amount.currency}</td>
                    </tr>    
                </table>
                <br/>
                <h6>Σας ευχαριστούμε για την προτίμησή σας.</h6>
            </div>
        </main>
        <%@ include file="footer.jsp" %>
    </body>
</html>


