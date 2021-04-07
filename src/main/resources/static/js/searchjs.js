/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const values = urlParams.values();
    const keys = urlParams.keys();
    const entries = urlParams.entries();
    firstloads();
    function firstloads() {

        var checknullvalues = true;
        var query = '';
        var varia = '';
        for (const entry of entries) {

            if (entry[1] !== '') {
                checknullvalues = false;
                varia = `${entry[0]}: ${entry[1]}`;
            }
            if (query === '' && varia !== '') {
                query = varia;
            } else if (query !== '' && varia !== '') {
                query = query + " AND " + varia;
            }
        }

        if (checknullvalues === true) {
            $.getJSON("http://localhost:8080/Adventure/event/search/all", function (results) {
                createpoints(results);
            });
        } else {
            $.getJSON("http://localhost:8080/Adventure/event/search/results?search=" + query, function (results) {
                createpoints(results);
            });
        }
    }

    var urlCategories = "http://localhost:8080/Adventure/categories";
    $.getJSON(urlCategories, function (result) {
        $(".categories").categories(result);
        if (urlParams.get("categoryId.id") !== '') {
            $(".categories").val(urlParams.get("categoryId.id"));
        }
    });

    var urlDifficulty = "http://localhost:8080/Adventure/difficulty";
    $.getJSON(urlDifficulty, function (result) {
        $(".difficulty").difficulty(result);
    });

    var urlTypeIndoorOutdoor = "http://localhost:8080/Adventure/typeIndoorOutdoor";
    $.getJSON(urlTypeIndoorOutdoor, function (result) {
        $(".typeIndoorOutdoor").typeIndoorOutdoor(result);
        if (urlParams.get("typeIndoorOutdoorId.id") !== '') {
            $(".typeIndoorOutdoor").val(urlParams.get("typeIndoorOutdoorId.id"));
        }
    });

    var urlCounties = "http://localhost:8080/Adventure/county";
    $(".city").prop("disabled", true);
    $.getJSON(urlCounties, function (result) {
        $(".county").county(result);
        if (urlParams.get("locationId.cityId.countyId.id") !== '') {
            $(".county").val(urlParams.get("locationId.cityId.countyId.id"));
            cityselector();
        }
    });

    $(".county").on("change", cityselector);
    function cityselector() {
        var city = $("#form").find(".city");
        city.val('');
        if ($(".county").find(">:first-child").is(":selected")) {
            city.prop("disabled", true);
            city.find(">:first-child").prop("selected", true);
            city.val(city.find(">:first-child").val());
        } else {
            var data = $(".county").children("option:selected").val();
            var urlCities = "http://localhost:8080/Adventure/county/cities/" + data;
            $.getJSON(urlCities, function (result) {
                city.empty();
                city.append('<option value="">Choose...</option>');
                city.citiesByCounty(result);
                city.prop("disabled", false);
                if (urlParams.get("locationId.cityId.id") !== '') {
                    city.val(urlParams.get("locationId.cityId.id"));
                }
            });
        }
    }

    $("#form").find(".inputSearching").on("keyup", sendRequest);
    $("#form").find(".selectSearching").on("change", sendRequest);
    function sendRequest() {
        var query = '';
        var varia = '';
        $("#form").find(".searching").each(function (index, obj) {
            setTimeout(function () {
                $(obj).val() // returns the updated value
            }, 0);
            if ($(obj).val() !== "") {
                if ($(obj).attr('type') === "text") {
                    varia = $(obj).attr("name") + ":'" + $(obj).val() + "*'";
                } else if ($(obj).attr('type') === "number") {
                    varia = $(obj).attr("name") + "<" + $(obj).val();
                } else if ($(obj).attr('type') === "date") {
                    varia = $(obj).attr("name") + ":" + $(obj).val();
                } else if ($(obj).is('select')) {
                    varia = $(obj).attr("name") + ":" + $(obj).val();
                }
                if (query === '' && varia !== '') {
                    query = varia;
                } else if (query !== '' && varia !== '') {
                    query = query + " AND " + varia;
                }
            }
        });
        $.getJSON("http://localhost:8080/Adventure/event/search/results?search=" + query, function (results) {
            createpoints(results);
        });
    }

    function createpoints(results) {
        document.getElementById("number").innerHTML = "Αριθμος δραστηριοτήτων " + results.length;
        $('#events').html('');
        $("#map").html("");
        $("#map").html('<div id="mapid" ></div>');
        let points = [];
        for (var i = 0; i < results.length; i++) {
            var row = "<div class='col'> " +
                    "<div class='card h-100'> " +
                    "<img " +
                    "src='/Adventure/img/" + results[i].categoryId.imgurl + "' " +
                    "class='card-img-top' " +
                    "alt='" + results[i].categoryId.categoryName + "' " +
                    "style='height: 200px' " +
                    "/> " +
                    "<div class='card-body card-main'> " +
                    "<h5 class='card-title'>" + results[i].name + "</h5> " +
                    "<p class='card-text'>" + results[i].description + "</p> " +
                    "</div> " +
                    "<ul class='list-group list-group-flush'> " +
                    "<li class='list-group-item'></li> " +
                    "<li class='list-group-item'></li> " +
                    "<li class='list-group-item'></li> " +
                    "</ul> " +
                    "<div class='card-body'> " +
                    "<a href='/Adventure' class='btn btn-primary btn-md'>Κράτηση</a> " +
                    "<a href='/Adventure' class='btn btn-primary btn-md'>Περισσότερα</a> " +
                    "</div> " +
                    "</div> " +
                    "</div>";
            points.push({name: results[i].name, x: results[i].locationId.coordinateX,
                y: results[i].locationId.coordinateY,
                start: results[i].startingDate,
                end: results[i].endingDate,
                type: results[i].categoryId.categoryName});
            $('#events').append(row);
        }

        createmap(points);
    }

    function createmap(result) {
        var map = L.map('mapid').setView([38.25, 25.07], 13);
        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
            maxZoom: 18,
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
                    'Imagery Β© <a href="https://www.mapbox.com/">Mapbox</a>',
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1
        }).addTo(map);
        var bounds = new L.LatLngBounds();
        if (result.length !== 0) {
            for (var i = 0; i < result.length; i++) {
                var marker = L.marker([result[i].x, result[i].y]).addTo(map);
                marker.bindPopup("<b>" + result[i].name + "</b><br/>" +
                        "Ημερομηνία Ενάρξης Δραστηριότητας: " + result[i].start + "<br/>" +
                        "Ημερομηνία Τέλους Δραστηριότητας: " + result[i].end + "<br/>" +
                        "Είδος: " + result[i].type);
                bounds.extend(marker.getLatLng());
            }
            map.fitBounds(bounds);
        }
    }

    (function ($) {
// Populates a select drop-down with options in a list 
        $.fn.citiesByCounty = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.name,
                    value: item.id,
                    name: "locationId.cityId.id"
                })));
        };
    })(jQuery);
    (function ($) {
        // Populates a select drop-down with options in a list 
        $.fn.county = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.name,
                    value: item.id,
                    name: "county"
                })));
        };
    })(jQuery);
    (function ($) {
        // Populates a select drop-down with options in a list 
        $.fn.categories = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.categoryName,
                    value: item.id,
                    name: "categoryId.id"
                })));
        };
    })(jQuery);
    (function ($) {
        // Populates a select drop-down with options in a list 
        $.fn.difficulty = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.level,
                    value: item.id,
                    name: "difficultyId.id"
                })));
        };
    })(jQuery);
    (function ($) {
        // Populates a select drop-down with options in a list 
        $.fn.typeIndoorOutdoor = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.typeIndoorOutdoor,
                    value: item.id,
                    name: "typeIndoorOutdoorId.id"
                })));
        };
    })(jQuery);
});


        