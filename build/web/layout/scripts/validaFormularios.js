/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function soloLetras(obj) {
    var letras = /^[A-Za-z\s\xF1\xD1\áéíóú]+$/;
    if (letras.test(obj.value) == true) {
        obj.style.borderColor = '#3CB371';
    } else {
        obj.style.borderColor = 'red';
    }
}

function soloLetrasyNull(obj) {
    var letras = /^([A-Za-z\s\xF1\xD1\áéíóú])*$/;
    if (letras.test(obj.value) == true) {
        obj.style.borderColor = '#3CB371';
    } else {
        obj.style.borderColor = 'red';
    }
}

function soloNumeros(obj) {
    if (/^[0-9]+$/.test(obj.value) == true) {
        obj.style.borderColor = '#3CB371';
    } else {
        obj.style.borderColor = 'red';
    }
}

function noVacio(obj) {
    if (obj.value != "") {
        obj.style.borderColor = '#3CB371';
    } else {
        obj.style.borderColor = 'red';
    }
}

function validaCorreo(obj) {
    if (/\S+@\S+\.\S+/.test(obj.value) == true) {
        obj.style.borderColor = '#3CB371';
    } else {
        obj.style.borderColor = 'red';
    }
}

function checaPass(pass1, pass2) {
    if (pass1.value != pass2.value) {
        pass1.style.borderColor = 'red';
        pass2.style.borderColor = 'red';
    } else {
        pass1.style.borderColor = '#3CB371';
        pass2.style.borderColor = '#3CB371';
    }
}

function checaPassActual(pass) {
    var idLogin = $('#idLogin').val();
    $.post('verificaPass.jsp', {
        idLogin: idLogin,
        pass: pass.value,
        op: 1,
    }, function (respuesta) {
        if (respuesta.trim() == 'Incorrecto') {
            pass.style.borderColor = 'red';
        } else {
            pass.style.borderColor = '#3CB371';
        }
    });
}

function validarFormulario(formulario) {
    var todoCorrecto = true;
    //formulario.apmat.style.borderColor = 'rgb(60, 179, 113)';
    for (var i = 0; i < formulario.length; i++) {
        if (formulario[i].type == 'text' || formulario[i].type == 'password' || formulario[i].type == 'textarea') {
            if (formulario[i].style.borderColor != 'rgb(60, 179, 113)') {
                todoCorrecto = false;
            }
        } else if (formulario[i].type == 'select-one') {
            if (formulario[i].value == '0') {
                alert("Falta seleccionar " + formulario[i].name + "!");
            }
        }
    }
    if (todoCorrecto == true) {
        formulario.submit();
    } else {
        alert("hay algo mal");
    }
}

function validarFormulario2(formulario) {
    var todoCorrecto = true;
    //formulario.apmat.style.borderColor = 'rgb(60, 179, 113)';
    for (var i = 0; i < formulario.length; i++) {
        if (formulario[i].type == 'text' && formulario[i].name != 'uploadFile') {
            if (formulario[i].style.borderColor != 'rgb(60, 179, 113)') {
                todoCorrecto = false;
            }
        }
    }
    if (todoCorrecto == true) {
        formulario.submit();
    } else {
        alert("hay algo mal2");
    }
}
function validarFormulario3(formulario) {
    var todoCorrecto = true;
    //formulario.apmat.style.borderColor = 'rgb(60, 179, 113)';
    for (var i = 0; i < formulario.length; i++) {
        if (formulario[i].type == 'text' || formulario[i].type == 'textarea') {
            if (formulario[i].name == 'uploadFile')
                continue;
            if (formulario[i].style.borderColor != 'rgb(60, 179, 113)') {
                todoCorrecto = false;
            }
        } else if (formulario[i].type == 'select-one') {
            if (formulario[i].value == '0') {
                alert("Falta seleccionar " + formulario[i].name + "!");
            }
        }
    }
    if (todoCorrecto == true) {
        formulario.submit();
    } else {
        alert("hay algo mal3");
    }
}

