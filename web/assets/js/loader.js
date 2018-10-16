function atualizarPagina(){
  location.href = location.href;  
}

function loader(){
    closeLoader();
    var html= "";
    html +="<div id='back-loader'>";
    html +="<div class='load'>";
    html +="<img src='/notamais-web/assets/img/loader.gif' />";
    html +="</div>";
    html +="</div>";
    
    $("body").append(html); 
}

function closeLoader(){
    try{
        $("#back-loader").remove();   
    }
    catch(e){
        
    }
    
}

