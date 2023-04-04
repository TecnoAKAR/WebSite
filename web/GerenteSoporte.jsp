<%@page import="org.akar.dao.PSReporte"%>
<%@page import="org.akar.helper.ReporteGerenteHelper"%>
<%@page import="java.util.List"%>
<%@page import="org.akar.dao.Reporte"%>
<html lang="esp">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Gerente de Soporte</title>
    </head>
    <body>
     <h1><center>Reportes Abiertos y en Mantenimiento</center></h1>
     <br>
     <br>
    <%
            String action = request.getParameter("action");
            List<Reporte> Reportito= new ReporteGerenteHelper().getList();
            if(action == null){
                action = "";
            }
            if(Reportito==null){
                %>
     <h2><center>Sin reportes</center></h2>
                <%
            }
            else{
        %>
    <div align="center">
                        <table class="table">
                            <tr>
                                <th>
                                    Reporte
                                </th>
                                <th>
                                    Estatus
                                </th>
                                <th>
                                    Fecha Inicial
                                </th>
                            </tr>

                            <%
                                for(Reporte reportito : Reportito){
                            %>
                                    <tr>
                                        <td>
                                            <a href="?action=rep&idreporte=<%=reportito.getIdReporte()%>"> <%=reportito.getIdReporte()%></a>
                                        </td>
                                        <td>
                                            <%=reportito.getEstatus() %>
                                        </td>
                                        <td>
                                            <%=reportito.getFechaI()%>
                                        </td>
                                    </tr>    
                            <%
                                }
                            }
                            %>

                        </table>
        
        <br>
        <br>
                    </div>        
                            <%
                                if (action.equals("rep")) {
                            %>
                                    <jsp:include page="ReporteGerente.jsp" />
                            <%
                                }
                        String send = request.getParameter("send");
                        String condicion= request.getParameter("Estatus");
                        if(send==null){
                            send="";
                        }
                        if(condicion==null){
                            send="";
                        }
                        if(send.equals("enviar")){
                        if(condicion.equals("En proceso")){
                        boolean reporte;
                        reporte=new ReporteGerenteHelper().AsignarReporteIng(request);
                        if(reporte==true){
                            %>
                               <script> alert("Reporte actualizado"); </script>
                            <%
                        }
                            else{

%>
                               <script> alert("Reporte No Actualizado"); </script>
                            <%
                            }
                          }
                            else{
                        if(condicion.equals("A Mantenimiento")){
                        boolean reporte;
                        reporte=new ReporteGerenteHelper().AsignarReporteIng(request);
                        if(reporte==true){
                            %>
                               <script> alert("Reporte actualizado"); </script>
                            <%
                        }
                            else{
%>
                               <script> alert("Reporte No Actualizado"); </script>
                            <%
                            }
                          }
                        if(condicion.equals("Mantenimiento hecho")){
                            boolean reporte;
                            reporte = new ReporteGerenteHelper().AsignarReporteIng(request);
                            if (reporte == true) {
                            %>
                               <script> alert("Reporte actualizado"); </script>
                            <%
                            } else {
                            %>
                               <script> alert("Reporte No Actualizado"); </script>
                            <%
                                }
                        }
                        }
                        }
%>
                            
                

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js" integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i" crossorigin="anonymous"></script>
    </body>
</html>