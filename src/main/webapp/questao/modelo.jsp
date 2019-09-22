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

            <!--<div class="row">-->
            <div class="col-10 row justify-content-end">
                <div class="col-10">
                    <div class="card text-black">
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
                            
//                            QuestaoImagemDAO qDAO = new QuestaoImagemDAO();
//                            List<QuestaoImagem> imagens;
//                            imagens = qDAO.getImagemByQuestao(request.getParameter("id"));
//                            
//                            for (QuestaoImagem img : imagens) {
//                                img.getImagem();
//                            }
                        %>

                        <form action="/djudge/SubmissaoServlet?id=<%=q.getId()%>" enctype="multipart/form-data" method="POST">                         

                            <div class="card-body">
                                <h4 class="card-title text-center"><strong><%=q.getTitulo()%></strong></h4>                                
                                <p class="card-text text-justify">
                                    <%=q.getEnunciado()%>
                                </p>
                                <img src="<%=IOUtils.toString(qi.getImagem(), "UTF-8")%>" width="100%" height="100%">

                                <h5 class=""><strong>Entrada</strong></h5>
                                <p class="card-text text-justify">
                                    <%=q.getEntrada()%>
                                </p>

                                <h5 class=""><strong>Saída</strong></h5>
                                <p class="card-text text-justify">
                                    <%=q.getSaida()%>
                                </p>   

                                <h5 class=""><strong>Restrições</strong></h5>
                                <p class="card-text text-justify">
                                    <%
                                        QuestaoRestricaoDAO qDAO = new QuestaoRestricaoDAO();
                                        List<QuestaoRestricao> restricoes = qDAO.getRestricaoByQuestao(request.getParameter("id"));
                                        for (QuestaoRestricao r : restricoes) {
                                    %>
                                    * <%=r.getRestricao()%>  <br>                            
                                    <%}%>
                                </p>

                                <h5 class=""><strong>Exemplos</strong></h5>

                                <table class="table table-borderless">
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

                                <div class="list-group list-group-flush card-body ">
                                    <table class="table">
                                        <strong>Submissão</strong>
                                        <tr> 
                                            <td> 
                                                <div>
                                                    <select name="compilerId">
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
                                                <div class="form-group">
                                                    <input type="file" name="source" class="form-control-file" id="exampleFormControlFile1">
                                                </div>
                                                <button type="submit" class="btn btn-primary btn-block">Submeter</button>
                                                <br><a href="gabarito.jsp?id=<%=q.getId()%>">Acesse o código-gabarito</a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!--                <div class="col-4">
                                <div class="row justify-content-start">
                                    <div class="card text-black col-md-5">
                                        <div class="card-header text-center">
                                            Menu
                                        </div>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item"><a href="#" class="text-black">Histórico</a></li>
                                            <li class="list-group-item"><a href="#" class="text-black">Maratonas</a></li>
                                            <li class="list-group-item"><a href="#" class="text-black">Resultados</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>-->
            <!--</div>-->
        </div>
    </body>
</html>
