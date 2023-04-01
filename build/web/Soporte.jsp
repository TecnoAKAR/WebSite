<%-- 
    Document   : Soporte
    Created on : 27/03/2023, 07:00:58 PM
    Author     : Axel Zarate Lozano
--%>

<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="org.akar.dao.Solucion"%>
<%@page import="java.util.List"%>
<%@page import="org.akar.helper.SolucionHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");

//    if(sesion != null){
//        if(!sesion.getTipo().equals("Ingeniero Soporte")){
//            response.sendRedirect("notAccess.jsp");
//        }
//    } else{
//        response.sendRedirect("notSession.jsp");
//    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Soporte</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    </head>
    
    <body>    
        <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }
        %>
        
        <br/>
        <br/>
        
        <div align="center">
            <a href="?action=solu"> <button type="button" class="btn btn-danger"> A solucionar </button> </a>
            <a href="?action=mant"> <button type="button" class="btn btn-warning"> De mantenimiento </button> </a>
        </div>
        
        <br/>
        <br/>
        <%
            if(action.equals("solu")){
                List<Solucion> list = new SolucionHelper().getListSop();
                if (list == null){
        %>
                    <h3> Sin reportes </h3>
        <%
                } else{
        %>
                    <div align="center">
                        <table class="table">
                            <tr>
                                <th>
                                    Reporte
                                </th>
                                <th>
                                    Fecha de creación
                                </th>
                            </tr>

                            <%
                                for(Solucion solucion : list){
                            %>
                                    <tr>
                                        <td>
                                            <a href="?action=rep&tipo=Sol&idreporte=<%=solucion.getIdTarea()%>"> <%=solucion.getIdTarea()%>. <%=solucion.getNomTarea()%> </a>
                                        </td>
                                        <td>
                                            <%=solucion.getFecha().toString()%>
                                        </td>
                                    </tr>    
                            <%
                                }
                            %>

                        </table>
                    </div>        
        <%
                }
            } else if(action.equals("mant")){
                List<Solucion> list = new SolucionHelper().getListMan();
                if (list == null){
        %>
                    <h3> Sin reportes </h3>
        <%
                } else{
        %>
                    <div align="center">
                        <table class="table">
                            <tr>
                                <th>
                                    Reporte
                                </th>
                                <th>
                                    Fecha de creación
                                </th>
                            </tr>

                            <%
                                for(Solucion solucion : list){
                            %>
                                    <tr>
                                        <td>
                                            <a href="?action=rep&tipo=Man&idreporte=<%=solucion.getIdTarea()%>"> <%=solucion.getIdTarea()%>. <%=solucion.getNomTarea()%> </a>
                                        </td>
                                        <td>
                                            <%=solucion.getFecha().toString()%>
                                        </td>
                                    </tr>    
                            <%
                                }
                            %>

                        </table>
                    </div>
        <%
                }
            } else if(action.equals("rep")){
        %>
                <jsp:include page="reporte.jsp" />
                
        <%
            }

            String send = request.getParameter("send");
            if(send == null){
                send = "";
            }
            
            if(send.equals("enviar")){
                boolean updated = new SolucionHelper().update(request);
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js" integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i" crossorigin="anonymous"></script>
    </body>

</html>