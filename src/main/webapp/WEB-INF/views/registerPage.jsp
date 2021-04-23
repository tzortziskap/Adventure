<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
        <title>Εγγραφή</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="http://localhost:8080/Adventure/css/register.css">
        <link href="http://localhost:8080/Adventure/css/footer.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <section class="Form my-4 mx-5">

            <div class="container">

                <div class="row no-gutters">
                    <div class="col-lg-12 px-5 pt-5">
                        <h1 class="font-weight-bold py-3">Adventure Booking</h1>
                        <h4>Εγγραφή χρήστη</h4>

                        <div class="form-check form-check-inline">
                            <input id="guestRadio" class="form-check-input" type="radio" name="type" id="inlineRadio1"
                                   value="guest" checked>
                            <label class="form-check-label" for="inlineRadio1">Πελάτης</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input id="userRadio" class="form-check-input" type="radio" name="type" id="inlineRadio2"
                                   value="user">
                            <label class="form-check-label" for="inlineRadio2">Διοργανωτής</label>
                        </div>

                        <form:form id="guestForm" method="post" action="${pageContext.request.contextPath}/customer/register" modelAttribute="customerToEdit">

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="custfirstname">Όνομα:</label>
                                    <input type="text" class="form-control" name="firstname" id="custfirstname"  placeholder="Όνομα..." required autofocus >
                                </div>
                                <div class="col-lg-6 ">
                                    <label for="custlastname">Επίθετο:</label>
                                    <input type="text" class="form-control" name="lastname" id="custlastname"  placeholder="Επίθετο..." required >
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="custdateOfBirth">Ημερομηνία Γέννησης</label>
                                    <input type="date" class="form-control" name="dateOfBirth" id="custdateOfBirth" required >
                                </div>
                                <div class="col-lg-6">
                                    <label for="custgender">Φύλο</label>
                                    <select name="genderId" class="gender form-control" id="custgender" required>
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-inline my-3">
                                <div class="col-lg-6">
                                    <label for="custaddress">Διεύθυνση:</label>
                                    <input type="text" class="form-control" name="address" id="custaddress"  placeholder="Διεύθυνση..." required >
                                </div>
                                <div class="col-lg-6">
                                    <label for="custpostalCode">Ταχυδρομικός Κώδικας:</label>
                                    <input type="text" class="form-control" name="postalCode" id="custpostalCode"  placeholder="Ταχυδρομικός Κώδικας..." required >
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="custcounty">Νομός:</label>
                                    <select  class="county form-control" id="custcountycounty" required>
                                        <option  value=''>Choose...</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 ">
                                    <label for="custcity">Πόλη:</label>
                                    <select name="cityId"  class="city form-control" id="custcity" required>
                                        <option value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="custemail">Ε-mail:</label>
                                    <c:if test="${custEmailExist != null}">
                                        <i class="error">${custEmailExist}</i>
                                    </c:if>
                                    <input type="email" class="form-control" name="email" id="custemail"  placeholder="Ε-mail..." required >
                                </div>
                                <div class="col-lg-6">
                                    <label for="custusername">Username:</label>
                                    <c:if test="${custUsernameExist != null}">
                                        <i class="error">${custUsernameExist}</i>
                                    </c:if>
                                    <input class="form-control" name="credentialsId.username" id="custusername"  placeholder="Enter your Username" required >
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="custpassword">Συνθηματικό:</label>
                                    <input type="password" class="form-control password" name="credentialsId.password" id="custpassword"  placeholder="Συνθηματικό..." required >
                                    <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="custconfpassword"> Eπιβεβαίωση Συνθηματικό:</label>
                                    <input type="password" class="form-control password" id="custconfpassword"  placeholder="Συνθηματικό..."  required >
                                </div>
                            </div>
                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <input type="checkbox" class="mati" > Δες τον κωδικό
                                </div>
                            </div>
                            <br>
                            <div class="col-lg-6">
                                <input type="submit" value="Εγγραφή" class="btn1 mt-3 mb-5">
                            </div>

                        </form:form>

                        <form:form id="userForm" method="post" action="${pageContext.request.contextPath}/company/register" modelAttribute="company">
                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label name="compname">Όνομα Εταιρίας:</label>
                                    <input type="text" name="name" id="compname" class=" form-control " placeholder="Όνομα Εταιρίας..." required autofocus>
                                </div>
                                <div class=" col-lg-6 ">
                                    <label for="compafm">ΑΦΜ:</label>
                                    <input type="text" class="form-control" name="afm" id="compafm"  placeholder="ΑΦΜ..." required>
                                </div>
                            </div>

                            <div class="form-inline my-3">
                                <div class="col-lg-6">
                                    <label for="compaddress">Διεύθυνση:</label>
                                    <input type="text" class="form-control" name="address" id="compaddress"  placeholder="Διεύθυνση..." required >
                                </div>
                                <div class="col-lg-6">
                                    <label for="comppostalCode">Ταχυδρομικός Κώδικας:</label>
                                    <input type="text" class="form-control" name="postalCode" id="comppostalCode"  placeholder="Ταχυδρομικός Κώδικας..." required >
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="compcounty">Νομός:</label>
                                    <select  class="county form-control" id="compcounty" required>
                                        <option value=''>Choose...</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 ">
                                    <label for="compcity">Πόλη:</label>
                                    <select name="cityId" class="city form-control" id="compcity" required>
                                        <option value=''>Choose...</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="compemail">Ε-mail:</label>
                                    <c:if test="${compEmailExist != null}">
                                        <i class="error">${compEmailExist}</i>
                                    </c:if>
                                    <input type="email" class="form-control" name="email" id="compemail"  placeholder="Ε-mail..." required >

                                </div>
                                <div class="col-lg-6">
                                    <label for="compusername">Username:</label>
                                    <c:if test="${compUsernameExist != null}">
                                        <i class="error">${compUsernameExist}</i>
                                    </c:if>
                                    <input class="form-control" name="credentialsId.username" id="compusername"  placeholder="Enter your Username" required >

                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="comppassword">Συνθηματικό:</label>
                                    <input type="password" class="form-control password" name="credentialsId.password" id="comppassword"  placeholder="Συνθηματικό..." required >
                                    <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="compconfpassword"> Eπιβεβαίωση Συνθηματικό:</label>
                                    <input type="password" class="form-control password" id="compconfpassword"  placeholder="Συνθηματικό..." required >
                                </div>
                            </div>
                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <input type="checkbox" class="mati" > Δες τον κωδικό
                                </div>
                            </div>
                            <br>
                            <div class="col-lg-2">
                                <input type="submit" value="Εγγραφή" class="btn1 mt-3 mb-5">
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </section>
       <%@ include file="footer.jsp" %>
        <script src="js/registerjs.js"></script>
    </body>
</html>
