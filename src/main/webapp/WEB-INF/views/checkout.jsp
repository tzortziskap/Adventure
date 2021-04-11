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
    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <main>
            <div class="container justify-content-center">
                <h4 class="font-weight-bold py-2">Στοιχεία Πληρωμής</h4>
                <form:form action="${pageContext.request.contextPath}/payment/pay" method="POST" id="checkoutForm" >
                    <table class="table">
                        <tr>
                        <input type="hidden" id="id" name="eventId" value="${book.eventId.id}" />
                        </tr>
                        <tr>                                  
                            <td> <label for="name">Όνομα δραστηριότητας:</label> </td>
                            <td> <input type="text" id="name" name="name" value="${event.name}" readonly/></td>
                        </tr>
                        <tr>
                            <td>   <label for="pricePerPerson">Τιμή ανα θέση:</label></td>
                            <td>
                                <input type="text" id="pricePerPerson" name="pricePerPerson"  value="${event.price} EUR" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td>    <label for="count">Αριθμός θέσεων:</label></td>
                            <td>    <input type="text" id="description" name="count"  value="${count}" readonly/></td>
                            </div> 
                        </tr>
                        <tr>
                            <td>   <label for="method">Τρόπος πληρωμής:</label></td>
                            <td>   <input type="text" id="method" name="method" value="PayPal" readonly/></td>
                        </tr>
                        <tr>
                            <td>   <label for="price">Σύνολο:</label></td>
                            <td>   <input class="input-symbol-euro" type="text" id="price" name="price" value="${total} EUR" readonly/></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Επομενο" class="btn btn-primary"></td>
                            <td></td>
                        </tr>
                    </table>
                </form:form>
            </div>
        </main>
        <%@ include file="footer.jsp" %>Ï
    </body>
</html>


