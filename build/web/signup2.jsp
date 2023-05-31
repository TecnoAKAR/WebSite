<%@page import="org.akar.helper.PSResPassHelper"%>
<%@page import="java.util.Date"%>
<%@page import="org.akar.dao.PSUsuario"%>
<%@page import="org.akar.helper.PSUsuarioHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es">
    <head>
        <title>Sign Up</title>
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="sources/login&signup/css/style.css"> 
        
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
    </head>
    <body class="img js-fullheight" style="background-image: url(sources/assets/images/quote-bg-v2.jpg);">
        
        <%
            boolean isMenor = Boolean.parseBoolean(request.getParameter("menor"));

            if(isMenor){
        %>        
                <script>
                    Swal.fire(
                        '¡Se ha detectado que usted es un menor de edad!',
                        'Por favor, siga las instrucciones al llenar el siguiente formulario.',
                        'warning'
                    );
                </script>
        <%
            }
        %>
        
        
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <div class="contenedor">
            <div class="container p-5">
            <h2 class="heading-section">Cuenta para menor de edad</h2>
            Para crear una cuenta con control parental el tutor deberá haberse creado una cuenta previamente
                <form accept-charset="UTF-8" class="row g-3" method="post">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre(s)" maxlength="50" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="apellido_p" name="apellido_p" placeholder="Apellido paterno" maxlength="50" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="apellido_m" name="apellido_m" placeholder="Apellido materno" maxlength="50" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="Date" class="form-control" id="fecha_nac" name="fecha_nac" required>
                    </div>
                    <div class="col-12">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="email" class="form-control" id="correo_e" name="correo_e" placeholder="Correo electrónico" maxlength="50" required>
                    </div>
                    <div class="col-12">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="email" class="form-control" id="correo_e" name="correo_e_tutor" placeholder="Correo electrónico del tutor" maxlength="50" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Nombre de usuario" maxlength="50" required>
                    </div>
                    <div class="col-md-6">
                        <label for="inputState" class="form-label"></label>
                        <select id="tipoUsuario" name="tipoUsuario" class="form-control" required>
                          <option value="" disabled selected>Tipo de usuario</option>
                          <option value="2">Usuario Con Síndrome de Asperger (UCSA)</option>
                          <option value="4">Usuario externo</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                      <label for="inputPassword4" class="form-label"></label>
                      <input id="password-field" type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña" minlength="8" maxlength="50" required> 
                      </br>
                      <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"> </span>
                    </div>
                    <div> 
                        <input type="hidden" id="action" name="action" value="send" />
                    </div>
                    <div class="col-12">
                        <button type="submit" id="action" name="action" value="send" class="btn btn-primary btn-lg">Registrarse</button>
                        <button type="reset" class="btn btn-secondary btn-lg">Cancelar</button>
                        <script></script>
                    </div>
                </form>
            </div>
        </div>
        

        <script src="sources/login&signup/js/jquery.min.js"></script>
        <script src="sources/login&signup/js/popper.js"></script>
        <script src="sources/login&signup/js/bootstrap.min.js"></script>
        <script src="sources/login&signup/js/main.js"></script>
        
        
        <script src="sources/vendor/jquery/jquery.min.js"></script>
        <script src="sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="sources/assets/js/owl-carousel.js"></script>
        <script src="sources/assets/js/animation.js"></script>
        <script src="sources/assets/js/imagesloaded.js"></script>
        <script src="sources/assets/js/custom.js"></script>
        
        <style>
            .contenedor {
                align-items: center;
                display: flex;
                justify-content: center;
                height: 100%;
            }
            
            select,
            option{
                color: black;
            }
        </style>
        
        
        <% 
            request.setCharacterEncoding("UTF-8");
            String action = request.getParameter( "action" );
            if( action == null )
            {
                action = "";
            }
            switch(action){
                case "send":
                    PSUsuario usuario = new PSUsuarioHelper().SignUp2(request);
                    if( usuario!= null){
                        boolean tokenA = new PSResPassHelper().setToken(request);
                        if(tokenA == true){
        %>
                            <script>
                                Swal.fire(
                                    '¡Cuenta creada!',
                                    'Revise su correo para verificarla.',
                                    'sucess'
                                );
                            </script>
        <%                                
                        }else{
        %>
                            <script>
                                Swal.fire(
                                    '¡Algo ha salido mal!',
                                    'Contacte a soporte de inmediato para solucionar el problema.',
                                    'error'
                                );
                            </script>
        <%                                 
                        }
                    }else{
        %>
                        <script>                            
                            Swal.fire(
                                '¡El correo y/o usuario están en uso!',
                                'Si se trata de un error, solicite soporte técnico.',
                                'warning'
                            );
                        </script>
        <%
                    }
                    break;
            }
        %>
        
    </body>
</html>
