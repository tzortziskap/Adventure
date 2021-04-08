$(document).ready(function () {
    var x= $("#x").html();
    var y= $("#y").html();
    points = [];
    var map = L.map('mapid').setView([38.25, 25.07], 13);
    points.push({x: x, y: y});

    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
        maxZoom: 6,
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
                'Imagery Β© <a href="https://www.mapbox.com/">Mapbox</a>',
        id: 'mapbox/streets-v11',
        tileSize: 512,
        zoomOffset: -1
    }).addTo(map);
    var bounds = new L.LatLngBounds();
    var marker = L.marker([x, y]).addTo(map);

    bounds.extend(marker.getLatLng());
    map.fitBounds(bounds);
    $('#recipeCarousel').carousel({
        interval: 0
    });
    $('.carousel .carousel-item').each(function () {
        var minPerSlide = 2;
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));

        for (var i = 0; i < minPerSlide; i++) {
            next = next.next();
            if (!next.length) {
                next = $(this).siblings(':first');
            }

            next.children(':first-child').clone().appendTo($(this));
        }
    });




});

