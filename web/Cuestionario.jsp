<%-- 
    Document   : Cuestionario
    Created on : 24/02/2023, 04:50:49 AM
    Author     : Axel Zarate Lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        
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
        <form method="post">
            <table class="table">
                <tr>
                    <th>Pregunta</th>
                    <th>Acuerdo Total</th>
                    <th>Acuerdo Parcial</th>
                    <th>Desacuerdo Parcial</th>
                    <th>Desacuerdo Total</th>
                </tr>
                <tr>
                    <td>1 Prefiero hacer cosas con otras personas en lugar de hacerlas solo.</td>
                    <td><input type="radio" name="p1" value="3" required></td>
                    <td><input type="radio" name="p1" value="2" required></td>
                    <td><input type="radio" name="p1" value="1" required></td>
                    <td><input type="radio" name="p1" value="0" required></td>
                </tr>
                <tr>
                    <td>2 Prefiero hacer las cosas de la misma manera una y otra vez.</td>
                    <td><input type="radio" name="p2" value="3" required></td>
                    <td><input type="radio" name="p2" value="2" required></td>
                    <td><input type="radio" name="p2" value="1" required></td>
                    <td><input type="radio" name="p2" value="0" required></td>
                </tr>
                <tr>
                    <td>3 Si intento imaginar algo me es muy fácil construir una imagen en mi mente.</td>
                    <td><input type="radio" name="p3" value="3" required></td>
                    <td><input type="radio" name="p3" value="2" required></td>
                    <td><input type="radio" name="p3" value="1" required></td>
                    <td><input type="radio" name="p3" value="0" required></td>
                </tr>
                <tr>
                    <td>4 Con frecuencia me quedo tan profundamente absorto en un tema que pierdo de vista todo lo demás.</td>
                    <td><input type="radio" name="p4" value="3" required></td>
                    <td><input type="radio" name="p4" value="2" required></td>
                    <td><input type="radio" name="p4" value="1" required></td>
                    <td><input type="radio" name="p4" value="0" required></td>
                </tr>
                <tr>
                    <td>5 A menudo percibo ligeros sonidos que los demás no aprecian.</td>
                    <td><input type="radio" name="p5" value="3" required></td>
                    <td><input type="radio" name="p5" value="2" required></td>
                    <td><input type="radio" name="p5" value="1" required></td>
                    <td><input type="radio" name="p5" value="0" required></td>
                </tr>
                <tr>
                    <td>6 A menudo me fijo en las matrículas</td>
                    <td><input type="radio" name="p6" value="3" required></td>
                    <td><input type="radio" name="p6" value="2" required></td>
                    <td><input type="radio" name="p6" value="1" required></td>
                    <td><input type="radio" name="p6" value="0" required></td>
                </tr>
                <tr>      
                    <td>7 A menudo otras personas me comentan que lo que he dicho es de mala educación, a pesar de que a mí no me lo parece</td>
                    <td><input type="radio" name="p7" value="3" required></td>
                    <td><input type="radio" name="p7" value="2" required></td>
                    <td><input type="radio" name="p7" value="1" required></td>
                    <td><input type="radio" name="p7" value="0" required></td>
                </tr>
                <tr>
                    <td>8 Cuando leo un relato puedo imaginarme con claridad cómo podrían ser los personajes.</td>
                    <td><input type="radio" name="p8" value="3" required></td>
                    <td><input type="radio" name="p8" value="2" required></td>
                    <td><input type="radio" name="p8" value="1" required></td>
                    <td><input type="radio" name="p8" value="0" required></td>
                </tr>
                <tr>
                    <td>9 Me fascinan las fechas.</td>
                    <td><input type="radio" name="p9" value="3" required></td>
                    <td><input type="radio" name="p9" value="2" required></td>
                    <td><input type="radio" name="p9" value="1" required></td>
                    <td><input type="radio" name="p9" value="0" required></td>
                </tr>
                <tr>
                    <td>10 En un grupo social puedo llevar con facilidad el hilo de las diferentes conversaciones de la gente.</td>
                    <td><input type="radio" name="p10" value="3" required></td>
                    <td><input type="radio" name="p10" value="2" required></td>
                    <td><input type="radio" name="p10" value="1" required></td>
                    <td><input type="radio" name="p10" value="0" required></td>
                </tr>
                <tr>
                    <td>11 Me encuentro cómodo en las situaciones sociales.</td>
                    <td><input type="radio" name="p11" value="3" required></td>
                    <td><input type="radio" name="p11" value="2" required></td>
                    <td><input type="radio" name="p11" value="1" required></td>
                    <td><input type="radio" name="p11" value="0" required></td>
                </tr>
                <tr>
                    <td>12 Suelo darme cuenta de detalles que otras personas pasan por alto.</td>
                    <td><input type="radio" name="p12" value="3" required></td>
                    <td><input type="radio" name="p12" value="2" required></td>
                    <td><input type="radio" name="p12" value="1" required></td>
                    <td><input type="radio" name="p12" value="0" required></td>
                </tr>
                <tr>
                    <td>13 Prefiero antes ir a una biblioteca que a una fiesta.</td>
                    <td><input type="radio" name="p13" value="3" required></td>
                    <td><input type="radio" name="p13" value="2" required></td>
                    <td><input type="radio" name="p13" value="1" required></td>
                    <td><input type="radio" name="p13" value="0" required></td>
                </tr>
                <tr>
                    <td>14 Me resulta fácil inventarme historias.</td>
                    <td><input type="radio" name="p14" value="3" required></td>
                    <td><input type="radio" name="p14" value="2" required></td>
                    <td><input type="radio" name="p14" value="1" required></td>
                    <td><input type="radio" name="p14" value="0" required></td>
                </tr>
                <tr>
                    <td>15 Me siento más atraído por las personas que por las cosas.</td>
                    <td><input type="radio" name="p15" value="3" required></td>
                    <td><input type="radio" name="p15" value="2" required></td>
                    <td><input type="radio" name="p15" value="1" required></td>
                    <td><input type="radio" name="p15" value="0" required></td>
                </tr>
                <tr>
                    <td>16 Tiendo a tener intereses muy intensos y me molesto si no los puedo ejercer.</td>
                    <td><input type="radio" name="p16" value="3" required></td>
                    <td><input type="radio" name="p16" value="2" required></td>
                    <td><input type="radio" name="p16" value="1" required></td>
                    <td><input type="radio" name="p16" value="0" required></td>
                </tr>
                <tr>
                    <td>17 Me gusta la cháchara social.</td>
                    <td><input type="radio" name="p17" value="3" required></td>
                    <td><input type="radio" name="p17" value="2" required></td>
                    <td><input type="radio" name="p17" value="1" required></td>
                    <td><input type="radio" name="p17" value="0" required></td>
                </tr>
                <tr>
                    <td>18 Cuando hablo no siempre es fácil para los demás meter baza.</td>
                    <td><input type="radio" name="p18" value="3" required></td>
                    <td><input type="radio" name="p18" value="2" required></td>
                    <td><input type="radio" name="p18" value="1" required></td>
                    <td><input type="radio" name="p18" value="0" required></td>
                </tr>
                <tr>
                    <td>19 Me fascinan los números.</td>
                    <td><input type="radio" name="p19" value="3" required></td>
                    <td><input type="radio" name="p19" value="2" required></td>
                    <td><input type="radio" name="p19" value="1" required></td>
                    <td><input type="radio" name="p19" value="0" required></td>
                </tr>
                <tr>
                    <td>20 Cuando leo novelas encuentro difícil entender las intenciones de los personajes.</td>
                    <td><input type="radio" name="p20" value="3" required></td>
                    <td><input type="radio" name="p20" value="2" required></td>
                    <td><input type="radio" name="p20" value="1" required></td>
                    <td><input type="radio" name="p20" value="0" required></td>
                </tr>
                <tr>
                    <td>21 No me gusta especialmente leer novelas.</td>
                    <td><input type="radio" name="p21" value="3" required></td>
                    <td><input type="radio" name="p21" value="2" required></td>
                    <td><input type="radio" name="p21" value="1" required></td>
                    <td><input type="radio" name="p21" value="0" required></td>
                </tr>
                <tr>
                    <td>22 Encuentro difícil hacer nuevos amigos.</td>
                    <td><input type="radio" name="p22" value="3" required></td>
                    <td><input type="radio" name="p22" value="2" required></td>
                    <td><input type="radio" name="p22" value="1" required></td>
                    <td><input type="radio" name="p22" value="0" required></td>
                </tr>
                <tr>
                    <td>23 Continuamente me doy cuenta de patrones en las cosas.</td>
                    <td><input type="radio" name="p23" value="3" required></td>
                    <td><input type="radio" name="p23" value="2" required></td>
                    <td><input type="radio" name="p23" value="1" required></td>
                    <td><input type="radio" name="p23" value="0" required></td>
                </tr>
                <tr>
                    <td>24 Prefiero ir antes al teatro que a un museo.</td>
                    <td><input type="radio" name="p24" value="3" required></td>
                    <td><input type="radio" name="p24" value="2" required></td>
                    <td><input type="radio" name="p24" value="1" required></td>
                    <td><input type="radio" name="p24" value="0" required></td>
                </tr>
                <tr>
                    <td>25 No me molesta que mi rutina diaria sea interrumpida.</td>
                    <td><input type="radio" name="p25" value="3" required></td>
                    <td><input type="radio" name="p25" value="2" required></td>
                    <td><input type="radio" name="p25" value="1" required></td>
                    <td><input type="radio" name="p25" value="0" required></td>
                </tr>
                <tr>
                    <td>26 A menudo me ocurre que no sé cómo mantener una conversación.</td>
                    <td><input type="radio" name="p26" value="3" required></td>
                    <td><input type="radio" name="p26" value="2" required></td>
                    <td><input type="radio" name="p26" value="1" required></td>
                    <td><input type="radio" name="p26" value="0" required></td>
                </tr>
                <tr>
                    <td>27 Encuentro fácil "leer entre líneas" cuando alguien me habla.</td>
                    <td><input type="radio" name="p27" value="3" required></td>
                    <td><input type="radio" name="p27" value="2" required></td>
                    <td><input type="radio" name="p27" value="1" required></td>
                    <td><input type="radio" name="p27" value="0" required></td>
                </tr>
                <tr>
                    <td>28 Suelo concentrarme más en la visión general que en los pequeños detalles.</td>
                    <td><input type="radio" name="p28" value="3" required></td>
                    <td><input type="radio" name="p28" value="2" required></td>
                    <td><input type="radio" name="p28" value="1" required></td>
                    <td><input type="radio" name="p28" value="0" required></td>
                </tr>
                <tr>
                    <td>29 No soy bueno recordando números de teléfono.</td>
                    <td><input type="radio" name="p29" value="3" required></td>
                    <td><input type="radio" name="p29" value="2" required></td>
                    <td><input type="radio" name="p29" value="1" required></td>
                    <td><input type="radio" name="p29" value="0" required></td>
                </tr>
                <tr>
                    <td>30 Normalmente no observo los pequeños detalles de una situación o de la apariencia de una persona.</td>
                    <td><input type="radio" name="p30" value="3" required></td>
                    <td><input type="radio" name="p30" value="2" required></td>
                    <td><input type="radio" name="p30" value="1" required></td>
                    <td><input type="radio" name="p30" value="0" required></td>
                </tr>
                <tr>
                    <td>31 Soy capaz de darme cuenta si una persona que me está escuchando se aburre.</td>
                    <td><input type="radio" name="p31" value="3" required></td>
                    <td><input type="radio" name="p31" value="2" required></td>
                    <td><input type="radio" name="p31" value="1" required></td>
                    <td><input type="radio" name="p31" value="0" required></td>
                </tr>
                <tr>
                    <td>32 Encuentro fácil hacer más de una cosa a la vez.</td>
                    <td><input type="radio" name="p32" value="3" required></td>
                    <td><input type="radio" name="p32" value="2" required></td>
                    <td><input type="radio" name="p32" value="1" required></td>
                    <td><input type="radio" name="p32" value="0" required></td>
                </tr>
                <tr>
                    <td>33 Al hablar por teléfono no estoy seguro de cuando es mi turno para hablar.</td>
                    <td><input type="radio" name="p33" value="3" required></td>
                    <td><input type="radio" name="p33" value="2" required></td>
                    <td><input type="radio" name="p33" value="1" required></td>
                    <td><input type="radio" name="p33" value="0" required></td>
                </tr>
                <tr>
                    <td>34 Me gusta hacer cosas de forma espontánea.</td>
                    <td><input type="radio" name="p34" value="3" required></td>
                    <td><input type="radio" name="p34" value="2" required></td>
                    <td><input type="radio" name="p34" value="1" required></td>
                    <td><input type="radio" name="p34" value="0" required></td>
                </tr>
                <tr>
                    <td>35 A menudo soy el último en entender la gracia de un chiste.</td>
                    <td><input type="radio" name="p35" value="3" required></td>
                    <td><input type="radio" name="p35" value="2" required></td>
                    <td><input type="radio" name="p35" value="1" required></td>
                    <td><input type="radio" name="p35" value="0" required></td>
                </tr>
                <tr>
                    <td>36 Encuentro fácil adivinar lo que una persona está pensando o sintiendo simplemente mirando a su cara.</td>
                    <td><input type="radio" name="p36" value="3" required></td>
                    <td><input type="radio" name="p36" value="2" required></td>
                    <td><input type="radio" name="p36" value="1" required></td>
                    <td><input type="radio" name="p36" value="0" required></td>
                </tr>
                <tr>
                    <td>37 En caso de ser interrumpido puedo volver a lo que estaba haciendo de forma muy rápida.</td>
                    <td><input type="radio" name="p37" value="3" required></td>
                    <td><input type="radio" name="p37" value="2" required></td>
                    <td><input type="radio" name="p37" value="1" required></td>
                    <td><input type="radio" name="p37" value="0" required></td>
                </tr>
                <tr>
                    <td>38 Soy bueno en la cháchara social.</td>
                    <td><input type="radio" name="p38" value="3" required></td>
                    <td><input type="radio" name="p38" value="2" required></td>
                    <td><input type="radio" name="p38" value="1" required></td>
                    <td><input type="radio" name="p38" value="0" required></td>
                </tr>
                <tr>
                    <td>39 La gente a menudo me dice que vuelvo una y otra vez sobre el mismo tema.</td>
                    <td><input type="radio" name="p39" value="3" required></td>
                    <td><input type="radio" name="p39" value="2" required></td>
                    <td><input type="radio" name="p39" value="1" required></td>
                    <td><input type="radio" name="p39" value="0" required></td>
                </tr>
                <tr>
                    <td>40 En mi infancia me gustaba jugar a fingir o simular con otros niños.</td>
                    <td><input type="radio" name="p40" value="3" required></td>
                    <td><input type="radio" name="p40" value="2" required></td>
                    <td><input type="radio" name="p40" value="1" required></td>
                    <td><input type="radio" name="p40" value="0" required></td>
                </tr>
                <tr>
                    <td>41 Me gusta coleccionar información sobre categorías de cosas (por ejemplo tipos de coches, pájaros, trenes, plantas, etc.).</td>
                    <td><input type="radio" name="p41" value="3" required></td>
                    <td><input type="radio" name="p41" value="2" required></td>
                    <td><input type="radio" name="p41" value="1" required></td>
                    <td><input type="radio" name="p41" value="0" required></td>
                </tr>
                <tr>
                    <td>42 Me cuesta imaginarme cómo me sentiría siendo otra persona.</td>
                    <td><input type="radio" name="p42" value="3" required></td>
                    <td><input type="radio" name="p42" value="2" required></td>
                    <td><input type="radio" name="p42" value="1" required></td>
                    <td><input type="radio" name="p42" value="0" required></td>
                </tr>
                <tr>
                    <td>43 Me gusta planear con cuidado todas las actividades en las que participo.</td>
                    <td><input type="radio" name="p43" value="3" required></td>
                    <td><input type="radio" name="p43" value="2" required></td>
                    <td><input type="radio" name="p43" value="1" required></td>
                    <td><input type="radio" name="p43" value="0" required></td>
                </tr>
                <tr>
                    <td>44 Me gustan las ocasiones sociales.</td>
                    <td><input type="radio" name="p44" value="3" required></td>
                    <td><input type="radio" name="p44" value="2" required></td>
                    <td><input type="radio" name="p44" value="1" required></td>
                    <td><input type="radio" name="p44" value="0" required></td>
                </tr>
                <tr>
                    <td>45 Encuentro difícil adivinar las intenciones de las otras personas.</td>
                    <td><input type="radio" name="p45" value="3" required></td>
                    <td><input type="radio" name="p45" value="2" required></td>
                    <td><input type="radio" name="p45" value="1" required></td>
                    <td><input type="radio" name="p45" value="0" required></td>
                </tr>
                <tr>
                    <td>46 Las situaciones nuevas me generan ansiedad.</td>
                    <td><input type="radio" name="p46" value="3" required></td>
                    <td><input type="radio" name="p46" value="2" required></td>
                    <td><input type="radio" name="p46" value="1" required></td>
                    <td><input type="radio" name="p46" value="0" required></td>
                </tr>
                <tr>
                    <td>47 Me gusta conocer a gente nueva.</td>
                    <td><input type="radio" name="p47" value="3" required></td>
                    <td><input type="radio" name="p47" value="2" required></td>
                    <td><input type="radio" name="p47" value="1" required></td>
                    <td><input type="radio" name="p47" value="0" required></td>
                </tr>
                <tr>
                    <td>48 Soy un buen diplomático.</td>
                    <td><input type="radio" name="p48" value="3" required></td>
                    <td><input type="radio" name="p48" value="2" required></td>
                    <td><input type="radio" name="p48" value="1" required></td>
                    <td><input type="radio" name="p48" value="0" required></td>
                </tr>
                <tr>
                    <td>49 No soy bueno recordando las fechas de nacimiento de la gente.</td>
                    <td><input type="radio" name="p49" value="3" required></td>
                    <td><input type="radio" name="p49" value="2" required></td>
                    <td><input type="radio" name="p49" value="1" required></td>
                    <td><input type="radio" name="p49" value="0" required></td>
                </tr>
                <tr>
                    <td>50 Encuentro muy fácil jugar con niños a juegos que implican fingir o simular.</td>
                    <td><input type="radio" name="p50" value="3" required></td>
                    <td><input type="radio" name="p50" value="2" required></td>
                    <td><input type="radio" name="p50" value="1" required></td>
                    <td><input type="radio" name="p50" value="0" required></td>
                </tr>
            </table>
            <button type="submit" id="action" name="action" value="ana" class="btn btn-light">Analizar</button>
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
                    for (int i = 1; i <= 50; i++) {
                        sum = sum + Integer.parseInt(request.getParameter("p"+String.valueOf(i)));
                        System.out.println(i);
                        System.out.println(sum);
                    }
                    if(sum >= 0 && sum <= 30){
        %>
                        <script>
                            
                            Swal.fire({
                                icon: 'success',
                                title: 'La posibilidad de que tenga algún síndrome del espectro autista es: baja.',
                                text: 'En caso de tener alguna duda consulte a un especialista.',
                                footer: '<button type="button" class="btn btn-light"> <a href="index.jsp">Volver al index.</a> </button>'
                              });
                        </script>
        <%
                    } else if (sum >= 31 && sum <= 62) {
        %>
                        <script>
                            
                            Swal.fire({
                                icon: 'success',
                                title: 'La posibilidad de que tenga algún síndrome del espectro autista es: media.',
                                text: 'En caso de tener alguna duda consulte a un especialista.',
                                footer: '<button type="button" class="btn btn-light"> <a href="index.jsp">Volver al index.</a> </button>'
                              });
                        </script>
        <%
                    } else if (sum >= 63 && sum <= 87) {
        %>
                        <script>
                            
                            Swal.fire({
                                icon: 'warning',
                                title: 'La posibilidad de que tenga algún síndrome del espectro autista es: media alta.',
                                text: 'Le recomendamos visitar a un profesional.',
                                footer: '<button type="button" class="btn btn-light"> <a href="index.jsp">Volver al index.</a> </button>'
                              });
                        </script>
        <%
                    } else if (sum >= 88 && sum <= 150) {
        %>
                        <script>
                            
                            Swal.fire({
                                icon: 'warning',
                                title: 'La posibilidad de que tenga algún síndrome del espectro autista es: muy alta.',
                                text: 'Le recomendamos visitar a un profesional.',
                                footer: '<button type="button" class="btn btn-light"> <a href="index.jsp">Volver al index.</a> </button>'
                              });
                        </script>
        <%
                    }
                    break;
            }
        %>
        
        
        <!-- Scripts -->
        <script src="sources/vendor/jquery/jquery.min.js"></script>
        <script src="sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="sources/assets/js/owl-carousel.js"></script>
        <script src="sources/assets/js/animation.js"></script>
        <script src="sources/assets/js/imagesloaded.js"></script>
        <script src="sources/assets/js/custom.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
    </body>
</html>
