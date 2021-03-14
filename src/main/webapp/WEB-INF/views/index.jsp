<%-- 
    Document   : index
    Created on : Mar 11, 2021, 9:19:27 PM
    Author     : tzortziskapellas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<!-- saved from url=(0052)https://getbootstrap.com/docs/5.0/examples/carousel/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/carousel/">



        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css">



    </head>
    <body>
        <div class="container-fluid">   



            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <div class="container-fluid">

                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <ul class="navbar-nav me-auto mb-2 mb-md-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Αναζήτηση</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Καταχωρήση</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Διοργανωτές/Επισκέπτες
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Εγγραφή</a>

                                    <a class="dropdown-item" href="#">Σύνδεση</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Πληροφορίες</a>
                            </li>
                        </ul>

                        <div id="loginregister">
                            <a class="nav-link active"  href="#">Σύνδεση</a>
                            <a class="nav-link active" href="#">Εγγραφή</a>        
                        </div>

                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Αναζήτηση</button>
                        </form>
                    </div>
                </div>
            </nav>
            <br/>
            <br/>
            <br/>
        </div>
        <br/>
        <div class="container">
            <main>

                <form>
                    <br/>
                    <br/>
                    <h2>Search for an Event</h2>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Starting date</label>
                            <input type="date" class="form-control" id="inputEmail4" placeholder="Email">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">Ending Date</label>
                            <input type="date" class="form-control" id="inputPassword4" placeholder="Password">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="inputState">Type of activity</label>
                            <select id="inputState" class="form-control">
                                <option selected value='SPACER'>Choose...</option>
                                 <c:forEach items="${indoorOutdoors}" var = "indoorOutdoor">
                                     <option value="${indoorOutdoor.id}">${indoorOutdoor.typeIndoorOutdoor}</option>
                                 </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputState">Νομός</label>
                            <select  id="county" class="form-control">
                                <option selected id="countySpacer" value='SPACER'>Choose...</option>
                                 <c:forEach items="${counties}" var = "county">
                                     <option value="${county.id}">${county.name}</option>
                                 </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div id="cityDiv" class="form-group col-md-6">
                            <label for="inputState">Πόλη</label>
                            <select id="city" class="form-control">
                                <option id="citySpacer" selected value='SPACER'>Choose...</option>
                                 
                            </select>
                        </div>
                    </div>
                    <br/>
                    <button type="submit" class="btn btn-primary">Search for evants</button>
                </form>


                <br/>
                <br/>
                <br/>
                <br/>

                <h2>Our main events by Category</h2>
                <br/>
                <br/>

                <div class="row mx-auto my-auto">
                    <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
                        <div class="carousel-inner w-100" role="listbox">


                            <div class="carousel-item active" >
                                <div class="col-md-4">

                                    <div class="card">
                                        <img
                                            src="https://mdbootstrap.com/img/new/standard/nature/182.jpg"
                                            class="img-fluid"
                                            alt="..."
                                            />
                                        <div class="card-body">
                                            <h5 class="card-title">Hking</h5>
                                            <p class="card-text"> Συνολικός αριθμός δραστηριοτήτων: 
                                            </p>
                                            <a href="#!" class="btn btn-primary">View</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="col-md-4">


                                    <img src="https://mdbootstrap.com/img/new/standard/nature/181.jpg" class="card-img-top" alt="..." />

                                    <div class="card-body">
                                        <h5 class="card-title">rafting</h5>
                                        <p class="card-text"> Συνολικός αριθμός δραστηριοτήτων: 
                                        </p>
                                        <a href="#!" class="btn btn-primary">View</a>

                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div class="col-md-4">

                                    <div class="card">
                                        <img
                                            src="https://mdbootstrap.com/img/new/standard/nature/182.jpg"
                                            class="img-fluid"
                                            alt="..."
                                            />
                                        <div class="card-body">
                                            <h5 class="card-title">Other</h5>
                                            <p class="card-text"> Συνολικός αριθμός δραστηριοτήτων: 
                                            </p>
                                            <a href="#!" class="btn btn-primary">View</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev w-auto" href="#recipeCarousel" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span>
                                <span class="sr-only"></span>
                            </a>
                            <a class="carousel-control-next w-auto" href="#recipeCarousel" role="button" data-slide="next">
                                <span class="carousel-control-next-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span>
                                <span class="sr-only"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <br/>
                <br/>
                <br/>





                <div>
                    <h3>Activities starting today</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name of the activity</th>
                                <th scope="col">Starting date</th>
                                <th scope="col">Ending date</th>
                                <th scope="col">Book it!!</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Activity1</td>
                                <td>2020-01-02</td>
                                <td>2020-02-02</td>
                                <td><a href="">Book it</a></td>
                            </tr>

                        </tbody>
                    </table>

                    <br/>
                    <br/>
                    <br/>	  


                </div>
                <div>
                    <h3>Our suggusted activities</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name of the activity</th>
                                <th scope="col">Starting date</th>
                                <th scope="col">Ending date</th>
                                <th scope="col">Rating</th>
                                <th scope="col">Book it!!</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Activity1</td>
                                <td>2020-01-02</td>
                                <td>2020-02-02</td>
                                <td>4.5</td>
                                <td><a href="">Book it</a></td>
                            </tr>

                        </tbody>
                    </table>
                </div>




            </main>
        </div>


        <br/>
        <br/>
        <br/>

        <footer class="container-fluid bg-dark"> 

            <p>© 2017–2021 Company, Inc. · <a href="#">Privacy</a> · <a href="https://getbootstrap.com/docs/5.0/examples/carousel/#">Terms</a>
                <br/>
                <a href="#">Back to top</a>
            </p>


        </footer>

        <script>
$('#recipeCarousel').carousel({
  interval: 0
})

$('.carousel .carousel-item').each(function(){
    var minPerSlide = 3;
    var next = $(this).next();
    if (!next.length) {
    next = $(this).siblings(':first');
    }
    next.children(':first-child').clone().appendTo($(this));
    
    for (var i=0;i<minPerSlide;i++) {
        next=next.next();
        if (!next.length) {
                next = $(this).siblings(':first');
        }
        
        next.children(':first-child').clone().appendTo($(this));
      }
});
        </script>
<script>
            $(document).ready(function() {
                $("#cityDiv").prop("hidden",true);
                
                $("#county").change(function(){
                    if ($("#countySpacer").is(":selected")) {
                        $("#cityDiv").prop("hidden", true);
                        $("#citySpacer").prop("hidden", true);
                    } else {
                        var data = $("#county").children("option:selected").val();
                        var url="http://localhost:8080/Adventure/county/cities/" + data;
                        $.getJSON(url,function(result){
                           $('#city').empty();
                           $('#city').append('<option selected id="citySpacer" value="SPACER">Choose...</option>');
                           $('#city').populate(result);
                        $("#cityDiv").prop("hidden", false);  
                        });
                    }
                });
            
                (function($) {
                        // Populates a select drop-down with options in a list 
                        $.fn.populate = function(list) {
                            return this.append(list.map(item => $('<option>', {
                            text  : item.name,
                            value : item.id
                        })));
                    };
                })(jQuery);

            });
        </script>
    </body>
</html>
