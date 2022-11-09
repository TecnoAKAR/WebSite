<%-- 
Document   : login
Created on : 12/10/2022, 10:52:51 PM
Author     : AKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>

<html lang="es">
    <head>
        <title>Sign Up</title>
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="sources/login&signup/css/style.css"> 
        
        <link rel="stylesheet" href="sources/assets/css/akar.css">
        <link rel="stylesheet" href="sources/assets/css/animated.css">
        <link rel="stylesheet" href="sources/assets/css/owl.css">
        
    </head>
    <body class="img js-fullheight" style="background-image: url(sources/assets/images/quote-bg-v2.jpg);">
        
        
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
            <br/>
            <h2 class="heading-section">Cree una cuenta</h2>
                <form class="row g-3">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre(s)" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="apellido_p" name="apellido_p" placeholder="Apellido paterno" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="apellido_m" name="apellido_m" placeholder="Apellido materno" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="Date" class="form-control" id="fecha_nac" name="fecha_nac" required>
                    </div>
                    <div class="col-12">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="email" class="form-control" id="correo_e" name="correo_e" placeholder="Correo electrónico" required>
                    </div>
                    <div class="col-md-6">
                      <label for="inputEmail4" class="form-label"></label>
                      <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Nombre de usuario" required>
                    </div>
                    <div class="col-md-6    ">
                        <label for="inputState" class="form-label"></label>
                        <select id="inputState" class="form-control">
                          <option selected>Tipo de usuario</option>
                          <option>Usuario Con Síndrome de Asperger (UCSA)</option>
                          <option>Tutor</option>
                          <option>Psicólogo</option>
                          <option>Usuario externo</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                      <label for="inputPassword4" class="form-label"></label>
                      <input id="password-field" type="password" class="form-control" placeholder="Contraseña" required> 
                      </br>
                      <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"> </span>
                    </div>
                    <div> 
                        <input type="hidden" id="action" name="action" value="send" />
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary btn-lg">Registrarse </button>
                        <button type="reset" class="btn btn-secondary btn-lg">Cancelar</button>
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
        
    </body>
</html>


