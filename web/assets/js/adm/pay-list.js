var json = $("#JSON").val();
var pagamentos = JSON.parse(json); 

var dataInicio = new Date($('#dt_de').val());
var dataFim = new Date($('#dt_ate').val());
var soma = 0;
var cont = 0;

$.each(pagamentos, function (i, value) {
    var u = value.user;
    var date = new Date(value.date);
    var customDate = new Date(date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate());

    cont++;
    if(value.user == null)
        soma += 0;
    else
        soma += value.value;

 });

soma = soma.toFixed(2).replace(".", ",");

$("#totalPgto").html(cont);
$("#totalGeral").html(soma);

