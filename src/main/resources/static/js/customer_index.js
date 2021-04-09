/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0');
var yyyy = today.getFullYear();
today = yyyy + "-" + mm + "-" + dd;
$(document).ready(function () {
    let id = document.getElementById("customerid").innerHTML;
    $.getJSON("http://localhost:8080/Adventure/customer/myevents/" + id, function (results) {
        var my_obj = JSON.parse((JSON.stringify(results)));
        let nym = results.length;
        document.getElementById("number").innerHTML = "Αριθμος δραστηριοτήτων " + nym;
        $("#map").html("");
        $("#map").append("<h3>Χάρτης</h3>");
        $("#map").html('<div id="mapid" >></div>');
        $('#eventstable tbody').html('');
        $("#map1").append("<h3>Χάρτης</h3>");
        $("#map1").html('<div id="mapid1" >></div>');
        createpoints(results, "eventstable");
        fetchrestofevent(id);
        $("input[name$='type']").click(function () {
            var test = $(this).val();
            if (test === "tablerd")
            {
                $("#table").show();
                $("#map").hide();
                $("#map_selected").hide();
            } else if (test === "all") {
                $("#table").hide();
                $("#map").show();
                $("#map_selected").hide();
            } else {
                $("#map").hide();
                $("#table").hide();
                $("#map_selected").show();
            }
        });
    });

    function fetchrestofevent(id) {
        let points = [];
        let link;
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/Adventure/customer/myevents/" + id,
            dataType: 'json'
        }).done(function (results) {
            createpoints(results, "");
        });
    }
    ;
    function createpoints(results, tablename) {
        let points = [];
        let bookings = [];
        let link;
        let link1;
        let equip = "";
        for (var i = 0; i < results.length; i++) {
            points.push({id: results[i].eventId.id,
                name: results[i].eventId.name,
                x: results[i].eventId.locationId.coordinateX,
                y: results[i].eventId.locationId.coordinateY,
                start: results[i].eventId.startingDate,
                end: results[i].eventId.endingDate,
                price: results[i].eventId.price,
                level: results[i].eventId.difficultyId.level,
                location: results[i].eventId.locationId.cityId.name,
                cat: results[i].eventId.categoryId.categoryName,
            });
            if (tablename === "eventstable") {
                bookings.push({
                    name: results[i].eventId.name,
                    kostos: results[i].totalPrice
                });
            }
        }
        var table;
        if (tablename === "eventstable") {
            table = $('#bookings').DataTable({});
            if (table !== null) {
                table.destroy();
            }
            $('#bookings').DataTable({
                lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
                data: bookings,
                columns: [
                    {data: "name"},
                    {data: "kostos"}
                ]
            });
            table = $('#eventstable').DataTable({
            });
            if (table !== null) {
                table.destroy();
            }
            $('#eventstable').DataTable({
                lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
                data: points,
                columns: [
                    {data: "id",
                        "visible": false},
                    {data: "x",
                        "visible": false},
                    {data: "y",
                        "visible": false},
                    {data: "name"},
                    {data: "start"},
                    {data: "price"},
                    {data: "location"},
                    {data: "cat"},
                    {data: "id",
                        "render": function (data, type, full, meta) {
                            return "<a href='http://localhost:8080/Adventure/event/" + data + "' class='btn btn-primary'>Πληροφορίες</a>";
                        }
                    }
                ]
            });
            map = L.map('mapid').setView([38.25, 25.07], 13);
            createmap(points, map);
        } else {
            table = $('#eventstobook').DataTable({
            });
            if (table !== null) {
                table.destroy();
            }
            $('#eventstobook').DataTable({
                lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
                data: points,
                columns: [
                    {data: "id",
                        "visible": false},

                    {data: "x",
                        "visible": false},
                    {data: "y",
                        "visible": false},

                    {data: "name"},
                    {data: "start"},
                    {data: "price"},
                    {data: "location"},
                    {data: "cat"},
                    {data: "id",
                        "render": function (data, type, full, meta) {
                            return "<a href='http://localhost:8080/Adventure/event/" + data + "'class='btn btn-primary'>Πληροφορίες</a>";
                        }
                    },
                    {data: "link1",
                        "render": function (data, type, full, meta) {
                            return "<a href=<a href='http://localhost:8080/Adventure/event/" + data + "' class='btn btn-primary'>Κράτηση</a>";
                        }
                    }

                ]
            });
            map = L.map('mapid1').setView([38.25, 25.07], 13);
            createmap(points, map);
        }
    }
    function createmap(result, map) {
        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
            maxZoom: 6,
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
                    'Imagery Β© <a href="https://www.mapbox.com/">Mapbox</a>',
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1
        }).addTo(map);
        var bounds = new L.LatLngBounds();
        if (result.length > 0) {
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
        $("#map").hide();
    }
    $("#button3").click(function () {
        $("#mapbook").toggle();
    });
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