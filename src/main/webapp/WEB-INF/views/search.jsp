<%-- 
    Document   : Search
    Created on : Mar 10, 2021, 7:14:29 PM
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Αναζήτηση Δραστηριοτήτων</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/carousel/">
        <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
                integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
                crossorigin=""
        ></script>
        <link rel="stylesheet" href="../css/search.css">
    </head>
    <body>

        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">

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
                            Διοργανωτές/Επισκέεπτες
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Εγγραφή</a>

                            <a class="dropdown-item" href="#">Συνδεση</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Πληροφορίες</a>
                    </li>
                </ul>

                <div id="loginregister">
                    <a class="nav-link active"  href="#">Log in</a>
                    <a class="nav-link active" href="#">Register</a>        
                </div>

        </nav>
        <main>
            <div class="container">
                <div class="container">
                    <div class="row">

                        <div class="col">
                            <h3> Φορμα αναζήτησης γεγονότων </h3>
                            <br/>
                            <br/>
                            <form id="form">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="name">'Ονομα</label>
                                        <input name="name" type="text" class="form-control searching inputSearching" id="name" >
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="type">Τύπος</label>
                                        <select name="typeIndoorOutdoorId.id" id="type" class="form-control typeIndoorOutdoor searching selectSearching">
                                            <option  value=''>Choose...</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="price">Τιμή εώς</label>
                                        <input type="number" name="price" id="price" class="form-control price searching inputSearching">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="county">Νομός</label>
                                        <select  name="locationId.cityId.countyId.id" id="county" class="form-control county searching selectSearching">
                                            <option  value=''>Choose...</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="city">Πόλη</label>
                                        <select  name="locationId.cityId.id" id="city" class="form-control city searching selectSearching">
                                            <option  value=''>Choose...</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="level">Δυσκολία</label>
                                        <select  name="difficultyId.id" id="level" class="form-control difficulty searching selectSearching">
                                            <option  value=''>Choose...</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="category">Κατηγορία</label>
                                        <select name="categoryId.id" id="category" class="form-control categories searching selectSearching">
                                            <option  value=''>Choose...</option>
                                        </select>
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-primary" value="Search for events">
                            </form>
                        </div>
                        <div class="col-sm" id="map">
                        </div>
                    </div>
                </div>
                <br/>
                <br/>
                <table id="eventstable" class="table">
                    <h3 id="number"></h3>
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Starting Date</th>
                            <th scope="col">Ending Date</th>
                            <th scope="col">Price</th>
                            <th scope="col">Diff</th>
                            <th scope="col">Type</th>
                            <th scope="col">Category</th>
                            <th scope="col">Positions</th>
                            <th scope="col">Book</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../js/searchjs.js"></script>
</body>
</html>
