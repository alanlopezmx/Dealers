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

function add(sucursal,disponibles){
    var cant = sucursal.value;
    if(Number(cant)<disponibles)
    sucursal.value = Number(cant) + 1;
}

function sub(sucursal){
    var cant = sucursal.value;
    if(Number(cant)>0)
    sucursal.value = Number(cant) - 1; 
}

function add2(sucursal,idProducto, idSucursal, disponibles){
    var cant = sucursal.value;
    if(Number(cant)<disponibles)
    sucursal.value = Number(cant) + 1;
    actualizacarrito(idProducto, idSucursal, sucursal.value);
}

function sub2(sucursal,idProducto, idSucursal){
    var cant = sucursal.value;
    if(Number(cant)>0)
    sucursal.value = Number(cant) - 1; 
    actualizacarrito(idProducto, idSucursal, sucursal.value);
}
    
    function ocultarDirecciones(direcciones){
        $(direcciones).addClass('ocultar');
    }
    
    function mostrarDirecciones(direcciones,idSucursal){
        var idLogin = $('#idLogin').val();
        $.post('direcciones.jsp', {
            idLogin: idLogin,
            idSucursal: idSucursal
        }, function(respuesta) {
            $(direcciones).html(respuesta);
        }); 
        $(direcciones).removeClass('ocultar');
    }
    
    function actualizacarrito(idProducto, idSucursal, cantidad){
        console.log(idProducto, idSucursal, cantidad);
        $.post('actualizacarrito.jsp', {
            idProducto: idProducto,
            idSucursal: idSucursal,
            cantidad: cantidad
        }, function() {
            
        }); 
    }
    
    function insertVenta(){
        console.log("entre");
        var idLogin = $('#idLogin').val();
        $.post('insertVenta.jsp', {
            idLogin: idLogin
        }, function () {
            
        });
    }
    
    function tipoEnvio(idSucursal, idDomicilio){
        console.log(idSucursal, idDomicilio);
        $.post('tipoEnvio.jsp', {
            idSucursal: idSucursal,
            idDomicilio: idDomicilio
        }, function () {
        });
    }
    
    function tipoPago(idSucursal, idTarjeta){
        console.log(idSucursal, idTarjeta);
        $.post('tipoPago.jsp', {
            idSucursal: idSucursal,
            idTarjeta: idTarjeta
        }, function () {
        });
    }
    
    $(document).ready(function(){
		$("#envioOp1").on( "click", function() {
			$('#borrar').addClass("visible"); //muestro mediante id
		 });
		$("#envioOp2").on( "click", function() {
			$('#borrar').removeClass("visible"); //oculto mediante id
		});
    });