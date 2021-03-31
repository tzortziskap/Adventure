$(document).ready(function () {
    var map = L.map("map_canvas").setView([38.25, 25.07], 5);
    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
        maxZoom: 18,
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
                'Imagery Β© <a href="https://www.mapbox.com/">Mapbox</a>',
        id: 'mapbox/streets-v11',
        tileSize: 512,
        zoomOffset: -1}).addTo(map);
    map.on("contextmenu", function (event) {
        $(".leaflet-marker-icon").remove();
        $(".leaflet-popup").remove();
        $(".leaflet-pane.leaflet-shadow-pane").remove();
        L.marker(event.latlng).addTo(map);
        var coord = event.latlng;
        var lat = coord.lat;
        var lng = coord.lng;
        document.getElementById("x").setAttribute('value', lat);
        document.getElementById("y").setAttribute('value', lng);
    });
    
    var checkList = document.getElementById('list1');
    checkList.getElementsByClassName('anchor')[0].onclick = function (evt) {
        if (checkList.classList.contains('visible'))
            checkList.classList.remove('visible');
        else
            checkList.classList.add('visible');
    };

    var urlEquipment = "http://localhost:8080/Adventure/equipment";

    $.getJSON(urlEquipment, function (result) {
        $(".equipment").equipment(result);
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

    (function ($) {
        // Populates a select drop-down with options in a list 
        $.fn.citiesByCounty = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.name,
                    value: item.id,
                    name: "locationId.cityId"
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
                    name: "categoryId"
                })));
        };
    })(jQuery);

    (function ($) {
        // Populates a select drop-down with options in a list 
        $.fn.difficulty = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.level,
                    value: item.id,
                    name: "difficultyId"
                })));
        };
    })(jQuery);

    (function ($) {
        // Populates a select drop-down with options in a list 
        $.fn.typeIndoorOutdoor = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.typeIndoorOutdoor,
                    value: item.id,
                    name: "typeIndoorOutdoorId"
                })));
        };
    })(jQuery);
    (function ($) {
        // Populates a select drop-down with options in a list 
        $.fn.equipment = function (list) {
            return this.append(list.map(item => $('<li>', {
                    text: item.name
                    
                   
                   
                })));
        };
    })(jQuery);
});
