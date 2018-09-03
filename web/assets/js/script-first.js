$(function(){
    
    $("#CardNumber").mask("9999 9999 9999 9999");
    $("#ExpirationDate").mask("99/99");
    $("#SecurityCode").mask("9999");
    
    $("#CardNumber").keyup(function(){
        $(".card-number").text($(this).val());
    });
    
    $("#Holder").keyup(function(){
        $(".card-name").text($(this).val());
    });
    
    $("#ExpirationDate").keyup(function(){
        $(".expiry").text($(this).val());
    });
    
    $("#Brand").change(function(){
        let brand = "master";
        if($(this).val() != ""){
            brand = $(this).val();
        }
        $("#brand").attr('src', '/notamais-web/assets/img/'+brand+'64.png');
    });
    
    $('.choice').on('click', function() {
        var type = $(this).attr('id');
        
        if(type == 'test'){
            $('.btn-next').hide();
            $('.btn-finish').show();
        }else{
            $('.btn-next').show();
            $('.btn-finish').hide();
        }
    });
    
    $(document).on('click', '.choice', function(){
        $(".choice").removeClass('active');
        $(this).addClass('active');
    });
    
    $("#plans").ready(function () {
        $.ajax({
            url: "plan",
            method: "POST",
            data: {
                type: "plan-list"
            },
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, value) {
                    let html = '<div class="col-sm-4"><div class="choice plan" data-toggle="wizard-radio" rel="tooltip" title="'+value.description+'"><input type="radio" name="pay-plan" class="pay-plan" value="'+value._id+'"><div class="icon"><i class="material-icons">archive</i></div><h6>'+value.name+'</h6><p>'+value.description+'</p></div></div>';
                    $("#plans").append(html);
                    html += "</div></td></tr>";
                });
            }, error: function (e) {
                console.log(e);
            }
        });
    });
    
    $(".btn-finish").click(function(){
        
        var type = $('input[name=plan]:checked', '#first-login').val()
        var plan = $(".plan.active").find('input').val();
        var CardNumber = $("#CardNumber").val();
        var Holder = $("#Holder").val();
        var ExpirationDate = $("#ExpirationDate").val();
        var SecurityCode = $("#SecurityCode").val();
        var Brand = $("#Brand").val();
        var method = "pay";
        
        $("#message").html("");
        
        if(type == ""){
            $("#message").html("<div style='color:red;'>Você deve escolher um tipo</div>");
            return false;
        }
        
        if((type == "pay" && plan == undefined) || (type == "" &&  plan == undefined)){
            $("#message").html("<div style='color:red;'>Você deve escolher um plano</div>");
            return false;
        }
        
        if(type == "pay" && plan != "" && (CardNumber == "" || Holder == "" || ExpirationDate == "" || SecurityCode == "" || Brand == "")){
            $("#message").html("<div style='color:red;'>Você deve informar os dados de cartão</div>");
            return false;
        }
        
        if(type == "test"){
            method = "test";
        }
        
        $.ajax({
            url: "first-login",
            method: "POST",
            dataType: "json",
            data: {
                type: type,
                plan: plan,
                CardNumber: CardNumber,
                Holder: Holder,
                ExpirationDate: ExpirationDate,
                SecurityCode: SecurityCode,
                Brand: Brand,
                method: method
            }, success: function(data){
                if(data.message == "Plano contratado com sucesso" || data.message  == "Periodo de testes iniciado com sucesso"){
                    $("#message").html("<div style='color:green;'>"+data.message+"</div>");
                    setTimeout(function () {
                        $(location).attr('href', '/notamais-web/dashboard');
                    }, 2000);
                }else{
                    $("#message").html("<div style='color:red;'>"+data.message+"</div>");
                }
            }, error: function(e){
                console.log(e);
            }
        });
        
    });
    
});

