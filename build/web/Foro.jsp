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
            if(sesion.getTipo().getIdTipo() == 2){
                response.sendRedirect("notAccess.jsp");
            }
            request.setCharacterEncoding("UTF-8");
            String action = request.getParameter( "action" );
            if( action == null )
            {
                action = "";
            }

            switch(action){
                case "close":
                    request.getSession().removeAttribute("usuario");
                    response.sendRedirect("index.jsp");
                    break;
                case "delMsj":
                    boolean elim = new PSUsuarioHelper().delMsg(request);
                    if(elim != true){
%>
                        <script>
                            alert("No se ha eliminado el mensaje.");
                        </script>
<%                        
                    }else{
                        response.sendRedirect("Foro.jsp");
                    }
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
        <%
                                    if(sesion.getTipo().getIdTipo() == 10){
        %>
                                        <li><a class="dropdown-item" href="AdminSignUp.jsp">Registrar administradores</a></li>
                                        <li><a class="dropdown-item" href="ActUsers.jsp">Ver usuarios</a></li>
        <%                                
                                    } 
        %>                                        
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
        
        <h1 align="center"> Bienvenido al foro de Apperger. </h1>
        
        <style>
            ol {
                margin-left: 40px;
                margin-right: 40px;
            }
        </style>
        
        <p align="center">
            Este espacio ha sido creado con el objetivo de fomentar el intercambio de ideas, experiencias y conocimientos entre tutores, usuarios externos y psicólogos que conviven con personas que tienen el síndrome de Asperger.
            Nos alienta la diversidad de experiencias y perspectivas de nuestros miembros, ya que creemos que todos tienen algo valioso que aportar a esta comunidad. Así que no dudes en participar, hacer preguntas, compartir tus logros y desafíos, y ofrecer tu apoyo y sabiduría a otros miembros.
            Queremos que este foro sea un lugar de respeto, empatía y comprensión mutua. Cada opinión es importante y cada voz cuenta. Juntos, podemos construir una red sólida de apoyo y contribuir al bienestar de las personas con síndrome de Asperger y sus entornos cercanos.            
        </p>
        
        <h3 align="center">Reglas del foro</h3>
        <ol>
            <li>
                <strong>1. Respeto y empatía:</strong> <p> Trata a todos los miembros con respeto y empatía. Respeta las opiniones y experiencias de los demás, incluso si difieren de las tuyas. Evita el lenguaje ofensivo, los ataques personales y los comentarios discriminatorios. </p>
            </li>
            <li>
                <strong>2. Mantén un ambiente seguro:</strong> <p> Este foro es un espacio seguro para todos. No se tolerarán el acoso, el bullying o cualquier forma de comportamiento inapropiado. Si encuentras algún contenido inapropiado, repórtalo de inmediato a los moderadores del foro. </p>
            </li>
            <li>
                <strong>3. Mantén la confidencialidad:</strong> <p> Respeta la privacidad y la confidencialidad de los demás. No compartas información personal de otros miembros sin su consentimiento.  </p>
            </li>
            <li>
                <strong>4. Temas relevantes:</strong> <p> Asegúrate de que los temas que compartas y discutas estén relacionados con el síndrome de Asperger, la convivencia con personas que lo tienen y los temas afines. Evita desviarte demasiado del propósito del foro.  </p>
            </li>
            <li>
                <strong>5. Comparte información útil:</strong> <p> Este foro se trata de aprender y apoyarse mutuamente. Si tienes información relevante, recursos, consejos o experiencias que puedan beneficiar a otros miembros, no dudes en compartirlos.  </p>
            </li>
        </ol>
        
        <hr>
        
        <div id="chat-mensajes">

        </div>
        
        <script>
            function getNewMessages() {
                var usuario = "<%=sesion.getUsuario().getNomUser()%>";
                var tipo = <%=sesion.getTipo().getIdTipo()%>;
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                  if (this.readyState === 4 && this.status === 200) {
                    var messages = JSON.parse(this.responseText);
                    var chatMessages = document.getElementById("chat-mensajes");
                    chatMessages.innerHTML = '';
                    if(tipo === 10){
                        for (var i = 0; i < messages.length; i++) {
                            var message = messages[i];
                            if(message.usuario.nomUser === usuario){
                              var messageDiv = document.createElement("div");
                              messageDiv.innerHTML = "<span style=\"text-align: left;\"> <b> <font color=\"blue\"> "+message.usuario.nomUser+" </font> </b> "+message.mensaje+" <font color=\"grey\"> "+message.hora+" </b> </span> <a href=\"?idMsj="+message.idMensaje+"&action=delMsj\"> <button type=\"submit\" class=\"btn btn-danger\"> Eliminar 🗑 </button> </a>";
                              chatMessages.appendChild(messageDiv);
                            }else{
                              var messageDiv = document.createElement("div");
                              messageDiv.innerHTML = "<b> <font color=\"green\"> "+message.usuario.nomUser+" </font> </b> "+message.mensaje+" <font color=\"grey\"> "+message.hora+" </b> <a href=\"?idMsj="+message.idMensaje+"&action=delMsj\"> <button type=\"submit\" class=\"btn btn-danger\"> Eliminar 🗑 </button> </a>";
                              chatMessages.appendChild(messageDiv);
                            }
                        }
                    }else{
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
                  }
                };
                xhr.open("GET", "ForoServlet", true);
                xhr.send();
            }

            setInterval(getNewMessages, 1000);
        </script>
        
        <hr>
        <form accept-charset="UTF-8" method="post" id="envMsj">
            <textarea class="form-control" name="msj" id="msj" rows="3" maxlength="300"></textarea>
            <button type="submit" id="action" name="action" value="send" class="btn btn-dark"> Enviar ⩥ </button>
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
            
        <script>
            $(document).ready(function() {
                $('#envMsj').submit(function(e) {
                    e.preventDefault();
                    var mensaje = $('#msj').val();
                    var session = "<%=sesion.getUsuario().getIdUsuario()%>";

                    if(mensaje.includes("<") && mensaje.includes(">")){
                        alert("No se pueden enviar mensajes que contengan los caracteres '<' y '>'");
                    }else{
                        $.ajax({
                          url: 'ForoServlet',
                          type: 'POST',
                          data: { 
                              msj: mensaje,
                              idAutor: session
                          },
                          success: function(response) {
                            $('#msj').val("");
                            getNewMessages();
                          },
                          error: function(xhr, status, error) {
                            alert("Ha ocurrido un error inesperado.");
                          }
                        });
                    }    
                });
            });
        </script>

        <!-- Scripts -->
        <script src="sources/vendor/jquery/jquery.min.js"></script>
        <script src="sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="sources/assets/js/owl-carousel.js"></script>
        <script src="sources/assets/js/animation.js"></script>
        <script src="sources/assets/js/imagesloaded.js"></script>
        <script src="sources/assets/js/custom.js"></script>
        
        <button  type="button" class="btn btn-dark" id="scroll-to-bottom" onclick="scrollToBottom()"> ↓ </button>

        <script>
            window.onscroll = function() {
                scrollFunction();
            };

            function scrollFunction() {
                var scrollToBottomButton = document.getElementById("scroll-to-bottom");
                if ((window.innerHeight + window.pageYOffset) >= document.body.offsetHeight) {
                    scrollToBottomButton.style.display = "none";
                } else {
                    scrollToBottomButton.style.display = "block";
                }
            }

            function scrollToBottom() {
                window.scrollTo(0, document.body.scrollHeight);
            }
        </script>
        
        <style>
            #scroll-to-bottom {
                display: none;
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 50px;
                text-align: center;
                line-height: 50px;
                font-size: 20px;
                cursor: pointer;
            }
        </style>
        
    </body>
</html>
<%
        }
    } catch(Exception ex){
        response.sendRedirect("Error.jsp");
    }
%>
