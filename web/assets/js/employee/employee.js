
$("#employee-list").ready(function (e) {
    $.ajax({
        url: "employee",
        method: "POST",
        data: {
            type: 'employee-list'
        },
        dataType: "json",
        success: function (data) {
            console.log(data);

            var months = [],
                    values = [];

            months['meses'] = [],
                    months['values'] = [];

            $.each(data, function (i, value) {
                let nickname = "Não informado";

                if (value.person.nickname != "") {
                    nickname = value.person.nickname;
                }

                let html = "<tr><td>" + value.person.name + "</td>";
                html += "<td>" + value.person.email + "</td>";
                html += "<td>" + value.person.createdAt + "</td>";
                html += "<td><button class='btn btn-primary delete-employee' id='" + value._id + "'>Excluir</button></td>";
                html += "</tr>";

                $("#employee-list tbody").append(html);

                var month = value.person.createdAt.split("-");
                month = getMes(month[1]);
                if (!in_array(month, months['meses'])) {
                    months['values'][month] = 1;
                    months['meses'].push(month);
                } else {
                    months['values'][month]++;
                }
            });

            for (var value in months.values) {
                values.push(months.values[value]);
            }

            $("#number-user").text(values[values.length - 1]);

            var ctx = document.getElementById("employee-chart").getContext('2d');

            var users_chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: months['meses'],
                    datasets: [{
                            label: 'Numero de funcionarios',
                            data: values,
                            backgroundColor: [
                                'rgba(255, 255, 255, 0.8)',
                                'rgba(255, 255, 255, 0.8)',
                                'rgba(255, 255, 255, 0.8)',
                                'rgba(255, 255, 255, 0.8)',
                                'rgba(255, 255, 255, 0.8)',
                                'rgba(255, 255, 255, 0.8)'
                            ],
                            borderColor: [
                                'rgba(255,255,255,1)',
                                'rgba(255, 255, 255, 1)',
                                'rgba(255, 255, 255, 1)',
                                'rgba(255, 255, 255, 1)',
                                'rgba(255, 255, 255, 1)',
                                'rgba(255, 255, 255, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
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


            
        },
        error: function (e) {
            $('#message').css('display', 'block');
            $('#message').html(e.responseText);
        }
    });

    return false;
});