function habilitar(obj1, obj2, obj3, obj4) {
    var valorDiv = $("#txtbtn").html();
    if (valorDiv == "&nbsp;&nbsp;&nbsp; Modificar &nbsp;&nbsp;&nbsp;") {
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
        if (obj1.style.borderColor == 'rgb(60, 179, 113)' &&
                obj2.style.borderColor == 'rgb(60, 179, 113)' &&
                obj3.style.borderColor == 'rgb(60, 179, 113)' &&
                obj4.style.borderColor == 'rgb(60, 179, 113)') {
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

function modificaDatosPer() {
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
    }, function () {
    });
}

function guardaNuevoPass(pa, p1, p2) {
    if (pa.style.borderColor == 'rgb(60, 179, 113)' &&
            p1.style.borderColor == 'rgb(60, 179, 113)' &&
            p2.style.borderColor == 'rgb(60, 179, 113)') {
        var idLogin = $('#idLogin').val();
        $.post('verificaPass.jsp', {
            idLogin: idLogin,
            pass: p1.value,
            op: 2,
        }, function () {
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

function cargaListaProd(obj) {
    var idCategoria = obj.value;
    $('#datosProd').html("");
    $.post('modificaProd.jsp', {
        idCategoria: idCategoria,
        op: 1,
    }, function (respuesta) {
        $('#seleccionaProd').html(respuesta);
    });
}

function cargaProductos(obj) {
    var idProducto = obj.value;
    $.post('modificaProd.jsp', {
        idProducto: idProducto,
        op: 2,
    }, function (respuesta) {
        $('#datosProd').html(respuesta);
        $('a.delete').on('click', function (e) {
            e.preventDefault();
            imageID = $(this).closest('.image')[0].id;
            alert('Now deleting "' + imageID + '"');
            $(this).closest('.image')
                    .fadeTo(300, 0, function () {
                        $(this)
                                .animate({width: 0}, 200, function () {
                                    $(this)
                                            .remove();
                                });
                    });
        });
        document.modProd.addEventListener('submit', function (event) {
            event.preventDefault();
            validarFormulario2(this);
        });
    });
}

function cargaCat(obj) {
    var idCategoria = obj.value;
    $.post('modificaCat.jsp', {
        idCategoria: idCategoria,
    }, function (respuesta) {
        $('#datosCat').html(respuesta);
        document.modCat.addEventListener('submit', function (event) {
            event.preventDefault();
            validarFormulario2(this);
        });
    });
}

function cargaUsuario(obj) {
    var idUsuario = obj.value;
    $.post('modificaUsr.jsp', {
        idUsuario: idUsuario,
    }, function (respuesta) {
        $('#datosClient').html(respuesta);
        document.modusr.addEventListener('submit', function (event) {
            event.preventDefault();
            validarFormulario(this);
        });
    });
}

function cargaProveedor(obj) {
    var idProveedor = obj.value;
    $.post('modProv.jsp', {
        idProveedor: idProveedor,
    }, function (respuesta) {
        $('#datosProveedor').html(respuesta);
        document.modprov.addEventListener('submit', function (event) {
            event.preventDefault();
            validarFormulario(this);
        });
    });
}

function cargaAdministrador(obj) {
    var idUsuario = obj.value;
    $.post('modAdmin.jsp', {
        idUsuario: idUsuario,
    }, function (respuesta) {
        $('#datosAdministrador').html(respuesta);
        document.modadmin.addEventListener('submit', function (event) {
            event.preventDefault();
            validarFormulario(this);
        });
    });
}

function cargaSucursal(obj) {
    var idSucursal = obj.value;
    $.post('modSuc.jsp', {
        idSucursal: idSucursal,
    }, function (respuesta) {
        $('#datosSucursal').html(respuesta);
        document.modsuc.addEventListener('submit', function (event) {
            event.preventDefault();
            validarFormulario(this);
        });
    });
}

function cargaVendedor(obj) {
    var idUsuario = obj.value;
    $.post('modificaUsr.jsp', {
        idUsuario: idUsuario,
    }, function (respuesta) {
        $('#datosVendedor').html(respuesta);
        document.modusr.addEventListener('submit', function (event) {
            event.preventDefault();
            validarFormulario(this);
        });
    });
}

function seleccion(obj) {
    if (obj.value == "0") {
        obj.style.borderColor = 'red';
        obj.style.borderColor = 'red';
    } else {
        obj.style.borderColor = '#3CB371';
        obj.style.borderColor = '#3CB371';
    }
}

function eliminaProd() {
    var mensaje = confirm("¿Seguro que quieres eliminar?");
    if (mensaje) {
        var idProducto = $('#idProducto').val();
        $.post('eliminaProductosDB.jsp', {
            idProducto: idProducto,
        }, function () {
            window.location.href = "administrador.jsp";
        });
    }
}

function eliminaProv() {
    var mensaje = confirm("¿Seguro que quieres eliminar?");
    if (mensaje) {
        var idProveedor = $('#idProveedor').val();
        $.post('eliminaProveedoresDB.jsp', {
            idProveedor: idProveedor,
        }, function () {
            window.location.href = "administrador.jsp";
        });
    }
}

function eliminaCat() {
    var mensaje = confirm("¿Seguro que quieres eliminar?");
    if (mensaje) {
        var idCategoria = $('#idCategoria').val();
        $.post('eliminaCategoriasDB.jsp', {
            idCategoria: idCategoria,
        }, function () {
            window.location.href = "administrador.jsp";
        });
    }
}
function eliminaUsr() {
    var mensaje = confirm("¿Seguro que quieres eliminar?");
    if (mensaje) {
        var idUsuario = $('#idUsuario').val();
        $.post('eliminaUsuariosDB.jsp', {
            idUsuario: idUsuario,
        }, function () {
            window.location.href = "administrador.jsp";
        });
    }
}

function eliminaAdmin() {
    var mensaje = confirm("¿Seguro que quieres eliminar?");
    if (mensaje) {
        var idUsuario = $('#idUsuario').val();
        $.post('eliminaUsuariosDB.jsp', {
            idUsuario: idUsuario,
        }, function () {
            window.location.href = "administrador.jsp";
        });
    }
}

function eliminaSuc() {
    var mensaje = confirm("¿Seguro que quieres eliminar?");
    if (mensaje) {
        var idSucursal = $('#idSucursal').val();
        $.post('eliminaSucursalDB.jsp', {
            idSucursal: idSucursal,
        }, function () {
            window.location.href = "administrador.jsp";
        });
    }
}

function cambiaValor(valor) {
    document.getElementById("uploadFile").value = valor;
    document.getElementById("uploadFile").style.borderColor = '#3CB371';
}

function ConfirmEliminarDir(idDir) {
    var mensaje = confirm("¿Seguro que quieres eliminar?");
    if (mensaje) {
        eliminaDir(idDir);
    }
}

function eliminaDir(idDir) {
    $.post('eliminaDirDB.jsp', {
        idDir: idDir,
    }, function () {
        window.location.href = "cliente.jsp";
    });
}

function llenaCampos(idDir) {
    $.post('llenaDomicilio.jsp', {
        idDir: idDir,
    }, function (respuesta) {
        $('#modificaDir').html(respuesta);
        document.modificadireccion.addEventListener('submit', function (event) {
            event.preventDefault();
            validarFormulario(this);
        });
    });
}

function validaMes(obj) {
    if (/^[0-9]+$/.test(obj.value) == true && obj.value <= 12 && obj.value > 0) {
        obj.style.borderColor = '#3CB371';
    } else {
        obj.style.borderColor = 'red';
    }
}

function ConfirmEliminarTarjeta(id) {
    var mensaje = confirm("¿Seguro que quieres eliminar esta tarjeta?");
    if (mensaje) {
        eliminaTar(id);
    }
}

function eliminaTar(id) {
    $.post('eliminaTarDB.jsp', {
        idTar: id,
    }, function () {
        window.location.href = "cliente.jsp";
    });
}

function llenaCamposTarjeta(id) {
    $.post('llenaTarjetas.jsp', {
        idTar: id,
    }, function (respuesta) {
        $('#modificaTar').html(respuesta);
        document.modificaTarjeta.addEventListener('submit', function (event) {
            event.preventDefault();
            validarFormulario(this);
        });
    });
}

function detalleCompra(idVenta, tipo, estado) {
    $.post('detalleCompra.jsp', {
        idVenta: idVenta,
        tipo: tipo,
        estado: estado,
    }, function (respuesta) {
        $('#carrito').html(respuesta);
    });
}

function finalizarPedido(idVenta) {
    $.post('finalizarPedido.jsp', {
        idVenta: idVenta,
    }, function () {
        $.post('adminAjax.jsp', {
            op: 19,
        }, function (responseText) {
            $('#contenido').html(responseText);
        });
    });
}

function agregarGuia(idVenta, guia) {
    if (/^[0-9]+$/.test(guia.value) == true && guia.value.trim != "") {
        $.post('agregarGuia.jsp', {
            idVenta: idVenta,
            guia: guia.value,
        }, function () {
            $.post('adminAjax.jsp', {
                op: 19,
            }, function (responseText) {
                $('#contenido').html(responseText);
            });
        });
    }
}
function newRow(object) {
    var rowCount = object.getElementsByTagName("tr").length;
    var row = object.insertRow(rowCount);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    cell1.innerHTML = "";
    cell2.innerHTML = "<input type='text' onkeyup='buscaProd(event,this)'/>";
    cell3.innerHTML = "<input type='text' onkeypress='return event.charCode >= 48 && event.charCode <= 57'onchange='sacaTotal(this)'/>";
    cell4.innerHTML = "<input type='text' onkeypress='return event.charCode >= 48 && event.charCode <= 57'onchange='sacaTotal(this)'/>";
    cell5.innerHTML = "";

}

function buscaProd(event, object) {
    var celda = object.parentNode;
    var fila = celda.parentNode;
    var id, nombre;
    var tamano = object.value.length;
    if (event.keyCode >= 97 && event.keyCode <= 122 || event.keyCode >= 65 && event.keyCode <= 90 || event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode >= 160 && event.keyCode <= 165) { // retonro
        $.post('buscaProd.jsp', {
            busqueda: object.value,
        }, function (respuesta) {
            respuesta = respuesta.trim();
            if (respuesta != "") {
                id = respuesta.split(",")[0];
                nombre = respuesta.split(",")[1];
                fila.cells[0].innerHTML = id;
                object.value = nombre;
                object.setSelectionRange(tamano, nombre.length);
            }
        });
    }
}

function sacaTotal(object) {
    var celda = object.parentNode;
    var fila = celda.parentNode;
    var precio = fila.cells[3].children[0].value;
    var cantidad = fila.cells[2].children[0].value;
    var total = precio * cantidad;
    fila.cells[4].innerHTML = '$' + total;
}

function realizarPedido(tabla, idProveedor) {
    if (idProveedor != 0){
        var size = tabla.rows.length;
        var total = 0;
        var numero;
        var idProducto;
        var idCompra;
        var cantidad;
        var precio;
        for (var i = 1; i < size; i++) {
            if (tabla.rows[i].cells[0] == "")
                continue;
            else {
                numero = parseFloat(tabla.rows[i].cells[4].innerHTML.substring(1, tabla.rows[i].cells[4].innerHTML.length));
                total += parseFloat(tabla.rows[i].cells[4].innerHTML.substring(1, tabla.rows[i].cells[4].innerHTML.length));
            }
        }
        //insertar compra
        $.post('insertCompra.jsp', {
            idProveedor: idProveedor,
            total: total
        }, function (respuesta) {
            idCompra = respuesta.trim();
            for (var i = 1; i < size; i++) {
                if (tabla.rows[i].cells[0].innerHTML == "")
                    continue;
                else {
                    cantidad = tabla.rows[i].cells[2].children[0].value;
                    precio = tabla.rows[i].cells[3].children[0].value;
                    idProducto = tabla.rows[i].cells[0].innerHTML;
                    $.post('insertProdHasCompra.jsp', {
                        idProducto: idProducto,
                        cantidad: cantidad,
                        idCompra: idCompra,
                        precio: precio
                    }, function () {
                    }
                    );
                }
            }
            window.location.href = "administrador.jsp";
        }
        );
    }

}

function detalleCompraProv(idCompra) {
    $.post('detalleCompraProv.jsp', {
        idCompra: idCompra,
    }, function (respuesta) {
        $('#carrito').html(respuesta);
    });
}