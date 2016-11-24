/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function soloLetras(obj){
    var letras=/^[A-Za-z\s\xF1\xD1\áéíóú]+$/;
    if (letras.test(obj.value)==true) {
        obj.style.borderColor = '#3CB371'; 
    } else {
        obj.style.borderColor = 'red'; 
    }
}

function soloLetrasyNull(obj){
    var letras=/^([A-Za-z\s\xF1\xD1\áéíóú])*$/;
    if (letras.test(obj.value)==true) {
        obj.style.borderColor = '#3CB371'; 
    } else {
        obj.style.borderColor = 'red'; 
    }
}

function soloNumeros(obj){
    if (/^[0-9]+$/.test(obj.value)==true) {
        obj.style.borderColor = '#3CB371'; 
    } else {
        obj.style.borderColor = 'red'; 
    }
}

function noVacio(obj){
    if (obj.value!="") {
        obj.style.borderColor = '#3CB371'; 
    } else {
        obj.style.borderColor = 'red'; 
    }
}

function validaCorreo(obj){
    if (/\S+@\S+\.\S+/.test(obj.value)==true) {
        obj.style.borderColor = '#3CB371'; 
    } else {
        obj.style.borderColor = 'red'; 
    }
}

function checaPass(pass1, pass2){
    if (pass1.value != pass2.value){
        pass1.style.borderColor = 'red'; 
        pass2.style.borderColor = 'red'; 
    } else {
        pass1.style.borderColor = '#3CB371';
        pass2.style.borderColor = '#3CB371'; 
    }
}

function checaPassActual(pass){
    var idLogin = $('#idLogin').val();
    $.post('verificaPass.jsp', {
            idLogin: idLogin,
            pass: pass.value,
            op: 1,
    }, function(respuesta) {
        if (respuesta.trim() == 'Incorrecto'){
            pass.style.borderColor = 'red';
        } else{
            pass.style.borderColor = '#3CB371';
        }
    });
}

function validarFormulario(formulario) {
    var todoCorrecto = true;
    //formulario.apmat.style.borderColor = 'rgb(60, 179, 113)';
    for (var i=0; i<formulario.length; i++) {
        if(formulario[i].type == 'text' || formulario[i].type == 'password' || formulario[i].type == 'textarea') {
            if(formulario[i].style.borderColor !='rgb(60, 179, 113)') {
                todoCorrecto=false;
            }
        } else if(formulario[i].type == 'select-one'){
            if(formulario[i].value == '0'){
                alert("Falta seleccionar " + formulario[i].name + "!");
            }
        }
    }
    if (todoCorrecto == true) {
        formulario.submit();
    }else{
        alert("hay algo mal");
    }
}

function habilitar(obj1,obj2,obj3,obj4){
    var valorDiv = $("#txtbtn").html();
    if (valorDiv == "&nbsp;&nbsp;&nbsp; Modificar &nbsp;&nbsp;&nbsp;"){
        obj1.disabled = false;
        obj2.disabled = false;
        obj3.disabled = false;
        obj4.disabled = false;
        obj1.style.borderColor = 'rgb(60, 179, 113)';
        obj2.style.borderColor = 'rgb(60, 179, 113)';
        obj3.style.borderColor = 'rgb(60, 179, 113)';
        obj4.style.borderColor = 'rgb(60, 179, 113)';
        $('#txtbtn').html("&nbsp;&nbsp;&nbsp; Guardar &nbsp;&nbsp;&nbsp;");
    } else {
        if(obj1.style.borderColor =='rgb(60, 179, 113)' && 
           obj2.style.borderColor =='rgb(60, 179, 113)' &&
           obj3.style.borderColor =='rgb(60, 179, 113)' &&
           obj4.style.borderColor =='rgb(60, 179, 113)'){
                modificaDatosPer();
                $('#txtbtn').html("&nbsp;&nbsp;&nbsp; Modificar &nbsp;&nbsp;&nbsp;");
                obj1.disabled = true;
                obj2.disabled = true;
                obj3.disabled = true;
                obj4.disabled = true;
                obj1.style.borderColor = '#D7D7D7';
                obj2.style.borderColor = '#D7D7D7';
                obj3.style.borderColor = '#D7D7D7';
                obj4.style.borderColor = '#D7D7D7';
        }
        
    }
}

function modificaDatosPer(){
    var idLogin = $('#idLogin').val();
    var nombre = $('#nombre').val();
    var appat = $('#appat').val();
    var apmat = $('#apmat').val();
    var telefono = $('#telefono').val();
    $.post('modificaDatosPer.jsp', {
            idLogin: idLogin,
            nombre: nombre,
            appat: appat,
            apmat: apmat,
            telefono: telefono,
    }, function() {
        });
}

