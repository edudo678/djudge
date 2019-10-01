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
    <body>
        <jsp:include page="header.jsp"/>

        <div class="container-fluid">
            <div class="form-row justify-content-center">
                <div class="card col-lg-11 px-4 py-4 text-black">
                    <h4>Cadastro de Questão</h4>
                    <small class="form-text text-muted">Preencha os campos abaixo para efetuar o cadastro.</small>

                    <form action="/djudge/QuestaoServlet" enctype="multipart/form-data" method="POST">
                        <div class="form-row justify-content-center">
                            <div class="col-md-8 text-center">
                                <label for="titulo">Título da questão</label>
                                <input type="titulo" class="form-control text-center" name="titulo" id="titulo" placeholder="Ex: Câmara de Compensação...">
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="form-group">
                                <label for="enunciado">Enunciado</label>
                                <textarea class="form-control" name="enunciado" id="enunciado" rows="3" placeholder="Ex: Em uma cidade, muitas pessoas emprestam dinheiro para outras pessoas. A coisa chegou a..."></textarea>
                            </div>

                            <div class="form-group">

                                <label for="imagem">Inserir imagem</label>
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

                            <div class="form-row">
                                <div class="col-md-6 form-group">
                                    <label for="entrada">Entrada</label>
                                    <textarea class="form-control" name="entrada" id="entrada" rows="3" placeholder="Descreva a entrada da questão aqui"></textarea>
                                </div>

                                <div class="col-md-6  form-group">
                                    <label for="saida">Saída</label>
                                    <textarea class="form-control" name="saida" id="saida" rows="3" placeholder="Descreva a saída da questão aqui"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="restricao">Restrições</label>
                                <textarea class="form-control" name="restricao" id="restricao" rows="3" placeholder="Descreva as restrições da questão aqui"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="exemplo">Exemplos</label>
                                <textarea class="form-control" name="entradaExemplo" id="entradaExemplo" rows="3" placeholder="Escreva um exemplo de entrada da questão aqui"></textarea>
                            </div>                                  

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nivel">Nível</label>
                                    <select class="form-control" id="nivel" name="nivel">
                                        <option>Selecione o nível da questão</option>
                                        <option value="1">1 - fácil</option>
                                        <option value="2">2 - médio</option>
                                        <option value="3">3 - difícil</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="peso">Peso</label>
                                    <select class="form-control" id="peso" name="peso">
                                        <option>Selecione um peso para a questão</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputState">Selecione a linguagem</label><br>
                                    <select class="form-control" name="compilerId">
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

                            <div class="form-row justify-content-end">
                                <a href=""  class="btn btn-secondary"> Cancelar </a>
                                <div class="col-1">
                                    <button type="submit" name="acao" value="continuar" class="btn btn-success"> Próximo </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>




