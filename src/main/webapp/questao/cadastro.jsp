<%-- 
    Document   : index
    Created on : 02/07/2019, 14:59:43
    Author     : Junior
--%>

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
        <link rel="stylesheet" href="../css/bootstrap/bootstrap-file-upload.css">
        <script src="../js/bootstrap/bootstrap-file-upload.js"></script>
    </head>
    <body class="background">
        <jsp:include page="header.jsp"/>

        <div class="container-fluid home" style="margin-bottom: 40px">

            <div class="row">
                <div class="col-10 row justify-content-end">

                    <div class="col-10">
                        <div class="card text-black">
                            <form action="/djudge/QuestaoServlet" method="POST">
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

                                        <label for="imagem"><strong>Inserir imagem</strong></label>
                                        <div class="form-panel">
                                            <div class="form-group last">
                                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <div class="fileupload-new thumbnail" >
                                                        <img src="../img/default_question.png" alt="Nenhuma imagem foi enviada"/>
                                                    </div>

                                                    <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 550px; max-height: 300px;"></div>
                                                    <div>
                                                        <span class="btn btn-theme02 btn-file">
                                                            <span class="fileupload-new"><i class="fa fa-paperclip"></i> Selecione uma imagem</span>
                                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Trocar</span>
                                                            <input type="file" id="imagem" class="default" name="imagem" onchange="previewImage(this, 'modalPreviewImg');" accept="image/png, image/jpg"  multiple/>
                                                        </span>
                                                        <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
                                                            <i class="fas fa-trash-alt"></i> Apagar</a>
                                                    </div>
                                                    <small class="form-text text-muted">Envie arquivos de um desses dois tipos (JPG ou PNG).</small>

                                                </div>

                                            </div>

                                        </div>
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
<!--                                        <br><label>Saída</label>
                                        <textarea class="form-control" name="saidaExemplo" id="saidaExemplo" rows="3" placeholder="Escreva um exemplo de saída da questão aqui"></textarea>-->
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
                                    <!--                                    <div class="form-group col-md-6">
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
                                                                        <div class="form-group col-md-6">
                                                                            <label>Entrada</label>
                                                                            <input type="entrada" class="form-control text-center" name="entradaCod" id="entradaCod" placeholder="Digite a entrada">
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label>Saída Esperada</label>
                                                                            <input type="saidaEsperada" class="form-control text-center" name="saidaEsperada" id="saidaEsperada" readonly>
                                                                        </div>
                                                                        <br>-->
                                    <div class="form-row justify-content-center">
                                        <div class="col-md-6">
                                            <button type="submit" name="acao" value="continuar" class="btn btn-secondary btn-block bg-dark">Continuar</button>
                                            <!--onclick="visualizarQuestao()" data-toggle="modal" data-target="#modalVisualizarQuestao"-->
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

<div class="modal fade" id="modalVisualizarQuestao" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg text-black" role="document">
        <div class="modal-content">
            <form action="/djudge/QuestaoServlet" enctype="multipart/form-data" method="POST">
                <div class="modal-header">

                    <h5 class="modal-title" id="TituloModalCentralizado">Visualização da questão</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>

                </div>
                <div class="modal-body text-black">

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

                    <h5><strong>Exemplos</strong></h5><br>
                    <h3>Entrada</h3>
                    <p class="card-text text-justify" id="modalEntradaExemplo"></p><br> 
<!--                    <h3>Saída</h3>
                    <p class="card-text text-justify" id="modalSaídaExemplo"></p>-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Editar</button>
                    <button type="submit" class="btn btn-primary">Confirmar cadastro</button>
                </div>
            </form>
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

        var exemplo = document.getElementById("entradaExemplo");
        $('#modalEntradaExemplo').text(entradaExemplo.value);
        
//        var exemplo = document.getElementById("saidaExemplo");
//        $('#modalSaidaExemplo').text(saidaExemplo.value);

    }


    function previewImage(input, id) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#' + id)
                        .attr('src', e.target.result)
                        ;
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>


