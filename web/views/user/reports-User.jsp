<jsp:include page="../layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <div class="tab-pane active" id="addCounter">
        <h2 class="title-register">Relatórios</h2>
        <form id="report" method="" action="">
            <div class="form-row">
                <input data-type='hidden' type="hidden" id="cliente" name="cliente" value="<%out.print(session.getAttribute("id"));%>">          
                <div class="form-group col-sm-12 col-md-3 col-lg-3">
                   <label>De</label>
                   <input type="date" class="form-control" id="begin" /> 
                </div>
                <div class="form-group col-sm-12 col-md-3 col-lg-3">
                   <label>Até</label>
                   <input type="date" class="form-control" id="end" /> 
                </div>
                <div class="form-group col-sm-12 col-md-3 col-lg-3">
                    <input type="submit" class="btn btn-dark" id="btnPesquisar" value="Pesquisar">
                </div>
            </div>  
            <div class="alert alert-info mt-2 mb-0" id="message" style="margin-bottom:100px !important;">

            </div>
            <div class="table-responsive" id="add-counter-list">
                
            </div>
        </form>
    </div>
</div>
<div class="space-footer"></div>
<jsp:include page="../layout/footer-auth.jsp" />  
<!--<script src="../../assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>  -->
    
