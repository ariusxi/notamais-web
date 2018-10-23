/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
            $("#form-edit-plan #promotion").val(floatToReal(data.promotion));
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
    let promotion = $("#promotion").val();
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

    if (promotion != "" && promotion < 0) {
        $('#message').css('display', 'block');
        $('#message').html('O preço promocional do plano não pode ser maior que 0');
        return false;
    }

    if (qtdeXML <= 0) {
        $('#message').css('display', 'block');
        $('#message').html('A quantidade de XMLs não pode ser menor ou igual a zero');
        return false;
    }

    //Format value with mask on Real format to float
    var valueReal = (value).toLocaleString('pt-BR');
    var valueDecimal = valueReal.replace(".", "");
    var separatorPosition = valueDecimal.charAt(valueDecimal.length - 3);
    var valueFloat = valueDecimal.replace(separatorPosition, ".");

    //Format promotion with mask on Real format to float
    var promotionReal = (promotion).toLocaleString('pt-BR');
    var promotionDecimal = promotionReal.replace(".", "");
    var separatorPosition = promotionDecimal.charAt(promotionDecimal.length - 3);
    var promotionFloat = promotionDecimal.replace(separatorPosition, ".");

    let form = $(this);
    let formData = form.serialize();
    formData += '&type=update-plan&id=' + id + "&valueFloat=" + valueFloat + '&promotionFloat=' + promotionFloat;

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

$("#plans-list").ready(function(){
    montarListaPlan();
})

function montarListaPlan(){
    $("#register input[type=text]").val("");
    $("#register input[type=number]").val("");
    $("#register textarea").val("");
    $("#message").hide();
    
    $("#plans-list > tbody").html("");
    $.ajax({
        url: "plan",
        method: "POST",
        data: {
            type: "admin-list"
        },
        dataType: "json",
        success: function(data){
            
            $.each(data, function (i, value) {
                let valueReal = floatToReal(value.value);
                let promotion;

                if (value.promotion == null || value.promotion == "null") {
                    promotion = "";
                } else {
                    promotion = floatToReal(value.promotion);
                }
                var html = "<tr><td>" + value.name + "</td><td>" + value.description + "</td><td>" + valueReal + "</td><td>" + promotion + "</td><td>" + value.qtdeXML + "</td><td><div class='btn-group btn-group-toggle'><a href='edit-plan?id=" + value._id + "' class='btn btn-primary'>Editar</a>";
//html = "<button class='delete-plan btn btn-primary' id='" + value._id + "'>Excluir</button>";
                if (value.active) {
                    html += "<button class='btn btn-primary activate' id='" + value._id + "'>Ativado</button>";
                } else {
                    html += "<button class='btn btn-primary desactivate' id='" + value._id + "'>Desativado</button>";
                }
                html += "</div></td></tr>";
                $("#plans-list tbody").append(html);
            });
        }, error: function(e){
            console.log(e);
        } 
    });
}

$("#plans").ready(function () {
    $.ajax({
        url: "plan",
        method: "POST",
        data: {
            type: "plan-list"
        },
        dataType: "json",
        success: function (data) {
            var dark = false;
            $.each(data, function (i, value) {

                let valueReal = floatToReal(value.value);
                let promotion;

                if (value.promotion == null || value.promotion == "null") {
                    promotion = "";
                } else {
                    promotion = floatToReal(value.promotion);
                }
                var classe = 'bg-primary';
                var button = 'btn-white';
                if (dark == false) {
                    classe = '';
                    button = 'btn-primary';
                }
                
                let html = '<div class="col-md-4" id="' + value._id + '">';
                html += '<div class="card card-pricing ' + classe + '"><div class="card-body ">';
                html += '<div class="icon"><i class="material-icons">business</i></div>';
                if(promotion != "0,00"){
                  html += '<h3 class="card-title mb-0"> <strike> R$' + valueReal + ' </strike><h3 class="card-title mt-0">R$ ' + promotion +  '</h3></h3>';  
                }else{
                  html += '<h3 class="card-title">R$ ' + valueReal + '</h3>';  
                }
                html += '<p class="card-description"><p>Armazenamento de ' + value.qtdeXML + ' XMLs</p>';
                html += '<p>' + value.description + '</p>';
                html += '<a href="register?plan='+value._id+'" class="btn btn-round ' + button + '">Escolher esse plano</a>';
                html += '</div></div></div>';
                
                $("#plans").append(html);
                
                if (dark == false)
                    dark = true;
                else
                    dark = false;
            });
        }, error: function (e) {
            console.log(e);
        }
    });
});

$(document).on('click', ".activate, .desactivate", function (e) {
    e.preventDefault();

    var id = $(this).attr('id');
    var active = $(this).attr('class').split(" ")[2];
    var $this = $(this);

    if (active == 'activate') {
        active = false;
    } else {
        active = true;
    }

    $.ajax({
        url: "edit-plan",
        method: "POST",
        data: {
            type: "plan-activate",
            active: active,
            id: id
        },
        dataType: "json",
        success: function (data) {
            if (active == false) {
                $this.removeClass('activate');
                $this.addClass('desactivate');
                $this.text('Desativado');
            } else {
                $this.removeClass('desactivate');
                $this.addClass('activate');
                $this.text('Ativado');
            }
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
            $this.parent().parent().parent().remove();
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
    let promotion = $("#promotion").val();
    let qtdeXML = $("#qtdeXML").val();
    let description = $("#description").val();

    //Format value with mask on Real format to float
    var valueReal = (value).toLocaleString('pt-BR');
    var valueDecimal = valueReal.replace(".", "");
    var separatorPosition = valueDecimal.charAt(valueDecimal.length - 3);
    var valueFloat = valueDecimal.replace(separatorPosition, ".");

    //Format promotion with mask on Real format to float
    var promotionReal = (promotion).toLocaleString('pt-BR');
    var promotionDecimal = promotionReal.replace(".", "");
    var separatorPosition = promotionDecimal.charAt(promotionDecimal.length - 3);
    var promotionFloat = promotionDecimal.replace(separatorPosition, ".");

    if (name == "" || value == "" || qtdeXML == "" || description == "") {
        $('#message').css('display', 'block');
        $('#message').html('Voce deve preencher os campos obrigatorios');
        return false;
    }

    if (value < 0) {
        $('#message').css('display', 'block');
        $('#message').html('O preço do plano não pode ser menor que 0');
        return false;
    }

    if (promotion < 0) {
        $('#message').css('display', 'block');
        $('#message').html('O preço promo do plano não pode ser menor que 0');
        return false;
    }

    if (qtdeXML <= 0) {
        $('#message').css('display', 'block');
        $('#message').html('A quantidade de XMLs não pode ser menor ou igual a zero');
        return false;
    }

    let form = $(this);
    let formData = form.serialize();
    formData += '&type=plan-create&valueFloat=' + valueFloat + '&promotionFloat=' + promotionFloat;

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


