<%-- 
    Document   : Asistente
    Created on : 28/03/2023, 06:52:12 PM
    Author     : 52553
--%>

<%@page import="org.akar.helper.RegistroTareaHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asistente</title>
        <link rel="preconnect" href="https://fonts.googleapis.com/%22%3E
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
    
    </head>
    <style>
        h1{
            font-family:"Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
            font-size: 69px;
            padding: 20px 20px;
            text-align: center;
        }
        
        body{
            margin-left: 200px;
            margin-right: 200px;   
        }
    </style>
    
    
    <body>
    

  <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="index.jsp" class="logo">
              <img src="sources/assets/images/loguitoakar.png" alt="">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li class="scroll-to-section"><div class="border-first-button"><a href="?action=close">Cerrar sesión</a></div></li>
            </ul> 
            <ul class="nav">
              <li class="scroll-to-section"><div class="border-first-button"><a href="Home.jsp">Regresar</a></div></li> 
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
        
        
        
        <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }
            
            switch(action){
                case "send":
                    boolean act = new RegistroTareaHelper().addRegistro(request);
                    if(act == true){
        %>
                        <script> alert("Se ha actualizado el estatus del reporte."); </script>
        <%
                    } else{
        %>
                        <script> alert("No se ha actualizado."); </script>
        <%
                    } 
                    break;          
                case "close":
                    request.getSession().removeAttribute("usuario");
                    response.sendRedirect("index.jsp");
                    break;
        }
        %>
        
        <br><br><br><br>
        <h1> Bienvenido Asistente!</h1>
        <br>
        <div>
            <form>
                <div>
                <div>
                    <input type="email" name="correo" id="correo" class="form-control" placeholder="Correo electrónico del usuario" required>
                    <br>
                    <br>
                </div>    
                <div class="mb-3">
                    <textarea class="form-control" id="desc" name="desc" rows="10" maxlength="1024" placeholder="Descripción del problema" required></textarea>
                    <br>
                    <br>
                </div>
                <div class="d-grid gap-2 col-6 mx-auto">
                    <button type="submit" id="action" name="action" class="btn btn-outline-dark" value="send">Subir reporte</button>
                </div>
            </form>
        </div>
    </body>
</html>
