<%-- 
    Document   : subErro
    Created on : 05/12/2019, 07:32:42
    Author     : Paulo Ribeiro
--%>
<%@page import="model.dao.GenericDAO"%>
<%@page import="model.dao.QuestaoDAO"%>
<%@page import="model.bean.Questao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Djudge - Juiz Online</title>

        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/bootstrap-4.3.1-dist/bootstrap-grid.css"/>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.css"/>
        <script src="../js/bootstrap/bootstrap.js"></script>
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="../js/jquery/jquery-3.4.1.min.js"></script>
        <script src="../js/bootstrap/bootstrap.min.js"></script>
        <script src="../js/bootstrap/bootstrap-file-upload.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <main>
            <div class="container-fluid">  
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card px-4 py-4 text-black">
                            <div>
                                <a class="font-weight-bold h3">Resultado da submissão</a> <br> 
                                <small>Deslize para baixo para ver mais</small>
                            </div> 

                            <div class="row justify-content-center px-4">
                                <div class="col-md-4 align-content-end">
                                    <img src="../img/subCerto.gif" width="100%" height="100%">
                                </div>
                                <div class="row">
                                    <div class="align-self-center">
                                        <div class="col-md-12">    
                                            <h4><b>Respota correta</b></h4>  
                                            <h5>Parabéns, você acertou essa questão!</h5>
                                            <h5 class="mt-4"><b>Saída:</b></h5>
                                            <table class="table table-bordered mt-2">  
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">Djudge</th>
                                                        <td><%= request.getParameter("ava")%></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Sua Resposta</th>
                                                        <td><%= request.getParameter("user")%> <i class="fas fa-check float-right text-green mt-2"></i></td>  
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 text-center">
                                <a href="javascript:history.go(-2)" class="btn btn-primary text-white">Ver mais questões</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp"/>
    </body>

</html>
