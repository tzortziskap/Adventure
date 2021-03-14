<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <link href="css/register.css" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row main">
                <div class="main-login main-center">
                    <h5>Sign up once and watch any of our free demos.</h5>
                    <form:form class="" method="post" action="${pageContext.request.contextPath}/customer/register" modelAttribute="customer">

                        <div class="form-group">
                            <label for="firstname" class="cols-sm-2 control-label">First Name</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <form:input type="text" class="form-control" path="firstname" id="firstname"  placeholder="Enter your Name..."/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="lastname" class="cols-sm-2 control-label">Last Name</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <form:input type="text" class="form-control" path="lastname" id="lastname"  placeholder="Enter your Name..."/>
                                </div>
                            </div>
                        </div>      
                        <div class="form-group">
                            <label for="dateOfBirth" class="cols-sm-2 control-label">Your Date of Birth</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <form:input type="date" class="form-control" path="dateOfBirth" id="dateOfBirth" />
                                </div>
                            </div>
                        </div>       

                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Your Email</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <form:input type="email" class="form-control" path="email" id="email"  placeholder="Enter your Email..."/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address" class="cols-sm-2 control-label">Your Address</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <form:input type="text" class="form-control" path="address" id="address"  placeholder="Enter your Address..."/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="postalCode" class="cols-sm-2 control-label">Your Postal Code</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <form:input type="text" class="form-control" path="postalCode" id="postalCode"  placeholder="Enter your Postal Code..."/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="cityId.countyId" class="cols-sm-2 control-label">Νομός</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                    <select id="county">
                                        <option selected id="countySpacer" value='SPACER'>Choose...</option>
                                        <c:forEach items="${counties}" var = "county">
                                            <option value="${county.id}">${county.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="cityId" class="cols-sm-2 control-label">Πόλη</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <form:select path="cityId" id="city">
                                        <option selected id="citySpacer" value='SPACER'>Choose...</option>
                                    </form:select>
                                    <form:errors path="cityId"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="credentialsId.username" class="cols-sm-2 control-label">Username</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                        <form:input class="form-control" path="credentialsId.username" id="credentialsId.username"  placeholder="Enter your Username"/>
                                        <form:errors class="form-control" path="credentialsId.username"  />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="credentialsId.password" class="cols-sm-2 control-label">Password</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                        <form:password class="form-control" path="credentialsId.password" id="credentialsId.password"  placeholder="Enter your Password"/>
                                        <form:errors class="form-control" path="credentialsId.password"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group ">
                            <input id="button" type="submit" class="btn btn-primary btn-lg btn-block login-button" value="Register"/>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function() {
                $("#city").prop("disabled",true);
                
                $("#county").change(function(){
                    if ($("#countySpacer").is(":selected")) {
                        $("#city").prop("disabled", true);
                        $("#citySpacer").prop("selected", true);
                    } else {
                        var data = $("#county").children("option:selected").val();
                        var url="http://localhost:8080/Adventure/county/cities/" + data;
                        $.getJSON(url,function(result){
                           $('#city').empty();
                           $('#city').append('<option selected id="citySpacer" value="SPACER">Choose...</option>');
                           $('#city').populate(result);
                        $("#city").prop("disabled", false);  
                        });
                    }
                });
            
                (function($) {
                        // Populates a select drop-down with options in a list 
                        $.fn.populate = function(list) {
                            return this.append(list.map(item => $('<option>', {
                            text  : item.name,
                            value : item.id,
                            name : "cityId"
                        })));
                    };
                })(jQuery);

            });
        </script>
    </body>
</html>
