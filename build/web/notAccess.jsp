<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="sources\assets\images\logoAKAR100.png">
        
        <!-- Bootstrap core CSS -->
        <link href="sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        
        <title>Acceso denegado</title>
    </head>
    <body>
        <div id="divC">
            <div class="card text-bg-dark mb-3" style="max-width: 20rem;">
                <div class="card-header">Alerta</div>
                <div class="card-body">
                    <h4 class="card-title"> ¡Acceso denegado! </h4>
                    <p class="card-text"> No cuenta con los permisos suficientes para acceder a la página. </p>
                    <button type="button" class="btn btn-light" id="boton-volver">Regresar</button>
                </div>
            </div>
        </div>
        
        <script>
            var botonVolver = document.getElementById("boton-volver");

            botonVolver.addEventListener("click", function() {
            window.history.back();
            });
        </script>
            
        <style>
            #divC {
                width: 300px;
                height: auto;
                margin: auto;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
        </style>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </body>
</html>
