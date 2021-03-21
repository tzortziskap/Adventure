<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <title>Registration</title>
        <link rel="stylesheet" href="css/register.css">
    </head>
    <body>
        <section class="Form my-4 mx-5">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-lg-12 px-5 pt-5">
                        <!-- <h1 class="font-weight-bold py-3">Logo</h1> -->
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

                        <form:form id="guestForm" method="post" action="${pageContext.request.contextPath}/customer/register" modelAttribute="customer">

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="custfirstname">Όνομα:</label>
                                    <form:input type="text" class="form-control" path="firstname" id="custfirstname"  placeholder="Όνομα..."/>
                                </div>
                                <div class="col-lg-6 ">
                                    <label for="custlastname">Επίθετο:</label>
                                    <form:input type="text" class="form-control" path="lastname" id="custlastname"  placeholder="Επίθετο..."/>
                                </div>
                            </div>

                            <div class="form-inline my-3">
                                <div class="col-lg-6">
                                    <label for="custdateOfBirth">Ημερομηνία Γέννησης</label>
                                    <form:input type="date" class="form-control" path="dateOfBirth" id="custdateOfBirth" />
                                </div>
                                <div class="col-lg-6">
                                    <label for="custaddress">Διεύθυνση:</label>
                                    <form:input type="text" class="form-control" path="address" id="custaddress"  placeholder="Διεύθυνση..."/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="custpostalCode">Ταχυδρομικός Κώδικας:</label>
                                    <form:input type="text" class="form-control" path="postalCode" id="custpostalCode"  placeholder="Ταχυδρομικός Κώδικας..."/>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="custcounty">Νομός:</label>
                                    <select  class="county form-control" id="custcountycounty">
                                        <option selected id="countySpacer" value='SPACER'>Choose...</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 ">
                                    <label for="custcity">Πόλη:</label>
                                    <form:select path="cityId"  class="city form-control" id="custcity">
                                        <option selected id="citySpacer" value='SPACER'>Choose...</option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="custemail">Ε-mail:</label>
                                    <form:input type="email" class="form-control" path="email" id="custemail"  placeholder="Ε-mail..."/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="custusername">Username:</label>
                                    <form:input class="form-control" path="credentialsId.username" id="custusername"  placeholder="Enter your Username"/>
                                    <form:errors class="form-control" path="credentialsId.username"  />
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="custpassword">Συνθηματικό:</label>
                                    <form:password class="form-control" path="credentialsId.password" id="custpassword"  placeholder="Συνθηματικό..."/>
                                    <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="custpassword2"> Eπιβεβαίωση Συνθηματικό:</label>
                                    <form:password class="form-control" path="credentialsId.password" id="custpassword2"  placeholder="Συνθηματικό..."/>
                                    <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                            </div>
                            <br>
                            <div class="col-lg-2">
                                <input type="submit" value="Εγγραφή" class="btn1 mt-3 mb-5">
                            </div>

                        </form:form>

                        <form:form id="userForm" method="post" action="${pageContext.request.contextPath}/company/register" modelAttribute="company">
                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label name="compname">Όνομα Εταιρίας:</label>
                                    <form:input type="text" path="name" id="compname" class=" form-control " placeholder="Όνομα Εταιρίας..." />
                                </div>
                                <div class=" col-lg-6 ">
                                    <label for="compafm">ΑΦΜ:</label>
                                    <form:input type="text" class="form-control" path="afm" id="compafm"  placeholder="ΑΦΜ..."/>
                                </div>
                            </div>

                            <div class="form-inline my-3">
                                <div class="col-lg-6">
                                    <label for="compaddress">Διεύθυνση:</label>
                                    <form:input type="text" class="form-control" path="address" id="compaddress"  placeholder="Διεύθυνση..."/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="comppostalCode">Ταχυδρομικός Κώδικας:</label>
                                    <form:input type="text" class="form-control" path="postalCode" id="comppostalCode"  placeholder="Ταχυδρομικός Κώδικας..."/>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="compcounty">Νομός:</label>
                                    <select  class="county form-control" id="compcounty">
                                        <option selected id="countySpacer" value='SPACER'>Choose...</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 ">
                                    <label for="compcity">Πόλη:</label>
                                    <form:select path="cityId" class="city form-control" id="compcity">
                                        <option selected id="citySpacer" value='SPACER'>Choose...</option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="compemail">Ε-mail:</label>
                                    <form:input type="email" class="form-control" path="email" id="compemail"  placeholder="Ε-mail..."/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="compusername">Username:</label>
                                    <form:input class="form-control" path="credentialsId.username" id="compusername"  placeholder="Enter your Username"/>
                                    <form:errors class="form-control" path="credentialsId.username"  />
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="comppassword">Συνθηματικό:</label>
                                    <form:password class="form-control" path="credentialsId.password" id="comppassword"  placeholder="Συνθηματικό..."/>
                                    <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="comppassword2"> Eπιβεβαίωση Συνθηματικό:</label>
                                    <form:password class="form-control" path="credentialsId.password" id="comppassword2"  placeholder="Συνθηματικό..."/>
                                    <form:errors class="form-control" path="credentialsId.password"/>
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

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
       
        <script src="js/registerjs.js"></script>
    </body>
</html>
