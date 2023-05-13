<%-- 
    Document   : Foro
    Created on : 29/03/2023, 10:55:31 PM
    Author     : Axel Zarate Lozano
--%>

<%@page import="org.akar.helper.PSUsuarioHelper"%>
<%@page import="org.akar.dao.MsjForo"%>
<%@page import="java.util.List"%>
<%@page import="org.akar.dao.PSUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    try{        
        PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");
        
        if(sesion == null){
            response.sendRedirect("notSession.jsp");
        }
        else{
            String action = request.getParameter( "action" );
            if( action == null )
            {
                action = "";
            }

            switch(action){
                case "send":
                    if(request.getParameter("msj").contains("<") && request.getParameter("msj").contains(">")){
%>
                        <script>
                            alert("No se pueden enviar mensajes que contengan los carácteres '<' y '>'");
                        </script>
<%                        
                    }else{
                        boolean enviado = new PSUsuarioHelper().sendMsg(request);
                    }
                    break;
                case "close":
                    request.getSession().removeAttribute("usuario");
                    response.sendRedirect("index.jsp");
                    break;
            }
    
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <title>Foro</title>
        <!-- Bootstrap core CSS -->
        <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
    </head>
    <body>
        
        <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="Home.jsp" class="logo">
                                <img src="sources/assets/images/loguitoakar.png" alt="">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="Home.jsp">Inicio</a></li>
                                <li class="scroll-to-section"><a href="Home.jsp#sobrenosotros">Sobre nosotros</a></li>
                                <li class="scroll-to-section"><a href="Home.jsp#proyecto">Proyecto</a></li>
                                <li class="scroll-to-section"><a href="Foro.jsp" class="active">Foro</a></li>
                                <li class="scroll-to-section"><a href="Home.jsp#contact">Contáctanos</a></li> 
                                <li class="scroll-to-section">
                                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="true"> <%= sesion.getUsuario().getNomUser()%> </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="profile.jsp">Perfil</a></li>
                                        <li><a class="dropdown-item" href="editProf.jsp">Editar perfil</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="?action=close" id="action" name="action" value="close">Cerrar sesión</a></li>
                                    </ul>
                                </li>



                            </ul>        
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->

        </br>
        </br>
        </br>
        </br>
        </br>
        
        <div id="chat-mensajes">
            
        </div>
        
        <script>
            function getNewMessages() {
                var usuario = "<%=sesion.getUsuario().getNomUser()%>";
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                  if (this.readyState === 4 && this.status === 200) {
                    var messages = JSON.parse(this.responseText);
                    var chatMessages = document.getElementById("chat-mensajes");
                    chatMessages.innerHTML = '';
                    for (var i = 0; i < messages.length; i++) {
                      var message = messages[i];
                      if(message.usuario.nomUser === usuario){
                        var messageDiv = document.createElement("div");
                        messageDiv.innerHTML = "<span style=\"text-align: left;\"> <b> <font color=\"blue\"> "+message.usuario.nomUser+" </font> </b> "+message.mensaje+" <font color=\"grey\"> "+message.hora+" </b> </span>";
                        chatMessages.appendChild(messageDiv);
                      }else{
                        var messageDiv = document.createElement("div");
                        messageDiv.innerHTML = "<b> <font color=\"green\"> "+message.usuario.nomUser+" </font> </b> "+message.mensaje+" <font color=\"grey\"> "+message.hora+" </b>";
                        chatMessages.appendChild(messageDiv);
                      }
                    }
                  }
                };
                xhr.open("GET", "ForoServlet", true);
                xhr.send();
              }

            setInterval(getNewMessages, 1000);
        </script>
        <hr>
        <form method="post" id="envMsj">
            <input type="hidden" id="idAutor" name="idAutor" value="<%=sesion.getUsuario().getIdUsuario()%>">
            <textarea class="form-control" name="msj" id="msj" rows="3"></textarea>
            <button type="submit" id="action" name="action" value="send" class="btn-dark"> Enviar > </button>
        </form>
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <p>Copyright © 2022 Tecnologías AKAR, S. de R.L. de C.V. All Rights Reserved. </p>
                        </div>
                    </div>
                </div>
            </footer>


            <!-- Scripts -->
            <script src="sources/vendor/jquery/jquery.min.js"></script>
            <script src="sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="sources/assets/js/owl-carousel.js"></script>
            <script src="sources/assets/js/animation.js"></script>
            <script src="sources/assets/js/imagesloaded.js"></script>
            <script src="sources/assets/js/custom.js"></script>
    </body>
</html>
<%
        }
    } catch(Exception ex){
    
    }
%>
