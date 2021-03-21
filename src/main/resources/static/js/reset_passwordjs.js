/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
                $(document).on('click', '.toggle-password', function () {

                    $(this).toggleClass("fa-eye fa-eye-slash");

                     
                    $(".password").each(function() {
                        $(this).attr('type') === 'password' ? $(this).attr('type', 'text') : $(this).attr('type', 'password');
                    });
                });
                $("#confpass_log_id").on('input', function (){
                    if($(this)[0].value != $("#pass_log_id")[0].value){
                        $(this)[0].setCustomValidity("Passwords do not match!");
                    }else{
                        $(this)[0].setCustomValidity("");
                    }
                    
                });
            });
