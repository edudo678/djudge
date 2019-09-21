<%-- 
    Document   : index
    Created on : 02/07/2019, 14:59:43
    Author     : Junior
--%>

<%@page import="java.util.List"%>
<%@page import="model.dao.QuestaoDAO"%>
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
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css"/>

        <script src="../js/bootstrap/bootstrap.js"></script>
        <script src="../js/jquery/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script> 
        <script src="../js/bootstrap/bootstrap.min.js"></script>

    </head>
    <body class="background">
        <jsp:include page="header.jsp"/>



        <div class="container-fluid home">

            <div class="row">
                <div class="col-12">

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 row justify-content-center">
                <div class="card col-11 text-black">
                    <br>
                    <h4 class="border-bottom border-dark">Questões adicionadas</h4>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">Título</th>
                                <th scope="col">Enunciado</th>
                                <th scope="col">Entrada</th>
                                <th scope="col">Saída</th>
                                <th scope="col">Dificuldade</th>
                                <th scope="col">Tempo de execução</th>
                                <th scope="col">Avaliador</th>
                                <th scope="col">Submissão</th>
                                <!--<th scope="col">Submissões</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                QuestaoDAO qDAO = new QuestaoDAO();
                                List<Questao> questoes = qDAO.getList();
                                for (Questao q : questoes) {
                            %>
                            <tr>
                                <td><%=q.getTitulo()%></td>
                                <td><%=q.getEnunciado()%></td>
                                <td><%=q.getEntrada()%></td>
                                <td><%=q.getSaida()%></td>
                                 <td><%=q.getNivel()%></td>
                                <td><%=q.getTempoExec()%></td>
                                <td><%=q.getAvaliador()%></td>
                                <td class="text-center"><a class="btn btn-primary" id="background-blue" href="modelo.jsp?id=<%=q.getId()%>">Submeter</a></td>
                                <!--<td><span class="badge badge-primary badge-pill">14</span></td>-->
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>
