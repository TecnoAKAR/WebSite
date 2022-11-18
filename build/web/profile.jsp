<%-- 
    Document   : profile
    Created on : Nov 17, 2022, 1:34:54 PM
    Author     : alumno
--%>
<%@page import="org.akar.dao.PSUsuario"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="es">

  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="sources\assets\images\logoAKAR100.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Tecnologías AKAR</title>

    <!-- Bootstrap core CSS -->
    <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="sources/assets/css/akar.css">
    <link rel="stylesheet" href="sources/assets/css/animated.css">
    <link rel="stylesheet" href="sources/assets/css/owl.css">
  </head>

<body>
    <%
        PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");  
        
        if( request == null )
        {
            return;
        }
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
        }


    %>  
  <!-- ***** Preloader Start ***** -->
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
              <img src="sources/assets/images/logoAKAR80.png" alt="">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li class="scroll-to-section"><a href="#top" class="active">Inicio</a></li>
              <li class="scroll-to-section"><a href="#sobrenosotros">Sobre nosotros</a></li>
              <li class="scroll-to-section"><a href="#proyecto">Proyecto</a></li>
              <li class="scroll-to-section"><a href="#galeria">Galería</a></li>
              <li class="scroll-to-section"><a href="Foro.jsp">Foro</a></li>
              <li class="scroll-to-section"><a href="#contact">Contáctanos</a></li> 
              <li class="scroll-to-section">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="true"> <%= sesion.getUsuario().getNomUser() %> </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="profile.jsp">Perfil</a></li>
                  <li><a class="dropdown-item" href="#">Another action</a></li>
                  <li><a class="dropdown-item" href="#">Something else here</a></li>
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
