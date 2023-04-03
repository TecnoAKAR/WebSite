<%-- 
    Document   : IngMantenimiento
    Created on : 28/03/2023, 10:42:57 PM
    Author     : 52553
--%>

<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="org.akar.dao.ReporteCambios"%>
<%@page import="org.akar.helper.ListEstatusHelper"%>
<%@page import="org.akar.dao.Reporte"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="esp">
    <%
    PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");
    if(sesion != null){
        if(sesion.getTipo().getIdTipo() != 9){
            response.sendRedirect("notAccess.jsp");
        }
    } else{
        response.sendRedirect("notSession.jsp");
    }
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>IngMantenimiento</title>
    </head>
    <style> 
        body{
            margin: 0;
        }
        
        .left{
           background: #f3f3f3;
           width: 35%;
           position: fixed ;
           top: 0px;
           height: 100%;
           left: 0px;
        }
        .right{
            width: 65%;
            height: 100%;
            position: fixed;
            top: 0px;
            right: 0px;
        }
        .Solucion{
            width: 90%;
        }
        .Selecciona{
            width: 75%;
        }
    </style>
    <body>
        <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }
        %>
        <div class="container">
            <div class="left"> 
                <h1><center>Reportes asignados</center></h1>
                <hr>
                <div >
                    <table class="table table-striped table-hover">
                        <thead>
                          <tr>
                              <th><h4>Identificador</h4></th> 
                              <th><h4>Tareas asignadas</h4></th> 
                            <th><h4>Fecha de reporte</h4></th>  
                          </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <%
                            List<ReporteCambios>ListEstatus = new ListEstatusHelper().getList();
                            if( ListEstatus != null && ListEstatus.size() > 0 )
                            {
                               for( ReporteCambios listEstatus : ListEstatus )
                               {
                        %>
                          <tr>
                            <th value="<%=listEstatus.getRep().getIdReporte()%>">
                                <a href="?action=rep&idreporte=<%=listEstatus.getRep().getIdReporte()%>"> <%=listEstatus.getRep().getIdReporte()%> </a>
                            </th>
                            <th><%=listEstatus.getRep().getProblema()%></th>
                            <th><%=listEstatus.getRep().getFechaI()%></th>
                            
                            
                            <%
                                }
                            }
                        %>
                            
                          </tr>
                          
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="right">
                <%
                               if(action.equals("rep")){
                            %>
                                <jsp:include page="reporteSol.jsp" />
                            <%
                                }
            String send = request.getParameter("action");
            if(send == null){
                send = "";
            }
            
            if(send.equals("send")){
                boolean updated = new ListEstatusHelper().addRegistro(request);
                if(updated == true){
                %>
                    <script> alert("Reporte finalizado"); </script>
        <%
                } else{
        %>
                    <script> alert("Hubo un error al actualizar el reporte"); </script>
        <%
                }
            }
         %>
            </div>
        </div>
         
    </body>
</html>
