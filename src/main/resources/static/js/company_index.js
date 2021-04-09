/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    let id = document.getElementById("companyid").innerHTML;
    $.ajax({
        type: "GET",
        url: "http://localhost:8080/Adventure/company/eventsByCompany/" + id,
        dataType: 'json'
    }).done(function (results) {
        var my_obj = JSON.parse((JSON.stringify(results)));
        let nym = results.length;
        document.getElementById("number").innerHTML = "Αριθμος δραστηριοτήτων " + nym;
        $("#map").append("<h3>Χάρτης</h3>");
        $("#map").html('<div id="mapid" >></div>');
        createpoints(results);
    });
    
    $(".date").each(function (){
        var date= $(this).text();
        $(this).html(dateformat(date));
    });
        
    


    function createpoints(results) {
        let points = [];
        for (var i = 0; i < results.length; i++) {
            points.push({name: results[i].name, x: results[i].locationId.coordinateX,
                y: results[i].locationId.coordinateY,
                start: results[i].startingDate,
                end: results[i].endingDate,
                type: results[i].typeIndoorOutdoorId.typeIndoorOutdoor});
        }
        createmap(points, map);
    }

    function createmap(result, map) {
        map = L.map('mapid').setView([38.25, 25.07], 13);
        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
            maxZoom: 20,
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
        function dateformat(date) {
        var date = new Date(date);
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = hours >= 12 ? 'pm' : 'am';
        hours = hours % 12;
        hours = hours ? hours : 12; // the hour '0' should be '12'
        minutes = minutes < 10 ? '0' + minutes : minutes;
        var strTime = hours + ':' + minutes + ' ' + ampm;
        return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear() + "  " + strTime;
    }
});