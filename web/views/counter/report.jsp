
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <title>Imprimir Relatório</title>
        <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous" type="text/javascript"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style type="text/css">
            #div-button {
                position: fixed;
                right: 20px;
                bottom: 20px;
            }
            
            .table thead th, .table tfoot th{
                color: #7b1fa2;
            }

            button{
               background: linear-gradient(60deg, #7b1fa2, #913f9e) !important;
               border: none !important;
               box-shadow: none !important;
               vertical-align: middle;
               font-weight: 600 !important;
            }
            
            button > * {
                vertical-align: middle;
                diplay: inline-block;
            }
            
            @media print {
                button {
                    display: none !important;
                }
            }
        </style>
    </head>
    <body>
        <div>
            <table class="table  table-striped table-bordered table-hover" id="tbRelatorio">
                <thead class="text-uppercase">
                    <tr>
                        <th colspan="15" class="text-center"><h4>Balanço de NF-es</h4></th>
                    </tr>
                    <tr>
                        <th>Cliente</th> 
                        <th colspan="14" style="color: #000" id="client-name">@NomeCliente</th>
                    </tr>
                    <tr>
                        <th>Mês/Ano</th>
                        <th>Valor BC</th>
                        <th>Valor BCST</th>
                        <th>Valor COFINS</th>
                        <th>Valor Frete</th>
                        <th>Valor ICMS</th>
                        <th>Valor ICMSDeson</th>
                        <th>Valor II</th>
                        <th>Valor IPI</th>
                        <th>Valor NF</th>
                        <th>Valor Outro</th>
                        <th>Valor PIS</th>
                        <th>Valor Prod</th>
                        <th>Valor ST</th>
                        <th>Valor Seg</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
                <tfoot>

                </tfoot>
            </table>
            <div id="div-button">
                <button type="button" class="btn btn-primary" id="btn-imprimir">
                    <i class="material-icons">print</i>
                    <span>Imprimir</span>
                </button> 
            </div>
        </div>
        
        <script type="text/javascript">
        $(function(){ 
            $("#btn-imprimir").click(
                function(){ window.print(); }
            );
            
            $("#tbRelatorio").ready(function(){
               
               var cliente = "<% out.print(request.getParameter("cliente")); %>";
               var begin = "<% out.print(request.getParameter("begin")); %>";
               var end = "<% out.print(request.getParameter("end")); %>";
               
               $.ajax({
                    url: "report",
                    method: "POST",
                    data: {
                        cliente: cliente,
                        begin: begin,
                        end: end
                    },success: function(json){
                        var json = JSON.parse(json);
                        console.log(json);
                        var tbody = "";
                        var tfoot = "";
                        var qtdTotal = 0;
                        var valorTotal = 0;

                        for (var i = 0; i < json.length; i++) {
                            var j = json[i];
                            
                            $("#client-name").text(j.user.name);

                           tbody += "<tr>";
                           tbody += "<td>" + j.date + "</td>";                              
                           tbody += "<td>" + j.total.vBC + "</td>";
                           tbody += "<td>" + j.total.vBCST + "</td>";
                           tbody += "<td>" + j.total.vCOFINS + "</td>";
                           tbody += "<td>" + j.total.vFrete + "</td>";
                           tbody += "<td>" + j.total.vICMS + "</td>";
                           tbody += "<td>" + j.total.vICMSDeson + "</td>";
                           tbody += "<td>" + j.total.vII + "</td>";
                           tbody += "<td>" + j.total.vIPI + "</td>";
                           tbody += "<td>" + j.total.vNF + "</td>";
                           tbody += "<td>" + j.total.vOutro + "</td>";
                           tbody += "<td>" + j.total.vPIS + "</td>"; 
                           tbody += "<td>" + j.total.vProd + "</td>";
                           tbody += "<td>" + j.total.vST + "</td>";
                           tbody += "<td>" + j.total.vSeg + "</td>";   
                           tbody += "</tr>";    

                           valorTotal += parseFloat(j.total.vProd);
                        }
                        
                        qtdTotal = json.length;

                        $("#tbRelatorio > tbody").html(tbody);

                        tfoot += "<tr>";
                        tfoot += "<th colspan='13'></th>";
                        tfoot += "<th>Qtd. Total: <strong style=' color: #000'>" + qtdTotal + "</strong></th>";                              
                        tfoot += "<th>Valor Total: <strong style=' color: #000'>R$ " + valorTotal.toFixed(2).toString().replace(".", ",") + "</strong></th>";
                        tfoot += "</tr>";

                        $("#tbRelatorio > tfoot").html(tfoot);
                    }, error: function(e){
                        console.log(e);
                    }
                });
            });
        });
        </script>
    </body>
</html>

