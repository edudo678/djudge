<%-- 
    Document   : editar
    Created on : 17/10/2019, 15:13:03
    Author     : paulo
--%>
<%@page import="model.dao.QuestaoEntradaDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.QuestaoRestricaoDAO"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="model.bean.QuestaoSaidaEsperada"%>
<%@page import="model.bean.QuestaoEntrada"%>
<%@page import="model.bean.QuestaoRestricao"%>
<%@page import="model.bean.QuestaoImagem"%>
<%@page import="model.bean.QuestaoImagem"%>
<%@page import="model.dao.GenericDAO"%>
<%@page import="model.bean.Questao"%>
<%@page import="model.bean.Questao"%>
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
            <div class="row justify-content-center">
                <div class="card col-lg-9 text-black">
                    <div class="mt-4 mx-4">
                        <div class="form-row">
                            <div class="col-lg-6">
                                <a class="font-weight-bold h4"> Editar Questão</a>
                                <small class="form-text text-muted">Preencha os campos abaixo para efetuar o cadastro.</small>
                            </div>
                            <div class="col-lg-6">
                                <a class=" float-lg-right text-black" href="../usuario/avaliador/index.jsp"><i class="fas fa-window-close fa-2x"></i></a>
                            </div>
                        </div>
                        <%
                            Questao q = new Questao();
                            GenericDAO<Questao> gqDAO = new GenericDAO();
                            q = gqDAO.findById(Questao.class, Long.parseLong(request.getParameter("id")));

                            QuestaoImagem qi = new QuestaoImagem();
                            GenericDAO<QuestaoImagem> gqiDAO = new GenericDAO();
                            qi = gqiDAO.findById(QuestaoImagem.class, Long.parseLong(request.getParameter("id")));

                            QuestaoRestricao qr = new QuestaoRestricao();
                            GenericDAO<QuestaoRestricao> gqrDAO = new GenericDAO();
                            qr = gqrDAO.findById(QuestaoRestricao.class, Long.parseLong(request.getParameter("id")));

                            QuestaoEntrada qe = new QuestaoEntrada();
                            GenericDAO<QuestaoEntrada> gqeDAO = new GenericDAO<>();
                            qe = gqeDAO.findById(QuestaoEntrada.class, Long.parseLong(request.getParameter("id")));

                            QuestaoSaidaEsperada qs = new QuestaoSaidaEsperada();
                            GenericDAO<QuestaoSaidaEsperada> gqsDAO = new GenericDAO<>();
                            qs = gqsDAO.findById(QuestaoSaidaEsperada.class, Long.parseLong(request.getParameter("id")));

                        %>

                        <form action="/djudge/QuestaoEditarServlet?id=<%=q.getId()%>" method="POST">
                            <div class="form-row justify-content-center">
                                <div class="col-md-8 text-center">
                                    <label for="titulo">Título da questão</label>
                                    <input type="titulo" value="<%=IOUtils.toString(q.getTitulo(), "ISO-8859-1")%>" class="form-control text-center" name="titulo" id="titulo" placeholder="Ex: Câmara de Compensação...">
                                </div>
                            </div>

                            <div class="card-body">
                                <div class="form-group">
                                    <label for="enunciado">Enunciado</label>
                                    <textarea class="form-control" name="enunciado" id="enunciado" rows="3" placeholder="Ex: Em uma cidade, muitas pessoas emprestam dinheiro para outras pessoas. A coisa chegou a..."><%=IOUtils.toString(q.getEnunciado(), "ISO-8859-1")%></textarea>
                                </div>

                                <div class="form-group">

                                    <label for="imagem">Inserir imagem</label>
                                    <div class="form-panel">
                                        <div class="form-group last">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <div class="fileupload-new thumbnail" >
                                                    <img src="<%=IOUtils.toString(qi.getImagem(), "UTF-8")%>" alt="Nenhuma imagem foi enviada"/>
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
                                        <textarea class="form-control" name="entrada" id="entrada" rows="3" placeholder="Descreva a entrada da questão aqui"><%=IOUtils.toString(q.getEntrada(), "ISO-8859-1")%></textarea>
                                    </div>

                                    <div class="col-md-6  form-group">
                                        <label for="saida">Saída</label>
                                        <textarea class="form-control" name="saida" id="saida" rows="3" placeholder="Descreva a saída da questão aqui"><%=IOUtils.toString(q.getSaida(), "ISO-8859-1")%></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="restricao">Restrições</label>
                                    <%
                                        QuestaoRestricaoDAO qDAO = new QuestaoRestricaoDAO();
                                        List<QuestaoRestricao> restricoes = qDAO.getRestricaoByQuestao(request.getParameter("id"));
                                        for (QuestaoRestricao r : restricoes) {
                                    %>                                  
                                    <textarea class="form-control" name="restricao" id="restricao" rows="3" placeholder="Descreva as restrições da questão aqui"><%=IOUtils.toString(r.getRestricao(), "ISO-8859-1")%></textarea>
                                    <%}%>
                                </div>

                                <div class="form-group">
                                    <label for="exemplo">Exemplos</label>
                                    <%
                                        QuestaoEntradaDAO qeDAO = new QuestaoEntradaDAO();
                                        List<QuestaoEntrada> entradas = qeDAO.getEntradaByQuestao(request.getParameter("id"));
                                         for (QuestaoEntrada e : entradas) {
                                     %> 
                                    <textarea class="form-control" name="entradaExemplo" id="entradaExemplo" rows="3" placeholder="Escreva um exemplo de entrada da questão aqui"><%=IOUtils.toString(e.getEntrada(), "ISO-8859-1")%></textarea>
                                    <%}%>
                                </div>                                  

                                <div class="form-row">
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
                                </div>
                              
                                <div class="form-row justify-content-end">
                                    <a href="../usuario/avaliador/index.jsp"  class="btn btn-dark"><i class="fas fa-window-close "></i> Cancelar </a>
                                    <button type="submit" name="acao" value="alterar" class="btn btn-success ml-1"><i class="fas fa-edit"></i> Confirmar alterações </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

