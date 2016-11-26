/*
Template Name: Brickary
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
File: Back to Top JS
*/

jQuery("#backtotop").click(function () {
    jQuery("body,html").animate({
        scrollTop: 0
    }, 600);
});
jQuery(window).scroll(function () {
    if (jQuery(window).scrollTop() > 150) {
        jQuery("#backtotop").addClass("visible");
    } else {
        jQuery("#backtotop").removeClass("visible");
    }
});

function hide(div){
    document.getElementById(div).className = " hide";
}



function validateEnter(e,email,pass) {
        var key = e.keyCode || e.which;
        if (key == 13) {
            checaLogin(email,pass);
            e.preventDefault();
        }
    }
    
function checaLogin(email,pass) {
    $.post('checkLogin.jsp', {
        email: email.value,
        password: pass.value,
    }, function(respuesta) {
        if (respuesta.trim() == ""){
            window.location = "index.jsp";
        }
        $('#datos').html(respuesta);
    });
}

function show(div, clase){
    document.getElementById(div).className = clase + " flotante";
}

function add(){
    var cant = document.getElementById("cantidad").value;
    document.getElementById("cantidad").value = Number(cant) + 1;
}

function sub(){
    var cant = document.getElementById("cantidad").value;
    if(Number(cant)>1)
    document.getElementById("cantidad").value = Number(cant) - 1; 
}