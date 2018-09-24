$(function(){
    $("#formulario").submit(function (e) {
        e.preventDefault();
        var name = $("#name").val();
        var description = $("#description").val();
        var user =  $("#user").val();
        var token = $("#token").val();
        var form = new FormData($(this)[0]);
        console.log($(this)[0]);
        $("#message").css('display', 'none');

        if(name == "" || description == ""){
            $("#message").css('display', 'block');
            $("#message").html('Voce deve preeencher todos os campos');
            return false;
        }

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
                $(".btnUploadXml").css('display','none');
                $("#message").html(response.message + '<a href="'+response.path+'" target"_blank" class="mt-2"> Clique aqui para abrir o seu arquivo</a>' );
                //window.location.href = "/views/user/cards.jsp";
                $(".text-file").text('Escolha um arquivo');
            },
            error: function (e) {
                alert('Erro ao carregar pagina');
            }
        });
            return false;
    });
    
    $(document).on('change', '#file', function(){
        var filename = $(this).val();
        filename = filename.split("\\");
        filename = filename[filename.length - 1];
        $(".text-file").text(filename);
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
                    var name = value.name;
                    if(value.name == undefined){
                        name = "-";
                    }
                    $("#xml-list tbody").append("<tr><td>"+(i+1)+"</td><td>"+name+"</td><td><a target='_blank' title='"+value.xml+"' href='"+value.xml+"'>Acessar</a></td><td>"+value.date+"</td></tr>");
                });
            },error: function(e){
                console.log(e);
            }
        });
    });
});