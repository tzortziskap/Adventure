/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();
    today = yyyy + "-" + mm + "-" + dd;
    let id = document.getElementById("customerid").innerHTML;
    $.getJSON("http://localhost:8080/Adventure/customer/myevents/" + id, function (results) {
        var my_obj = JSON.parse((JSON.stringify(results)));
        let nym = results.length;
        document.getElementById("number").innerHTML = "Αριθμος δραστηριοτήτων " + nym;
        $('#eventstable tbody').html('');
        createpoints(results, "eventstable");
        fetchrestofevent(id);
    });
    function fetchrestofevent(id) {
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/Adventure/event/otherevents/" + id + "/" + today,
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
            points.push({id: results[i].id,
                name: results[i].name,
                x: results[i].locationId.coordinateX,
                y: results[i].locationId.coordinateY,
                start: dateformat(results[i].startingDate),
                end: dateformat(results[i].endingDate),
                price: results[i].price,
                level: results[i].difficultyId.level,
                location: results[i].locationId.cityId.name,
                cat: results[i].categoryId.categoryName,
            });
            if (tablename === "eventstable") {
                bookings.push({
                    name: results[i].name,
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
                    }
                        ]});
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
    function ageCount() {
        var date1 = new Date();
        var dob = new Date($(".age").text());
        var month_diff = Date.now() - dob.getTime();
        var age_dt = new Date(month_diff);
        var year = age_dt.getUTCFullYear();
        var age = Math.abs(year - 1970);
        $(".age").text(age);
    }
    ageCount();

});