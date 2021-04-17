/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 $(document).ready(function () {
                $(document).on('click', '.toggle-password', function () {

                    $(this).toggleClass("fa-eye fa-eye-slash");

                    var input = $("#pass_log_id");
                    input.attr('type') === 'password' ? input.attr('type', 'text') : input.attr('type', 'password');
                });
            });