$(function () {
    meusContadores();
    $("a[href='#listCounter']").click(meusContadores);
});

$("#btnPesquisarContador").click(function () {
    if ($("#pesquisar").val() == "") {
        $("#pesquisar").focus();
        return;
    }

    $("#message").hide();

    pesquisar();
});

function pesquisar() {
    $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type: "counters-list-search",
            search: $("#pesquisar").val()
        },
        success: function (json) {
            $("#add-counter-list").html("");
            //montar tabela
            var html = "";
            var contadores = JSON.parse(json);

            if (contadores.length == 0) {
                $("#message").html("Nenhum resultado encontrado");
                $("#message").show();
                return;
            }

            html += "<table  class='display table text-center'>";
            html += "<thead>";
            html += "<tr>";
            html += "<th>Nome</th>";
            html += "<th>Email</th>";
            html += "<th>Nickname</th>";
            html += "<th>CPF</th>";
            html += "<th>Aç&otilde;es</th>";
            html += "</tr>";
            html += "</thead>";
            html += "<tbody>";

            var c = 0;
            for (var i = 0; i < contadores.length; i++) {

                var contador = contadores[i];

                if (contador.pending == 0) {
                    c++;
                    html += "<tr>";
                    html += "<td>" + contador.counter.name + "</td>";
                    html += "<td>" + contador.counter.email + "</td>";
                    html += " <td>" + contador.profile.nickname + "</td>";
                    html += "<td>" + contador.profile.cpf + "</td>";

                    var btnInviteCounter = "<button type='button' class='btn btn-primary' data-id-contador='" + contador.counter._id + "' onClick='convidar(this)' >Enviar solicitaç&atilde;o</button>";
                    var btnCounterDetails = "<button type='button' class='btn btn-primary' data-id-contador='" + contador.counter._id + "' onClick='counterDetails(this)' >Detalhes</button>"

                    html += "<td>" + btnInviteCounter + btnCounterDetails + "<td>";
                    html += "</tr>";
                }
            }

            html += "</tbody>";
            html += "</table>";

            if (c > 0) {
                $("#add-counter-list").append(html);
            } else {
                $("#message").html("Nenhum resultado encontrado");
                $("#message").show();
            }

        }, error: function (e) {
            console.log(e);
        }
    });
}

function meusContadores() {
    montarLista();
}

function montarLista() {
    $("#message").hide();

    $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type: "counters-list",
        },

        success: function (json) {
            $("#counter-list").html("");
            //montar tabela
            var html = "";
            var convites = JSON.parse(json);

            html += "<table  class='display table'>";
            html += "<thead>";
            html += "<tr>";
            html += "<th>Nome</th>";
            html += "<th>Email</th>";
            html += "<th>Status</th>";
            html += "<th>Aç&otilde;es</th>";
            html += "</tr>";
            html += "</thead>";
            html += "<tbody>";

            for (var i = 0; i < convites.length; i++) {

                var convite = convites[i];
                html += "<tr>";
                html += "<td>" + convite.counter.name + "</td>";
                html += "<td>" + convite.counter.email + "</td>";
                html += " <td>" + (convite.approved ? "Aprovado" : "Aguardando aprovaç&atilde;o") + "</td>";
                html += "<td><button type='button' data-id-convite='" + convite._id + "' onclick='excluir(this)' class='btn btn-primary'>Excluir</button></td>";
                html += "</tr>";
            }

            html += "</tbody>";
            html += "</table>";

            $("#counter-list").append(html);

            $("#counter-list > table").dataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
                }
            });

        }, error: function (e) {
            console.log(e);
        }
    });
}

function convidar(btn) {
    $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type: "add-counter",
            idContador: $(btn).attr("data-id-contador")
        },
        success: function (json) {

            $(btn).closest("tr").remove();

        }, error: function (e) {
            console.log(e);
            var msg = JSON.parse(json);
            $("#message").html(msg.mensagem);
            $("#message").show();
        }
    });
}

function counterDetails(btn) {
    $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type: "counter-details",
            idContador: $(btn).attr("data-id-contador")
        },
        success: function (response) {
            var json = JSON.parse(response);

            var data = json.data;
            var jobs = json.jobs;
            var profile = json.profile;

            $("#photoCounter").html("<img src='" + data.image + "' class='img-fluid' alt='Sem imagem'>");
            $("#nameCounter").text(data.name);
            $("#emailCounter").text(data.email);

            $("#cpfCounter").text(profile.cpf);
            $("#genderCounter").text(profile.gender);
            $("#nicknameCounter").text(profile.nickname);

            var html = "";

            for (var i = 0; i < jobs.length; i++) {
                html += "<div class='row'>";
                html += "<div class='col-md-6'>";
                html += jobs[i].user.name;
                html += "</div>";
                html += "<div class='col-md-6'>";
                html += jobs[i].user.email;
                html += "</div></div>";
            }

            $("#jobsCounter").append(html);
            $("#modalCounterDetails").modal("show");

        }, error: function (e) {
            console.log(e.responseText);
        }
    });
}

/* FUNÇÃO EXCLUIR
 function excluir(btn){ 
 $.ajax({
 url: "counters",
 method: "POST",
 data: {
 type : "delete-counter",
 idConvite : $(btn).attr("data-id-convite")
 },
 
 success: function(json){
 $(btn).closest("tr").remove();
 
 },error: function(e){
 console.log(e);
 var msg = JSON.parse(json);
 $("#message").html(msg.mensagem); 
 $("#message").show();
 }
 });
 }  */
