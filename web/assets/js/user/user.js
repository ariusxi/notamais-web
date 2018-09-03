/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$("#user-register").submit(function (e) {
    e.preventDefault();

    let fullname = $("#user-register #fullname").val();
    let email = $("#user-register #email").val();
    let cpf = $("#user-register #cpf").val();
    let gender = $("#user-register #gender").val();
    let password = $("#user-register #password").val();
    let confirm = $("#user-register #confirm").val();
    let fantasia = $("#user-register #fantasia").val();
    let cnpj = $("#user-register #cnpj").val();
    let ie = $("#user-register #ie").val();
    let telephone = $("#user-register #telephone").val();

    $('#message').css('display', 'none');

    if (fullname == "" || email == "" || cpf == "" || gender == "" || password == "" || confirm == "" || fantasia == "" || cnpj == "" || ie == "" || telephone == "") {
        $('#message').css('display', 'block');
        $('#message').html('Voce deve preencher os campos obrigatorios');
        return false;
    }

    if (password != confirm) {
        $('#message').css('display', 'block');
        $('#message').html('As senhas informadas devem ser iguais');
        return false;
    }

    if (!validarCPF(cpf)) {
        $('#message').css('display', 'block');
        $('#message').html('CPF Inválido');
        return false;
    }

    if (!validarCNPJ(cnpj)) {
        $('#message').css('display', 'block');
        $('#message').html('CNPJ Inválido');
        return false;
    }

    if (password.length < 6) {
        $('#message').css('display', 'block');
        $('#message').html('A senha deve ser maior que 6 digitos');
        return false;
    }

    let form = $(this);
    let formData = form.serialize();
    formData += '&type=user';

    $.ajax({
        url: "register",
        method: "post",
        data: formData,
        beforeSend: function () {
            $('#message').css('display', 'block');
            $('#message').html('Aguarde...');
        },
        success: function (data) {
            $("#message").css('display', 'block');
            $('#message').html(data.message);
            setTimeout(() => {
                $(location).attr('href', '/notamais-web/');
            }, 2000);
        },
        error: function (e) {
            $('#message').css('display', 'block');
            $('#message').html(e.responseText);
        }
    });

    return false;

});