function guardaNuevoPass(pa,p1,p2){
     if(pa.style.borderColor =='rgb(60, 179, 113)' && 
        p1.style.borderColor =='rgb(60, 179, 113)' &&
        p2.style.borderColor =='rgb(60, 179, 113)'){
            var idLogin = $('#idLogin').val();
            $.post('verificaPass.jsp', {
                    idLogin: idLogin,
                    pass: p1.value,
                    op: 2,
            }, function() {
                });
        pa.value = "";
        p1.value = "";
        p2.value = "";
        pa.style.borderColor = '#D7D7D7';
        p1.style.borderColor = '#D7D7D7';
        p2.style.borderColor = '#D7D7D7';
        $('#msjPass').html("Nueva Contraseña Guardada Exitosamente");
     }
}

function cargaListaProd(obj){
    var idCategoria = obj.value;
    $('#datosProd').html("");
    $.post('modificaProd.jsp', {
            idCategoria: idCategoria,
            op: 1,
    }, function(respuesta) {
        $('#seleccionaProd').html(respuesta);
    }); 
}

function cargaProductos(obj){
    var idProducto = obj.value;
    $.post('modificaProd.jsp', {
            idProducto: idProducto,
            op: 2,
    }, function(respuesta) {
        $('#datosProd').html(respuesta);
        document.modProd.addEventListener('submit', function(event){
            event.preventDefault();
            validarFormulario(this);
        });
    }); 
}

function cargaCat(obj){
    var idCategoria = obj.value;
    $.post('modificaCat.jsp', {
            idCategoria: idCategoria,
    }, function(respuesta) {
        $('#datosCat').html(respuesta);
        document.modCat.addEventListener('submit', function(event){
            event.preventDefault();
            validarFormulario(this);
        });
    }); 
}

function cargaUsuario(obj){
    var idUsuario = obj.value;
    $.post('modificaUsr.jsp', {
            idUsuario: idUsuario,
    }, function(respuesta) {
        $('#datosClient').html(respuesta);
        document.modusr.addEventListener('submit', function(event){
            event.preventDefault();
            validarFormulario(this);
        });
    }); 
}

function cargaProveedor(obj){
    var idProveedor = obj.value;
    $.post('modProv.jsp', {
            idProveedor: idProveedor,
    }, function(respuesta) {
        $('#datosProveedor').html(respuesta);
        document.modprov.addEventListener('submit', function(event){
            event.preventDefault();
            validarFormulario(this);
        });
    }); 
}

function cargaAdministrador(obj){
    var idUsuario = obj.value;
    $.post('modAdmin.jsp', {
            idUsuario: idUsuario,
    }, function(respuesta) {
        $('#datosAdministrador').html(respuesta);
        document.modadmin.addEventListener('submit', function(event){
            event.preventDefault();
            validarFormulario(this);
        });
    }); 
}

function seleccion(obj){
   if (obj.value == "0"){
        obj.style.borderColor = 'red'; 
        obj.style.borderColor = 'red'; 
    } else {
        obj.style.borderColor = '#3CB371';
        obj.style.borderColor = '#3CB371'; 
    }
}

function eliminaProd(){
    var idProducto = $('#idProducto').val();
     $.post('eliminaProductosDB.jsp', {
            idProducto: idProducto,
    }, function() {
        window.location.href = "administrador.jsp";
    });
}

function eliminaCat(){
    var idCategoria = $('#idCategoria').val();
     $.post('eliminaCategoriasDB.jsp', {
            idCategoria: idCategoria,
    }, function() {
        window.location.href = "administrador.jsp";
    });
}
function eliminaUsr(){
    var idUsuario = $('#idUsuario').val();
     $.post('eliminaUsuariosDB.jsp', {
            idUsuario: idUsuario,
    }, function() {
        window.location.href = "administrador.jsp";
    });
}

function eliminaUsr(){
    var idUsuario = $('#idUsuario').val();
     $.post('eliminaUsuariosDB.jsp', {
            idUsuario: idUsuario,
    }, function() {
        window.location.href = "administrador.jsp";
    });
}

function eliminaAdmin(){
    var idUsuario = $('#idUsuario').val();
     $.post('eliminaUsuariosDB.jsp', {
            idUsuario: idUsuario,
    }, function() {
        window.location.href = "administrador.jsp";
    });
}

function cambiaValor(valor){
    document.getElementById("uploadFile").value = valor;
    document.getElementById("uploadFile").style.borderColor = '#3CB371';
}