/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$("#employee-list").ready(function (e) {
    $.ajax({
        url: "employee",
        method: "POST",
        data: {
            type: 'employee-list'
        },
        dataType: "json",
        success: function (data) {
            $.each(data, function (i, value) {
                let nickname = "Não informado";
                if (value.person.nickname != "") {
                    nickname = value.person.nickname;
                }
                let html = "<tr><td>" + value.person.name + "</td>";
                html += "<td>" + value.person.gender + "</td>";
                html += "<td>" + nickname + "</td>";
                html += "<td>" + value.person.cpf + "</td>";
                html += "<td><button class='btn btn-primary delete-employee' id='" + value._id + "'>Excluir</button></td>";
                html += "</tr>";

                $("#employee-list tbody").append(html);
            });
        }, error: function (e) {
            console.log(e);
        }
    });
});

$(document).on('click', '.delete-employee', function (e) {
    e.preventDefault();

    var id = $(this).attr('id');
    var $this = $(this);

    if (!confirm("Tem certeza que deseja excluir esse funcionario?")) {
        return false;
    }

    $.ajax({
        url: "employee",
        type: "POST",
        data: {
            type: "delete-employee",
            e: id
        }, success: function (data) {
            $this.parent().parent().remove();
        }, error: function (e) {
            console.log(e);
        }
    });

    return false;
});

$("#employee-register").submit(function (e) {
    e.preventDefault();

    let name = $("#name").val();
    let nickname = $("#nickname").val();
    let email = $("#email").val();
    let cpf = $("#cpf").val();
    let gender = $("#gender").val();

    if (name == "" || cpf == "" || gender == "" || email == "") {
        $('#message').css('display', 'block');
        $('#message').html('Voce deve preencher os campos obrigatorios');
        return false;
    }

    if (!validarCPF(cpf)) {
        $('#message').css('display', 'block');
        $('#message').html('CPF Inválido');
        return false;
    }

    let form = $(this);
    let formData = form.serialize();
    formData += '&type=employee-create';

    $.ajax({
        url: "employee",
        method: "post",
        data: formData,
        beforeSend: function () {
            $('#message').css('display', 'block');
            $('#message').html('Aguarde...');
        },
        success: function (data) {
            var data = JSON.parse(data);
            $("#message").css('display', 'block');
            $('#message').html(data.message);
            //setTimeout(() => {
            //$(location).attr('href', '/notamais-web/dashboard');
            //}, 2000);
        },
        error: function (e) {
            $('#message').css('display', 'block');
            $('#message').html(e.responseText);
        }
    });

    return false;
});

