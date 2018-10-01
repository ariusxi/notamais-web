<%-- 
    Document   : invitations
    Created on : 01/10/2018, 10:28:17
    Author     : lucas
--%>

<jsp:include page="../layout/header-auth.jsp"/>
<div class="col-sm-12 col-md-12 col-lg-12">
    <div class="card">
        <div class="card-body">
            <ul class="list-group listInvitations">
            </ul>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer-auth.jsp"/>

<script type="text/javascript">

    $(document).ready(function (e) {
        var json = JSON.parse('<%= request.getAttribute("invitations")%>');

        console.log(json);

        var html = "";
        for (let i = 0; i < json.length; i++) {

            let counter = json[i].counter;
            let user = json[i].user;
            let idInvitation = json[i]._id
            let isApproved = json[i].approved;

            if (isApproved == false) {
                html += '<li class="list-group-item d-flex justify-content-between align-items-center">';
                html += '<div class="h4">' + user.name + ' enviou um convite - Email: ' + user.email + ' </div>';
                html += '<input type="button" class="btn btn-primary btnAcceptInvitation" id="' + idInvitation + '" value="Aceitar" />';
                html += '</li>';

                $(".listInvitations").html(html);
            }
        }

    });

    $('ul.listInvitations').on('click', '.btnAcceptInvitation', function () {
        var id = $(".btnAcceptInvitation").attr("id");

        $.ajax({
            url: "invitations",
            method: "POST",
            data: {
                'id': id
            },
            success: function (data) {
                console.log(data);
            }, error: function (data) {
                console.log(data);
            }
        });

    });


</script>

