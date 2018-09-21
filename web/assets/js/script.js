$(function () {

    $('.cpf').mask('000.000.000-00', {reverse: true});
    $('.cnpj').mask('00.000.000/0000-00', {reverse: true});
    $('.telephone').mask('(00) 0000-0000');
    $('.expirationDate').mask('00/0000');
    $('.securityCode').mask('0000');
    $('.telephone').mask('(99) 9999-9999');

    $("#modalQuickView").on('show.bs.modal', function () {
        $("#uno3").appendTo($("#card1"));
        $("#uno3").appendTo($("#card2"));
        $("#uno3").appendTo($("#card3"));
    });

});

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

    return false;
});

$("#users-list").ready(function () {
    $.ajax({
        url: "users",
        method: "post",
        data: {
            type: "users-list"
        },
        dataType: "json",
        success: function (data) {
            var months = [],
                values = [];
            months['meses'] = [],
            months['values'] = [];
            $.each(data, function (i, value) {
                let roles = "";
                if(value.roles != undefined){
                    roles = value.roles[0];
                }
                let html = "<tr><td>" + value.name + "</td><td>" + value.email + "</td><td><a href='user-profile?id=" + value._id + "' class='btn btn-primary'>Perfil</a>&nbsp;<button class='btn btn-primary btnAtivacao' data-id='" + value._id + "'data-ativo='" + value.active + "'>" + (value.active?"Desativar":"Ativar") + "</button></td></tr>";

                if (roles == "user") {
                    $("#users-list tbody").append(html);
                }
                else if(roles == "counter")
                {
                    $("#counter-list tbody").append(html);
                }
                var month = value.createdAt.split("-");
                month = getMes(month[1]);
                if(!in_array(month, months['meses'])){
                    months['values'][month] = 1;
                    months['meses'].push(month);
                }else{
                    months['values'][month]++;
                }
            });
            
            for(var value in months.values){
                values.push(months.values[value]);
            }
            
            var ctx = document.getElementById("user-chart").getContext('2d');
            
            var users_chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: months['meses'],
                    datasets: [{
                        label: 'Numeros de usuarios',
                        data: values,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.8)',
                            'rgba(54, 162, 235, 0.8)',
                            'rgba(255, 206, 86, 0.8)',
                            'rgba(75, 192, 192, 0.8)',
                            'rgba(153, 102, 255, 0.8)',
                            'rgba(255, 159, 64, 0.8)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true
                            }
                        }]
                    }
                }
            });

            $("#users-list").dataTable({
                "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
                }
            });
            $("#counter-list").dataTable({
                "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
                }
            });    
        }, error: function (e) {
            console.log(e);
        }
    });

});

$("#contaReceber").ready(function () {
        var json = $("#JSON").val();
        var pagamentos = JSON.parse(json);

        var html = "";
        $.each(pagamentos, function (i, value) {

            var u = value.user;
            var date = new Date(value.date);

            html += "<tr>";
            html += "   <td>" + (u != null ? u.name : "-") + "</td>";
            html += "   <td>" + date.getDate() + '/' + (date.getMonth() + 1) + '/' +  date.getFullYear() + "</td>";
            html += "   <td>" + (value.paymentType == "CreditCard" ? "Cr&eacute;dito" : "D&eacute;bito") + "</td>";
            html += "   <td> R$" + (u != null ? value.value.toFixed(2).replace(".", ","): "-") + "</td>";
            html += "</tr>";
        });

    $("#contaReceber tbody").html(html);

       $("#contaReceber").dataTable({
        "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
        }
    });
});


$(document).on('click', '.btnAtivacao', function (e) {
    e.preventDefault();

    var id = $(this).attr('data-id');    
    var ativo = $(this).attr('data-ativo');
    var newativo = true;
    if(ativo == "true"){
        newativo = false;
    }

    var $this = $(this);

    if (!confirm("Tem certeza que deseja " + (ativo == "true" ?"desativar":"ativar") + " esse usuario?")) {
        return false;
    }

    $.ajax({
        url: "users",
        type: "post",

        data: {
            type: "users-block",
            id: id
        }, success: function () {
            location.href = location.href;
        }, error: function (e) {
            console.log(e);
        }
    });

    return false;
});

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

function getMes(mes){
    switch(mes){
        case "01":
            return "Janeiro";
            break;
        case "02":
            return "Fevereiro";
            break;
        case "03":
            return "Março"
            break;
        case "04":
            return "Abril";
            break;
        case "05":
            return "Maio";
            break;
        case "06":
            return "Junho";
            break;
        case "07":
            return "Julho";
            break;
        case "08":
            return "Agosto";
            break;
        case "09":
            return "Setembro";
            break;
        case "10":
            return "Outubro";
            break;
        case "11":
            return "Novembro";
            break;
        case "12":
            return "Dezembro";
            break;
        default:
            return "Mês inválido";
            break;
    }
}

function in_array(value, array){
    var exist = false;
    for(var i = 0; i < array.length; i++)
        if(array[i] == value)
            exist = true;
    return exist;
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
