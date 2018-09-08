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

    return false
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
                
                $.each(data, function (i, value) {
                    let roles = value.roles[0];
                    let html = "<tr><td>" + value.name + "</td><td>" + value.email + "</td><td><a href='user-profile?id=" + value._id + "' class='btn btn-primary'>Perfil</a>&nbsp;<button class='btn btn-primary btnAtivacao' data-id='" + value._id + "'data-ativo='" + value.active + "'>" + (value.active?"Desativar":"Ativar") + "</button></td></tr>";

                    if (roles == "user") {
                        $("#users-list tbody").append(html);
                    }
                    else if(roles == "counter")
                    {
                        $("#counter-list tbody").append(html);
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
/* FORMAS DE PAGAMENTO  */

$(function () {
			//validação do campo
			$("#registrar").click(function(){
       			$("input").each(function (index, item) { 

					var obj = $(item);
					if(obj.val("#list") == "") {
						obj.removeClass("sucesso");
						obj.addClass("erro");

						if(item.name === "bol"){
	 						$("#alerta1").fadeIn(3000);
		   				}
		   				if(item.name === "cred"){
	 						$("#alerta2").fadeIn(3000);
		   				}
		   				if(item.name === "deb"){
	 						$("#alerta3").fadeIn(3000);
		   				}
		   			}
		   			else {
						obj.removeClass("erro");
						obj.addClass("sucesso");

						if(item.name === "bol"){
	 						$("#alerta1").hide();
		   				}
		   				if(item.name === "cred"){
	 						$("#alerta2").hide();
		   				}
		   				if(item.name === "deb"){
	 						$("#alerta3").hide();
		   				}
		   			}

				});
					//pegar o valor do objeto pelo id
				if($("#bol").val() =="" || $("#cred").val() =="" || $("#deb").val() ==""){
		   				$("#contErro").fadeIn(3000);
		   				$("#contSuc").hide();
		   			}
		   		else{
		   			$("#contSuc").fadeIn(3000);	
		   			$("#contErro").hide();
		   		}
    		});
				
			$("#alerta1").hide();
			$("#alerta2").hide();
			$("#alerta3").hide();
			$("#contSuc").hide();
			$("#contErro").hide();
			//mostra msg escondida
			$("#conteudo").hide(); // esconde o conteudo do id
			
			$("#ajuda").click(function () {
				$("#conteudo").slideToggle("slow");
			});	
		});