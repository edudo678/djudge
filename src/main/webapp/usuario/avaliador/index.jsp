<%-- 
    Document   : index
    Created on : 02/07/2019, 14:59:43
    Author     : Paulo Ribeiro
--%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.QuestaoDAO"%>
<%@page import="model.bean.Questao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script> 
        <script src="../../js/jquery/jquery-3.4.1.min.js"></script>
        <script src="../../js/popper.min.js"></script>
        <script src="../../js/bootstrap/bootstrap.min.js"></script>


    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="card col-lg-9">
                    <div class="mx-3 mt-3">
                        <div class="form-row">
                            <div class="col-lg-6">
                                <a class="font-weight-bold h4">Questões cadastradas</a><br>
                                <small>Deslize para baixo para ver mais questões cadastradas</small>
                            </div>
                            <div class="col-lg-6">
                                <a class="btn btn-dark float-lg-right" href="../../questao/cadastro.jsp"><i class="fas fa-plus-circle"></i> NOVO</a>
                            </div>
                        </div>
                        <form action="/djudge/Questao2Servlet" method="post">
                            <br>

                            <div class="table-responsive-lg">
                                <table class="table table-hover table-bordered" id="filtro">
                                    <caption>Questões</caption>
                                    <thead>
                                        <tr class="bg-light">
                                            <th>Título<i class="fa fa-sort float-right"></i></th>
                                            <th>Nível<i class="fa fa-sort float-right"></i></th>
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
                                            <td>
                                                <div class="form-row">
                                                    <div class="col-6">
                                                        <%=q.getNivel()%>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-row justify-content-end">
                                                            <div class="dropdown dropup">
                                                                <a class="w-25 p-3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                    <i class="fas fa-ellipsis-v"></i>
                                                                </a>
                                                                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                                                    <a class="dropdown-item" href="../../questao/editar.jsp?id=<%=q.getId()%>"><i class="fas fa-edit"></i> Editar</a>
<!--                                                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#excluir" ><i class="fas fa-trash"></i> Excluir</a>-->
                                                                    <a class="dropdown-item" href="/djudge/Questao2Servlet?id=<%=q.getId()%>" name="acao" value="excluir"><i class="fas fa-trash"></i> Excluir</a>
                                                                    <a class="dropdown-item" href="questao_selecionada.jsp?id=<%=q.getId()%>"><i class="fas fa-arrows-alt"></i> Visualizar</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal fade" id="excluir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                                                    <input name="id" value="<%=q.getId()%>"/>
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Excluir</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Você deseja realmente excluir esta questão?
                                                                <br>
                                                                <b><%=IOUtils.toString(q.getTitulo(), "ISO-8859-1")%></b>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" type="submit" class="btn btn-danger" name="acao" value="excluir"><i class="fas fa-trash"></i> Sim, excluir</button>
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fas fa-window-close fa-lg"></i> Cancelar</button>
                                                            </div>

                                                        </div>
                                                    </div>                                               
                                                </div>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>                                 
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../../footer.jsp"/>
        <script src="../../js/addons/datatables.min.js"></script>
        <script src="../../js/filtro/filtro_generico.js"></script>
    </body>
</html>
