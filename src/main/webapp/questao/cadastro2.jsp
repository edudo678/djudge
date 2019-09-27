<%@page import="model.dao.GenericDAO"%>
<%@page import="model.dao.QuestaoDAO"%>
<%@page import="model.bean.Questao"%>

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
        <link rel="stylesheet" href="../css/bootstrap/bootstrap-file-upload.css">
        <script src="../js/bootstrap/bootstrap-file-upload.js"></script>
    </head>

    <body class="background">
        <jsp:include page="header.jsp"/>
        <div class="container-fluid home" style="margin-bottom: 40px">
            <div class="row">
                <div class="col-10 row justify-content-end">
                    <div class="col-10">
                        <div class="card px-4 py-4 text-black">
                            <form action="/djudge/SubmissaoAvaliadorServlet?id=" enctype="multipart/form-data" method="POST">
                                <h4>Cadastro de questão</h4>
                                <small>Para finalizar o cadastro, insira o código fonte da questão</small>

                                <br><br>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Selecione a linguagem</label><br>
                                        <select name="compilerId">
                                            <option>Selecione a linguagem</option>
                                            <option  value="c">C</option>   
                                            <option  value="cpp">C++</option>                  
                                            <option value="java">Java</option> 
                                            <option value="python2">Python 2</option> 
                                            <option value="python3">Python 3</option> 
                                        </select>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Código-fonte gabarito</label>
                                        <input type="file" name="source" class="form-control-file" id="source"> 
                                    </div>
                                </div>


                                <div class="row justify-content-end" >
                                    <a href="javascript:history.back()" style="margin-right: 3px"class="btn btn-secondary">Voltar</a>
                                    <button type="submit"  class="btn btn-success">Confirmar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

<!--<div class="modal fade" id="modalVisualizarQuestao" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">

    
    <div class="modal-dialog modal-dialog-centered modal-lg text-black" role="document">
        <div class="modal-content">
            <form action="/djudge/SubmissaoAvaliadorServlet?id=" enctype="multipart/form-data" method="POST">
                <div class="modal-header">

                    <h5 class="modal-title" id="TituloModalCentralizado">Visualização da questão</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>

                </div>
                <div class="modal-body text-black">

                    <input name="id" id="id" value="" readonly/> 

                    <div class="form-group col-md-6">
                        <label>Código-fonte gabarito</label>
                        <input type="file" name="source" class="form-control-file" id="source"> 
                    </div>
                    <div class="form-group col-md-6">
                        <select name="compilerId">
                            <option>Selecione a linguagem</option>
                            <option  value="c">C</option>   
                            <option  value="cpp">C++</option>                  
                            <option value="java">Java</option> 
                            <option value="python2">Python 2</option> 
                            <option value="python3">Python 3</option> 
                        </select>                                                
                    </div>

                    <h4 class="card-title text-center" id="modalTitulo"><strong></strong></h4>

                    <p class="card-text text-justify" id="modalEnunciado"></p>

                    <center>
                        <img id="modalPreviewImg" class="mini_foto" src="../img/default_question.png" style="max-width: 300px; max-height: 300px;"/>
                    </center>  

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
                    <button type="submit" class="btn btn-primary">Confirmar cadastro</button>
                </div>
            </form>
        </div>
    </div>
</div>-->