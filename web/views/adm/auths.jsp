<%-- 
    Document   : auths.jsp
    Created on : 15/10/2018, 10:06:43
    Author     : lucas
--%>

<jsp:include page="../layout/header-auth.jsp" />
<div class="table-responsive mt-4">
    <h3>Histórico de login</h3>
    <table id="auths-list" class="display table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Data/Horário</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>   
        </tbody>
    </table>  
</div>
<jsp:include page="../layout/footer-auth.jsp" />

<script>

    var auths = <%= request.getAttribute("auths")%>;
    
    console.log(auths);

    for (var i = 0; i < auths.length; i++) {

        var date = new Date(auths[i].date);

        let html = "<tr>";
        html += "<td>" + auths[i]._id + "</td>";
        if (auths[i].user != null) {
            html += "<td>" + auths[i].user.email + "</td>";
        } else {
            html += "<td></td>";
        }
        html += "<td>" + date.toLocaleDateString() + " " + date.toLocaleTimeString() + "</td>";
        if (auths[i].user != null) {
            html += "<td> <a href='auth-detail?id=" + auths[i].user._id + "' class='btn btn-primary btn-sm'>Detalhes</a> </td>";
        } else {
            html += "<td></td>";
        }
        html += "</tr>";

        $("#auths-list tbody").append(html);
    }

    $("#auths-list").dataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
        }
    });


</script>