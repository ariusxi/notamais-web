$(function(){
    $("#formulario").submit(function (e) {
        e.preventDefault();
        var name = $("#name").val();
        var description = $("#description").val();
        var user =  $("#user").val();
        var token = $("#token").val();
        var form = new FormData($(this)[0]);
        $("#message").css('display', 'none');
        
        $("#message").css('display', 'block');
        $("#message").html("Enviando....");

        if(name == "" || description == ""){
            $("#message").css('display', 'block');
            $("#message").html('Voce deve preeencher todos os campos');
            return false;
        }
        
        $(".btnUploadXml").prop("disabled", true);

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
                $("#message").removeClass('alert-danger').addClass('alert-info');
                $("#message").css('display', 'block');
                $(".btnUploadXml").css('display','none');
                $("#message").html(response.message + '<a href="'+response.path+'" target"_blank" class="mt-2"> Clique aqui para abrir o seu arquivo</a>' );
                //window.location.href = "/views/user/cards.jsp";
                $(".text-file").text('Escolha um arquivo');
                $(".btnUploadXml").prop("disabled", false);
            },
            error: function (e) {
                var dataJSON = JSON.parse(e.responseText);
                $("#message").removeClass('alert-info').addClass('alert-danger');
                $("#message").css('display', 'block');
                $("#message").html(dataJSON.message);
                $(".btnUploadXml").prop("disabled", true);
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
                
                $("#xml-list").dataTable({
                    "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
                    }
                });
                
            },error: function(e){
                console.log(e);
            }
        });
        
       
        
        
        
    });
});