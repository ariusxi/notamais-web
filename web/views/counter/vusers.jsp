<%-- 
    Document   : vusers
    Created on : 08/10/2018, 18:38:26
    Author     : Isabela
--%>
<jsp:include page="../layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <ul class="nav nav-tabs">
        <li class="active">
            <a class="nav-link active" href="#listCounter" data-toggle="tab">Lista de Clientes</a>
        </li>
        
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="listCounter">
            <h2 class="title-register">Lista de Clientes</h2>
            <div class="table-responsive" id="counter-list">

            </div>
        </div>
        
            
        </div>
        </div>
    </div>
</div>
<div class="space-footer"></div>
<jsp:include page="../layout/footer-auth.jsp" />

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/counter/vusers.js" charset="utf-8"></script>    
