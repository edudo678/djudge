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
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="card col-lg-9 text-black">
                    <div class="mt-4 mx-4 mb-4">
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

                            String codeDecode = new String(q.getCodigoFonteGabarito(), "ISO-8859-1");
                        %>

                        <form action="/djudge/SubmissaoPublicoServlet?id=<%=q.getId()%>" enctype="multipart/form-data" method="POST">  
                            <div id="oculto">
                                <a class="font-weight-bold h4">Questão</a><br>
                                <small> Deslize para baixo para ver a questão por completo</small>
                                <br><br>

                                <h4 class="text-center"><%=IOUtils.toString(q.getTitulo(), "ISO-8859-1")%></h4>

                                <p class="text-justify">
                                    <%=IOUtils.toString(q.getEnunciado(), "ISO-8859-1")%>
                                </p>

                                <div>
                                    <img class="w-auto p-3" src="<%=IOUtils.toString(qi.getImagem(), "UTF-8")%>" width="100%" height="100%">
                                </div>

                                <h5>Entrada</h5>
                                <p class="text-justify px-3">
                                    <%=IOUtils.toString(q.getEntrada(), "ISO-8859-1")%>
                                </p>

                                <h5>Saída</h5>
                                <p class="text-justify px-3">
                                    <%=IOUtils.toString(q.getSaida(), "ISO-8859-1")%>
                                </p>   

                                <h5>Restrições</h5>
                                <p class="text-justify px-3">
                                    <%
                                        QuestaoRestricaoDAO qDAO = new QuestaoRestricaoDAO();
                                        List<QuestaoRestricao> restricoes = qDAO.getRestricaoByQuestao(request.getParameter("id"));
                                        for (QuestaoRestricao r : restricoes) {
                                    %>
                                    *  <%=IOUtils.toString(r.getRestricao(), "ISO-8859-1")%>  <br>                            
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
                                        <td><%=IOUtils.toString(e.getEntrada(), "ISO-8859-1")%></td>
                                        <td><%=IOUtils.toString(s.getSaidaEsperada(), "ISO-8859-1")%></td>
                                    </tr>
                                    <%}%>
                                    <%}%>
                                </table>
                            </div>
                            <br>
                            <h5>Submeta sua solução</h5>

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
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                <a href="gabarito.jsp?id=<%=q.getId()%>">Acesse o código-gabarito</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
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
