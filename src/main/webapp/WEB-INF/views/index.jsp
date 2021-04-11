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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="http://localhost:8080/Adventure/css/index.css" rel="stylesheet" type="text/css">
        <title>Adventure Booking</title>
    </head>
    <body>
        <%@ include file="nav.jsp" %>
        <div class="container">
            <main>
                <h1 class="font-weight-bold py-3">Adventure Booking</h1>
                <div id="aboutus">

                    <form:form action="/Adventure/event/search" id="form" method="GET">
                        <h3>Αναζήτηση Δραστηριοτήτων</h3>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="categories">Κατηγορία</label>
                                <select name="categoryId.id" id="categories" class="form-control categories">
                                    <option value=''>Choose...</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="county">Νομός</label>
                                <select  name="locationId.cityId.countyId.id" id="county" class="form-control county">
                                    <option value=''>Choose...</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="type">Τύπος</label>
                                <select name="typeIndoorOutdoorId.id" id="type" class="form-control typeIndoorOutdoor searching selectSearching">
                                    <option  value=''>Choose...</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="city">Πόλη</label>
                                <select name="locationId.cityId.id" id="city" class="form-control city">
                                    <option value=''>Choose...</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary searcheve">Αναζήτηση Δραστηριοτήτων</button>
                    </form:form>
                    <h3>Ποιοι Ειμαστε</h3>
                    <p>
                        Πιστεύουμε στη δημιουργικότητα. Κάθε δημιουργική διαδικασία απαιτεί έναν ορισμένο βαθμό φαντασίας και μια πραγματική όρεξη για περιπέτεια. Περιπέτεια για εμάς σημαίνει έκθεση στο νέο, έκθεση στην έκπληξη. Ανακαλύπτοντας νέες εικόνες, μέρη, μυρωδιές, ομοιόμορφα άτομα και ελπίζουμε, ακόμη και έναν μακρύ κρυφό θησαυρό μέσα στον εαυτό μας.
                        Το σπίτι μας είναι η Ελλάδα, μια χώρα με μοναδικό πολιτισμό και γλώσσα, ένα τοπίο που είναι από τα λιγότερο εξερευνημένα στην Ευρώπη και μερικούς από τους πιο φιλόξενους ανθρώπους στον κόσμο. Στόχος μας είναι να σας παρουσιάσουμε τα πράγματα που αγαπάμε περισσότερο, τα ταξίδια και την περιπέτεια. Συχνά φτάνουμε σε μια κατάσταση δημιουργικής ροής, ενώ σχεδιάζουμε τα δρομολόγια για εσάς, αλλά δεν συγκρίνεται καν με τη συγκίνηση να σας συναντήσουμε και να συνδυάσετε μαζί σας σε μια νέα περιπέτεια. Με την σταθερή εταιρική μας υποδομή, την εκπαιδευμένη ομάδα εξειδικευμένων οδηγών και την πολυετή εμπειρία, εγγυόμαστε ότι είμαστε οι κατάλληλοι άνθρωποι για να μοιραστούμε μαζί σας τι μπορεί να είναι η περιπέτεια μιας ζωής. Ας σας εκπλήξουμε! Αυτό που θα χρειαστεί να φέρετε μαζί με την τσάντα σας είναι καλή χαρά και θέληση, παρά οποιαδήποτε συγκεκριμένη ικανότητα.
                        Ας φανταστούμε ... και μείνετε συντονισμένοι.
                    </p>
                </div>
                <h3>Βασικές Κατηγορίες Δραστηριοτήτων</h3>
                <!--Carousel Wrapper-->
                <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
                    <!--Controls-->
                    <div class="controls-top">
                        <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fas fa-chevron-left"></i></a>
                        <a class="btn-floating" href="#multi-item-example" data-slide="next"><i
                                class="fas fa-chevron-right"></i></a>
                    </div>
                    <!--/.Controls-->
                    <!--Indicators-->
                    <ol class="carousel-indicators">
                        <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
                        <li data-target="#multi-item-example" data-slide-to="1"></li>
                        <li data-target="#multi-item-example" data-slide-to="2"></li>
                    </ol>
                    <!--/.Indicators-->
                    <!--Slides-->
                    <div class="carousel-inner" role="listbox">
                        <!--First slide-->
                        <div class="carousel-item active">
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/pezoporia.jpeg" alt="Πεζοπορία">
                                    <div class="card-body">
                                        <h4 class="card-title">Πεζοπορία</h4>
                                        <p class="card-text">Η Πεζοπορία απευθύνεται σε όλους του ανθρώπους ανεξαρτήτου ηλικίας 
                                            και ειδικά σε όσους αγαπούν το περπάτημα και την περιπλάνηση στη φύση!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Πεζοπορία" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/toxovolia.jpeg" alt="Τοξοβολία">
                                    <div class="card-body">
                                        <h4 class="card-title">Τοξοβολία</h4>
                                        <p class="card-text">Οι τοξότες αποκτούν πνευματική δύναμη. 
                                            Με την προπόνηση αναπτύσσουν ικανότητες συγκέντρωσης, 
                                            ακρίβειας και υπομονής!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Τοξοβολία" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/ippasia.jpeg" alt="Ιππασία">
                                    <div class="card-body">
                                        <h4 class="card-title">Ιππασία</h4>
                                        <p class="card-text">Η ιππασία λοιπόν, είναι μία δραστηριότητα που δεν κάνει διακρίσεις, απευθύνεται σε μικρούς και μεγάλους!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Ιππασία" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.First slide-->
                        <!--Second slide-->
                        <div class="carousel-item">

                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/mageiriki.jpeg" alt="Μαγειρική">
                                    <div class="card-body">
                                        <h4 class="card-title">Μαγειρική</h4>
                                        <p class="card-text">Μαθήματα Μαγειρικής και Ζαχαροπλαστικής για ερασιτέχνες και επαγγελματίες. Απόλυτα πρακτικά!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Μαγειρική" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/katadisi.jpeg" alt="Κατάδυση">
                                    <div class="card-body">
                                        <h4 class="card-title">Κατάδυση</h4>
                                        <p class="card-text">Ανακάλυψε τον συναρπαστικό κόσμο που βρίσκεται κάτω από την θάλασσα!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Κατάδυση" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/anarixisi.jpeg" alt="Αναρρίχηση">
                                    <div class="card-body">
                                        <h4 class="card-title">Αναρρίχηση</h4>
                                        <p class="card-text">Το σκαρφάλωμα είναι μέσα στο DNA μας οπότε μας ταιριάζει. 
                                            Θυμάσαι που σαν παιδί σκαρφάλωνες στα δέντρα και στις ξερολιθιές!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Αναρρίχηση" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.Second slide-->
                        <!--Third slide-->
                        <div class="carousel-item">

                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/canoe.jpg" alt="Κανό Καγιάκ">
                                    <div class="card-body">
                                        <h4 class="card-title">Κανό Καγιάκ</h4>
                                        <p class="card-text">Μέσα σε ένα κανό καγιάκ, μερικά μόλις εκατοστά πάνω από το νερό, 
                                            βρισκόμαστε στο ιδανικό σημείο για να απολαύσουμε το ποτάμι και την φύση 
                                            και να χαλαρώσουμε εντελώς. </p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Κανό Καγιάκ" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/ski.png" alt="Ski">
                                    <div class="card-body">
                                        <h4 class="card-title">Ski</h4>
                                        <p class="card-text">Ααααχ, φύση, καθαρός αέρας, χιονισμένα τοπία, λευκές βουνοκορφές, πανύψηλα πεύκα, μαγικά χρώματα, η αίσθηση των ζεστών ακτίνων του ήλιου στο πρόσωπο. Μαγεία!</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Ski" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="float:left">
                                <div class="card mb-2">
                                    <img class="card-img-top"
                                         src="${pageContext.request.contextPath}/img/bike.jpeg" alt="Ορεινή ποδηλασία">
                                    <div class="card-body">
                                        <h4 class="card-title">Ορεινή ποδηλασία</h4>
                                        <p class="card-text">Η ορεινή ποδηλασία οδηγεί σε απομακρυσμένες περιοχές, 
                                            όπου μπορεί αυτόματα να βοηθήσει στη χαλάρωση, ιδιαίτερα τα άτομα που ζουν, 
                                            σε μια μεγάλη και θορυβώδη πόλη.</p>
                                        <a href="${pageContext.request.contextPath}/event/categoryName/Ορεινή ποδηλασία" class="btn btn-primary">Μάθε περισσότερα</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.Third slide-->
                    </div>
                    <!--/.Slides-->
                    <!--/.Carousel Wrapper-->
                </div>
            </main>
        </div>
        <%@ include file="footer.jsp" %>
        <script src="js/indexjs.js"></script>
    </body>
</html>
