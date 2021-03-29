/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $.getJSON("${pageContext.request.contextPath}/event/search", function (results) {
        document.getElementById("number").innerHTML = "Αριθμος δραστηριοτήτων " + results.event.length;
        var my_obj = JSON.parse((JSON.stringify(results)));
        $('#eventstable tbody').html('');
        $("#map").html("");
        $("#map").append("<h3>Χάρτης</h3>");
        $("#map").html('<div id="mapid" >></div>');
        createpoints(results);
    });

    var urlCategories = "http://localhost:8080/Adventure/categories";

    $.getJSON(urlCategories, function (result) {
        $(".categories").categories(result);
    });

    var urlDifficulty = "http://localhost:8080/Adventure/difficulty";

    $.getJSON(urlDifficulty, function (result) {
        $(".difficulty").difficulty(result);
    });

    var urlTypeIndoorOutdoor = "http://localhost:8080/Adventure/typeIndoorOutdoor";

    $.getJSON(urlTypeIndoorOutdoor, function (result) {
        $(".typeIndoorOutdoor").typeIndoorOutdoor(result);
    });

    var urlCounties = "http://localhost:8080/Adventure/county";
    $(".city").prop("disabled", true);

    $.getJSON(urlCounties, function (result) {
        $(".county").county(result);
    });


    $(".county").on("change", function () {
        var city = $("#form").find(".city");
        city.val('');
        if ($(this).find(">:first-child").is(":selected")) {
            city.prop("disabled", true);
            city.find(">:first-child").prop("selected", true);
            city.val(city.find(">:first-child").val());
        } else {
            var data = $(this).children("option:selected").val();
            var urlCities = "http://localhost:8080/Adventure/county/cities/" + data;
            $.getJSON(urlCities, function (result) {
                city.empty();
                city.append('<option value="">Choose...</option>');
                city.citiesByCounty(result);
                city.prop("disabled", false);
            });
        }
    });

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
        $.getJSON("http://localhost:8080/Adventure/event/search/results?search=" + query, function (result) {
        });
    }

    $("form").submit(function () {
        $("form").children().each(function (index, obj) {
            if ($(obj).val() == "") {
                $(obj).remove();
            }
        });
    });

    $("#form").submit(function (event) {
        event.preventDefault();
        var form = $(this);
        $.ajax({
            type: "GET",
            url: "/Adventure/event/search/results",
            dataType: 'json',
            data: form.serialize()
        }).done(function (results) {
            let points = [];
            var my_obj = JSON.parse((JSON.stringify(results)));
            //alert(results);
            $('#eventstable tbody').html('');
            $("#map").html("");
            $("#map").append("<h3>Χάρτης</h3>");
            $("#map").html('<div id="mapid" >></div>');
            createpoints(results);
        });
    });

    function createpoints(results) {
        let points = [];
        for (var i = 0; i < results.event.length; i++) {
            let book;
            let link;
            if (JSON.stringify(results.pos[i]) === 0) {
                book = "Not avaliable";
            } else {
                book = "Book it";
                link = "${pageContext.request.contextPath}/event/get/" + results.event[i].id;
            }
            var row = $('<tr ><td>' + results.event[i].name + '</td>' +
                    '<td>' + results.event[i].startingDate + '</td>' +
                    '<td>' + results.event[i].endingDate + '</td>' +
                    '<td>' + results.event[i].price + '</td>' +
                    '<td>' + results.event[i].difficultyId.level + '</td>' +
                    '<td>' + results.event[i].typeIndoorOutdoorId.typeIndoorOutdoor + '</td>' +
                    '<td>' + JSON.stringify(results.event[i].categoriesList) + '</td>' +
                    '<td>' + JSON.stringify(results.event[i].equipmentList) + '</td>' +
                    '<td>' + JSON.stringify(results.event[i].positions) + '</td>' +
                    '<td><a href="' + link + '">' + book + '</a></td>' +
                    //'<td>' + results.event[i].locationId.coordinateX + '</td>' +
                    //'<td>' + results.event[i].locationId.coordinateY + '</td>' +
                    "</tr>");
            points.push({name: results.event[i].name, x: results.event[i].locationId.coordinateX,
                y: results.event[i].locationId.coordinateY,
                start: results.event[i].startingDate,
                end: results.event[i].endingDate,
                type: results.event[i].typeIndoorOutdoorId.typeIndoorOutdoor});
            $('#eventstable tbody').append(row);
        }
        createmap(points, map);
    }

    function createmap(result, map) {
        map = L.map('mapid').setView([38.25, 25.07], 13);
        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
            maxZoom: 6,
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
                    'Imagery Β© <a href="https://www.mapbox.com/">Mapbox</a>',
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1
        }).addTo(map);
        var bounds = new L.LatLngBounds();
        for (var i = 0; i < result.length; i++) {
            var marker = L.marker([result[i].x, result[i].y]).addTo(map);
            marker.bindPopup("<b>" + result[i].name + "</b><br/>" +
                    "Ημερομηνία Ενάρξης Δραστηριότητας: " + result[i].start + "<br/>" +
                    "Ημερομηνία Τέλους Δραστηριότητας: " + result[i].end + "<br/>" +
                    "Είδος:" + result[i].type);
            bounds.extend(marker.getLatLng());
        }
        map.fitBounds(bounds);
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


        