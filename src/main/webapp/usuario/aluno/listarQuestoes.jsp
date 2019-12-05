<%-- 
    Document   : index
    Created on : 02/07/2019, 14:59:43
    Author     : Junior
--%>

<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.QuestaoDAO"%>
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
        <link rel="stylesheet" href="../../css/bootstrap/bootstrap.min.css"/>

        <script src="../../js/bootstrap/bootstrap.js"></script>
        <script src="../../js/jquery/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="../../js/bootstrap/bootstrap.min.js"></script>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main>
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card px-4 py-4">
                            <div>
                                <a class="font-weight-bold h3">Questões</a> <br>
                                <small>Deslize para baixo para ver mais</small>
                            </div> 
                            <div class="px-2 py-3">
                                <table class="table table-hover table-bordered" id="filtro">
                                    <caption>Questões</caption>
                                    <thead>
                                        <tr class="bg-light">
                                            <th>Título<i class="fa fa-sort float-right"></i></th>
                                            <th>Nível<i class="fa fa-sort float-right"></i></th>
                                            <th>Ação<i class="fa fa-sort float-right"></i></th>
                                        </tr>

                                    </thead>
                                    <tbody>
                                        <%
                                            QuestaoDAO qDAO = new QuestaoDAO();
                                            List<Questao> questoes = qDAO.getList();
                                            for (Questao q : questoes) {
                                        %>
                                        <tr>
                                            <td><%=IOUtils.toString(q.getTitulo(), "ISO-8859-1")%></td>
                                            <td><%=q.getNivel()%></td>
                                            <td><a class="card-link" href="modelo.jsp?id=<%=q.getId()%>">Ver mais</a></td>
                                        </tr>
                                        <% }%>
                                    </tbody>                                 
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../../footer.jsp"/>       
        <script src="../../js/addons/datatables.min.js"></script>
        <script src="../../js/filtro/filtro_generico.js"></script>
    </body>
</html>
