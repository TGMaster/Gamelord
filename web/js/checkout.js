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


    var x_timer;
    $("#password-confirm").keyup(function (e) {
        clearTimeout(x_timer);
        $("#user-result").html('<img src="img/loading.gif" />');
        var password = $(this).val();
        var username = $(document.getElementById('name')).val();

        x_timer = setTimeout(function () {
            check_password_ajax(username, password);
        }, 1000);
    });

    $("#exp_y").change(function (e) {
        var exp_m = parseInt(document.getElementById('exp_m').value);
        var exp_y = parseInt(document.getElementById('exp_y').value);
        check_valid_form(exp_m, exp_y);
    });

    $("#exp_m").keyup(function (e) {
        var exp_m = parseInt(document.getElementById('exp_m').value);
        var exp_y = parseInt(document.getElementById('exp_y').value);
        check_valid_form(exp_m, exp_y);
    });

    function check_password_ajax(username, password) {
        $.post('validate', {'password': password, 'username': username}, function (data) {
            $("#user-result").html(data);
            $("#next_btn").removeAttr('disabled');
        });
    }

    function check_valid_form(exp_m, exp_y) {
        if (exp_m >= 1 && exp_m <= 12)
        {
            if (exp_y >= 18 && exp_y <= 23) {
                $("#statusExp").html("<a class=\"text-success\"><i class=\"fa fa-check\"></i> Thanks, you entered input valid</a>");
            } else {
                $(document.getElementById('exp_y')).val('');
                $("#statusExp").html("<a class=\"text-danger\"><i class=\"fa fa-times\"></i> Please input valid month and year</a>");
            }
        } else {
            $("#statusExp").html("<a class=\"text-danger\"><i class=\"fa fa-times\"></i> Please input valid month and year</a>");
            $(document.getElementById('exp_m')).val('');
        }
    }
});

function nextTab(elem) {
    $(elem).parent().next().find('a[data-toggle="pill"]').click();
}
function prevTab(elem) {
    $(elem).parent().prev().find('a[data-toggle="pill"]').click();
    $("#next_btn").prop('disabled', true);
    $("#password-confirm").val('');
    $("#user-result").html('');
    
    
}

// validates number only
function ValidateNumber(no) {
    no.value = no.value.replace(/[^0-9]+/g, '');
}