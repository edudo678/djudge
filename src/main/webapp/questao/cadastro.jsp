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

        <title>Djudge - Corretor de Questões</title>

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
    </head>
    <body class="background">
        <jsp:include page="header.jsp"/>

        <div class="container-fluid home">

            <div class="row">
                <div class="col-10 row justify-content-end">

                    <div class="col-10">
                        <div class="card text-black">
                            <form action="#">

                                <div class="card-header bg-white border-0">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="form-row justify-content-center">
                                    <div class="col-md-8">
                                        <label for="titulo"><strong>Título da questão</strong></label>
                                        <input type="titulo" class="form-control text-center" id="titulo" placeholder="Título da questão">
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="enunciado"><strong>Enunciado</strong></label>
                                        <textarea class="form-control" id="enunciado" rows="3" placeholder="Descreva o enunciado da questão aqui"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="imagem"><strong>Inserir imagem</strong></label>
                                        <input type="file" class="form-control-file" id="imagem">
                                    </div>

                                    <div class="form-group">
                                        <label for="entrada"><strong>Entrada</strong></label>
                                        <textarea class="form-control" id="entrada" rows="3" placeholder="Descreva a entrada da questão aqui"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="saida"><strong>Saída</strong></label>
                                        <textarea class="form-control" id="saida" rows="3" placeholder="Descreva a saída da questão aqui"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="restricao"><strong>Restrições</strong></label>
                                        <textarea class="form-control" id="restricao" rows="3" placeholder="Descreva as restrições da questão aqui"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="exemplo"><strong>Exemplos</strong></label>
                                        <textarea class="form-control" id="exemplo" rows="3" placeholder="Descreva os exemplos da questão aqui"></textarea>
                                    </div>

                                    <div class="form-row justify-content-center">
                                        <div class="col-md-6">
                                            <button type="button" class="btn btn-secondary btn-block bg-dark"  onclick="visualizarQuestao()" data-toggle="modal" data-target="#modalVisualizarQuestao">Confirmar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<div class="modal fade" id="modalVisualizarQuestao" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg text-black" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="TituloModalCentralizado">Visualização da questão</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-black">

                <h4 class="card-title text-center" id="modalTitulo"><strong></strong></h4>

                <p class="card-text text-justify" id="modalEnunciado"></p>



                <h5 class=""><strong>Entrada</strong></h5>
                <p class="card-text text-justify" id="modalEntrada"></p>

                <h5><strong>Saída</strong></h5>
                <p class="card-text text-justify" id="modalSaida"></p>  

                <h5><strong>Restrições</strong></h5>
                <p class="card-text text-justify" id="modalRestricao"></p>  

                <h5><strong>Exemplos</strong></h5>
                <p class="card-text text-justify" id="modalExemplo"></p>  
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Editar</button>
                <button type="button" class="btn btn-primary">Confirmar cadastro</button>
            </div>
        </div>
    </div>
</div>

<script>
    function visualizarQuestao() {

        var titulo = document.getElementById("titulo");
        $('#modalTitulo').text(titulo.value);

        var enunciado = document.getElementById("enunciado");
        $('#modalEnunciado').text(enunciado.value);

        var entrada = document.getElementById("entrada");
        $('#modalEntrada').text(entrada.value);

        var saida = document.getElementById("saida");
        $('#modalSaida').text(saida.value);

        var restricao = document.getElementById("restricao");
        $('#modalRestricao').text(restricao.value);

        var exemplo = document.getElementById("exemplo");
        $('#modalExemplo').text(exemplo.value);

    }
</script>


