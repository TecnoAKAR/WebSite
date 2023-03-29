<%-- 
    Document   : reporte
    Created on : 27/03/2023, 07:57:15 PM
    Author     : Axel Zarate Lozano
--%>

<%@page import="org.akar.dao.Solucion"%>
<%@page import="org.akar.helper.SolucionHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }  
            
            switch(request.getParameter("tipo")){
                case "Sol":
                    Solucion sol = new SolucionHelper().getById(request);
                    if(sol == null){
        %>
                        <h3> Ha ocurrido un error </h3>
        <%
                    } else{
        %>
                        <div align="left">
                            <table width="50%">
                                <tr>
                                    <th>
                                        <h3> <%=sol.getIdTarea()%>. <%=sol.getNomTarea()%> </h3>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Reportado el: </b> <br/> <%=sol.getFecha()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Por: </b> <br/> <%=sol.getNombreU()%> <%=sol.getApellidosU()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Correo del usuario: </b> <br/> <%=sol.getCorreoU()%>
                                    </td>    
                                </tr>
                                <tr>
                                    <td>
                                        <b> Problemática: </b> <br/> <%=sol.getProblema()%>
                                    </td>    
                                </tr>
                            </table>
                        </div>
                        <div>
                            <form method="post" action="Soporte.jsp">

                                <input type="hidden" id="idTarea" name="idTarea" value="<%=sol.getIdTarea()%>">
                                <input type="hidden" id="estatusInicial" name="estatusInicial" value="<%=sol.getEstatus()%>">

                                <label for="exampleFormControlInput1" class="form-label"> <b> Estatus </b> </label>
                                <select id="tipoUsuario" name="estatus" class="form-control">
                                    <option selected> <%=sol.getEstatus()%> </option>
                                    <option value="Finalizado"> Finalizado </option>
                                </select>

                                <label for="exampleFormControlTextarea1" class="form-label"> <b> Solución </b> </label>
                                <textarea class="form-control" na   me="sol" id="sol" rows="3"> </textarea>

                                <button type="submit" id="send" name="send" value="enviar" class="btn btn-primary btn-lg">Subir</button>
                                <a href="?action=solu"> <button type="button" class="btn btn-secondary btn-lg">Regresar a la lista</button> </a>
                                
                            </form>
                        </div>
        <%                                
                    }
                    break;
                case "Man":
                    Solucion solMan = new SolucionHelper().getById(request);
                    if(solMan == null){
        %>
                        <h3> Ha ocurrido un error </h3>
        <%
                    } else{
        %>
                        <div align="left">
                            <table width="50%">
                                <tr>
                                    <th>
                                        <h3> <%=solMan.getIdTarea()%>. <%=solMan.getNomTarea()%> </h3>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Reportado el: </b> <br/> <%=solMan.getFecha()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Por: </b> <br/> <%=solMan.getNombreU()%> <%=solMan.getApellidosU()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Correo del usuario: </b> <br/> <%=solMan.getCorreoU()%>
                                    </td>    
                                </tr>
                                <tr>
                                    <td>
                                        <b> Problemática: </b> <br/> <%=solMan.getProblema()%>
                                    </td>    
                                </tr>
                                <tr>
                                    <td>
                                        <b> Reporte de mantenimiento: </b> <br/> <%=solMan.getSolMan()%>
                                    </td>    
                                </tr>
                            </table>
                        </div>
                        <div>
                            <form method="post" action="Soporte.jsp">

                                <input type="hidden" id="idTarea" name="idTarea" value="<%=solMan.getIdTarea()%>">
                                <input type="hidden" id="estatusInicial" name="estatusInicial" value="<%=solMan.getEstatus()%>">

                                <label for="exampleFormControlInput1" class="form-label"> <b> Estatus </b> </label>
                                <select id="tipoUsuario" name="estatus" class="form-control">
                                    <option selected> <%=solMan.getEstatus()%> </option>
                                    <option value="Finalizado"> Finalizado </option>
                                </select>

                                <label for="exampleFormControlTextarea1" class="form-label"> <b> Solución </b> </label>
                                <textarea class="form-control" name="sol" id="sol" rows="3"> </textarea>

                                <button type="submit" id="send" name="send" value="enviar" class="btn btn-primary btn-lg">Subir</button>
                                <a href="?action=mant"> <button type="button" class="btn btn-secondary btn-lg">Regresar a la lista</button> </a>
                                
                            </form>
                        </div>
        <%
                    }
                    break;
            }    
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js" integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i" crossorigin="anonymous"></script>
    </body>
</html>
