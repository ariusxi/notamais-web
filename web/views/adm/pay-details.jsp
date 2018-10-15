<%-- 
    Document   : pay-details
    Created on : 09/10/2018, 08:34:32
    Author     : lucas
--%>

<jsp:include page="../layout/header-auth.jsp" />

<div class="col-sm-12 col-md-12 col-lg-12 mt-5">
    <div class="col-sm-12 col-md-12 col-md-4">
        <div class="card">
            <div class="card-body cardPaymentDetail">
                <h3>Pagamento</h3>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="idPayment">ID</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="idPayment" name="idPayment" readonly/>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="datePayment">Data/Horário</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="datePayment" name="datePayment" readonly/>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="typePayment">Forma de pagamento</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="typePayment" name="typePayment" readonly/>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="totalPayment">Valor</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="totalPayment" name="totalPayment" readonly/>
                    </div>
                </div>
                <h3>Cliente</h3>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="idUser">ID</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="idUser" name="idUser" readonly/>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="nameUser">Nome</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="nameUser" name="nameUser" readonly/>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="emailUser">Email</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="emailUser" name="emailUser" readonly/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer-auth.jsp" />

<script>

    var paymentDetails = <%= request.getAttribute("paymentDetails")%>;
    var user = paymentDetails.user;
    var date = new Date(paymentDetails.date);

    $(".cardPaymentDetail #idPayment").val(paymentDetails._id);
    $(".cardPaymentDetail #datePayment").val(date.toLocaleString());
    $(".cardPaymentDetail #typePayment").val(paymentDetails.paymentType);
    $(".cardPaymentDetail #totalPayment").val("R$ " + paymentDetails.value);
    $(".cardPaymentDetail #idUser").val(user._id);
    $(".cardPaymentDetail #nameUser").val(user.name);
    $(".cardPaymentDetail #emailUser").val(user.email);

</script>
