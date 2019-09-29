<%-- 
    Document   : index
    Created on : 02/07/2019, 14:59:43
    Author     : Junior
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.util.Base64"%>
<%@page import="model.dao.QuestaoImagemDAO"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="model.dao.QuestaoSaidaEsperadaDAO"%>
<%@page import="model.dao.QuestaoEntradaDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.QuestaoRestricaoDAO"%>
<%@page import="model.dao.QuestaoDAO"%>
<%@page import="model.bean.QuestaoRestricao"%>
<%@page import="model.bean.QuestaoSaidaEsperada"%>
<%@page import="model.bean.QuestaoEntrada"%>
<%@page import="model.bean.QuestaoImagem"%>
<%@page import="model.dao.GenericDAO"%>
<%@page import="model.bean.Questao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Djudge - Corretor de Questões</title>

        <link rel="stylesheet" href="../../css/fontawesome-all.css">
        <link rel="stylesheet" href="../../css/style.css">
        <link rel="stylesheet" href="../../css/header.css">
        <link rel="stylesheet" href="../../css/bootstrap-4.3.1-dist/bootstrap-grid.css"/>
        <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css"/>
        <script src="../../js/bootstrap/bootstrap.js"></script>
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>
        <script src="../../js/jquery/jquery-3.4.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="../../js/bootstrap/bootstrap.min.js"></script>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <div class="col-12 row justify-content-center">
                <div class="card col-11 text-black px-4 py-4">
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

                        String codeDecode = new String(q.getCodigoFonteGabarito(), "UTF-8");
                    %>

                    <form action="/djudge/SubmissaoServlet?id=<%=q.getId()%>" enctype="multipart/form-data" method="POST">   

                        <div id="oculto">
                            <h4 class="border-bottom border-dark">Praticando</h4>
                            <small> Deslize para baixo para ver a questão por completo</small>
                            <br><br>

                            <h4 class="text-center"><%=q.getTitulo()%></h4>

                            <p class="text-justify">
                                <%=q.getEnunciado()%>
                            </p>

                            <div class="col-lg-12">
                                <img src="<%=IOUtils.toString(qi.getImagem(), "UTF-8")%>" width="100%" height="100%">
                            </div>

                            <h5>Entrada</h5>
                            <p class="text-justify px-3">
                                <%=q.getEntrada()%>
                            </p>

                            <h5>Saída</h5>
                            <p class="text-justify px-3">
                                <%=q.getSaida()%>
                            </p>   

                            <h5>Restrições</h5>
                            <p class="text-justify px-3">
                                <%
                                    QuestaoRestricaoDAO qDAO = new QuestaoRestricaoDAO();
                                    List<QuestaoRestricao> restricoes = qDAO.getRestricaoByQuestao(request.getParameter("id"));
                                    for (QuestaoRestricao r : restricoes) {
                                %>
                                * <%=r.getRestricao()%>  <br>                            
                                <%}%>
                            </p>

                            <h5>Exemplos</h5>

                            <table class="table table-bordered">
                                <tr>
                                    <td><strong>Entrada</strong></td>
                                    <td><strong>Saída</strong></td>
                                </tr>
                                <%
                                    QuestaoEntradaDAO qeDAO = new QuestaoEntradaDAO();
                                    List<QuestaoEntrada> entradas = qeDAO.getEntradaByQuestao(request.getParameter("id"));
                                    for (QuestaoEntrada e : entradas) {
                                %>    
                                <%
                                    QuestaoSaidaEsperadaDAO qsDAO = new QuestaoSaidaEsperadaDAO();
                                    List<QuestaoSaidaEsperada> saidas = qsDAO.getSaidaByQuestao(request.getParameter("id"));
                                    for (QuestaoSaidaEsperada s : saidas) {
                                %>     
                                <tr>       
                                    <td><%=e.getEntrada()%></td>
                                    <td><%=s.getSaidaEsperada()%></td>
                                </tr>
                                <%}%>
                                <%}%>
                            </table>
                        </div>
                        <h5>Submita sua solução</h5>

                        <div class="border form-row">
                            <div class="form-group col-md-4">
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

                            <div class="form-group col-md-4">
                                <label>Código-fonte gabarito</label>
                                <input type="file" name="source" class="form-control-file" id="exampleFormControlFile1">
                            </div>

                            <div class="form-row align-items-center">
                                <div class="row justify-content-end">
                                    <button type="submit" class="btn btn-primary"><i class="fas fa-play fa-sm"></i> Submeter</button>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-12 text-center">
                            <a href="#" id="imprimir">Imprimir questão</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../../footer.jsp"/>
    </body>

    <script>
        document.getElementById('imprimir').onclick = function () {
            var conteudo = document.getElementById('oculto').innerHTML,
                    tela_impressao = window.open('Questão');

            tela_impressao.document.write(conteudo);
            tela_impressao.window.print();
            tela_impressao.window.close();
        };
    </script>
</html>
