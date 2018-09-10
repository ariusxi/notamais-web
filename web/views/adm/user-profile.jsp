<jsp:include page="../layout/header-auth.jsp"/>
<div class="col-sm-12 col-md-12 col-lg-12">
    <div class="card">
        <div class="card-body">
                <div class="form-row">
                    <div class="form-group col-md-6 ">
                        <label>Nome:</label>
                        <input type="text" class="form-control" id="name" name="name" value="" disabled=""/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Email:</label>
                        <input type="text" class="form-control" id="email" name="email" value="" disabled=""/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label>Nickname:</label>
                        <input type="text" class="form-control" id="nickname" name="nickname" disabled=""/>
                    </div>
                    <div class="form-group col-md-4">
                        <label>CPF:</label>
                        <input type="text" class="form-control" id="cpf" name="cpf" disabled=""/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Gênero:</label>
                        <input type="text" class="form-control" id="gender" name="gender" disabled=""/>
                    </div>
                </div>
                <div class="form-row" id="camposUsuario">
                    <div class="form-group col-md-3">
                        <label>Nome fantasia:</label>
                        <input type="text" class="form-control" id="namefantasy" name="namefantasy" disabled=""/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>CNPJ</label>
                        <input type="text" class="form-control" id="cnpj" name="cnpj" disabled=""/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>IE</label>
                        <input type="text" class="form-control" id="ie" name="ie" disabled=""/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Telefone</label>
                        <input type="text" class="form-control" id="telephone" name="telephone" disabled=""/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Plano</label>
                        <input type="text" class="form-control" id="plano" name="plano" disabled=""/>
                    </div>
                </div>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp"/>
<script type="text/javascript">
$(document).ready(function () {
    var json = '<%= request.getAttribute("user")%>';   
    var json2 = '<%= request.getAttribute("plano")%>';

    var obj = JSON.parse(json);
    if(obj.user.roles == "counter"){
        $("#camposUsuario").hide();
    }
    
    $("#name").val(obj.user.name);
    $("#email").val(obj.user.email);
    $("#nickname").val(obj.profile[0].nickname);
    $("#cpf").val(obj.profile[0].cpf);
    $("#gender").val(obj.profile[0].gender); 
    $("#namefantasy").val(obj.client[0].fantasia);
    $("#cnpj").val(obj.client[0].cnpj);
    $("#ie").val(obj.client[0].ie);
    $("#telephone").val(obj.client[0].telephone);
 
    if(json2 != "")
    {
        var plano = JSON.parse(json2);
        $("#plano").val(plano.name); 
    }
    else
    {
        $("#plano").val("Sem plano");
    }
});
</script>