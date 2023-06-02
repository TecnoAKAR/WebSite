<%-- 
    Document   : ActUsers
    Created on : 30/05/2023, 09:50:39 PM
    Author     : Axel Zarate Lozano
--%>

<%@page import="java.util.List"%>
<%@page import="org.akar.helper.PSUsuarioHelper"%>
<%@page import="org.akar.dao.PSUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    try {
        PSUsuario sesion = (PSUsuario) session.getAttribute("usuario");

        if (sesion == null) {
            response.sendRedirect("notSession.jsp");
        } else {
            if (sesion.getTipo().getIdTipo() != 10) {
                response.sendRedirect("notAccess.jsp");
            }
%>

<html lang="es">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>

        <!-- Bootstrap core CSS -->
        <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        
        


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
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
                                        <li><a class="dropdown-item" href="Home.jsp#downloadApp">Descargar Apperger</a></</li>
                              <%
                                          if(sesion.getTipo().getIdTipo() == 10){
                              %>
                                              <li><a class="dropdown-item" href="AdminSignUp.jsp">Registrar administradores</a></li>
                                              <li><a class="dropdown-item" href="ActUsers.jsp">Ver usuarios</a></li>
                              <%                                
                                          } 
                              %>          <li><hr class="dropdown-divider"></li>
                                          <li><a class="dropdown-item" href="?action=close" id="action" name="action" value="close">Cerrar sesión</a></li>    
                                          <li><a class="dropdown-item" href="#" id="#" name="#" value="#"></a></li>
                                    </ul>
                                </li>
                                <li class="scroll-to-section"><a href="#"></a></li>
                            </ul>        
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
                                        
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>

        <%
            List<PSUsuario> users = new PSUsuarioHelper().getUsers();
            if(users != null){
        %>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">IDUser</th>
                            <th scope="col">IDRel</th>
                            <th scope="col">IDTipo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellidos</th>
                            <th scope="col">Correo</th>
                            <th scope="col">Username</th>
                            <th scope="col">Verificado</th>
                        </tr>
                    </thead>
                    <tbody>
        <%
                for(PSUsuario user : users){
        %>    
                    <tr>
                        <th scope="row"><%=user.getUsuario().getIdUsuario()%></th>
                        <td><%=user.getIdRelTipUs()%></td>
                        <td><%=user.getTipo().getIdTipo()%></td>
                        <td><%=user.getUsuario().getNom()%></td>
                        <td><%=user.getUsuario().getApellidoP()%> <%=user.getUsuario().getApellidoM()%></td>
                        <td><%=user.getUsuario().getCorreo()%></td>
                        <td><%=user.getUsuario().getNomUser()%></td>
                        <td><%=user.getUsuario().getVer()%></td>
                    </tr>
        <%
                }
        %>
                    </tbody>
                </table>
        <%
            }else{
        %>
                
        <%
            }
        %>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        
        <!-- Scripts -->
        <script src="sources/vendor/jquery/jquery.min.js"></script>
        <script src="sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="sources/assets/js/owl-carousel.js"></script>
        <script src="sources/assets/js/animation.js"></script>
        <script src="sources/assets/js/imagesloaded.js"></script>
        <script src="sources/assets/js/custom.js"></script>
        
        
            
        <%
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "close":
                    request.getSession().removeAttribute("usuario");
                    response.sendRedirect("index.jsp");
                    break;
            }
        %>    

    </body>
</html>
<%
        }
    } catch (Exception e) {
    }
%>