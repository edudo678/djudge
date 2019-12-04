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

        <title>Djudge - Juiz Online</title>

        <link rel="stylesheet" href="../../css/fontawesome-all.css">
        <link rel="stylesheet" href="../../css/style.css">
        <link rel="stylesheet" href="../../css/header.css">
        <link rel="stylesheet" href="../../css/bootstrap-4.3.1-dist/bootstrap-grid.css"/>
        <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css"/>
        <script src="../../js/bootstrap/bootstrap.js"></script>
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="../../js/jquery/jquery-3.4.1.min.js"></script>
        <script src="../../js/bootstrap/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main>
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card px-4 py-4 text-black">
                            <div>
                                <a class="font-weight-bold h3">Questão</a> <br>
                                <small>Deslize para baixo para ver mais</small>
                            </div> 
                            <div class="px-2 py-3">
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
                                <form action="/djudge/SubmissaoServlet?id=<%=q.getId()%>" enctype="multipart/form-data" method="POST"> 
                                    <div class="col-md-12">
                                        <h4 class="text-center"><b><%=IOUtils.toString(q.getTitulo(), "ISO-8859-1")%></b></h4>   
                                    </div>
                                    <div class="col-md-12">
                                        <p class="card-text text-justify">
                                            <%=IOUtils.toString(q.getEnunciado(), "ISO-8859-1")%>
                                        </p>
                                    </div>
                                    <div class="row justify-content-center mt-4">
                                        <div class="col-md-4">
                                            <img src="<%=IOUtils.toString(qi.getImagem(), "UTF-8")%>" width="100%" height="100%">
                                        </div>
                                    </div>
                                    <div class="col-md-12 mt-4">
                                        <h5><b>Entrada</b></h5>
                                        <p class="text-justify"><%=IOUtils.toString(q.getEntrada(), "ISO-8859-1")%></p>
                                    </div>
                                    <div class="col-md-12 mt-4">
                                        <h5><b>Saída</b></h5>
                                        <p class="text-justify"><%=IOUtils.toString(q.getSaida(), "ISO-8859-1")%></p>   
                                    </div>

                                    <div class="col-md-12 mt-4">
                                        <h5><b>Restrições</b></h5>
                                        <p class="text-justify">
                                            <%
                                                QuestaoRestricaoDAO qDAO = new QuestaoRestricaoDAO();
                                                List<QuestaoRestricao> restricoes = qDAO.getRestricaoByQuestao(request.getParameter("id"));
                                                for (QuestaoRestricao r : restricoes) {
                                            %>
                                            <%=IOUtils.toString(r.getRestricao(), "ISO-8859-1")%>  <br>                            
                                            <%}%>
                                        </p>
                                    </div>

                                    <div class="col-md-12 mt-4">
                                        <h5 class=""><b>Exemplos</b></h5>
                                        <table class="table table-borderless">
                                            <tr>
                                                <td><b>Entrada</b></td>
                                                <td><b>Saída</b></td>
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
                                                <td><%=IOUtils.toString(e.getEntrada(), "ISO-8859-1")%></td>
                                                <td> <%=IOUtils.toString(s.getSaidaEsperada(), "ISO-8859-1")%></td>
                                            </tr>
                                            <%}%>
                                            <%}%>
                                        </table>
                                    </div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">Selecione a linguagem</th>
                                                <th scope="col">Código-fonte gabarito</th>
                                                <th scope="col">Submeter</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-group">
                                                        <select class="form-control" name="compilerId">
                                                            <option>Selecione a linguagem</option>
                                                            <option  value="c">C</option>   
                                                            <option  value="cpp">C++</option>                  
                                                            <option value="java">Java</option> 
                                                            <option value="python2">Python 2</option> 
                                                            <option value="python3">Python 3</option> 
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="file" name="source" class="form-control-file" id="exampleFormControlFile1">
                                                </td>
                                                <td>
                                                    <div class="float-lg-left">
                                                        <button type="submit" class="btn btn-primary"><i class="fas fa-play fa-sm"></i> Submeter</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                    <div class="col-12 text-center">
                                        <a href="#" id="imprimir">Imprimir questão</a>
                                    </div>  
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
    <script>
        document.getElementById('imprimir').onclick = function () {
            var conteudo = document.getElementById('oculto').innerHTML,
                    tela_impressao = window.open('Questão');

            tela_impressao.document.write(conteudo);
            tela_impressao.window.print();
            tela_impressao.window.close();
        };
    </script>ed
</html>
