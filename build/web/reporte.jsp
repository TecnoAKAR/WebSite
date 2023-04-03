<%-- 
    Document   : reporte
    Created on : 27/03/2023, 07:57:15 PM
    Author     : Axel Zarate Lozano
--%>

<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="java.util.Date"%>
<%@page import="org.akar.dao.RelReporteUsuario"%>
<%@page import="org.akar.dao.Reporte"%>
<%@page import="org.akar.helper.SolucionHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    PSUsuario sesion = (PSUsuario)session.getAttribute("usuario");

    if(sesion != null){
        if(sesion.getTipo().getIdTipo() != 7){
            response.sendRedirect("notAccess.jsp");
        }
    } else{
        response.sendRedirect("notSession.jsp");
    }
%>
<html>
    <body>
        <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }  
            
                RelReporteUsuario rep = new SolucionHelper().getById(request);
                if(rep == null){
        %>
                    <h3> Ha ocurrido un error </h3>
        <%
                } else{
        %>
                    <div align="left">
                        <table width="50%">
                            <tr>
                                <th>
                                    <h3> Reporte: <%=rep.getRep().getIdReporte()%> </h3>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <b> Reportado el: </b> <br/> <%=rep.getRep().getFechaI()%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b> Por: </b> <br/> <%=rep.getUser().getIdUsuario()%>. <%=rep.getUser().getNomUser()%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b> Problemática: </b> <br/> <%=rep.getRep().getProblema()%>
                                </td>    
                            </tr>
                        </table>
                    </div>
                    
                        <%
                            if(request.getParameter("tipo").equals("Sol")){
                        %>
                                <div>
                                    <form method="post" action="Soporte.jsp">

                                        <input type="hidden" id="idTarea" name="idRep" value="<%=rep.getRep().getIdReporte()%>">
                                        <input type="hidden" id="estatusInicial" name="estatI" value="<%=rep.getRep().getEstatus()%>">
                                        <input type="hidden" id="estatusInicial" name="idIng" value="<%=sesion.getUsuario().getIdUsuario()%>">

                                        <label for="exampleFormControlInput1" class="form-label"> <b> Estatus </b> </label>
                                        <select id="tipoUsuario" name="estat" class="form-control">
                                            <option selected> <%=rep.getRep().getEstatus()%> </option>
                                            <option value="Finalizado"> Finalizado </option>
                                        </select>

                                        <label for="exampleFormControlTextarea1" class="form-label"> <b> Solución </b> </label>
                                        <textarea class="form-control" name="sol" id="sol" rows="3"> </textarea>

                                        <button type="submit" id="send" name="send" value="enviar" class="btn btn-primary btn-lg">Subir</button>
                                        <a href="?action=solu"> <button type="button" class="btn btn-secondary btn-lg">Regresar a la lista</button> </a>

                                    </form>
                                </div>
                        <%
                            } else{
                        %>
                                <div>
                                    <form method="post" action="Soporte.jsp">

                                        <input type="hidden" id="idTarea" name="idRep" value="<%=rep.getRep().getIdReporte()%>">
                                        <input type="hidden" id="estatusInicial" name="estatI" value="<%=rep.getRep().getEstatus()%>">
                                        <input type="hidden" id="estatusInicial" name="idIng" value="<%=sesion.getUsuario().getIdUsuario()%>">
                                        <input type="hidden" id="sol" name="sol" value="<%=rep.getRep().getSolucion()%>">

                                        <label for="exampleFormControlInput1" class="form-label"> <b> Estatus </b> </label>
                                        <select id="tipoUsuario" name="estat" class="form-control">
                                            <option selected> <%=rep.getRep().getEstatus()%> </option>
                                            <option value="Finalizado"> Finalizado </option>
                                        </select>

                                        <label for="exampleFormControlTextarea1" class="form-label"> <b> Solución </b> </label>
                                        <textarea disabled="true" class="form-control" rows="3"> <%=rep.getRep().getSolucion()%> </textarea>

                                        <button type="submit" id="send" name="send" value="enviar" class="btn btn-primary btn-lg">Subir</button>
                                        <a href="?action=solu"> <button type="button" class="btn btn-secondary btn-lg">Regresar a la lista</button> </a>

                                    </form>
                                </div>
        <%                                
                    }
                }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js" integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i" crossorigin="anonymous"></script>
    </body>
</html>
