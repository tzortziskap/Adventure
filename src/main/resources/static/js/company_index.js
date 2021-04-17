/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    
    $(".date").each(function (){
        var date= $(this).text();
        $(this).html(dateformat(date));
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
        return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear() + "  " + strTime;
    }
    
    function getCustomers(d) {
    window.open("/Adventure/event/get/customers/" + d.getAttribute("data-id"), 'popup', 'width=600,height=600');
}
});
