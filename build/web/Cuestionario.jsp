<%-- 
    Document   : Cuestionario
    Created on : 24/02/2023, 04:50:49 AM
    Author     : Axel Zarate Lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cuestionario</title>
        <style>
                table, th, td {
                  border: 1px solid black;
                  border-collapse: collapse;
                }
                th, td {
                  padding: 5px;
                }
        </style>
    </head>
    <body>
        <form method="post">
            <table>
                <tr>
                    <th>Pregunta</th>
                    <th>Acuerdo Total</th>
                    <th>Acuerdo Parcial</th>
                    <th>Desacuerdo Parcial</th>
                    <th>Desacuerdo Total</th>
                </tr>
                <tr>
                    <td>1 Prefiero hacer cosas con otras personas en lugar de hacerlas solo.</td>
                    <td><input type="radio" name="p1" value="0"></td>
                    <td><input type="radio" name="p1" value="0"></td>
                    <td><input type="radio" name="p1" value="1"></td>
                    <td><input type="radio" name="p1" value="1"></td>
                </tr>
                <tr>
                    <td>2 Prefiero hacer las cosas de la misma manera una y otra vez.</td>
                    <td><input type="radio" name="p2" value="0"></td>
                    <td><input type="radio" name="p2" value="0"></td>
                    <td><input type="radio" name="p2" value="1"></td>
                    <td><input type="radio" name="p2" value="1"></td>
                </tr>
                <tr>
                    <td>3 Si intento imaginar algo me es muy fácil construir una imagen en mi mente.</td>
                    <td><input type="radio" name="p3" value="0"></td>
                    <td><input type="radio" name="p3" value="0"></td>
                    <td><input type="radio" name="p3" value="1"></td>
                    <td><input type="radio" name="p3" value="1"></td>
                </tr>
                <tr>
                    <td>4 Con frecuencia me quedo tan profundamente absorto en un tema que pierdo de vista todo lo demás.</td>
                    <td><input type="radio" name="p4" value="0"></td>
                    <td><input type="radio" name="p4" value="0"></td>
                    <td><input type="radio" name="p4" value="1"></td>
                    <td><input type="radio" name="p4" value="1"></td>
                </tr>
                <tr>
                    <td>5 A menudo percibo ligeros sonidos que los demás no aprecian.</td>
                    <td><input type="radio" name="p5" value="0"></td>
                    <td><input type="radio" name="p5" value="0"></td>
                    <td><input type="radio" name="p5" value="1"></td>
                    <td><input type="radio" name="p5" value="1"></td>
                </tr>
                <tr>
                    <td>6 A menudo me fijo en las matrículas
                    <td><input type="radio" name="p6" value="0"></td>
                    <td><input type="radio" name="p6" value="0"></td>
                    <td><input type="radio" name="p6" value="1"></td>
                    <td><input type="radio" name="p6" value="1"></td>
                </tr>
                <tr>      
                    <td>7 A menudo otras personas me comentan que lo que he dicho es de mala educación, a pesar de que a mí no me lo pare</td>
                    <td><input type="radio" name="p7" value="0"></td>
                    <td><input type="radio" name="p7" value="0.5"></td>
                    <td><input type="radio" name="p7" value="1"></td>
                    <td><input type="radio" name="p7" value="1"></td>
                </tr>
                <tr>
                    <td>8 Cuando leo un relato puedo imaginarme con claridad cómo podrían ser los personajes.</td>
                    <td><input type="radio" name="p8" value="0"></td>
                    <td><input type="radio" name="p8" value="0"></td>
                    <td><input type="radio" name="p8" value="1"></td>
                    <td><input type="radio" name="p8" value="1"></td>
                </tr>
                <tr>
                    <td>9 Me fascinan las fechas.</td>
                    <td><input type="radio" name="p9" value="0"></td>
                    <td><input type="radio" name="p9" value="0"></td>
                    <td><input type="radio" name="p9" value="1"></td>
                    <td><input type="radio" name="p9" value="1"></td>
                </tr>
                <tr>
                    <td>10 En un grupo social puedo llevar con facilidad el hilo de las diferentes conversaciones de la gente.</td>
                    <td><input type="radio" name="p10" value="0"></td>
                    <td><input type="radio" name="p10" value="0"></td>
                    <td><input type="radio" name="p10" value="1"></td>
                    <td><input type="radio" name="p10" value="1"></td>
                </tr>
                <tr>
                    <td>11 Me encuentro cómodo en las situaciones sociales.</td>
                    <td><input type="radio" name="p11" value="0"></td>
                    <td><input type="radio" name="p11" value="0"></td>
                    <td><input type="radio" name="p11" value="1"></td>
                    <td><input type="radio" name="p11" value="1"></td>
                </tr>
                <tr>
                    <td>12 Suelo darme cuenta de detalles que otras personas pasan por alto.</td>
                    <td><input type="radio" name="p12" value="0"></td>
                    <td><input type="radio" name="p12" value="0"></td>
                    <td><input type="radio" name="p12" value="1"></td>
                    <td><input type="radio" name="p12" value="1"></td>
                </tr>
                <tr>
                    <td>13 Prefiero antes ir a una biblioteca que a una fiesta.</td>
                    <td><input type="radio" name="p13" value="0"></td>
                    <td><input type="radio" name="p13" value="0"></td>
                    <td><input type="radio" name="p13" value="1"></td>
                    <td><input type="radio" name="p13" value="1"></td>
                </tr>
                <tr>
                    <td>14 Me resulta fácil inventarme historias.</td>
                    <td><input type="radio" name="p14" value="0"></td>
                    <td><input type="radio" name="p14" value="0"></td>
                    <td><input type="radio" name="p14" value="1"></td>
                    <td><input type="radio" name="p14" value="1"></td>
                </tr>
                <tr>
                    <td>15 Me siento más atraído por las personas que por las cosas.</td>
                    <td><input type="radio" name="p15" value="0"></td>
                    <td><input type="radio" name="p15" value="0"></td>
                    <td><input type="radio" name="p15" value="1"></td>
                    <td><input type="radio" name="p15" value="1"></td>
                </tr>
                <tr>
                    <td>16 Tiendo a tener intereses muy intensos y me molesto si no los puedo ejercer.</td>
                    <td><input type="radio" name="p16" value="0"></td>
                    <td><input type="radio" name="p16" value="0"></td>
                    <td><input type="radio" name="p16" value="1"></td>
                    <td><input type="radio" name="p16" value="1"></td>
                </tr>
                <tr>
                    <td>17 Me gusta la cháchara social.</td>
                    <td><input type="radio" name="p17" value="0"></td>
                    <td><input type="radio" name="p17" value="0"></td>
                    <td><input type="radio" name="p17" value="1"></td>
                    <td><input type="radio" name="p17" value="1"></td>
                </tr>
                <tr>
                    <td>18 Cuando hablo no siempre es fácil para los demás meter baza.</td>
                    <td><input type="radio" name="p18" value="0"></td>
                    <td><input type="radio" name="p18" value="0"></td>
                    <td><input type="radio" name="p18" value="1"></td>
                    <td><input type="radio" name="p18" value="1"></td>
                </tr>
                <tr>
                    <td>19 Me fascinan los números.</td>
                    <td><input type="radio" name="p19" value="0"></td>
                    <td><input type="radio" name="p19" value="0"></td>
                    <td><input type="radio" name="p19" value="1"></td>
                    <td><input type="radio" name="p19" value="1"></td>
                </tr>
                <tr>
                    <td>20 Cuando leo novelas encuentro difícil entender las intenciones de los personajes.</td>
                    <td><input type="radio" name="p20" value="0"></td>
                    <td><input type="radio" name="p20" value="0"></td>
                    <td><input type="radio" name="p20" value="1"></td>
                    <td><input type="radio" name="p20" value="1"></td>
                </tr>
            </table>
            <button type="submit" id="action" name="action" value="ana">Analizar</button>
        </form>
        <%
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
                case "ana":
                    int sum = 0;
                    for (int i = 1; i <= 20; i++) {
                        sum = sum + Integer.parseInt(request.getParameter("p"+String.valueOf(i)));
                    }
        %>
                        <script>
                            alert(<%=sum%>);
                        </script>
        <%
                    break;
            }
        %>
    </body>
</html>
