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

    $(document).ready(function () {
        
        var json = JSON.parse('<%= request.getAttribute("invitations")%>');
        
        console.log(json.length);

        if (json.length > 1) {
            
            var html = "";
            for (let i = 0; i < json.length; i++) {

                let counter = json[i].counter;
                let user = json[i].user;
                let idInvitation = json[i]._id
                let isApproved = json[i].approved;

                if (isApproved == false) {
                    
                    $(".countInvitation").html(json.length)

                    html += '<li class="list-group-item d-flex justify-content-between align-items-center">';
                    html += '<div class="h4">' + user.name + ' enviou um convite - Email: ' + user.email + ' </div>';
                    html += '<input type="button" class="btn btn-primary btnAcceptInvitation" id="' + idInvitation + '" value="Aceitar" />';
                    html += '</li>';

                    $(".listInvitations").html(html);
                }
            }
        } else {
            var html = "";

            $(".countInvitation").html("1")

            let counter = json.counter;
            let user = json.user;
            let idInvitation = json._id
            let isApproved = json.approved;

            html += '<li class="list-group-item d-flex justify-content-between align-items-center">';
            html += '<div class="h4">' + user.name + ' enviou um convite - Email: ' + user.email + ' </div>';
            html += '<input type="button" class="btn btn-primary btnAcceptInvitation" id="' + idInvitation + '" value="Aceitar" />';
            html += '</li>';

            $(".listInvitations").html(html);

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
                var json = JSON.parse(data);
                alert(json.message)
            }, error: function (data) {
                console.log(data);
            }
        });

    });


</script>

