<jsp:include page="../layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <div class="tab-pane active" id="addCounter">
        <h2 class="title-register">Relatórios</h2>

        <div class="form-row">
            <div class="form-group col">
               <label>Cliente</label> 
               <select class="form-control fix-select-option" id="cliente" name="cliente">
                   <option>-</option>
               </select>
            </div>    
            <div class="form-group col">
               <label>De</label>
               <input type="date" class="form-control" id="txtDe" /> 
            </div>
            <div class="form-group col">
               <label>Até</label>
               <input type="date" class="form-control" id="txtAte" /> 
            </div>
            <div class="form-group col">
                <input type="submit" class="btn btn-dark" id="btnPesquisar" value="Pesquisar">

            </div>
        </div>  
        <div class="alert alert-info mt-2 mb-0" id="message" style="margin-bottom:100px !important;">

        </div>
        <div class="table-responsive" id="add-counter-list">

        </div>
    </div>
</div>
<div class="space-footer"></div>
<jsp:include page="../layout/footer-auth.jsp" />
    <script src="../../assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function(){
        $("#btnPesquisar").click(function(){
            location.href="/notamais-web/report";
        });    
    });
    
    function meusClientes(){
        $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type : "counters-list",
        },
        
        success: function(json){
            alert(json);
          
        },error: function(e){
            console.log(e);
        }
    });
}
</script>
    
