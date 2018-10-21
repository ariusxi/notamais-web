<jsp:include page="../layout/header-auth.jsp" />

<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <div class="tab-content">
        <div class="tab-pane active" id="listCounter">
            <h2 class="title-register">Lista de Clientes</h2>
            <table class="table-responsive" id="counter-list">
            </table>    
        </div>
        
    </div>
</div>
<div class="space-footer"></div>
<jsp:include page="../layout/footer-auth.jsp" />
<script type="text/javascript">
    $(function(){
        meusContadores();
    });
    
    function meusContadores(){
        $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type : "counters-list",
        },
        success: function(json){
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
            html+="<th>Aç&otilde;es</th>";
            html+="</tr>";
            html+="</thead>";
            html+="<tbody>";       
            
            for(var i=0; i < convites.length; i++){
            
            var convite = convites[i];
                if(convite.approved){
                    html+="<tr>";
                    html+="<td>" + convite.user.name + "</td>";
                    html+="<td>" + convite.user.email + "</td>";
                    html+=" <td>" + (convite.approved?"Aprovado":"Aguardando aprovaç&atilde;o") + "</td>";
                    html+="<td><a href='/notamais-web/lista-arquivos?cliente=" + convite.user._id + "' class='btn btn-primary'>Lista NFes</a></td>";
                    html+="</tr>"; 
                }             
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
</script>