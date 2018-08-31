$(function () {

    $('.cpf').mask('000.000.000-00', {reverse: true});
    $('.cnpj').mask('00.000.000/0000-00', {reverse: true});
    $('.telephone').mask('(00) 0000-0000');

    function validarCPF(cpf) {
        cpf = cpf.replace(/[^\d]+/g, '');
        if (cpf == '')
            return false;
        // Elimina CPFs invalidos conhecidos	
        if (cpf.length != 11 ||
                cpf == "00000000000" ||
                cpf == "11111111111" ||
                cpf == "22222222222" ||
                cpf == "33333333333" ||
                cpf == "44444444444" ||
                cpf == "55555555555" ||
                cpf == "66666666666" ||
                cpf == "77777777777" ||
                cpf == "88888888888" ||
                cpf == "99999999999")
            return false;
        // Valida 1o digito	
        add = 0;
        for (i = 0; i < 9; i ++)
            add += parseInt(cpf.charAt(i)) * (10 - i);
        rev = 11 - (add % 11);
        if (rev == 10 || rev == 11)
            rev = 0;
        if (rev != parseInt(cpf.charAt(9)))
            return false;
        // Valida 2o digito	
        add = 0;
        for (i = 0; i < 10; i ++)
            add += parseInt(cpf.charAt(i)) * (11 - i);
        rev = 11 - (add % 11);
        if (rev == 10 || rev == 11)
            rev = 0;
        if (rev != parseInt(cpf.charAt(10)))
            return false;
        return true;
    }

    function validarCNPJ(cnpj) {

        cnpj = cnpj.replace(/[^\d]+/g, '');

        if (cnpj == '')
            return false;

        if (cnpj.length != 14)
            return false;

        // Elimina CNPJs invalidos conhecidos
        if (cnpj == "00000000000000" ||
                cnpj == "11111111111111" ||
                cnpj == "22222222222222" ||
                cnpj == "33333333333333" ||
                cnpj == "44444444444444" ||
                cnpj == "55555555555555" ||
                cnpj == "66666666666666" ||
                cnpj == "77777777777777" ||
                cnpj == "88888888888888" ||
                cnpj == "99999999999999")
            return false;

        // Valida DVs
        tamanho = cnpj.length - 2
        numeros = cnpj.substring(0, tamanho);
        digitos = cnpj.substring(tamanho);
        soma = 0;
        pos = tamanho - 7;
        for (i = tamanho; i >= 1; i--) {
            soma += numeros.charAt(tamanho - i) * pos--;
            if (pos < 2)
                pos = 9;
        }
        resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
        if (resultado != digitos.charAt(0))
            return false;

        tamanho = tamanho + 1;
        numeros = cnpj.substring(0, tamanho);
        soma = 0;
        pos = tamanho - 7;
        for (i = tamanho; i >= 1; i--) {
            soma += numeros.charAt(tamanho - i) * pos--;
            if (pos < 2)
                pos = 9;
        }
        resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
        if (resultado != digitos.charAt(1))
            return false;

        return true;

    }

    $(".open-register").click(function (e) {
        e.preventDefault();

        var type = $(this).attr('id');

        $(".user-register").hide();
        $("." + type + " form").fadeIn();

        return false;
    });

    $(".back-type").click(function (e) {
        e.preventDefault();

        $(".user form, .counter form").hide();

        $(".user-register").show();

        return false;
    });

    $("#contato").submit(function (e) {
        e.preventDefault();

        let email = $("#email").val();
        let title = $("#title").val();
        let text = $("#text").val();

        $('#message').css('display', 'none');

        if (email == "" || title == "" || text == "") {
            $('#message').css('display', 'block');
            $('#message').html('Voce deve preencher todos os campos');
            return false;
        }

        let form = $(this);
        let formData = form.serialize();

        $.ajax({
            url: "contact",
            method: "post",
            data: formData,
            beforeSend: function () {
                $('#message').css('display', 'block');
                $('#message').html('Aguarde...');
            },
            success: function (data) {
                var dataJSON = JSON.parse(data);
                $("#message").css('display', 'block');
                $('#message').html(dataJSON.message);
            },
            error: function (e) {
                $('#message').css('display', 'block');
                $('#message').html(e.responseText);
            }
        });

        return false
    });

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

    $("#form-edit-plan").ready(function () {
        var id = $("#id_plano").val();
        $.ajax({
            url: "edit-plan",
            method: "POST",
            data: {
                id: id,
                type: "select-plan"
            },
            dataType: "json",
            success: function (data) {
                $("#form-edit-plan #name").val(data.name);
                $("#form-edit-plan #value").val(floatToReal(data.value));
                $("#form-edit-plan #qtdeXML").val(data.qtdeXML);
                $("#form-edit-plan #description").val(data.description);
            }, error: function (e) {
                console.log(e);
            }
        });
    });

    $("#form-edit-plan").submit(function (e) {
        e.preventDefault();

        let name = $("#name").val();
        let value = $("#value").val();
        let qtdeXML = $("#qtdeXML").val();
        let description = $("#description").val();
        let id = $("#id_plano").val();

        if (name == "" || value == "" || qtdeXML == "" || description == "") {
            $('#message').css('display', 'block');
            $('#message').html('Voce deve preencher os campos obrigatorios');
            return false;
        }

        if (value < 0) {
            $('#message').css('display', 'block');
            $('#message').html('O preço do plano não pode ser maior que 0');
            return false;
        }

        if (qtdeXML <= 0) {
            $('#message').css('display', 'block');
            $('#message').html('A quantidade de XMLs não pode ser menor ou igual a zero');
            return false;
        }

        let form = $(this);
        let formData = form.serialize();
        formData += '&type=update-plan&id=' + id;

        $.ajax({
            url: "edit-plan",
            method: "POST",
            data: formData,
            dataType: "json",
            success: function (data) {
                $("#message").css('display', 'block');
                $("#message").html(data.message);
            }, error: function (e) {
                $('#message').css('display', 'block');
                $('#message').html(e.responseText);
            }
        });

        return false;
    });

    $("#plans, #plans-list").ready(function () {
        $.ajax({
            url: "plan",
            method: "POST",
            data: {
                type: "plan-list"
            },
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, value) {

                    let valueReal = floatToReal(value.value);

                    let html = '<div id="' + value._id + '" class="plan"><h2 class="plan-heading">' + value.name + '</h2><div class="plan-subheading">$' + valueReal + '/mes</div><p>Armazenamento de ' + value.qtdeXML + ' XMLs</p><p>' + value.description + '</p></div>';
                    $("#plans").append(html);
                    html = "<tr><td>" + value.name + "</td><td>" + value.description + "</td><td>" + valueReal + "</td><td>" + value.qtdeXML + "</td><td><a href='edit-plan?id=" + value._id + "' class='btn btn-primary'>Editar</a><button class='delete-plan btn btn-primary' id='" + value._id + "'>Excluir</button></td></tr>";
                    $("#plans-list tbody").append(html);
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

    $(document).on('click', '.delete-plan', function (e) {
        e.preventDefault();

        var id = $(this).attr('id');
        var $this = $(this);

        if (!confirm("Tem certeza que deseja excluir esse plano?")) {
            return false;
        }

        $.ajax({
            url: "plan",
            type: "POST",
            data: {
                type: "plan-delete",
                id: id
            }, success: function (data) {
                $this.parent().parent().remove();
            }, error: function (e) {
                console.log(e);
            }
        });

        return false;
    });

    $("#plan-register").submit(function (e) {
        e.preventDefault();

        let name = $("#name").val();
        let value = $("#value").val();
        let qtdeXML = $("#qtdeXML").val();
        let description = $("#description").val();

        //Format value with mask on Real format to float
        var valueReal = (value).toLocaleString('pt-BR');
        var valueDecimal = valueReal.replace(".", "");
        var separatorPosition = valueDecimal.charAt(valueDecimal.length - 3);
        var valueFloat = valueDecimal.replace(separatorPosition, ".");

        if (name == "" || value == "" || qtdeXML == "" || description == "") {
            $('#message').css('display', 'block');
            $('#message').html('Voce deve preencher os campos obrigatorios');
            return false;
        }

        if (value < 0) {
            $('#message').css('display', 'block');
            $('#message').html('O preço do plano não pode ser maior que 0');
            return false;
        }

        if (qtdeXML <= 0) {
            $('#message').css('display', 'block');
            $('#message').html('A quantidade de XMLs não pode ser menor ou igual a zero');
            return false;
        }

        let form = $(this);
        let formData = form.serialize();
        formData += '&type=plan-create&valueFloat=' + valueFloat;

        $.ajax({
            url: "plan",
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

    $("#counter-register").submit(function (e) {
        e.preventDefault();

        let fullname = $("#counter-register #fullname").val();
        let email = $("#counter-register #email").val();
        let cpf = $("#counter-register #cpf").val();
        let gender = $("#counter-register #gender").val();
        let password = $("#counter-register #password").val();
        let confirm = $("#counter-register #confirm").val();

        $('#message').css('display', 'none');

        if (fullname == "" || email == "" || cpf == "" || gender == "" || password == "" || confirm == "") {
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

        if (password.length < 6) {
            $('#message').css('display', 'block');
            $('#message').html('A senha deve ser maior que 6 digitos');
            return false;
        }

        let form = $(this);
        let formData = form.serialize();
        formData += '&type=counter';

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

    $("#employee-register").submit(function (e) {
        e.preventDefault();

        let name = $("#name").val();
        let nickname = $("#nickname").val();
        let cpf = $("#cpf").val();
        let gender = $("#gender").val();

        if (name == "" || cpf == "" || gender == "") {
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
});

function onlyNumber(e) {

    keyCodes = new Array(8, 9, 37, 39, 46);

    for (x = 48; x <= 57; x++) {
        keyCodes.push(x);
    }

    for (x = 96; x <= 105; x++) {
        keyCodes.push(x);
    }

    keyCode = e.which;

    if ($.inArray(keyCode, keyCodes) != -1) {
        return true;
    }
    return false;
}

function onlyLetter(e) {

    var tecla = new Number();
    if (window.event) {
        tecla = e.keyCode;
    } else if (e.which) {
        tecla = e.which;
    } else {
        return true;
    }
    if ((tecla >= "48") && (tecla <= "57")) {
        return false;
    }
}

function formatPrice(text) {
    var er = /[^0-9.,]/;
    er.lastIndex = 0;
    var field = text;
    if (er.test(field.value)) {
        field.value = "";
    }
}

function floatToReal(value) {
    var numero = value.toFixed(2).split('.');
    numero[0] = numero[0].split(/(?=(?:...)*$)/).join('.');
    return numero.join(',');
}
