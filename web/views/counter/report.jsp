
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <th colspan="3" class="text-center"><h4>Balanço de NF-es</h4></th>
                    </tr>
                    <tr>
                        <th>Cliente</th> 
                        <th colspan="2" style="color: #000">@NomeCliente</th>
                    </tr>
                    <tr>
                        <th>Mês/Ano</th>
                        <th>Quantidade de NF-es</th>                   
                        <th>Valor</th>
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
    montarRelatorio();
        });
        
        function montarRelatorio(){
            var json = JSON.parse('[{"MesAno":"JAN/2018","Quantidade":"1000","Valor":"1000.50"},{"MesAno":"FEV/2018","Quantidade":"2000","Valor":"2000.00"},{"MesAno":"MAR/2018","Quantidade":"3000","Valor":"3000.00"},{"MesAno":"ABR/2018","Quantidade":"4000","Valor":"4000.00"},{"MesAno":"MAI/2018","Quantidade":"5000","Valor":"5000.00"},{"MesAno":"JUN/2018","Quantidade":"6000","Valor":"6000.00"},{"MesAno":"JUL/2018","Quantidade":"7000","Valor":"7000.00"},{"MesAno":"AGO/2018","Quantidade":"8000","Valor":"8000.00"},{"MesAno":"SET/2018","Quantidade":"9000","Valor":"9000.00"},{"MesAno":"OUT/2018","Quantidade":"10000","Valor":"10000.00"},{"MesAno":"NOV/2018","Quantidade":"11000","Valor":"11000.00"},{"MesAno":"DEZ/2018","Quantidade":"12000","Valor":"12000.00"}]')
            var tbody = "";
            var tfoot = "";
            var qtdTotal = 0;
            var valorTotal = 0;
            
            for (var i = 0; i < json.length; i++) {
                var j = json[i];
                
               tbody += "<tr>";
               tbody += "<th>" + j.MesAno + "</th>";
               tbody += "<td>" + j.Quantidade + "</td>";                              
               tbody += "<td>R$ " + j.Valor.replace(".", ",") + "</td>";
               tbody += "</tr>";    
               
               qtdTotal += parseFloat(j.Quantidade);
               valorTotal += parseFloat(j.Valor);
            }
            
            $("#tbRelatorio > tbody").html(tbody);
            
            tfoot += "<tr>";
            tfoot += "<th></th>";
            tfoot += "<th>Qtd. Total: <strong style=' color: #000'>" + qtdTotal + "</strong></th>";                              
            tfoot += "<th>Valor Total: <strong style=' color: #000'>R$ " + valorTotal.toFixed(2).toString().replace(".", ",") + "</strong></th>";
            tfoot += "</tr>";
            
            $("#tbRelatorio > tfoot").html(tfoot);
            
        }
        
        </script>
    </body>
</html>

