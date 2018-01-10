/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    //Initialize tooltips
    $('.nav-pills > li a[title]').tooltip();

    //Wizard
//    $('a[data-toggle="pill"]').on('show.bs.tab', function (e) {
//
//        var $target = $(e.target);
//
//        if ($target.parent().hasClass('disabled')) {
//            $target.removeClass('disabled');
//            return false;
//        }
//    });

    $(".next-step").click(function (e) {

        var $active = $('.nav-pills li>a.active');
        $active.parent().next().find('a[data-toggle="pill"]').removeClass('disabled');
        nextTab($active);

    });
    $(".prev-step").click(function (e) {

        var $active = $('.nav-pills li>a.active');
        prevTab($active);

    });
});

function nextTab(elem) {
    $(elem).parent().next().find('a[data-toggle="pill"]').click();
}
function prevTab(elem) {
    $(elem).parent().prev().find('a[data-toggle="pill"]').click();
}