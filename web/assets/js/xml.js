$(function(){
    
    var fileobj;
    
    function upload_file(e){
        e.preventDefault();
        console.log(e);
        fileobj = e.dataTransfer.files[0];
        ajax_file_upload(fileobj);
    }
    
    function file_explorer(){
        document.getElementById('file').click();
        document.getElementById('file').onchange = function(){
            fileobj = document.getElementById('file').files[0];
            ajax_file_upload(fileobj);
        };
    }
    
    function ajax_file_upload(file_obj){
        if(file_obj != undefined){
            var user =  $("#user").val();
            var token = $("#token").val();
            var form = new FormData();
            
            $("#drag_upload_file").html('<p>Enviando....</p>');
            form.append('file', file_obj);
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
                    $("#drag_upload_file").html('<p>Arraste o arquivo arquivo</p><p>ou</p> <p><input type="button" value="Selecione um arquivo" class="btn btn-primary btn-rounded file"/></p><input type="file" id="file" name="file"/>');
                },
                error: function (e) {
                    $("#drag_upload_file").html('<p>Arraste o arquivo arquivo</p><p>ou</p> <p><input type="button" value="Selecione um arquivo" class="btn btn-primary btn-rounded file"/></p><input type="file" id="file" name="file"/>');
                }
            });
        }
    }
    
    $(".file").click(function(){
        file_explorer();
    });
    
    $("#drop_file_zone").on('drop', function(e){
        upload_file(e);
    });
    
    $("#drop_file_zone").on('dragover', function(){
        return false;
    })
    
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
    
    $("#imageUser").submit(function(){
        var formData = new FormData($(this)[0]);
        var user = $("#user").val();
        var token = $("#token").val();
        
        $.ajax({
            type: "POST",
            url: "https://notamaisapi.herokuapp.com/users/update-image/"+user,
            headers: { 'x-access-token': token },
            data: formData,
            contentType: false,
            cache: false,
            processData: false,
            dataType: "json",
            success: function (response) {
                $("#feedback-image").css('display', 'block');
                $("#feedback-image").html(response.message);
                console.log(response);
                setTimeout(function(){
                    window.location.href = window.location.href + '?image=' + response.path;
                }, 2000);
            },
            error: function (e) {
                var dataJSON = JSON.parse(e.responseText);
                $("#feedback-image").removeClass('alert-info').addClass('alert-danger');
                $("#feedback-image").css('display', 'block');
                $("#feedback-image").html(dataJSON.message);
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
    
    $(".activate-sefaz").click(function(){
        var id = $(this).attr('id');
        var $this = $(this);
        
        $.ajax({
            url: "upload-xml",
            method: "POST",
            data: {
                methodType: "activate-sefaz",
                id: id
            }, success: function(data){
                $this.parent().parent().removeClass('alert-warning').addClass('alert-success').html('<div class="container"><div class="alert-icon"><i class="material-icons">check</i></div>Sua conta esta ativada no SEFAZ</div>');
            }, error: function(e){
                console.log(e);
            }
        });
    });
    
    $(document).on('click', '.emitir-nota', function(){
        var id = $(this).attr('id');
        var $this = $(this);
        
        $.ajax({
            url: "upload-xml",
            method: "POST",
            dataType: "json",
            data: {
                methodType: "emitir-nota",
                file: id
            }, success: function(data){
                $this.prop("disabled", true);
                $this.parent().append("<button class='gerar-danfe btn btn-primary btn-rounded' id='"+id+"'>Gerar DANFE</button>");
            }, error: function(e){
                console.log(e);
            }
        });
    });
    
    $(document).on('click', '.gerar-danfe', function(e){
        e.preventDefault();
        
        var id = $(this).attr('id');
        var $this = $(this);
        
        alert(id);
        
        $.ajax({
            url: "upload-xml",
            method: "POST",
            dataType: "json",
            data: {
                methodType: "gerar-danfe",
                file: id
            }, success: function(data){
                console.log(data);
                $this.replaceWith("<a href='"+data.url+"' class='btn btn-primary btn-rounded' target='_blank'>Ver DANFE</a>");
            }, error: function(e){
                console.log(e);
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
                    var name = value.name;
                    if(value.name == undefined){
                        name = "-";
                    }
                    var html = "<tr><td>"+(i+1)+"</td><td>"+name+"</td><td><a target='_blank' title='"+value.xml+"' href='"+value.xml+"'>Acessar</a></td><td>"+value.date+"</td>";
                    if(value.nfe){
                        html += "<td><button class='emitir-nota btn btn-primary btn-rounded' id='"+value._id+"' disabled='disabled'>Emitir</button>";
                        if(!value.danfe){
                            html += "<button class='gerar-danfe btn btn-primary btn-rounded' id='"+value._id+"'>Gerar DANFE</button>";
                        }else{
                            html += "<a href='"+value.danfe+"' class='btn btn-primary btn-rounded' target='_blank'>Ver DANFE</a>";
                        }
                        html += "</td></tr>";
                    }else{
                        html += "<td><button class='emitir-nota btn btn-primary btn-rounded' id='"+value._id+"'>Emitir</button></td></tr>";
                    }
                    $("#xml-list tbody").append(html);
                    
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