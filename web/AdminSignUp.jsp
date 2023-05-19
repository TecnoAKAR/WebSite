<%-- 
Document   : login
Created on : 12/10/2022, 10:52:51 PM
Author     : AKAR
--%>

<%@page import="org.akar.helper.PSResPassHelper"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="org.akar.helper.PSUsuarioHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<%
    try{
        PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");

        if(sesion == null){
            response.sendRedirect("notSession.jsp");
        } else{
            if(sesion.getTipo().getIdTipo() != 10){
                response.sendRedirect("notAccess.jsp");
            }    
%>
<html lang="es">
    <head>
        <title>Sign Up</title>
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="sources/login&signup/css/style.css"> 
        
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
        
    </head>
    <body class="img js-fullheight" style="background-image: url(sources/assets/images/quote-bg-v2.jpg);">
        
        
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        
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
                                <li class="scroll-to-section"><a href="Home.jsp#top" class="active">Inicio</a></li>
                                <li class="scroll-to-section"><a href="Home.jsp#sobrenosotros">Sobre nosotros</a></li>
                                <li class="scroll-to-section"><a href="Home.jsp#proyecto">Proyecto</a></li>
                                <li class="scroll-to-section"><a href="Foro.jsp">Foro</a></li>
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
                                        
        </br>
        
        <div class="contenedor">
            <div class="container p-5">
            <br/>
            <h2 class="heading-section">Cree una cuenta con privilegios de administrador</h2>
                <form class="row g-3" method="post">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre(s)" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="apellido_p" name="apellido_p" placeholder="Apellido paterno" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="apellido_m" name="apellido_m" placeholder="Apellido materno" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="Date" class="form-control" id="fecha_nac" name="fecha_nac" required>
                    </div>
                    <div class="col-12">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="email" class="form-control" id="correo_e" name="correo_e" placeholder="Correo electrónico" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Nombre de usuario" required>
                    </div>
                    <div class="col-md-6    ">
                        <label for="inputState" class="form-label"></label>
                        <select id="tipoUsuario" name="tipoUsuario" class="form-control">
                          <option selected>Tipo de usuario</option>
                          <option value="10">Administrador</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                      <label for="inputPassword4" class="form-label"></label>
                      <input id="password-field" type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña" required> 
                      </br>
                      <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"> </span>
                    </div>
                    <div> 
                        <input type="hidden" id="action" name="action" value="send" />
                    </div>
                    <div class="col-12">
                        <button type="submit" id="action" name="action" value="send" class="btn btn-primary btn-lg">Registrarse</button>
                        <button type="reset" class="btn btn-secondary btn-lg">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
        

        <script src="sources/login&signup/js/jquery.min.js"></script>
        <script src="sources/login&signup/js/popper.js"></script>
        <script src="sources/login&signup/js/bootstrap.min.js"></script>
        <script src="sources/login&signup/js/main.js"></script>
        
        
        <script src="sources/vendor/jquery/jquery.min.js"></script>
        <script src="sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="sources/assets/js/owl-carousel.js"></script>
        <script src="sources/assets/js/animation.js"></script>
        <script src="sources/assets/js/imagesloaded.js"></script>
        <script src="sources/assets/js/custom.js"></script>
        
        <style>
            .contenedor {
                align-items: center;
                display: flex;
                justify-content: center;
                height: 100%;
            }
            
            select,
            option{
                color: black;
            }
        </style>        
        <%
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
                case "send":
                    
                    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate fNac = LocalDate.parse(request.getParameter("fecha_nac"), format);
                    LocalDate hoy = LocalDate.now();
                    Period per = Period.between(fNac, hoy);
                    
                    if(per.getYears() < 18){
        %>
                        <script>
                            alert("No creo que sea correcto que un menor de edad sea un administrador.");
                        </script>
        <% 
                    }
                    else{
                        PSUsuario usuario = new PSUsuarioHelper().SignUp(request);
                        if( usuario!= null){
                            boolean tokenA = new PSResPassHelper().setToken(request);
                            if(tokenA == true){
        %>
                                <script>
                                    alert("Revise su correo para confirmar su cuenta.");
                                </script>
        <%                                
                            }else{
        %>
                                <script>
                                    alert("¡Algo ha salido mal!, contacte a soporte de inmediato para solucionar el problema.");
                                </script>
        <%                                 
                            }
                        }
                        else{
        %>
                            <script>
                                alert("El correo y usuario están en uso.");
                            </script>
        <%
                        }
                        break;
                    }
            }
        %>
        
        
    </body>
</html>
<%
        }
    }catch(Exception e){
    }
%>
