<%-- 
    Document   : index
    Created on : 02/07/2019, 14:59:43
    Author     : Junior
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Djudge - Juiz Online</title>

        <link rel="stylesheet" href="../../css/fontawesome-all.css">
        <link rel="stylesheet" href="../../css/style.css">
        <link rel="stylesheet" href="../../css/header.css">
        <link rel="stylesheet" href="../../css/bootstrap-4.3.1-dist/bootstrap-grid.css"/>
        <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css"/>
        <link rel="stylesheet" href="../../css/bootstrap/bootstrap.min.css"/>

        <script src="../../js/bootstrap/bootstrap.js"></script>
        <script src="../../js/jquery/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script> 
        <script src="../../js/bootstrap/bootstrap.min.js"></script>

    </head>
    <body>

        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="form-row col-lg-10">
                    <div class="col-lg-8 card text-black mb-4">
                        <div class="mt-4 mx-4 mb-2">
                            <div class="mb-3">
                                <a class="font-weight-bold h4">Bem vindo(a) ${usuario.nome}</a><br>
                                <small>Deslize para baixo para ver mais</small>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                  <jsp:include page="../../carousel/principal.jsp"/>
                                </div>

                                <div class="col-6">
                                    <div class="card-body text-center">
                                        <h3>Fique por dentro das próximas maratonas 
                                            do IFAM-CMC. Vamos praticar!</h3> <br>
                                        <a href="praticar.jsp" class="btn btn-outline-dark btn-block">Praticar</a>
                                    </div>
                                </div>
                            </div>

                            <br>
                            <h3 class="border-bottom border-dark">Últimas Notícias</h3>
                            <a href="#">Histórico da maratona de programação</a>

                            <p>
                                Aguardando a data da maratona 2020. <br>
                                Postado por Coordenação em 05 de Julho de 2019
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-row justify-content-center">
                            <div class="card text-black col-lg-10">
                                <div class="mt-4 mx-4 mb-2">
                                    <div class="mb-3">
                                        <a class="font-weight-bold h4">Modalidade</a><br>
                                        <small>Selecione uma modalidade para ver questões</small>
                                    </div>
                                    <h6>Iniciante</h6>
                                    <a href="#">Nível 1</a> <br>
                                    <a href="#">Nível 2</a>
                                    <h6>Programação</h6>
                                    <a href="questao_junior.jsp">Nível de programação júnior</a> <br>
                                    <a href="questao.jsp">Nível de programação 1</a> <br>
                                    <a href="#">Nível de programação 2</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../../footer.jsp"/>
    </body>
</html>
