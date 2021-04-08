/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    var compEmailExist = urlParams.get("compEmailExist");
    var compUsernameExist = urlParams.get("compUsernameExist");
    if(compEmailExist!=null || compUsernameExist!=null){
        $("#userRadio").prop('checked',true);
    }else{
        $("#guestRadio").prop('checked',true);
    }
    
    if($("#userRadio").is(":checked")===true){
        $("#guestForm").hide();
        $("#userForm").show();
    }else{
        $("#userForm").hide();
        $("#guestForm").show();
    }

    $(".form-check-input").click(function () {
        var isChecked = $("#userRadio").is(':checked');
        if (isChecked === true) {
            $("#guestForm").hide();
            $("#userForm").show();
        } else {
            $("#userForm").hide();
            $("#guestForm").show();
        }
    });

    var urlCounties = "http://localhost:8080/Adventure/county";
    $(".city").each(function () {
        $(this).prop("disabled", true);
    });

    $.getJSON(urlCounties, function (result) {
        $(".county").each(function () {
            $(this).county(result);
        });
    });


    $(".county").change(function () {
        var city = $(this).closest("form").find(".city");
        if ($(this).find(">:first-child").is(":selected")) {
            city.prop("disabled", true);
            city.find(">:first-child").prop("selected", true);
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
    var urlGender = "http://localhost:8080/Adventure/gender";
    
    $.getJSON(urlGender, function (result) {
        $(".gender").each(function () {
            $(this).gender(result);
        });
    });


    (function ($) {
        // Populates a select drop-down with options in a list 
        $.fn.citiesByCounty = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.name,
                    value: item.id,
                    name: "cityId"
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
        $.fn.gender = function (list) {
            return this.append(list.map(item => $('<option>', {
                    text: item.name,
                    value: item.id,
                    name: "genderId"
                })));
        };
    })(jQuery);

    $("#compconfpassword").on('input', function () {
        if ($(this)[0].value != $("#comppassword")[0].value) {
            $(this)[0].setCustomValidity("Passwords do not match!");
        } else {
            $(this)[0].setCustomValidity("");
        }
    });

    $("#custconfpassword").on('input', function () {
        if ($(this)[0].value != $("#custpassword")[0].value) {
            $(this)[0].setCustomValidity("Passwords do not match!");
        } else {
            $(this)[0].setCustomValidity("");
        }
    });
    

    $(".mati").on("click", function () {
        var input = $(this).closest("form").find(".password");
        input.each(function(){
            if ($(this)[0].type === "password"){
            $(this)[0].type = "text";
        } else {
            $(this)[0].type = "password";
        }
        });   
    });
   
});