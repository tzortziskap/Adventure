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
                                    <label for="firstname">Όνομα:</label>
                                    <form:input type="text" class="form-control" path="firstname" id="firstname"  placeholder="Όνομα..."/>
                                </div>
                                <div class="col-lg-6 ">
                                    <label for="lastname">Επίθετο:</label>
                                    <form:input type="text" class="form-control" path="lastname" id="lastname"  placeholder="Επίθετο..."/>
                                </div>
                            </div>

                            <div class="form-inline my-3">
                                <div class="col-lg-6">
                                    <label for="dateOfBirth">Ημερομηνία Γέννησης</label>
                                    <form:input type="date" class="form-control" path="dateOfBirth" id="dateOfBirth" />
                                </div>
                                <div class="col-lg-6">
                                    <label for="address">Διεύθυνση:</label>
                                    <form:input type="text" class="form-control" path="address" id="address"  placeholder="Διεύθυνση..."/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="address">Ταχυδρομικός Κώδικας:</label>
                                    <form:input type="text" class="form-control" path="postalCode" id="postalCode"  placeholder="Ταχυδρομικός Κώδικας..."/>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="county">Νομός:</label>
                                    <select id="county" class="county">
                                        <option selected id="countySpacer" value='SPACER'>Choose...</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 ">
                                    <label for="city">Πόλη:</label>
                                    <form:select path="cityId" id="city" class="city">
                                        <option selected id="citySpacer" value='SPACER'>Choose...</option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="email">Ε-mail:</label>
                                    <form:input type="email" class="form-control" path="email" id="email"  placeholder="Ε-mail..."/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="username">Username:</label>
                                    <form:input class="form-control" path="credentialsId.username" id="username"  placeholder="Enter your Username"/>
                                    <form:errors class="form-control" path="credentialsId.username"  />
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="password">Συνθηματικό:</label>
                                    <form:password class="form-control" path="credentialsId.password" id="password"  placeholder="Συνθηματικό..."/>
                                    <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="password"> Eπιβεβαίωση Συνθηματικό:</label>
                                    <form:password class="form-control" path="credentialsId.password" id="password"  placeholder="Συνθηματικό..."/>
                                    <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                            </div>
                            <br>
                            <div class="col-lg-2">
                                <button type="button" class="btn1 mt-3 mb-5">Εγγραφή</button>
                            </div>

                        </form:form>
                            
                        <form:form id="userForm" method="post" action="${pageContext.request.contextPath}/company/register" modelAttribute="company">
                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label name="name">Όνομα Εταιρίας:</label>
                                    <form:input type="text" path="name" id="name" class=" form-control " placeholder="Όνομα Εταιρίας..." />
                                </div>
                                <div class=" col-lg-6 ">
                                    <label for="afm">ΑΦΜ:</label>
                                    <form:input type="text" class="form-control" path="afm" id="afm"  placeholder="ΑΦΜ..."/>
                                </div>
                            </div>

                             <div class="form-inline my-3">
                                <div class="col-lg-6">
                                    <label for="address">Διεύθυνση:</label>
                                    <form:input type="text" class="form-control" path="address" id="address"  placeholder="Διεύθυνση..."/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="address">Ταχυδρομικός Κώδικας:</label>
                                    <form:input type="text" class="form-control" path="afm" id="afm"  placeholder="Ταχυδρομικός Κώδικας..."/>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="county">Νομός:</label>
                                    <select id="county" class="county">
                                        <option selected id="countySpacer" value='SPACER'>Choose...</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 ">
                                    <label for="city">Πόλη:</label>
                                    <form:select path="cityId" id="city" class="city">
                                        <option selected id="citySpacer" value='SPACER'>Choose...</option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="email">Ε-mail:</label>
                                    <form:input type="email" class="form-control" path="email" id="email"  placeholder="Ε-mail..."/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="username">Username:</label>
                                    <form:input class="form-control" path="credentialsId.username" id="username"  placeholder="Enter your Username"/>
                                    <form:errors class="form-control" path="credentialsId.username"  />
                                </div>
                            </div>

                            <div class="form-inline my-3 ">
                                <div class="col-lg-6">
                                    <label for="password">Συνθηματικό:</label>
                                    <form:password class="form-control" path="credentialsId.password" id="password"  placeholder="Συνθηματικό..."/>
                                    <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                                <div class="col-lg-6">
                                    <label for="password"> Eπιβεβαίωση Συνθηματικό:</label>
                                    <form:password class="form-control" path="credentialsId.password" id="password"  placeholder="Συνθηματικό..."/>
                                    <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                            </div>
                            <br>
                            <div class="col-lg-2">
                                <button type="button" class="btn1 mt-3 mb-5">Εγγραφή</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </section>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function() {
                 $("#userForm").hide();

            $(".form-check-input").click(function () {
                var isChecked = $("#userRadio").is(':checked');
                if (isChecked === true) {
                    $("#guestForm").hide();
                    $("#userForm").show();
                } else {
                    $("#userForm").hide();
                    $("#guestForm").show();
                }
            });
                    
                var urlCounties="http://localhost:8080/Adventure/county";
                $("#city").prop("disabled",true);
                    
                $.getJSON(urlCounties,function(result){
                    $("#county").county(result);
                });
                    
                
                $("#county").change(function(){
                    if ($("#countySpacer").is(":selected")) {
                        $("#city").prop("disabled", true);
                        $("#citySpacer").prop("selected", true);
                    } else {
                        var data = $("#county").children("option:selected").val();
                        var urlCities="http://localhost:8080/Adventure/county/cities/" + data;
                        $.getJSON(urlCities,function(result){
                           $('#city').empty();
                           $('#city').append('<option selected id="citySpacer" value="SPACER">Choose...</option>');
                           $('#city').citiesByCounty(result);
                        $("#city").prop("disabled", false);  
                        });
                    }
                });
            
                (function($) {
                        // Populates a select drop-down with options in a list 
                        $.fn.citiesByCounty = function(list) {
                            return this.append(list.map(item => $('<option>', {
                            text  : item.name,
                            value : item.id,
                            name : "cityId"
                        })));
                    };
                })(jQuery);
                    
                (function($) {
                        // Populates a select drop-down with options in a list 
                        $.fn.county = function(list) {
                            return this.append(list.map(item => $('<option>', {
                            text  : item.name,
                            value : item.id,
                            name : "county"
                        })));
                    };
                })(jQuery);


            });
        </script>
    </body>
</html>
