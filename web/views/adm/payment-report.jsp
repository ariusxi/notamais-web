
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <title>Relatório de Pagamentos</title>
        <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous" type="text/javascript"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                        <th colspan="15" class="text-center"><h4>Relatório de Pagamentos</h4></th>
                    </tr>
                    <tr>
                        <th>Mês/Ano</th>
                        <th>Soma dos pagamentos</th>   
                    </tr>
                </thead>
                <tbody>
                <script>
                    $("#tbRelatorio").ready(function(){
                        var dataInicio = new Date( <% out.println("'"+request.getParameter("dt_de")+"'"); %> );
                        var dataFim = new Date(<% out.println("'"+request.getParameter("dt_ate")+"'"); %>);
                        var pagamentos = <% out.println(request.getParameter("json_data")); %>;
                        
                        var soma = 0;
                        var cont = 0;
                        var somaMes = 0;
                        
                        var ajuda = "";
                        var tbody = "";
                        var jan= 0, feb= 0, mar= 0, apr= 0, may= 0, jun= 0, jul= 0, aug= 0, sep= 0, oct= 0, nov= 0, dec = 0;
                        
                        
                        console.log(dataInicio);
                        console.log(dataFim);
                        console.log(pagamentos);
                        
                        $.each(pagamentos, function (i, value) {
                            var u = value.user;
                            var date = new Date(value.date);
                            
                            var customDate = new Date(date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate());
                             
                            console.log(customDate);
                             
                            if(customDate >= dataInicio && customDate <= dataFim){
                                cont++;
                                 
                                var date_array = customDate.toString().split("-")[0].split(" ");  
                                
                                var month = date_array[1];
                                var year = date_array[3];
                                 
                                if(month == "Sep" && year == "2018"){
                                    sep += value.value; 
                                }
                                
                                if(month == "Oct" && year== "2018"){
                                    oct += value.value
                                    //oct = "<tr> <td>"+month+"/"+year+"</td><td>"+somaMes+"</td> </tr>";
                                }
                                
                                 
                                if(value.user == null)
                                    soma += 0;
                                else
                                    soma += value.value;
                            }
                        });
                        
                        if(jan>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Jan/2018</td><td>"+jan+"</td> </tr>");
                        if(feb>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Fev/2018</td><td>"+feb+"</td> </tr>");
                        if(mar>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Mar/2018</td><td>"+mar+"</td> </tr>");
                        if(apr>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Abr/2018</td><td>"+apr+"</td> </tr>");
                        if(may>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Mai/2018</td><td>"+may+"</td> </tr>");
                        if(jun>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Jun/2018</td><td>"+jun+"</td> </tr>");
                        if(jul>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Jul/2018</td><td>"+jul+"</td> </tr>");
                        if(aug>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Ago/2018</td><td>"+aug+"</td> </tr>");
                        if(sep>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Set/2018</td><td>"+sep+"</td> </tr>");
                        if(oct>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Out/2018</td><td>"+oct+"</td> </tr>");
                        if(nov>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Nov/2018</td><td>"+nov+"</td> </tr>");
                        if(dec>0)
                            $("#tbRelatorio tbody").append("<tr> <td>Dez/2018</td><td>"+dec+"</td> </tr>");
                        
                        
                        
                    });
                </script>
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
        
        
    </body>
</html>
