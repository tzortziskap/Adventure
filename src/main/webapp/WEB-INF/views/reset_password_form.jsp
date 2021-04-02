<%-- 
    Document   : loginPage
    Created on : 19 Μαρ 2021, 6:19:39 μμ
    Author     : tzortziskapellas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>        <title>Reset Password</title>
        <link rel="stylesheet" href="css/login.css">
    </head>

    <body>
       
        <section class="Form my-4 mx-5">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-centered">
                        <h1 class="font-weight-bold py-3">Adventure Booking</h1>
                        <h4>Επανεκκίνηση κωδικού:</h4>
                        <c:if test="${message != null}">
                            <p>${message}</p>
                        </c:if>   
                        <form:form action="${pageContext.request.contextPath}/reset_password" method="post">
                            <input type="hidden" name="token" value="${token}">
                            <div class="form-row">
                                <div class="col-lg-12 col-centered">
                                    <input id="pass_log_id" type="password" name="password"  placeholder="Συνθηματικό..." class="form-control my-3 p-4 password" required autofocus>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-12 col-centered">
                                    <input id="confpass_log_id" type="password" name="confirmPassword"  placeholder="Επιβεβαίωση συνθηματικού..." class="form-control my-3 p-4 password" required autofocus>
                                    <div id="mati" toggle=" #password-field" class="fa fa-fw  fa-eye field_icon toggle-password fa-lg"></div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-12 col-centered">
                                    <input type="submit" value="Αλλαγή κωδικού" class="btn1 mt-3 mb-5">
                                </div>
                            </div>
                        </form:form>
                        <div id="formFooter">
                            <p>Δεν έχεις λογαριασμό;
                                <a class="underlineHover" href="register">Κάνε εγγραφή τώρα</a>
                        </div>
                        </p>

                    </div>
                </div>
            </div>
        </section>
        <script src="js/reset_passwordjs.js"></script>
    </body>
</html>
