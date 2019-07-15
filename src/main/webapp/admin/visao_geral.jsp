<%-- 
    Document   : visao_geral
    Created on : 21/05/2019, 21:45:27
    Author     : daniela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- <link rel="shortcut icon" href="img/djudge-favicon.ico" type="image/x-icon"/> -->
        <link href="../img/djudge_favicon.png" rel="icon" type="image/x-icon">
        <title>Djudge - Corretor de Questões</title>
        <!--Importações-->
        <script src="../js/jquery/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <script src="../js/bootstrap/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script> 
    </head>
    <body>
        <div id="header" style="margin-bottom: 80px;"></div> 
        <div class="container mt-4">
            <!--  h-card col-3 float-left pr-6-->
            <div class="row">
                <div class="col-auto">
                    <div class="card" style="width: 15rem;">
                        <img class="card-img-top" src="../img/perfil.png" alt="Imagem de perfil">
                        <div class="card-body">
                            <h5 class="card-title"><b>Daniela Ferreira</b></h5>
                            <p class="card-text">danielaferreira1133@gmail.com</p>
                            <a href="#" class="btn btn-primary">Visualizar perfil</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Título especial</h5>
                            <p class="card-text">Com suporte a texto embaixo, que funciona como uma introdução a um conteúdo adicional.</p>
                            <a href="#" class="btn btn-primary">Visitar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>$(function () {
                $("#header").load("header_logado.html");
            });</script>
    </body>
</html>
