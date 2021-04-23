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
        <%@ include file="nav.jsp" %>
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
       <%@ include file="footer.jsp" %>
        <script src="js/loginJs.js"></script>
    </body>
</html>
