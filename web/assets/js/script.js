$(function(){
    
    $('#cpf').mask('000.000.000-00', {reverse: true});
    
    function validarCPF(cpf) {	
	cpf = cpf.replace(/[^\d]+/g,'');	
	if(cpf == '') return false;	
	// Elimina CPFs invalidos conhecidos	
	if (cpf.length != 11 || 
		cpf == "00000000000" || 
		cpf == "11111111111" || 
		cpf == "22222222222" || 
		cpf == "33333333333" || 
		cpf == "44444444444" || 
		cpf == "55555555555" || 
		cpf == "66666666666" || 
		cpf == "77777777777" || 
		cpf == "88888888888" || 
		cpf == "99999999999")
			return false;		
	// Valida 1o digito	
	add = 0;	
	for (i=0; i < 9; i ++)		
		add += parseInt(cpf.charAt(i)) * (10 - i);	
		rev = 11 - (add % 11);	
		if (rev == 10 || rev == 11)		
			rev = 0;	
		if (rev != parseInt(cpf.charAt(9)))		
			return false;		
	// Valida 2o digito	
	add = 0;	
	for (i = 0; i < 10; i ++)		
		add += parseInt(cpf.charAt(i)) * (11 - i);	
	rev = 11 - (add % 11);	
	if (rev == 10 || rev == 11)	
		rev = 0;	
	if (rev != parseInt(cpf.charAt(10)))
		return false;		
	return true;   
    }
   
    $(".open-register").click(function(e){
        e.preventDefault();
        
        var type = $(this).attr('id');
        
        $(".user-register").hide();
        $("." + type + " form").fadeIn();
        
        return false;
    });
    
    $(".back-type").click(function(e){
        e.preventDefault();
        
        $(".user form, .counter form").hide();
        
        $(".user-register").show();
        
        return false;
    });
    
    $("#contato").submit(function(e){
        e.preventDefault();
        
        let email = $("#email").val();
        let title = $("#title").val();
        let text = $("#text").val();
        
        $('#message').css('display', 'none');
        
        if(email == "" || title == "" || text == ""){
            $('#message').css('display', 'block');
            $('#message').html('Voce deve preencher todos os campos');
            return false;
        }
        
        let form = $(this);
        let formData = form.serialize();
        
         $.ajax({
            url: "contact",
            method: "post",
            data: formData,
            beforeSend: function () {
                $('#message').css('display', 'block');
                $('#message').html('Aguarde...');
            },
            success: function (data) {
                var dataJSON = JSON.parse(data);
                $("#message").css('display', 'block');
                $('#message').html(dataJSON.message);
            },
            error: function(e) {
                $('#message').css('display', 'block');
                $('#message').html(e.responseText);
            }
        });
        
        return false
    });
    
    $("#employee-register").submit(function(e){
        e.preventDefault();
        
        let fullname = $("#fullname").val();
        let email = $("#email").val();
        let cpf = $("#cpf").val();
        let gender  = $("#gender").val();
        let password = $("#password").val();
        let confirm = $("#confirm").val();
        
        $('#message').css('display', 'none');
        
        if(fullname == "" || email == "" || cpf == "" || gender == "" || password == "" || confirm == ""){
            $('#message').css('display', 'block');
            $('#message').html('Voce deve preencher os campos obrigatorios');
            return false;
        }
        
        if(password != confirm){
            $('#message').css('display', 'block');
            $('#message').html('As senhas informadas devem ser iguais');
            return false;
        }
        
        if(!validarCPF(cpf)){
            $('#message').css('display', 'block');
            $('#message').html('CPF Inválido');
            return false;
        }
        
        if(password.length < 6){
            $('#message').css('display', 'block');
            $('#message').html('A senha deve ser maior que 6 digitos');
            return false;
        }
        
        let form = $(this);
        let formData = form.serialize();
        formData += '&type=counter';
        
        $.ajax({
            url: "register",
            method: "post",
            data: formData,
            beforeSend: function () {
                $('#message').css('display', 'block');
                $('#message').html('Aguarde...');
            },
            success: function (data) {
                $("#message").css('display', 'block');
                $('#message').html(data.message);
                setTimeout(() => {
                    $(location).attr('href', '/notamais-web/dashboard');
                }, 2000);
            },
            error: function(e) {
                $('#message').css('display', 'block');
                $('#message').html(e.responseText);
            }
        });
        
        return false;
         $("#counter-register").submit(function(e){
        e.preventDefault();
        
        let fullname = $("#fullname").val();
        let email = $("#email").val();
        let cpf = $("#cpf").val();
        let gender  = $("#gender").val();
        let password = $("#password").val();
        let confirm = $("#confirm").val();
        
        $('#message').css('display', 'none');
        
        if(fullname == "" || email == "" || cpf == "" || gender == "" || password == "" || confirm == ""){
            $('#message').css('display', 'block');
            $('#message').html('Voce deve preencher os campos obrigatorios');
            return false;
        }
        
        if(password != confirm){
            $('#message').css('display', 'block');
            $('#message').html('As senhas informadas devem ser iguais');
            return false;
        }
        
        if(!validarCPF(cpf)){
            $('#message').css('display', 'block');
            $('#message').html('CPF Inválido');
            return false;
        }
        
        if(password.length < 6){
            $('#message').css('display', 'block');
            $('#message').html('A senha deve ser maior que 6 digitos');
            return false;
        }
        
        let form = $(this);
        let formData = form.serialize();
        formData += '&type=counter';
        
        $.ajax({
            url: "register",
            method: "post",
            data: formData,
            beforeSend: function () {
                $('#message').css('display', 'block');
                $('#message').html('Aguarde...');
            },
            success: function (data) {
                $("#message").css('display', 'block');
                $('#message').html(data.message);
                setTimeout(() => {
                    $(location).attr('href', '/WNotaMais/');
                }, 2000);
            },
            error: function(e) {
                $('#message').css('display', 'block');
                $('#message').html(e.responseText);
            }
        });
        
        return false;
    });
    
});
});