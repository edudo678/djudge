<%-- 
    Document   : sucess
    Created on : 25/09/2019, 17:27:51
    Author     : Aluno
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
        <script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script> 


        <script src="../js/jquery/jquery-3.4.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="../js/bootstrap/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap-file-upload.css">
        <script src="../js/bootstrap/bootstrap-file-upload.js"></script>
    </head>

    <body class="background">
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <div class="form-row justify-content-center">
                <div class="card col-lg-11 px-4 py-4 text-black">

                    <h4>Status da questão:</h4>

                    <div class="text-center">
                        <img src="../img/sucess.gif" width="200px" height="200px">
                        <h6>Questão cadastrada com sucesso!</h6>
                    </div>
                    <br>


                    <div class="row justify-content-end">
                        <a href="#" id="imprimir" style="margin-right: 3px"class="btn btn-secondary"><i class="fas fa-print fa-lg"></i> Imprimir questão</a>
                        <a href="listar.jsp" class="btn btn-success">Finalizar</a>
                    </div>

                    <%
                        Questao q = new Questao();
                        GenericDAO<Questao> gqDAO = new GenericDAO();
                        q = gqDAO.findById(Questao.class, Long.parseLong(request.getParameter("id")));
                    %>

                    <div hidden id="oculto">

                        <br>
                        <div class="form-row justify-content-center">
                            <div class="col-md-8">
                                <label for="titulo"><strong>Título da questão</strong></label>
                                <input type="titulo" class="form-control text-center" name="titulo" id="titulo" placeholder="Título da questão">
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="form-group">
                                <label for="enunciado"><strong>Enunciado</strong></label>
                                <textarea class="form-control" name="enunciado" id="enunciado" rows="3" placeholder="Descreva o enunciado da questão aqui"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="entrada"><strong>Entrada</strong></label>
                                <textarea class="form-control" name="entrada" id="entrada" rows="3" placeholder="Descreva a entrada da questão aqui"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="saida"><strong>Saída</strong></label>
                                <textarea class="form-control" name="saida" id="saida" rows="3" placeholder="Descreva a saída da questão aqui"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="restricao"><strong>Restrições</strong></label>
                                <textarea class="form-control" name="restricao" id="restricao" rows="3" placeholder="Descreva as restrições da questão aqui"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="exemplo"><strong>Exemplos</strong></label><br>
                                <label>Entrada</label>
                                <textarea class="form-control" name="entradaExemplo" id="entradaExemplo" rows="3" placeholder="Escreva um exemplo de entrada da questão aqui"></textarea>
                            </div>

                            <br>
                            <h5 class="border-bottom border-dark"></h5>
                            <br>

                            <div class="form-group col-md-6">
                                <label for="nivel">Nível</label>
                                <select class="form-control" id="nivel" name="nivel">
                                    <option></option>
                                    <option value="1">1 - fácil</option>
                                    <option value="2">2 - médio</option>
                                    <option value="3">3 - difícil</option>
                                </select>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="peso">Peso</label>
                                <select class="form-control" id="peso" name="peso">
                                    <option></option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                            <br>        
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../footer.jsp"/>
    </body>

    <script>
        document.getElementById('imprimir').onclick = function () {
            var conteudo = document.getElementById('oculto').innerHTML;
                    tela_impressao = window.open('about:blank');

            tela_impressao.document.write(conteudo);
            tela_impressao.window.print();
            tela_impressao.window.close();
        };
    </script>
</html>
