<%@page import="org.akar.helper.PSUsuarioHelper"%>
<%@page import="org.akar.dao.MsjForo"%>
<%@page import="java.util.List"%>
<%@page import="org.akar.dao.PSUsuario"%>
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
                    boolean enviado = new PSUsuarioHelper().sendMsg(request);
            }
    
%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foro</title>
        <!-- Bootstrap core CSS -->
        <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="sources/assets/css/fontawesome.css">
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <%
            List<MsjForo> msgs = new PSUsuarioHelper().getMsg();
            for(MsjForo msjs : msgs){
                if(sesion.getUsuario().getNomUser().equals(msjs.getUsuario().getNomUser())){
        %>
                    <div align="right">
                        <font style="color: green"> <%=msjs.getUsuario().getNomUser()%> </font> <%=msjs.getMensaje()%> <font style="color: graytext"><%=msjs.getHora().toString()%></font>
                    </div>
        <%
                } else{
        %>
                    <div>
                        <font style="color: blue"> <%=msjs.getUsuario().getNomUser()%> </font> <%=msjs.getMensaje()%> <font style="color: graytext"><%=msjs.getHora().toString()%></font>
                    </div>
        <%
                }
            }
        %>
        <hr>
        <form method="post">
            <input type="hidden" id="idAutor" name="idAutor" value="<%=sesion.getUsuario().getIdUsuario()%>">
            <textarea class="form-control" name="msj" id="msj" rows="3"> </textarea><button type="submit" id="action" name="action" value="send"> > </button>
        </form>
    </body>
    
</html>
<%
        }
    } catch(Exception ex){
    
    }
%>