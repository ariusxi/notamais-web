<%-- 
    Document   : footer
    Created on : 23/08/2018, 09:29:12
    Author     : lucas
--%>
<<<<<<< HEAD

=======
>>>>>>> 611e6cf940883056b12e65235fd151cb694e9f92
        <!--Start of Zendesk Chat Script-->
        <script type="text/javascript">
        window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
        d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
        _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
        $.src="https://v2.zopim.com/?60xKJ9iLLTNO0tHe1vP54pEK02yMFmlP";z.t=+new Date;$.
        type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
        </script>
        <!--End of Zendesk Chat Script-->
<<<<<<< HEAD
        <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
        <script>
            var OneSignal = window.OneSignal || [];

            //Dev: f2f5720e-15a4-446b-b683-12954e009076
            //Productions: 6a8eed60-3d61-4064-847e-94062f9d70dc
            OneSignal.push(["init", {
                //Alterne aqui as chaves do Push Notification
                //Produção
                //appId: "159ddb12-4eac-4ac4-9dbe-ea9aaae0b507",
                //Desenvolvimento
                appId: "159ddb12-4eac-4ac4-9dbe-ea9aaae0b507",
                autoRegister: true,

                httpPermissionRequest: {
                    enable: true,
                    modalTitle: 'Obrigado por se Inscrever',
                    modalMessage: "Você vai receber nossas promoções, elas pode ser canceladas a qualquer momento.",
                    modalButtonText: 'Fechar'
                },

                welcomeNotification: {
                    "title": "Nota Mais",
                    "message": "Obrigado por se Inscrever!",
                    "url": ""
                },


                promptOptions: {
                    siteName: "Nota Mais",
                    actionMessage: "Gostaria de Receber nossas novidades e promoções?",
                    exampleNotificationTitle: "Exemplo da Notificação",
                    exampleNotificationMessage: "Este é um exemplo de notificação",
                    exampleNotificationCaption: "Você pode cancelar a qualquer momento",
                    acceptButtonText: "Aceitar",
                    cancelButtonText: "Não, obrigado"
                },

                notifyButton: {
                    enable: true,
                    displayPredicate: function () {
                        return OneSignal.isPushNotificationsEnabled().then(function (isPushEnabled) {
                            return !isPushEnabled;
                        });
                    },
                    colors: {
                        'circle.background': 'rgb(204,105,47)',
                        'circle.foreground': 'white',
                        'badge.background': 'rgb(204, 105, 47)',
                        'badge.foreground': 'white',
                        'badge.bordercolor': 'white',
                        'pulse.color': 'white',
                        'dialog.button.background.hovering': 'rgb(77, 101, 113)',
                        'dialog.button.background.active': 'rgb(70, 92, 103)',
                        'dialog.button.background': 'rgb(84,110,123)',
                        'dialog.button.foreground': 'white'
                    },
                    size: 'small',
                    theme: 'default',
                    position: 'bottom-left',
                    offset: {
                        bottom: '30px',
                        left: '10px',
                        right: '0px'
                    },
                    prenotify: true,
                    showCredit: false,
                    text: {
                        'tip.state.unsubscribed': 'Inscreva-se para receber nossas promoções',
                        'tip.state.subscribed': "Você está recebendo nossas notificações",
                        'tip.state.blocked': "Você bloqueou nossas notificações",
                        'message.prenotify': 'Clique para se inscrever',
                        'message.action.subscribed': "Obrigado por se inscrever!",
                        'message.action.resubscribed': "Obrigado, você vai receber nossas notificações!",
                        'message.action.unsubscribed': "Você cancelou nossas notificações.",
                        'dialog.main.title': 'Gerenciar Notificações',
                        'dialog.main.button.subscribe': 'RECEBER NOTIFICAÇÕES',
                        'dialog.main.button.unsubscribe': 'NÃO RECEBER NOTIFICAÇÕES',
                        'dialog.blocked.title': 'Desbloquear Notificações',
                        'dialog.blocked.message': "Siga essas instruções para liberar as notificações:"
                    }
                }
            }]);
        </script>

=======
>>>>>>> 611e6cf940883056b12e65235fd151cb694e9f92
        <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous" type="text/javascript"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/material-kit.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/script.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/counter/counter.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/employee/employee.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plan/plan.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/user/user.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery.mask.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.maskMoney.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
    </body>
</html>
