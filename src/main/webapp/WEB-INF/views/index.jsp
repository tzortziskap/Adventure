<%-- 
    Document   : index
    Created on : Mar 11, 2021, 9:19:27 PM
    Author     : tzortziskapellas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
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
                                <a class="nav-link active" aria-current="page" href="http://localhost:8080/Adventure">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Δράστηριοτητες</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/event/create">Καταχωρήση</a>
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
        </div>
        <div class="container">
            <main>
               <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                    <input type="submit" value="Logout">
                </form:form>
                    <form id="form">
                    <h2>Search for an Event</h2>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Starting date</label>
                            <input type="date" class="form-control" id="inputEmail4" placeholder="Email">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="category">Κατηγορία</label>
                            <select id="category" class="form-control category">
                                <option value=''>Choose...</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="county">Νομός</label>
                            <select  id="county" class="form-control county">
                                <option value=''>Choose...</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="city">Πόλη</label>
                            <select id="city" class="form-control city">
                                <option value=''>Choose...</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary searcheve">Search for evants</button>
                </form>
                <h3>Our main events by Category</h3>
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
            </main>
        </div>
        <script src="js/searchjs.js"></script>
    </body>
</html>
