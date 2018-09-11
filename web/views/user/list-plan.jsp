<jsp:include page="../layout/header-auth.jsp"/>

<div class='col'>
        <h2>Lista de planos</h2>
        <hr />
    <div id="accordion">
    </div>
    <br />
    <a href="user-plan" class="btn btn-secondary">Voltar</a>
</div>

<!-- Modal para selecionar o cartão -->
<div class="modal" tabindex="-1" role="dialog" id="modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <p>Selecione um cartão.</p>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">Cartões</label>
                </div>
                <select class="custom-select" id="slcCartoes"></select>
                <input type="hidden" id="idPlano" value="" />
            </div>
            <a href="#" data-target="#modalCadastro" data-toggle="modal">+ Cadastrar um novo cartão</a>
            <div class="alert alert-info mb-0 mt-2" id="message">

            </div>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="salvarPlano();">Salvar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal para cadastro do cartão -->
<div class="modal fade bd-example-modal-lg" tabindex="-1"  aria-labelledby="myLargeModalLabel" aria-hidden="true" role="dialog" id="modalCadastro">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Adicionar um cartão de crédito</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    <div class="modal-body">
 
        <div class="tab-pane" id="register">
            <form action="" method="POST" id="card-register">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="number">Número do cartão</label>
                            <input type="number" class="form-control"  placeholder="Número do cartão" name="number" id="number">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="holder">Titular</label>
                            <input type="text" class="form-control" placeholder="Titular" name="holder" id="holder">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="expiration-date">Data de expiração</label>
                            <input type="text" class="form-control expirationDate" placeholder="Data de expiração" name="expiration-date" id="expiration-date">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="security-code">Código de Segurança</label>
                            <input type="text" class="form-control securityCode" placeholder="Código de segurança" size="4" max="4" name="security-code" id="security-code">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="brand">Bandeira</label>
                            <select class="form-control" id="brand" name="brand">
                                <option value="" selected="">Bandeira</option>
                                <option value="master">Master</option>
                                <option value="visa">Visa</option>
                                <option value="elo">Elo</option>
                                <option value="amex">Amex</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="card-type">Tipo:</label>
                            <select class="form-control" id="card-type" name="card-type">
                                <option value="">Tipo</option>
                                <option value="CreditCard">Cartão de Crédito</option>
                                <option value="DebitCard">Cartão de Débito</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <input type="submit" class="btn btn-secondary" value="Cadastrar">
                        <input type="button" class="btn btn-secondary" value="Voltar" data-dismiss="modal" onclick="getCartoes();">
                    </div>
                </div>
            </form>
            <div class="alert alert-info mt-2 mb-0" id="message" style="margin-bottom:100px !important;">

            </div>
        </div>
    </div>  
 
    </div>
    </div>
  </div>
</div>




<script>
    var json = '<%= request.getAttribute("planos")%>';

    
    var planos = JSON.parse(json);
    
    window.onload = function(){

        
        var html="";
        var json2 = '<%= request.getAttribute("plano")%>';
        var p = JSON.parse(json2);

        for(var i=0; i < planos.length; i++)
        {
            var plano = planos[i]; 
            
            html+="<div class='card'>";
            html+="<div class='card-header'>";
            html+="<h5 class='mb-0'>";
            html+="<button class='btn btn-link' data-toggle='collapse' data-target='#collapseOne' aria-expanded='true' aria-controls='collapseOne'>";
            html+= plano.name;
            html+="</button>";
            html+="</h5>";
            html+="</div>";
            html+="<div class='collapse show' aria-labelledby='headingOne' data-parent='#accordion'>";
            html+="<div class='card-body'>";
            html += "<p class='card-text' id='descricao'>" + plano.description + "</p>";
            html += "<strong class='card-text' id='preco'>" + "R$" + plano.value.toFixed(2).replace(".", ",") + "/mês" + "</strong>";
            html += "<br /><br />";
            if (p.plan._id != plano._id) {
                html += "<button type='button' class='btn btn-primary' onclick='selecionarPlano(this);' data-toggle='modal' data-plano='" + i + "' data-target='#modal'>";
                html+= "Contratar";
            }
            else
            {
                html += "<button type='button' class='btn btn-danger' disabled='disabled'>";
                html += "Plano atual";
            }
            html+="</button>";
            html+="</div>";
            html+="</div>";
            html+="</div>";
            
        }

        
        $("#accordion").append(html);
        $("#accordion .btn-link").click(function(){
            var card = $(this).closest(".card");
            var col = $(card).find(".collapse");
            $(col).collapse('toggle')    
        });
        $('.collapse').collapse('toggle')
    };

    function selecionarPlano(btn){
        var i = $(btn).attr("data-plano");
        var p = planos[i];
        
        $("#idPlano").val(p._id);
        var m = $("#modal");
        $(m).find(".modal-title").html(p.name + " - R$" + p.value.toFixed(2).replace(".", ","));
        
        getCartoes();
    }    
    
    function getCartoes(){
        $.ajax({
            url: "card",
            method: "POST",
            
            data: {
                methodType: "card-list"
            },
            dataType: "json",
            success: function (data) {
                    var html = "";

                $.each(data, function (i, value) {

                    html += "<option value='" + value._id + "' " + (value.selected ? "selected= 'selected'": "") + "> Cartão de " + (value.type == "DebitCard"?"débido":"crédito") + " - " + value.Brand.toUpperCase() + " com final "  + value.CardNumber.substr(-4) + "</option> ";        
                    $("#slcCartoes").html(html);
                });

            }, error: function (e) {
                console.log(e);
            }
        });   
    }
    
    function salvarPlano(){
        var idPlano = $("#idPlano").val();
        var idCartao = $("#slcCartoes").val();
        
        $("#message").css('display', 'none');
        
        $.ajax({
            url: "list-plan",
            type: "POST",
            data: {
                methodType: "contracts-change",
                idPlano : idPlano, 
                idCartao : idCartao
            }, success: function (data) {
                var responseData = JSON.parse(data);
                $("#message").css('display', 'block');
                $("#message").html(responseData.message);
                setTimeout(function(){
                    location.href = "/notamais-web/user-plan"
                }, 2000);
            }, error: function (e) {
                alert(e);
            }
        });
    }
</script>