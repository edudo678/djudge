<%-- 
    Document   : index
    Created on : 02/07/2019, 14:59:43
    Author     : Junior
--%>

<%@page import="model.dao.GenericDAO"%>
<%@page import="model.bean.QuestaoImagem"%>
<%@page import="model.bean.Questao"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.QuestaoDAO"%>
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
        <script src="../../js/bootstrap/bootstrap.js"></script>
        <script src="../../js/jquery/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <script src="../../css/fontawesome-all.css"></script>   
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
                                <a class="font-weight-bold h3">Bem vindo(a) ${usuario.nome}</a> <br>
                                <small>Deslize para baixo para ver mais</small>
                            </div> 
                            <div class="px-2 py-3">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <h4 class="mt-3 mr-2">Últimas maratonas</h4>
                                    </div>
                                    <div class="col-md-6">
                                        <a href="" class="card-link float-right mt-2 ">Ver mais</a>
                                    </div>
                                </div>
                                <section>
                                    <div class="form-row py-3">
                                        <div class="col-lg-4 px-2 mb-3">  
                                            <div class="card">
                                                <img src="../../img/maratona2.jpg" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Maratona de Programação 2019</h5>
                                                    <p class="card-text text-justify d-inline-block text-truncate w-100">Em maio de 2018, foi realizado a primeira fase da maratona de programação no ifam cmc, com as turmas de 1°,2° e 3° anos de informática.</p>
                                                </div>
                                                <div class="card-body border-top">
                                                    <a href="#" class="card-link">Sobre</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 px-2 mb-3">  
                                            <div class="card">
                                                <img src="../../img/maratona2_2018 medals.png" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Maratona de Programação 2018</h5>
                                                    <p class="card-text text-justify d-inline-block text-truncate w-100">Em maio de 2018, foi realizado a primeira fase da maratona de programação no ifam cmc, com as turmas de 1°,2° e 3° anos de informática.</p>
                                                </div>
                                                <div class="card-body border-top">
                                                    <a href="#" class="card-link">Sobre</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 px-2 mb-3">  
                                            <div class="card">
                                                <img src="../../img/maratona3_2018.png" class="card-img-top" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Maratona de Programação 2017</h5>
                                                    <p class="card-text text-justify d-inline-block text-truncate w-100">Em maio de 2018, foi realizado a primeira fase da maratona de programação no ifam cmc, com as turmas de 1°,2° e 3° anos de informática.</p>
                                                </div>
                                                <div class="card-body border-top">
                                                    <a href="#" class="card-link">Sobre</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <section>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <h4 class="mt-3 mr-2">Principais questões</h4>
                                        </div>
                                        <div class="col-md-6">
                                            <a href="listarQuestoes.jsp" class="card-link float-right mt-2 ">Ver mais</a>
                                        </div>
                                    </div>
                                    <div class="form-row py-3">

                                        <%
                                            QuestaoDAO qDAO = new QuestaoDAO();
                                            List<Questao> questoes = qDAO.getList();
                                            int i = 0;
                                            for (Questao q : questoes) {
                                                i++;
                                                QuestaoImagem qi = new QuestaoImagem();
                                                GenericDAO<QuestaoImagem> gqiDAO = new GenericDAO();
                                                qi = gqiDAO.findById(QuestaoImagem.class, Long.parseLong("" + q.getId()));
                                                if (i < 3) {
                                        %>
                                        <div class="col-lg-6 px-1 mb-3">   
                                            <div class="card mb-3">  
                                                <div class="row no-gutters">
                                                    <div class="col-md-4 bg-secondary">
                                                        <img src="<%=IOUtils.toString(qi.getImagem(), "UTF-8")%>" width="100%" height="100%">
                                                    </div>
                                                    <div class="col-md-8 py-0">    
                                                        <div class="card-body mb-5">
                                                            <h5 class="card-title d-inline-block text-truncate w-100"><%=IOUtils.toString(q.getTitulo(), "ISO-8859-1")%></h5>
                                                            <p class="card-text d-inline-block text-truncate w-100"><%=IOUtils.toString(q.getEnunciado(), "ISO-8859-1")%></p>
                                                        </div>
                                                        <div class="card-footer">  
                                                            <p class=""><small class="text-muted">Enviado a 3 minutos atrás</small></p>  
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% }
                                        }%>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../../footer.jsp"/>
    </body>
</html>
