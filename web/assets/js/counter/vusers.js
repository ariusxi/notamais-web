function meusContadores(){
    $.ajax({
        url: "vusers",
        method: "POST",
        data: {
            type : "counters-list",       
        }, success: function(json){
            $("#counter-list").html("");
            //montar tabela
            var html="";
            var convites = JSON.parse(json);
			
			html+="<table  class='display table'>";
            html+="<thead>";
            html+="<tr>";
            html+="<th>Nome</th>";
            html+="<th>Email</th>";
            html+="<th>Status</th>";
            html+="<th></th>";
            html+="</tr>";
            html+="</thead>";
            html+="<tbody>";       
            
            for(var i=0; i < convites.length; i++){
            
            var convite = convites[i];
                html+="<tr>";
                html+="<td>" + convite.user.name + "</td>";
                html+="<td>" + convite.user.email + "</td>";
                html+=" <td>" + (convite.approved?"Aprovado":"Aguardando aprovaç&atilde;o") + "</td>";
                html+="<td></td>";
                html+="</tr>";
            }
            html+="</tbody>";
            html+="</table>";

			$("#counter-list").append(html);
			$("#counter-list > table").dataTable({
				"language": {
				"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
				}
			});
          
        },error: function(e){
            console.log(e);
        }
    });
}

$(function(){  
    meusContadores();
    
    });