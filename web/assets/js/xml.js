$(function(){
    $("#formulario").submit(function (e) {
        e.preventDefault();
        var user =  $("#user").val();
        var token = $("#token").val();
        var form = new FormData($(this)[0]);
        console.log($(this)[0]);
        $("#message").css('display', 'none');



        $.ajax({
            type: "POST",
            url: "https://notamaisapi.herokuapp.com/files/send/"+user,
            headers: { 'x-access-token': token },
            data: form,
            contentType: false,
            cache: false,
            processData: false,
            dataType: "json",
            success: function (response) {
                $("#message").css('display', 'block');
                $("#message").html(response.message + '<a href="'+response.path+'" target"_blank">Clique aqui para abrir o seu arquivo</a>' );
                //window.location.href = "/views/user/cards.jsp";
            },
            error: function (e) {
                alert('Erro ao carregar pagina');
            }
        });
            return false;
    });

    $("#xml-list").ready(function(){
        $.ajax({
            url: "upload-xml",
            method: "POST",
            dataType: "json",
            data: {
                methodType: "list-xml"
            },
            success: function(data){
                $.each(data, function(i, value){
                    $("#xml-list tbody").append("<tr><td>"+(i+1)+"</td><td>"+value.name+"</td><td><a target='_blank' title='"+value.xml+"' href='"+value.xml+"'>Acessar</a></td><td>"+value.date+"</td></tr>");
                });
            },error: function(e){
                console.log(e);
            }
        });
    });
});