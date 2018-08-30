<jsp:include page="../layout/header-auth.jsp" />
<div class="col-sm-12 col-md-9 col-lg-9">
    <form action="" method="POST" id="form-edit-plan">
        <input type="hidden" name="id_plano" id="id_plano" value="<% out.print(request.getParameter("id"));%>">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <h1 class="title-register">Editar plano</h1>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="form-group">
                    <label for="name">Nome do Plano</label>
                    <input type="text" class="form-control"  placeholder="Titulo" name="name" id="name">
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-6">
                <div class="form-group">
                    <label for="value">Preço</label>
                    <input type="text" class="form-control" placeholder="Preço" name="value" id="value">
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label for="value">Preço</label>
                <input type="text" class="form-control" placeholder="Preço" name="value" id="value" onkeydown=" formatPrice(this)">
            </div>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label for="qtdeXML">Quantidade de XML</label>
                <input type="number" class="form-control cpf" placeholder="Quantidade de XML" name="qtdeXML" id="qtdeXML">
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="form-group">
                <label for="description">Descrição do Plano</label>
                <textarea class="form-control" placeholder="Descrição do Plano" id="description" name="description"></textarea>
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <input type="submit" class="btn btn-primary" value="Alterar">
            <input type="button" class="btn btn-primary" value="Voltar">
        </div>
</div>
</form>
<div class="alert alert-info mt-2 mb-0" id="message" style="margin-bottom:100px !important;">

</div>
</div>
<div class="space-footer"></div>

<jsp:include page="../layout/footer.jsp" />

<script type="text/javascript">

    $(function () {
        $('#name').bind('keydown', onlyLetter);
        $('#qtdeXML').bind('keydown', onlyNumber);
    });

    $(document).ready(function ()
    {
        $("#value").maskMoney({
            decimal: ",",
            thousands: "."
        });
    });

</script>

