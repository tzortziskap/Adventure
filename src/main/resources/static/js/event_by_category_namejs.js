/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    var category = $(".category").text();

    var urlCategories = "http://localhost:8080/Adventure/event/category/" + category;
    console.log(category);

    $.getJSON(urlCategories, function (results) {
        createpoints(results);
    });

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
                    "<li class='list-group-item'>" + results[i].categoryId.categoryName + "</li> " +
                    "<li class='list-group-item'>" + dateformat(results[i].startingDate) + "</li> " +
                    "<li class='list-group-item'>" + results[i].locationId.cityId.name + "</li> " +
                    "</ul> " +
                    "<div class='card-body'> " +
                    "<a href='http://localhost:8080/Adventure/event/" + results[i].id + "' class='btn btn-primary btn-md'>Περισσότερα</a> " +
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
    function dateformat(date) {
        var date = new Date(date);
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = hours >= 12 ? 'pm' : 'am';
        hours = hours % 12;
        hours = hours ? hours : 12; // the hour '0' should be '12'
        minutes = minutes < 10 ? '0' + minutes : minutes;
        var strTime = hours + ':' + minutes + ' ' + ampm;
        return (date.getMonth() + 1) + "/" + date.getDate() + "/" + date.getFullYear() + "  " + strTime;
    }
});