/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    let id = document.getElementById("companyid").value;
    console.log(id)
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/event/view/" + id,
        dataType: 'json'
    }).done(function (results) {
        var my_obj = JSON.parse((JSON.stringify(results)));
        let nym = results.event.length;
        document.getElementById("number").innerHTML = "Αριθμος δραστηριοτήτων " + nym;
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
        var row = $('<tr ><td>' + results.event[i].name + '</td>' +
                '<td>' + results.event[i].startingDate + '</td>' +
                '<td>' + results.event[i].endingDate + '</td>' +
                '<td>' + results.event[i].price + '</td>' +
                '<td>' + results.event[i].difficultyId.level + '</td>' +
                '<td>' + results.event[i].typeIndoorOutdoorId.typeIndoorOutdoor + '</td>' +
                '<td>' + JSON.stringify(results.event[i].categoriesList) + '</td>' +
                '<td>' + JSON.stringify(results.event[i].equipmentList) + '</td>' +
                '<td>' + JSON.stringify(results.event[i].positions) + '</td>' +
                '<td> <a href="' + "${pageContext.request.contextPath}" + "/event/delete/" + results.event[i].id + '"> delete Event</a></td>' +
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
