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
    </head>
    <style>
        h1{
            font-family:"Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
            font-size: 69px;
            padding: 20px 20px;
            text-align: center;
        }
        
        body{
            background-color:lightsteelblue ;
            margin-left: 200px;
            margin-right: 200px;   
        }
    </style>
    
    
    <body>
        
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
            }
        %>
        <h1 style="color:#6666ff"> Bienvenido Asistente</h1>
        <div>
            <form>
                <div>
                <div>
                    <input type="email" name="correo" id="correo" class="form-control" placeholder="Correo electrónico del usuario" required>
                    <br>
                    <br>
                </div>    
                <div class="mb-3">
                    <textarea class="form-control" id="desc" name="desc" rows="7" maxlength="1024" placeholder="Descripción del problema" required></textarea>
                    <br>
                    <br>
                </div>
                <div>
                    <input type="text" class="form-control" id="estatus" name="estatus" placeholder="Estatus" required>
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
