/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
     var urlCounties = "/Adventure/county";
    

    $.getJSON(urlCounties, function (result) {
        $(".county").county(result);
        cityList();
    });
    
    $(".county").change(cityList);
    
            function cityList () {
        var city = $(".county").closest("form").find(".city");
        if ($(".county").find(">:first-child").is(":selected")) {
            city.prop("disabled", true);
            city.find(">:first-child").prop("selected", true);
        } else if($(".county").find(">:first-child").next().is(":selected")){
            var data = $(".county").children("option:selected").val();
            var urlCities = "/Adventure/county/cities/" + data;
            $.getJSON(urlCities, function (result) {
                city.citiesByCounty(result);
                city.prop("disabled", false);
            });
        }
        else {
            var data = $(".county").children("option:selected").val();
            var urlCities = "/Adventure/county/cities/" + data;
            $.getJSON(urlCities, function (result) {
                city.empty();
                city.append('<option value="">Choose...</option>');
                city.citiesByCounty(result);
                city.prop("disabled", false);
            });
        }
    }
    
    var urlGender = "/Adventure/gender";
    
    $.getJSON(urlGender, function (result) {
        $(".gender").gender(result);
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
});