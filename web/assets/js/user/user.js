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

$("#cards, #cards-list").ready(function () {
    $.ajax({
        url: "card",
        method: "POST",
        data: {
            methodType: "card-list"
        },
        dataType: "json",
        success: function (data) {

            let btnCardMain;

            $.each(data, function (i, value) {
                let html = "<tr><td>" + value.CardNumber + "</td>";
                html += "<td>" + value.Holder + "</td>";
                html += "<td>" + value.SecurityCode + "</td>";
                html += "<td>" + value.ExpirationDate + "</td>";
                html += "<td>" + value.Brand + "</td>";
                html += "<td>" + value.type + "</td>";
                if(value.selected){
                    btnCardMain = "<button class='btn btn-primary main-card' id='" + value._id + "'>Principal</button></td>"
                }else{
                    btnCardMain = "<button class='btn btn-primary main-card' id='" + value._id + "'>Definir como principal</button></td>"
                }
                html += "<td><div class='btn-group'><button class='btn btn-primary delete-card' id='" + value._id + "'>Excluir</button>" + btnCardMain + "</div>";
                html += "</tr>";
                $("#cards-list tbody").append(html);

            });

        }, error: function (e) {
            console.log(e);
        }
    });
});

$(document).on('click', '.main-card', function (e) {
    e.preventDefault();

    var idCard = $(this).attr('id');
    $.ajax({
        url: "card",
        type: "POST",
        data: {
            methodType: "main-card",
            id: idCard
        }, beforeSend() {
            $('#message').css('display', 'block');
            $('#message').html('Aguarde...');
        }, success: function (data) {
            var dataJSON = JSON.parse(data);
            $('#message').html(dataJSON.message);
            setTimeout(() => {
                $(location).attr('href', '/notamais-web/card');
            }, 2000);
        }, error: function (error) {
            console.log(error);
        }
    });

});

$(document).on('click', '.delete-card', function (e) {
    e.preventDefault();
    var id = $(this).attr('id');
    var $this = $(this);
    if (!confirm("Tem certeza que deseja excluir esse cartao de credito?")) {
        return false;
    }
    $.ajax({
        url: "card",
        type: "POST",
        data: {
            methodType: "card-delete",
            id: id
        }, success: function (data) {
            $this.parent().parent().remove();
        }, error: function (e) {
            console.log(e);
        }
    });
    return false;
});

$("#card-register").submit(function (e) {
    e.preventDefault();
    let number = $("#number").val();
    let holder = $("#holder").val();
    let expirationDate = $("#expiration-date").val();
    let brand = $("#brand").val();
    let securityCode = $("#security-code").val();
    let cardType = $("#card-type").val();

    if (number == "" || holder == "" || expirationDate == "" || securityCode == "" || brand == "" || cardType == "") {
        $('#message').css('display', 'block');
        $('#message').html('Voce deve preencher os campos obrigatorios');
        return false;
    }

    if (number.length < 13 || number.length > 16) {
        $('#message').css('display', 'block');
        $('#message').html('Número do cartão está incorreto!');
        return false;
    }

    if (securityCode.length < 3 || securityCode.length > 4) {
        $('#message').css('display', 'block');
        $('#message').html('O Código de segurança do cartão está incorreto');
        return false;
    }
    let form = $(this);
    let formData = form.serialize();
    formData += '&methodType=card-create';

    $.ajax({
        url: "card",
        method: "POST",
        data: formData,
        dataType: "json",
        beforeSend: function () {
            $('#message').css('display', 'block');
            $('#message').html('Aguarde...');
        },
        success: function (data) {
            $("#message").css('display', 'block');
            $('#message').html(data.message);
        }, error: function (e) {
            $('#message').css('display', 'block');
            $('#message').html(e.responseText);
        }

    });

    return false;
});


