<%@page import="org.akar.dao.PSReporte"%>
<%@page import="org.akar.helper.ReporteGerenteMHelper"%>
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
        <title>Gerente de Mantenimiento</title>
    </head>
    <body>
    <%
            String action = request.getParameter("action");
            if(action == null){
                action = "";
            }
        %>
    <div align="center">
        <h1><center>Reportes Abiertos y en Mantenimiento</center></h1>
                        <table class="table">
                            <tr>
                                <th>
                                    Reporte
                                </th>
                            </tr>

                            <%
                                 List<Reporte> Reportito= new ReporteGerenteMHelper().getList();
                                for(Reporte reportito : Reportito){
                            %>
                                    <tr>
                                        <td>
                                            <a href="?action=rep&idreporte=<%=reportito.getIdReporte()%>"> <%=reportito.getIdReporte()%></a>
                                        </td>
                                        <td>
                                            
                                        </td>
                                    </tr>    
                            <%
                                }
                            %>

                        </table>
                    </div>        
                            <%
                                if (action.equals("rep")) {
                            %>
                                    <jsp:include page="ReporteGerenteM.jsp" />
                            <%
                                }
                        String send=request.getParameter("send");
                        String condicion= request.getParameter("Estatus");
                        if(send==null){
                            send="";
                        }
                        if(send.equals("enviar")){
                        if(condicion.equals("En Mantenimiento")){
                        boolean reporte;
                        reporte=new ReporteGerenteMHelper().AsignarReporteIng(request);
                        if(reporte==true){
                            %>
                               <script> alert("Mantenimiento Finalizado"); </script>
                            <%
                        }
                            else{

%>
                               <script> alert("Reporte No Actualizado"); </script>
                            <%
                            }
                          }
                            else{
                        if(condicion.equals("Mantenimiento Finalizado")){
                        boolean reporte;
                        reporte=new ReporteGerenteMHelper().AsignarReporteSop(request);
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
                        }
                        }
%>
                            
                

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js" integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i" crossorigin="anonymous"></script>
    </body>
</html>