/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

  $(document).ready(function () {
                $("#userForm").hide();

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
                             city.append('<option selected id="citySpacer" value="SPACER">Choose...</option>');
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
            });